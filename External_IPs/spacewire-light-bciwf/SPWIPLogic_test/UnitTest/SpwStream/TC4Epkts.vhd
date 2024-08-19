--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC4Epkts.vhd
--!
--! \brief        Implementation of the test case Empty Packets unit test.
--!               One SPW link is connected to a SPW TLM (Transaction level model).
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 26.06.2018
--! \date         Updated: 06.03.2019
--! \version      V 1.00
--
-- Unit         : TC4Epkts (BEH) (entity, architecture)
-- File version : $Revision: 71 $
--
-- Limitations  : Only for logic test usage
-- Errors       : None known
--
-- Copyright 2021 IWF
-- 
-- This file is part of SpaceWire Unit Testbench.
--
-- SpaceWire Unit Testbench is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 2.1 of the License, or
-- (at your option) any later version.
--
-- SpaceWire Unit Testbench is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public License
-- along with SpaceWire Unit Testbench.  If not, see <https://www.gnu.org/licenses/>.
--
--------------------------------------------------------------------------------
-- History
--
-- $Log$
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Library
--------------------------------------------------------------------------------
--! IEEE standard library
library ieee;
--! IEEE standard logic package
use ieee.std_logic_1164.all;
--! IEEE standard numeric package
use ieee.numeric_std.all;
--! VHUNIT test library
library VHUNIT;
--! VHUNIT test execution package
use VHUNIT.TestExecution_pkg.all;
--! VHUNIT test monitor package
use VHUNIT.TestMonitor_pkg.all;
--! VHUNIT test statistic package
use VHUNIT.TestStatistic_pkg.all;

--! VHDL SPW IP library
library SPWIP;
--! VHDL SPW IP package
use SPWIP.SpwStream_pkg.all;
--! SPWIP registers definition.
use SPWIP.SpwRegisters_pkg.all;
--! SPWIP record type definitions.
use SPWIP.SpwProtocol_pkg.all;
--! SPWIP SpwStream unit
use SPWIP.SpwStream;

--! OSVVM library
library OSVVM;
--! OSVVM Transcript package
use OSVVM.TranscriptPkg.all;
--! OSVVM Global package
use OSVVM.OsvvmGlobalPkg.all;
--! OSVVM Alertlog package
use OSVVM.AlertLogPkg.all;
--! OSVVM Random package
use OSVVM.RandomPkg.all;
--! OSVVM Coverage package
use OSVVM.CoveragePkg.all;
--! OSVVM Memory package
use OSVVM.MemoryPkg.all;

--! Work library
library work;
--! Simulation support package
use work.SimulationSupport_pkg.all;
--------------------------------------------------------------------------------
-- Entity TC4Epkts
--! \brief        TC4Epkts - test case Empty packets of the SPW unit.
--! \details      The unit executes the test case Empty packets. Evaluates the 
--!               handling and quietly discarding of empty packets. 
--!
--!               List of Error/Corner cases:
--!               - Corner Case: Empty packets
--!
--!               List of associated clauses from the SpW Standard (ECSS-E-ST-50-12C):
--!               - Corner Case: Empty packets 8.9.1.c, 8.9.3.2.a, 8.9.3.2.b
--!
--!               List of coverage points used here:
--!               - cp_rxepkt
-- Comments     :
-- Updates      :
--------------------------------------------------------------------------------
entity TC4Epkts is
   generic (
      SEED           : integer      := 1;     --! seed for random generation.
      SETUP_TIME     : delay_length := 1 ns;  --! define the default setup time.
      HOLD_TIME      : delay_length := 1 ns;  --! define the default hold time.
      INPUT_RATE     : real  := 100.0e6 ;     --! input data rate of the SPW Rx
      TX_CLOCK_DIV   : integer := 0           --! Divisor for SPW Tx clock
   );
   port (
      CONTROL_IN  : in execution; --! the test case execution control information.
      CONTROL_OUT : out result    --! the test case execution result information.
   );
end entity TC4Epkts;
--------------------------------------------------------------------------------
-- Architecture TC4Epkts_beh
--! \brief  Implementation of the test case 4 for the SPW unit.
--------------------------------------------------------------------------------
architecture TC4Epkts_beh of TC4Epkts is
   -----------------------------------------------------------------------------
   -- Simulation related signals, variables and constants
   -----------------------------------------------------------------------------
   constant UUT_T_SYSCLK : time := (1 sec)/SYSFREQ; --! define the UUT clk signal period.
   constant MAX_RST_T : time := 20 * UUT_T_SYSCLK; --! maximum reset time
   constant TX_CLK_DIV_SLV : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(TX_CLOCK_DIV, 8));
   signal control     : result;            --! internal execution result
   signal error       : integer := 0;      --! total error counter
   signal error_tf    : integer := 0;      --! test flow error counter
   signal error_cov   : integer := 0;      --! functional coverage error counter
   signal logic_0     : std_logic := '0';  --! constant for logic '0' comparison
   signal logic_1     : std_logic := '1';  --! constant for logic '1' comparison
   signal end_sim     : boolean := false;  --! end of simulation flag
   signal end_testflow: boolean := false;  --! end of testflow (stimuli) process flag
   signal case_number : natural := 0;      --! indicates the current test running.
   -----------------------------------------------------------------------------
   -- Clock related signals, variables and constants
   -----------------------------------------------------------------------------
   -- Bit periods for incoming / outgoing signal
   constant INBIT_PD       : time := (1 sec) / INPUT_RATE ; --! inbit period in the Run state
   constant INIT_INBIT_PD  : time := (1 sec) / 10.0e6 ; --! inbit period before Run state (10 Mbps)
   constant TXCLK_PD       : time := (1 sec) / TXCLKFREQ ; --! Tx clock period
   -----------------------------------------------------------------------------
   -- Input generator related signals, variables and constants
   -----------------------------------------------------------------------------
   signal gen_par     : std_logic;         --! the parity bit of the input generator.
   signal gen_idle    : std_logic;         --! high when the input generator is idle.
   signal gen_ptrn    : integer := 0;      --! selects the input pattern.
   signal gen_stbflip : std_logic := '0';  --! The value of spw_link.si (strobe) when the sim starts.
   -----------------------------------------------------------------------------
   -- Link bit and character monitor related signals, variables and constants
   -----------------------------------------------------------------------------
   signal mon_ena1   : std_logic := '0'; --! monitor enable
   signal mon_data   : std_logic_vector(7 downto 0); --! received data
   signal mon_data_vld : std_logic; --! data valid flag
   signal mon_tc     : std_logic_vector(7 downto 0); --! received timecode
   signal mon_tc_vld   : std_logic; --! timecode valid flag
   signal mon_inputs : monitor_inputs_type;  --! monitor inputs/config parameters
   signal mon_outputs: monitor_outputs_type; --! monitor outputs
   signal char_mon_stats  : monitor_stats_type := monitor_stats_reset;
   signal char_mon_errors : integer := 0; --! char monitor error counter
   signal bit_mon_errors  : integer := 0; --! bit monitor error counter
   signal rate_changed    : std_logic := '0'; --! Tx rate change flag
   signal sim_ds_switch   : std_logic := '0'; --! simultaneous DS switching flag
   -----------------------------------------------------------------------------
   -- spwstream (UUT) interface signals
   -----------------------------------------------------------------------------
   signal clk           : std_logic;   --! UUT System clock
   signal txclk         : std_logic;   --! UUT Transmit clock
   signal rst_n         : std_logic;   --! asynchronous reset (active-low)
   signal spw_host_in   : spw_host_interface_in := spw_host_interface_in_reset; --! SPW host input interface
   signal spw_host_out  : spw_host_interface_out := spw_host_interface_out_reset; --! SPW host output interface
   signal spw_link      : spw_link_interface; --! SPW link interface
   -----------------------------------------------------------------------------
   -- testFlow process signals
   -----------------------------------------------------------------------------
   subtype chars is std_logic_vector(8 downto 0); -- 1 bit for ctrl flag (MSB)
                                                  -- 8 bits for data.
   -----------------------------------------------------------------------------
   -- Type data_FIFO
   --! \brief        Type definition for a data FIFO between input generator and receiver.
   --! \details      The type is an array of 9-bits chars.
   -----------------------------------------------------------------------------
   type data_FIFO is array (0 to 7) of chars; -- FIFO for data comparison
                                              -- at receiver link
   constant TX_CHARS : data_FIFO := ("001010101", "000111010", "100000000", "000000001",
                                     "000000011", "000000111", "011110000", "100000000" );
   -----------------------------------------------------------------------------
   -- Functional Coverage related signals, variables and constants
   -----------------------------------------------------------------------------
   constant ILLEGALMODE : IllegalModeType := ILLEGAL_ON; -- can also be ILLEGAL_FAILURE
   -----------------------------------------------------------------------------
   --! Handling empty packets. Rx consecutive EEP or EOP chars it is not an error,
   --! the empty should be discarded.
   shared variable cp_rxepkt : CovPType; -- cp rx empty packet
   constant RXEPKT_BIN  : integer := 1; -- rx empty packet bin
   constant RXEPKT_GOAL : integer := 1; -- rx empty packet goal
   constant IRXEPKT_BIN : integer := 99; -- illegal rx empty packet bin
   -----------------------------------------------------------------------------
   -- Type spwstream_regs_type
   --! \brief        internal registers for the Spwstream module.
   --! \details      The type contains the registers used by the Spwstream
   --!               module.
   -----------------------------------------------------------------------------
   type spwstream_regs_type is record
 	  -- packet state
      rxpacket      : std_logic; --! '1' when receiving a packet
      rxeep         : std_logic; --! '1' when rx EEP character pending
      txpacket      : std_logic; --! '1' when transmitting a packet
      txdiscard     : std_logic; --! '1' when discarding a tx packet
      rxemptydiscard: std_logic; --! '1' when rx empty packet (consecutive EOP or EEP)
      -- FIFO pointers
      rxfifo_raddr  : std_logic_vector(RXFIFOSIZE_BITS-1 downto 0); --! RX FIFO read addr pointer
      rxfifo_waddr  : std_logic_vector(RXFIFOSIZE_BITS-1 downto 0); --! RX FIFO write addr pointer
      txfifo_raddr  : std_logic_vector(TXFIFOSIZE_BITS-1 downto 0); --! TX FIFO read addr pointer
      txfifo_waddr  : std_logic_vector(TXFIFOSIZE_BITS-1 downto 0); --! TX FIFO write addr pointer
      -- FIFO state
      rxfifo_rvalid : std_logic; --! '1' if s_rxfifo_rdata is valid
      txfifo_rvalid : std_logic; --! '1' if s_txfifo_rdata is valid
      rxfull        : std_logic; --! '1' if RX fifo is full
      rxhalff       : std_logic; --! '1' if RX fifo is at least half full
      txfull        : std_logic; --! '1' if TX fifo is full
      txhalff       : std_logic; --! '1' if TX fifo is at least half full
      rxroom        : std_logic_vector(5 downto 0); --! nr of free positions in the rx fifo
      rxfiforoom    : std_logic_vector (RXFIFOSIZE_BITS downto 0); -- RX FIFO room.
      txfiforoom    : std_logic_vector (TXFIFOSIZE_BITS downto 0); -- TX FIFO room.
      disc_cnt      : std_logic_vector(7 downto 0); --! disconnect error counter
      par_cnt       : std_logic_vector(7 downto 0); --! parity error counter
      esc_cnt       : std_logic_vector(7 downto 0); --! escape error counter
      cred_cnt      : std_logic_vector(7 downto 0); --! credit error counter
      empty_cnt     : std_logic_vector(7 downto 0); --! empty packet counter
   end record;
--! \cond VHDL2008
   alias spwstream_regs_uut  is <<signal uut.res_seq : spwstream_regs_type>>;
   alias rxemptydiscard is spwstream_regs_uut.rxemptydiscard; -- rxemptydiscard
   signal ins_epkts : std_logic := '0'; -- inserted empty packets
   --! Registers from SpwLink
   alias spwlink_regs_uut  is <<signal uut.link_inst.state_seq : spwlink_regs_type>>;
   --! state is link_st_t.
   alias link_state    is spwlink_regs_uut.state;
--! \endcond 
   -----------------------------------------------------------------------------
begin
   
   -----------------------------------------------------------------------------
   -- Unit under test
   -----------------------------------------------------------------------------
   UUT: spwstream 
   port map(
      CLK        =>  clk,
      TXCLK      =>  txclk,
      ARST_N     =>  rst_n,
      AUTOSTART  =>  spw_host_in.auto_start,
      LINKSTART  =>  spw_host_in.link_start,
      LINKDIS    =>  spw_host_in.link_dis,
      TXDIVCNT   =>  spw_host_in.tx_div_cnt,
      TICK_IN    =>  spw_host_in.tick_in,
      CTRL_IN    =>  spw_host_in.ctrl_in,
      TIME_IN    =>  spw_host_in.time_in,
      TXWRITE    =>  spw_host_in.tx_write,
      TXFLAG     =>  spw_host_in.tx_flag,
      TXDATA     =>  spw_host_in.tx_data,
      TXRDY      =>  spw_host_out.tx_rdy,
      TXHALFF    =>  spw_host_out.tx_halff,
      TICK_OUT   =>  spw_host_out.tick_out,
      CTRL_OUT   =>  spw_host_out.ctrl_out,
      TIME_OUT   =>  spw_host_out.time_out,
      RXVALID    =>  spw_host_out.rx_valid,
      RXHALFF    =>  spw_host_out.rx_halff,
      RXFLAG     =>  spw_host_out.rx_flag,
      RXDATA     =>  spw_host_out.rx_data,
      RXREAD     =>  spw_host_in.rx_read,
      STARTED    =>  spw_host_out.started,
      CONNECTING =>  spw_host_out.connecting,
      RUNNING    =>  spw_host_out.running,
      --
      CNT_RST     => (not rst_n),
      ERRDISC_CNT => spw_host_out.err_disc_cnt, 
      ERRPAR_CNT  => spw_host_out.err_par_cnt,  
      ERRESC_CNT  => spw_host_out.err_esc_cnt,  
      ERRCRED_CNT => spw_host_out.err_cred_cnt, 
      EMPTY_CNT   => spw_host_out.empty_cnt,   
      --
      SPW_DI     =>  spw_link.di,
      SPW_SI     =>  spw_link.si,
      SPW_DO     =>  spw_link.do,
      SPW_SO     =>  spw_link.so
      );
  
   
   error <=  error_tf + error_cov + char_mon_errors + bit_mon_errors;
   
   mon_inputs.spw_name        <= "UUT1";
   mon_inputs.spw_divcnt      <= spw_host_in.tx_div_cnt;
   mon_inputs.spw_run_state   <= spw_host_out.running;
   mon_inputs.spw_tx_clk_freq <= TXCLKFREQ;
   
   SPW_MON: SpwMonitor
   port map(
      CONTROL     => control,
      SPW_DI      => spw_link.do,
      SPW_SI      => spw_link.so,
      MON_ENABLE  => mon_ena1,
      MON_DATA    => mon_data,  
      MON_DATA_VLD=> mon_data_vld, 
      MON_TC      => mon_tc, 
      MON_TC_VLD  => mon_tc_vld,
      MON_INPUTS  => mon_inputs,
      MON_OUTPUTS => mon_outputs
      );
      
   bit_mon_errors  <= mon_outputs.spw_bit_errors;
   rate_changed    <= mon_outputs.spw_rate_changed;
   sim_ds_switch   <= mon_outputs.spw_sim_ds_switch;
   char_mon_errors <= mon_outputs.spw_char_errors;
   char_mon_stats  <= mon_outputs.spw_char_stats;
   
   -----------------------------------------------------------------------------
   -- Process executeTC
   --! \brief        test case execution.
   --! \details      The process execute the test case and stop it if the end of
   --!               the run time is reached.
   -----------------------------------------------------------------------------
   executeTC: process
   begin
      WaitForStart( CONTROL_IN );
      ExecuteUntilCond( CONTROL_IN, end_sim, error, 50*UUT_T_SYSCLK , control, CONTROL_OUT );
      wait for 10 ns; -- wait to execute other process;
   end process executeTC;
   -----------------------------------------------------------------------------
   -- Process clockSys
   --! \brief        generate the system clock for UUT.
   --! \details      The process generates the system clock signal defined by
   --!               UUT_T_SYSCLK generic with random initial offset in the time range
   --!               [0;10*UUT_T_SYSCLK]
   -----------------------------------------------------------------------------
   clockSys: process
      variable rv         : RandomPType;
      variable initdelay  : time;
   begin
      -- initialize
      clk <= '0';
      rv.InitSeed(rv'instance_name & integer'image(10*SEED) );
      initdelay := rv.RandTime(0 ns, 10*UUT_T_SYSCLK);
      WaitForStart( CONTROL_IN );
      wait for initdelay;
      loop
         clk <= '0';
         wait for UUT_T_SYSCLK/2;
         clk <= '1';
         wait for UUT_T_SYSCLK/2;
         StopAtEnd( control );
      end loop;
   end process clockSys;
   -----------------------------------------------------------------------------
   -- Process clockTx
   --! \brief        generate the transmit clock for UUT.
   --! \details      The process generates the transmit clock signal defined by
   --!               TXCLKFREQ constant in SpwRegisters_pkg.vhd with random 
   --!               initial offset in the time range [0;10*TXCLK_PD]
   -----------------------------------------------------------------------------
   clockTx: process
      variable rv        : RandomPType;
      variable initdelay : time;
   begin
      -- initialize
      txclk <= '0';
      rv.InitSeed(rv'instance_name & integer'image(10*SEED));
      --PrintLogLine(GetExecutedTestCaseName, "clocktx1 seed: ", to_string(rv.GetSeed));
      initdelay := rv.RandTime(0 ns, 10*TXCLK_PD);
      WaitForStart( CONTROL_IN );
      wait for initdelay;
      loop
         txclk <= '0';
         wait for TXCLK_PD/2;
         txclk <= '1';
         wait for TXCLK_PD/2;
         StopAtEnd( control );
      end loop;
   end process clockTx;
   -----------------------------------------------------------------------------
   -- Process genInputProc
   --! \brief        Generate input data for UUT.
   --! \details      The process generates the required signals for the SpW input
   --!               data interface.
   --  Comments: Adapted from SpaceWire Light IP from opencores.org
   -----------------------------------------------------------------------------
   genInputProc: process is
      variable RV              : RandomPType ;
      variable random_bit      : std_logic := '0';
      variable random_bit_vec  : std_logic_vector(0 downto 0);
      variable random_seq      : std_logic_vector(8 downto 0) := (others => '0');
--! \cond VHDL2008
      --------------------------------------------------------------------------
      -- Procedure inputReset
      --! \brief        Reset the SPW data and strobe signals.
      --------------------------------------------------------------------------
      procedure inputReset is
      begin
         gen_par   <= '0';
         random_seq  := (others => '0');
         -- gentle reset of spacewire signals
         if ( spw_link.di = '1' and spw_link.si = '1') then
            spw_link.di <= spw_link.di and spw_link.si;
            spw_link.si <= gen_stbflip;
            if link_state = S_Run then
               wait for INBIT_PD;
            else
               wait for INIT_INBIT_PD;
            end if; -- link_state
            spw_link.di <= spw_link.di and spw_link.si;
            spw_link.si <= gen_stbflip;
         else
            spw_link.di <= '0';
            spw_link.si <= gen_stbflip;
         end if; -- link_state
      end procedure inputReset;
      --------------------------------------------------------------------------
      -- Procedure genBit
      --! \brief        Sends one bit.
      --------------------------------------------------------------------------
      procedure genBit(
         b: std_logic
      ) is
      begin
         spw_link.si <= not (spw_link.si xor spw_link.di xor b);
         spw_link.di <= b;
         if link_state = S_Run then
            wait for INBIT_PD;
         else
            wait for INIT_INBIT_PD;
         end if; -- link_state
      end procedure genBit;
      --------------------------------------------------------------------------
      -- Procedure genfct
      --! \brief        Sends FCT control code.
      --------------------------------------------------------------------------
      procedure genfct is
      begin
         genBit(gen_par);
         genBit('1');
         genBit('0');
         gen_par <= '0';
         genBit('0');
      end procedure genfct;
      --------------------------------------------------------------------------
      -- Procedure genesc
      --! \brief        Sends ESC control code.
      --------------------------------------------------------------------------
      procedure genesc is
      begin
         genBit(gen_par);
         genBit('1');
         genBit('1');
         gen_par <= '0';
         genBit('1');
      end procedure genesc;
      --------------------------------------------------------------------------
      -- Procedure geneop
      --! \brief        Send EOP or EEP control code.
      --------------------------------------------------------------------------
      procedure geneop(
         e: std_logic
      )  is
      begin
         genBit(gen_par);
         genBit('1');
         genBit(e);
         gen_par <= '1';
         genBit(not e);
      end procedure geneop;
      --------------------------------------------------------------------------
      -- Procedure gendat
      --! \brief        Send an 8-bit data.
      --------------------------------------------------------------------------
      procedure gendat(
         dat: std_logic_vector(7 downto 0)
      )  is
      begin
         genBit(not gen_par);
         genBit('0');
         genBit(dat(0)); genBit(dat(1)); genBit(dat(2)); genBit(dat(3));
         genBit(dat(4)); genBit(dat(5)); genBit(dat(6));
         gen_par <= dat(0) xor dat(1) xor dat(2) xor dat(3) xor
                      dat(4) xor dat(5) xor dat(6) xor dat(7);
         genBit(dat(7));
      end procedure gendat;
      --------------------------------------------------------------------------
--! \endcond 
   begin
      -- initializing the generator with the seed
      RV.InitSeed(RV'instance_name & integer'image(10*SEED));
      inputReset;
      gen_idle <= '1';
      if gen_ptrn = 0 then
         wait until gen_ptrn /= 0;
      end if; -- gen_ptrn
      gen_idle <= '0';
      while gen_ptrn /= 0 loop
         if gen_ptrn = 1 then
            -- NULL tokens
            genesc;
            genfct;
         elsif gen_ptrn = 2 then
            -- FCT tokens
            genfct;
         elsif gen_ptrn = 7 then -- empty packets
            -- FCT, NULL (2x), char (2x), EOP (2x), NULL (2x), EEP (2x), char (4x), EOPs, EEPs (empty packets)
            genfct; -- FCT
            genesc;
            genfct; -- NULL
            genesc;
            genfct; -- NULL
            gendat("01010101"); --0x55
            gendat("00111010"); --0x3A
            geneop('0');
            geneop('0');
            genesc;
            genfct; -- NULL
            genesc;
            genfct; -- NULL
            geneop('1');
            geneop('1');
            gendat("00000001"); --0x01
            gendat("00000011"); --0x03
            gendat("00000111"); --0x07
            gendat("11110000"); --0xF0
            while gen_ptrn = 7 loop
               geneop('0');
               geneop('1');
            end loop;
         else
             PrintLine(GetExecutedTestCaseName, LS_FAILURE, "genInputProc: " & integer'image(gen_ptrn) & " Unknown input pattern selected!" );
         end if; -- gen_ptrn
      end loop;
   end process genInputProc;

   -----------------------------------------------------------------------------
   -- Process testFlow
   --! \brief        Main process for UUT.
   --! \details      The process handles the execution of UUT.
   --  Comments:     Adapted from SpaceWire Light IP from opencores.org
   -----------------------------------------------------------------------------
   testFlow: process
      variable RV         : RandomPType ;
      variable looptime   : time := 0 ns;
      variable validdata  : boolean := false;
      variable error_var  : integer := 0;
      variable tf         : integer := 0;   
      variable rdptr      : integer := 0;  -- Read pointer for TX_CHARS FIFO
--! \cond VHDL2008
      --------------------------------------------------------------------------
      impure function checkValidData return boolean is
         variable checkresult : boolean;
      begin
         if spw_host_out.rx_valid = '1' then
            checkresult := true;
         else
            checkresult := false;
         end if; -- spw_host_out.rx_valid
         return checkresult;
      end function checkValidData;
      --------------------------------------------------------------------------
      procedure CompareDataValues is
         variable chartmp: std_logic_vector(8 downto 0);
      begin
         -- read from testbench tx_data FIFO
         chartmp := TX_CHARS(rdptr);
         rdptr := rdptr + 1;
         -- compare values
         if (spw_host_out.rx_flag /= chartmp(8)) then
            PrintFailureLine(GetExecutedTestCaseName, spw_host_out.rx_flag,
                             chartmp(8), "spw_host_out.rx_flag" );
            error_var := error_var + 1;
         end if; -- spw_host_out.rx_flag
         if (spw_host_out.rx_data /= chartmp(7 downto 0)) then
            PrintFailureLine(GetExecutedTestCaseName, spw_host_out.rx_data,
                             chartmp(7 downto 0), "spw_host_out.rx_data" );
            error_var := error_var + 1;
         end if; -- spw_host_out.rx_data
      end procedure CompareDataValues;
      --------------------------------------------------------------------------
      procedure ReadAckToUUT is
      begin
         spw_host_in.rx_read <= '1';
         wait for UUT_T_SYSCLK;
         spw_host_in.rx_read <= '0';
      end procedure ReadAckToUUT;
      --------------------------------------------------------------------------
--! \endcond
   begin
      -- initializing the generator with the seed
      RV.InitSeed(RV'instance_name & integer'image(10*SEED)); 
      -- Initialize reset signals
      rst_n <= '0';
      -- Initialize the input generator
      gen_ptrn    <= 0;
      gen_stbflip <= '0';
      -- Initialize the output monitor. Reset output monitor.
      mon_ena1 <= '0';
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      WaitForStart( CONTROL_IN );
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Reset asserted in the ErrorReset state
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      --------------------------------------------------------------------------
      -- Case : Empty packets.
      -- Objective: Evaluate if the UUT is discarding received empty packets. An empty
      --            packet is defined as an EOP or EEP followed immediately by another
      --            EOP or EEP.
      case_number <= 1;
      tf := 1;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Empty packets.");
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      mon_ena1 <= '1';
      wait until link_state = S_Connecting;
      ins_epkts <= '1';
      gen_ptrn <= 7; -- send FCT, NULL (2x), char (2x), EOP (2x), NULL (2x), EEP (2x), char (4x), EOPs, EEPs (empty packets)
      -- check that are only received: char (2x), EOP, char (4x), EOP.
      looptime := NOW + 10 us;
      -- receive data through host interface
      RecvData: while (NOW < looptime) loop
         wait until rising_edge(clk);
         wait for HOLD_TIME;
         validdata := checkValidData;
         if (validdata = true) then
            -- read data from UUT and compare with TX_CHARS FIFO
            CompareDataValues;
            -- Read Ack To UUT
            ReadAckToUUT;
         end if; -- validdata
      end loop;
      if (error_var /= 0 or rdptr /= 8) then
         PrintLine(GetExecutedTestCaseName, LS_FAILURE, "TF: ERROR in CASE " & to_string(case_number) );
      end if; -- error_var
      mon_ena1 <= '0';
      gen_ptrn <= 0; -- disabled
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n); -- reset
      ins_epkts <= '0';
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      rst_n <= '0';
      case_number <= 99;
      tf := 99;
  
      -- Stop simulation
      gen_ptrn <= 0;
      error_tf <= error_var;
      end_testflow <= true;
      wait for 1 ns; -- to update the error signal
      StopProcess(control);
   end process testFlow;
   
   -----------------------------------------------------------------------------
   -- Process coverageMonitor
   --! \brief        Defines the functional coverage objective.
   --! \details      The process defines the functional coverage of this testcase.
   --  Comments:     Adapted from OSVVM FIFO example.
   -----------------------------------------------------------------------------
   coverageMonitor: process
      variable errcov        : integer := 0; -- error coverage counter
      -------------------------------------------------------
      variable prevrstst  : std_logic; -- previous reset signal state
      variable prevlinkst : link_st_t; -- previous link fsm state
   begin
      --------------------------------------------------------------------------
      WaitForStart( CONTROL_IN );
      wait until falling_edge(clk);
      --------------------------------------------------------------------------
      -- Creating bins for the rest of cover points
      --------------------------------------------------------------------------
      --------------------------------------------------------------------------
      -- cp_rxepkt
      --------------------------------------------------------------------------
      cp_rxepkt.SetName("cp_rxepkt");
      cp_rxepkt.AddBins("Discard empty packet",
      RXEPKT_GOAL, GenBin(RXEPKT_BIN) );
      cp_rxepkt.AddBins(ALL_ILLEGAL);
      cp_rxepkt.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      prevlinkst :=link_state;
      prevrstst := rst_n;
      --collecting coverage
      MainCovLoop: while not ( cp_rxepkt.IsCovered and
                              end_testflow
                              )   loop
         wait until falling_edge(clk);
         -----------------------------------------------------------------------
         -- check if cp_rxepkt is covered
         -----------------------------------------------------------------------
         if ins_epkts = '1' then
            if (rxemptydiscard = '1') then
               cp_rxepkt.Icover(RXEPKT_BIN);
            end if; -- rxemptydiscard
         else
            if (rxemptydiscard = '1') then
               cp_rxepkt.Icover(IRXEPKT_BIN);
               errcov := errcov + 1;
            end if; -- rxemptydiscard
         end if; -- ins_epkts
         -----------------------------------------------------------------------
         prevlinkst := link_state;
         prevrstst  := rst_n;
         -----------------------------------------------------------------------
         --Check for TimeOut and force exit when now is greater than TimeOut value
         exit MainCovLoop when NOW > (CONTROL_IN.runtime - 10 ns);
      end loop;
      --Final reporting
      PrintResultHeader( GetExecutedTestCaseName, "Functional Coverage" );
      if NOW >= (CONTROL_IN.runtime - 10 ns) then
         PrintResultLine( "FC: TIME OUT. Functional Coverage failed!");
         PrintResultLine( "FC: More details on the coverage report." );
         if not cp_rxepkt.IsCovered then
            errcov := errcov + 1;
            cp_rxepkt.WriteCovHoles;
         end if; -- cp_rxepkt        
      else
         PrintResultLine( "FC: SUCCESS! The functional coverage goal was achieved.");
         PrintResultLine( "FC: 1 coverage points checked." );
         PrintResultLine( "FC: More details on the coverage report." );
      end if; -- NOW
      -- The illegal bins errors are accumulated during coverage collection
      error_cov <= errcov;
      -- End the simulation by suspending all the processes.
      -- After assert end_sim, the error signal has a time defined
      -- in the executeTC process to update the final value.
      wait for UUT_T_SYSCLK;
      end_sim <= true;
      --let the simulation run for a little longer before stopping it
      wait for 50*UUT_T_SYSCLK;
      StopProcess(control);
   end process coverageMonitor;
end architecture TC4Epkts_beh;
--------------------------------------------------------------------------------
-- end TC4Epkts.vhd
--------------------------------------------------------------------------------