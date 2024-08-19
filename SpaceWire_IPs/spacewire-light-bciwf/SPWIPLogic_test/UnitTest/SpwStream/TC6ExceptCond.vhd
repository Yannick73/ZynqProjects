--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC6ExceptCond.vhd
--!
--! \brief        Implementation of the test case exception conditions unit test.
--!               One SPW link is connected to a SPW TLM (Transaction level model).
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 26.06.2018
--! \date         Updated: 06.03.2019
--! \version      V 1.00
--
-- Unit         : TC6ExceptCond (BEH) (entity, architecture)
-- File version : $Revision: 89 $
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
-- Entity TC6ExceptCond
--! \brief        TC6ExceptCond - test case exception conditions of the SPW unit.
--! \details      The unit executes the test case exception conditions. Evaluates the 
--!               handling of exception conditions. 
--!
--!               List of Error/Corner cases:
--!               - Error Case: Simultaneous switching in data and strobe input signals
--!               - Error Case: Link connected in one direction but not in the other
--!               - Corner Case: One end starts while the other end disconnects
--!               - Error Case: D connected, S disconnected
--!               - Error Case: S connected, D disconnected
--!               - Error Case: Link disconnected while transmitting/receiving a packet.
--!               - Error Case: Read empty RXFIFO
--!               - Error Case: Write full TXFIFO
--!
--!               List of associated clauses from the SpW Standard (ECSS-E-ST-50-12C):
--!               - Error Case: Simultaneous switching in data and strobe input signals 6.3.2.a
--!               - Error Case: Link connected in one direction but not in the other 8.9.2.1.2.d, 8.10.3
--!               - Corner Case: One end starts while the other end disconnects 8.10.5
--!               - Error Case: D connected, S disconnected 8.10.6
--!               - Error Case: S connected, D disconnected 8.10.7
--!               - Error Case: Link disconnected while transmitting/receiving a packet 11.4
--!
--!               List of coverage points used here:
--!               - cp_ds_in_simtrans
--!               - cp_linkcon_onedir
--!               - cp_onestarts_otherdiscon
--!               - cp_d_con_s_discon
--!               - cp_s_con_d_discon
--!               - cp_lnk_err_recov
-- Comments     :
-- Updates      :
--------------------------------------------------------------------------------
entity TC6ExceptCond is
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
end entity TC6ExceptCond;
--------------------------------------------------------------------------------
-- Architecture TC6ExceptCond_beh
--! \brief  Implementation of the test case 6 for the SPW unit.
--------------------------------------------------------------------------------
architecture TC6ExceptCond_beh of TC6ExceptCond is
   -----------------------------------------------------------------------------
   -- Simulation related signals, variables and constants
   -----------------------------------------------------------------------------
   constant UUT_T_SYSCLK : time := (1 sec)/SYSFREQ; --! define the UUT clk signal period.
   constant MAX_RST_T : time := 20 * UUT_T_SYSCLK; --! maximum reset time
   constant TX_CLK_DIV_SLV : std_logic_vector (7 downto 0) := std_logic_vector(to_unsigned(TX_CLOCK_DIV, 8));
   signal control     : result;            --! internal execution result
   signal error       : integer := 0;      --! total error counter
   signal error_tf    : integer := 0;      --! test flow error counter
   signal error_cov   : integer := 0;      --! functional coverage error counter
   signal logic_0     : std_logic := '0';  --! constant for logic '0' comparison
   signal logic_1     : std_logic := '1';  --! constant for logic '1' comparison
   signal end_sim     : boolean := false;  --! end of simulation flag
   signal end_testflow: boolean := false;  --! end of testflow (stimuli) process flag
   signal case_number : natural := 0;      --! indicates the current test running.
   --
   constant VHUNIT_TIME_BASE : time := ns; --! Unit in which the time is shown.
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
   signal gen_started : std_logic;         --! high when the input generator is started.
   signal gen_connect : std_logic;         --! high when the input generator is connecting.
   signal gen_run     : std_logic;         --! high when the input generator is running.
   signal gen_ptrn    : integer := 0;      --! selects the input pattern.
   signal gen_stbflip : std_logic := '0';  --! The value of spw_link.si (strobe) when the sim starts.
   -----------------------------------------------------------------------------
   -- Link bit and character monitor related signals, variables and constants
   -----------------------------------------------------------------------------
   signal mon_ena1   : std_logic := '0'; --! monitor enable
   signal mon_data   : std_logic_vector (7 downto 0); --! received data
   signal mon_data_vld : std_logic; --! data valid flag
   signal mon_tc     : std_logic_vector (7 downto 0); --! received timecode
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
   signal spw_host_in   : spw_host_interface_in := SPW_HOST_INTERFACE_IN_RESET;  --! SPW host input interface
   signal spw_host_out  : spw_host_interface_out := SPW_HOST_INTERFACE_OUT_RESET; --! SPW host output interface
   signal spw_link      : spw_link_interface; --! SPW link interface
   -----------------------------------------------------------------------------
   -- testFlow process signals
   -----------------------------------------------------------------------------

   -----------------------------------------------------------------------------
   -- Functional Coverage related signals, variables and constants
   -----------------------------------------------------------------------------
   constant ILLEGALMODE : IllegalModeType := ILLEGAL_ON; -- can also be ILLEGAL_FAILURE
   constant PASSED : integer := 1;
   constant FAILED : integer := 99;
   constant PASSED_BIN : CovBinType := GenBin(PASSED);
   constant FAILED_BIN : CovBinType := GenBin(FAILED);
   signal bad_init_seq : std_logic := '0';
   signal uut_ok_response : std_logic := '0';
   signal uut_notok_response : std_logic := '0';
   -----------------------------------------------------------------------------
   --! Simultaneous switching in data and strobe input signals. The UUT receiver
   --! should not hang up.
   shared variable cp_ds_in_simtrans : CovPType; -- cp data strobe in simultaneous transition
   constant DSSIMTRANS_GOAL : integer := 1;
   -----------------------------------------------------------------------------
   --! Link connected in one direction but not in the other. The link cannot 
   --! initialize.
   shared variable cp_linkcon_onedir : CovPType; -- cp link connected only in one direction
   constant LINKCONONEDIR_GOAL : integer := 1;
   -----------------------------------------------------------------------------
   --! One end starts while the other end disconnects. The link FSMs at both ends
   --! should cycle to ErrorReset, one due to timeout and the other due to disconnect error.
   --! The next time round should start properly.
   shared variable cp_onestarts_otherdiscon : CovPType; -- cp one end starts while the other disconnects
   constant ONESTARTSOTHERDISCON_GOAL : integer := 1;
   -----------------------------------------------------------------------------
   --! Data connected, Strobe disconnected
   --! The receiver should get a continuous sequence of 0101010101010101 
   shared variable cp_d_con_s_discon : CovPType; -- cp Data connected, Strobe disconnected
   constant DCONSDISCON_GOAL : integer := 1;
   -----------------------------------------------------------------------------
   --! Strobe connected, Data disconnected
   --! The receiver should get a continuous sequence of 1111111.... since 
   --! Data input goes to 1 when disconnected.
   --! If data is shorted to ground the sequence should be 00000...  
   shared variable cp_s_con_d_discon : CovPType; -- cp Strobe connected, Data disconnected
   constant SCONDDISCON_GOAL : integer := 1;
   -----------------------------------------------------------------------------
   --! Link disconnected while transmitting/receiving a packet.
   --! The transmitted packet should be spilled from the TXFIFO and after the 
   --! last received byte from the received data packet should be added an EEP marker.
   shared variable cp_lnk_err_recov : CovPType; -- cp link error recovery
   constant LNKERRRECOV_GOAL : integer := 1;
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
      rxfifo_raddr  : std_logic_vector (RXFIFOSIZE_BITS-1 downto 0); --! RX FIFO read addr pointer
      rxfifo_waddr  : std_logic_vector (RXFIFOSIZE_BITS-1 downto 0); --! RX FIFO write addr pointer
      txfifo_raddr  : std_logic_vector (TXFIFOSIZE_BITS-1 downto 0); --! TX FIFO read addr pointer
      txfifo_waddr  : std_logic_vector (TXFIFOSIZE_BITS-1 downto 0); --! TX FIFO write addr pointer
      -- FIFO state
      rxfifo_rvalid : std_logic; --! '1' if s_rxfifo_rdata is valid.
      txfifo_rvalid : std_logic; --! '1' if s_txfifo_rdata is valid.
      rxfull        : std_logic; --! '1' if RX fifo is full
      rxhalff       : std_logic; --! '1' if RX fifo is at least half full
      txfull        : std_logic; --! '1' if TX fifo is full
      txhalff       : std_logic; --! '1' if TX fifo is at least half full
      rxroom        : std_logic_vector (5 downto 0); --! nr of free positions in the rx fifo
      rxfiforoom    : std_logic_vector (RXFIFOSIZE_BITS downto 0); -- RX FIFO room.
      txfiforoom    : std_logic_vector (TXFIFOSIZE_BITS downto 0); -- TX FIFO room.
      disc_cnt      : std_logic_vector (7 downto 0); --! disconnect error counter
      par_cnt       : std_logic_vector (7 downto 0); --! parity error counter
      esc_cnt       : std_logic_vector (7 downto 0); --! escape error counter
      cred_cnt      : std_logic_vector (7 downto 0); --! credit error counter
      empty_cnt     : std_logic_vector (7 downto 0); --! empty packet counter
   end record;
--! \cond VHDL2008
   alias spwstream_regs_uut  is <<signal uut.res_seq : spwstream_regs_type>>;
   --! Registers from SpwLink
   alias spwlink_regs_uut  is <<signal uut.link_inst.state_seq : spwlink_regs_type>>;
   --! state is link_st_t.
   alias link_state    is spwlink_regs_uut.state;
   alias s_txfifo_wen is <<signal uut.s_txfifo_wen : std_logic>>;
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
      variable random_bit_vec  : std_logic_vector (0 downto 0);
      variable random_seq      : std_logic_vector (8 downto 0) := (others => '0');
      variable prevnullchar    : integer := 0;
      variable prevfctchar     : integer := 0;
      variable fctcnt          : integer := 0;
      variable nulltimeout     : time;
      variable fcttimeout      : time;
--! \cond VHDL2008
      --------------------------------------------------------------------------
      -- Procedure inputReset
      --! \brief        Reset the SPW data and strobe signals.
      --------------------------------------------------------------------------
      procedure inputReset is
      begin
         gen_par   <= '0';
         random_seq  := (others => '0');
         -- gentle reset of SpaceWire signals
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
         end if; -- spw_link.di
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
         dat: std_logic_vector (7 downto 0)
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
      gen_started <= '0';
      gen_connect <= '0';
      gen_run <= '0';
      inputReset;
      gen_idle <= '1';
      if gen_ptrn = 0 then
         wait until gen_ptrn /= 0;
      end if; -- gen_ptrn
      gen_idle <= '0';
      ptrnLoop: while gen_ptrn /= 0 loop
         if gen_ptrn = 1 then
            -- NULL tokens
            genesc;
            genfct;
         elsif gen_ptrn = 2 then
            -- FCT tokens
            genfct;
         elsif gen_ptrn = 3 then
            -- NULL token with simultaneous switching of data and strobe
            genesc;
            genfct;
            -----------------------------
            spw_link.si <= '1';
            spw_link.di <= '1';
            if link_state = S_Run then
               wait for INBIT_PD;
            else
               wait for INIT_INBIT_PD;
            end if; -- link_state
            -----------------------------
            genesc;
            genfct;
            -----------------------------
            genesc;
            genfct;
            -----------------------------
            genesc;
            genfct;
            -----------------------------
            genesc;
            genfct;
         elsif gen_ptrn = 4 then
            -- Strobe and Data stable at '1'
            spw_link.si <= '1';
            spw_link.di <= '1';
            if link_state = S_Run then
               wait for INBIT_PD;
            else
               wait for INIT_INBIT_PD;
            end if; -- link_state
         elsif gen_ptrn = 19 then
            -- reacts as a SpaceWire Link in Start mode
            wait for 19.2 us;
            gen_started <= '1';
            prevnullchar := char_mon_stats.nullchars;
            nulltimeout := NOW;
            while (char_mon_stats.nullchars < prevnullchar + 1) and 
                  (nulltimeout + 12.8 us > NOW ) loop -- wait to receive a NULL 
               genesc;
               genfct;
            end loop;
            exit ptrnLoop when (nulltimeout + 12.8 us <= NOW );
            gen_started <= '0';
            gen_connect <= '1';
            prevfctchar := char_mon_stats.fcts;
            fctcnt := 0;
            fcttimeout := NOW;
            while (char_mon_stats.fcts < prevfctchar + 1) and
                  (fcttimeout + 12.8 us > NOW ) loop -- wait to receive an FCT
               if fctcnt < 7 then
                  genfct;
                  fctcnt := fctcnt + 1;
               else
                  genesc;
                  genfct;
               end if; -- fctcnt
            end loop;
            exit ptrnLoop when (fcttimeout + 12.8 us <= NOW );
            gen_connect <= '0';
            gen_run     <= '1';
            while gen_ptrn = 19 loop
               genesc;
               genfct;
            end loop;
         elsif gen_ptrn = 20 then
            -- send data bytes
            gendat(X"01");
            gendat(X"02");
            gendat(X"03");
            gendat(X"04");
            gendat(X"05");
            gendat(X"06");
            gendat(X"07");
            genesc;
            genesc;
         else
             PrintLine(GetExecutedTestCaseName, LS_FAILURE, "genInputProc: " & integer'image(gen_ptrn) & " Unknown input pattern selected!" );
         end if; -- gen_ptrn
      end loop ptrnLoop;
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
      variable rdptr      : integer := 0;  --! Read pointer for TX_CHARS FIFO
      --------------------------------------------------------------------------
      variable datatimecodeflag: integer := 0; --! 0 for N-char
      variable ctrlin : std_logic_vector (1 downto 0) := (others => '0');
      variable timein : std_logic_vector (5 downto 0) := (others => '0');
      variable txdata      : std_logic_vector (7 downto 0) := (others => '0');
      variable txflag         : integer := 0;  --! flag to decide the txdata (N-char) type.
      variable endofpacketflag: integer := 0;  --! flag to decide the end of
                                               --! packet type. 0 for EOP, 1 for EEP, 2 for wrong EOP/EEP
      variable inputgenstats : generator_stats_type := generator_stats_reset;
      --------------------------------------------------------------------------
      variable prevdatachars : integer := 0; --! previous data characters
      variable eepdetected : boolean := False; --! condition to exit reading loop in case 6
      --
      variable bytes_cnt : natural := 0; --! byte counter for transmitting data bytes from the FIFO interface in UUT
      variable rxfifo_raddr : std_logic_vector (RXFIFOSIZE_BITS-1 downto 0); --! RX FIFO read pointer
      variable txfifo_waddr : std_logic_vector (TXFIFOSIZE_BITS-1 downto 0); --! TX FIFO write pointer
--! \cond VHDL2008
      --------------------------------------------------------------------------
      -- check that the UUT is in a expected state. The procedure waits to reach 
      -- this state for a defined time.
      procedure checkState (state : in link_st_t; waitperiod : in time ) is
      begin
         wait until ( link_state = state ) for waitperiod;
         if (link_state /= state ) then
            bad_init_seq <= '1';
            StopProcess(control);
         end if; -- link_state
      end procedure checkState;
      --------------------------------------------------------------------------
      -- Assert a testbench signal for one clock period 
      procedure AssertTestbenchSignal ( signal tbsig : out std_logic ) is
      begin
         tbsig <= '1';
         wait for UUT_T_SYSCLK;
         tbsig <= '0';
      end procedure AssertTestbenchSignal;
      --------------------------------------------------------------------------
      -- Generates the inputs for UUT
      -- 
      procedure GenData(numbytes : natural; bytes_cnt : inout natural ) is
      begin
         if bytes_cnt < numbytes then
            txflag := 0;
         else
            txflag := 1;
         end if; -- inputgenstats.databytestx
         
         if (txflag = 0) then
            txdata := std_logic_vector(unsigned(txdata) + to_unsigned(1, txdata'length)) ;
            inputgenstats.databytestx := inputgenstats.databytestx + 1;
            inputgenstats.bytestx := inputgenstats.bytestx + 1;
         else
            endofpacketflag := 0;
            txdata := X"00";
            inputgenstats.eopstx := inputgenstats.eopstx + 1;
            inputgenstats.bytestx := inputgenstats.bytestx + 1;
         end if; -- txflag
         bytes_cnt := bytes_cnt + 1;
      end procedure GenData;
      --------------------------------------------------------------------------
      -- WriteByteToSPW -> TBWriteByteToSPW
      procedure TBWriteByteToSPW is
      begin
         WriteByteToSPW(clk, datatimecodeflag, spw_host_out.running, spw_host_in.tick_in,
                        spw_host_in.ctrl_in, spw_host_in.time_in, ctrlin, timein,
                        spw_host_in.tx_data, spw_host_in.tx_flag, spw_host_out.tx_rdy,
                        spw_host_in.tx_write,txdata, txflag, HOLD_TIME, UUT_T_SYSCLK);
      end procedure TBWriteByteToSPW;
      --------------------------------------------------------------------------
      -- WriteByteToSPW -> TBWriteByteToSPWIGTXRDY
      -- Variant that ignores the TXRDY signal from SpW (used to test TXFIFO FULL write)
      procedure TBWriteByteToSPWIGTXRDY is
      begin
         WriteByteToSPW(clk, datatimecodeflag, spw_host_out.running, spw_host_in.tick_in,
                        spw_host_in.ctrl_in, spw_host_in.time_in, ctrlin, timein,
                        spw_host_in.tx_data, spw_host_in.tx_flag, logic_1,
                        spw_host_in.tx_write,txdata, txflag, HOLD_TIME, UUT_T_SYSCLK);
      end procedure TBWriteByteToSPWIGTXRDY;
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
      procedure ReadAckToUUT is
      begin
         spw_host_in.rx_read <= '1';
         wait for UUT_T_SYSCLK;
         spw_host_in.rx_read <= '0';
      end procedure ReadAckToUUT;
      --------------------------------------------------------------------------
      -- Simplified version of CheckSignalStable in VHUNIT TestMonitor_pkg
      procedure CheckSignalStable( 
         signal   target           : in std_logic;
         constant signal_name      : in string;
         constant stable_for       : in time;
         constant message          : in string := ""
      ) is
         constant value_string       : string  := to_string(target);
         constant last_value_string  : string  := to_string(target'last_value);
         constant last_change        : time    := target'last_event;
         constant last_change_string : string  := to_string(last_change, VHUNIT_TIME_BASE);
      begin
        if ( last_change >= stable_for ) then
            PrintLogLine( GetExecutedTestCaseName, signal_name, "=> stable at '" & value_string &
                          "'. "  & message );
         else 
            PrintCheckLine( GetExecutedTestCaseName, signal_name, "=> not stable. " &
                            "Switched from " & last_value_string & " to " & value_string &
                            " " & last_change_string & " ago. " & message );
         end if; -- last_change
         
      end procedure CheckSignalStable;
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
      -- Case : Simultaneous switching in data and strobe input signals.
      -- Objective: Evaluate if the UUT is tolerant to simultaneous transitions 
      --            on the Data and Strobe lines.
      --            
      case_number <= 1;
      tf := 1;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Simultaneous transitions on Data and Strobe input.");
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Set Init state of UUT and stimulus
      spw_host_in.link_start <= '1';
      mon_ena1 <= '1';
      gen_ptrn <= 1; -- send NULLs
      checkState(S_Connecting, 30 us);
      gen_ptrn <= 2; -- send FCT
      checkState(S_Run, 10 us);      
      gen_ptrn <= 1; -- send NULLs
      wait for 1 us;
      gen_ptrn <=  3; -- send NULL with simultaneous switching in data and strobe
      -- NOTE: JTO 15.01.21 For the XOR only version of RXCLK recovery, The receiver does not 
      -- generate any error.
      -- checkState(S_ErrorReset, 2 us);
      mon_ena1 <= '0';
      gen_ptrn <= 0;
      -- The UUT should detect a parity error.
      wait for 2 us;
      
      --------------------------------------------------------------------------
      -- Case : Link connected in one direction (UUT to gen_ptrn) but not in the other (gen_ptrn to UUT).
      -- Objective: Evaluate the behavior of the UUT when it is only connected
      --            in one direction. If both are set to link start, both FSM 
      --            should cycle between ErrorReset and Started states. 
      case_number <= 2;
      tf := 2;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Link connected in one direction but not in the other.");
      --------------------------------------------------------------------------
      -- Reset asserted in the ErrorReset state
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      gen_ptrn <= 0;
      checkState(S_ErrorWait, 6.5 us); -- 6.4 us is the nominal
      checkState(S_Ready, 12.9 us); -- 12.8 us is the nominal
      checkState(S_Started, 1 us); -- 
      checkState(S_ErrorReset, 12.9 us); -- 12.8 us is the nominal
      gen_ptrn <= 4; -- Strobe and Data stable at '1'
      checkState(S_ErrorWait, 6.5 us); -- 6.4 us is the nominal
      checkState(S_Ready, 12.9 us); -- 12.8 us is the nominal
      checkState(S_Started, 1 us); -- 
      checkState(S_ErrorReset, 12.9 us); -- 12.8 us is the nominal
     
      wait for 2 us; 
      gen_ptrn <= 0;
      AssertTestbenchSignal(uut_ok_response);
      --------------------------------------------------------------------------
      -- Case : One end starts while the other end disconnects.
      -- Objective: Evaluate the behavior of the UUT when one FSM arrive to the 
      --            Started state 12.8 us after the other end arrived to the Started state. 
      --            In the first try, the link is not established but on the second try, the
      --            link is established.
      case_number <= 3;
      tf := 3;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". One end starts while the other end disconnects.");
      --------------------------------------------------------------------------
      -- Reset asserted 
      rst_n <= '0';
      spw_host_in.link_start <= '1';
      gen_ptrn <= 19;
      wait for 12.8 us;
      rst_n <= '1';
      mon_ena1 <= '1';
      
      checkState(S_Connecting, 21.2 us); -- 19.2 +0.8(NULL) us is the nominal
      checkState(S_ErrorReset, 2 us); -- 
      mon_ena1 <= '0';
      checkState(S_Ready, 20.2 us); -- 19.2 us is the nominal
      mon_ena1 <= '1';
      
      wait for 10 us;
      checkState(S_Run, 1 us); -- link running
      AssertTestbenchSignal(uut_ok_response);
      gen_ptrn <= 0;
      mon_ena1 <= '0';
      --------------------------------------------------------------------------
      -- Case : D connected, S disconnected
      -- Objective: Evaluate the behavior of the UUT when only the data line is 
      --            connected and the strobe line is disconnected.
      --             
      --             
      case_number <= 4;
      tf := 4;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Data connected, Strobe disconnected.");
--! \cond VHDL2008
      --------------------------------------------------------------------------
      -- Reset asserted in the ErrorReset state
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      spw_link.si <= force '1';
      gen_ptrn <= 1; -- send NULLs
      checkState(S_Started, 20.2 us); -- 6.4 us + 12.8 us is the nominal
      checkState(S_ErrorReset, 13.8 us); -- 12.8 us is the nominal
      spw_link.si <= force '0';
      checkState(S_Started, 20.2 us); -- 6.4 us + 12.8 us is the nominal
      checkState(S_ErrorReset, 13.8 us); -- 12.8 us is the nominal
      spw_link.si <= release;
      checkState(S_Connecting, 21 us); -- 19.2 us + 0.8 us us is the nominal
      gen_ptrn <= 2; -- send FCTs
      checkState(S_Run, 3 us);
      gen_ptrn <= 1; -- send NULLs
      spw_link.si <= force '0';
      -- after S disconnected 
      checkState(S_ErrorReset, 14 us); -- the input data is interpreted as data char, so a credit error is triggered
      
      spw_link.si <= release;
      wait for 2 us;
      gen_ptrn <= 0;
      AssertTestbenchSignal(uut_ok_response);
--! \endcond 
      --------------------------------------------------------------------------
      -- Case : S connected, D disconnected
      -- Objective: Evaluate the behavior of the UUT when only the strobe line is 
      --            connected and the data line is disconnected.
      --             
      case_number <= 5;
      tf := 5;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Strobe connected, Data disconnected.");
      --------------------------------------------------------------------------
--! \cond VHDL2008
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      spw_link.di <= force '1';
      gen_ptrn <= 1; -- send NULLs
      checkState(S_Started, 20.2 us); -- 6.4 us + 12.8 us is the nominal
      checkState(S_ErrorReset, 13.8 us); -- 12.8 us is the nominal
      spw_link.di <= force '0';
      checkState(S_Started, 20.2 us); -- 6.4 us + 12.8 us is the nominal
      checkState(S_ErrorReset, 13.8 us); -- 12.8 us is the nominal
      spw_link.di <= release;
      checkState(S_Connecting, 21 us); -- 19.2 us + 0.8 us us is the nominal
      gen_ptrn <= 2; -- send FCTs
      checkState(S_Run, 3 us);
      gen_ptrn <= 1; -- send NULLs
      spw_link.di <= force '0';
      -- after D disconnected, 
      checkState(S_ErrorReset, 1 us);
      spw_link.di <= release;
--! \endcond
      wait for 2 us;
      gen_ptrn <= 0; 
      AssertTestbenchSignal(uut_ok_response);
      --------------------------------------------------------------------------
      -- Case : Link error while transmitting/receiving a packet.
      -- Objective: Evaluate the behavior of the UUT when a link error happens 
      --            when transmitting/receiving a data packet. The transmitted 
      --            packet should be spilled from the TXFIFO and after the last 
      --            received byte from the received data packet should be added 
      --            an EEP marker.
      case_number <= 6;
      tf := 6;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Link error while transmitting/receiving a packet.");
      --------------------------------------------------------------------------
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      mon_ena1 <= '1';
      gen_ptrn <= 19; -- reacts as a SpaceWire Link in Start mode
      checkState(S_Run, 30 us);
      gen_ptrn <= 20; -- send data bytes
      
      bytes_cnt := 0;
      while (end_sim = false and (bytes_cnt < 11)) loop
         -- data generation to send from UUT to gen_ptrn
         GenData(10,bytes_cnt);
         -- send random data to UUT.
         TBWriteByteToSPW;
      end loop;
      
      checkState(S_ErrorReset, 10 us);
      mon_ena1 <= '0';
      gen_ptrn <= 0;
      gen_ptrn <= 19; -- reacts as a SpaceWire Link in Start mode
      prevdatachars := char_mon_stats.datachars;
      checkState(S_Started, 20.2 us);
      mon_ena1 <= '1';
      checkState(S_Run, 10 us);
      wait for 5 us;
      -- check that the transmitted packet was completely spilled.
      if prevdatachars /= char_mon_stats.datachars then -- after link reestablish no data is transmitted
         AssertTestbenchSignal(uut_notok_response);
      end if; -- prevdatachars
      mon_ena1 <= '0';
      -- Read received packet from UUT and an EEP should appear at the end
      readingLoop: while (eepdetected = false) loop
         validdata := checkValidData;
         if (validdata = true) then
            if (spw_host_out.rx_flag = '1' and spw_host_out.rx_data = X"01" ) then -- EEP received
               AssertTestbenchSignal(uut_ok_response);
               eepdetected := True;
            end if; -- spw_host_out.rx_flag
            ReadAckToUUT;
         end if; -- validdata
         wait for UUT_T_SYSCLK;
      end loop readingLoop;
      gen_ptrn <= 0;
      --------------------------------------------------------------------------
      -- Case : Read empty RXFIFO.
      -- Objective: Evaluate the behavior of the UUT when the RXFIFO is read.
      -- 
      case_number <= 7;
      tf := 7;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Read empty RXFIFO.");
      --------------------------------------------------------------------------
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      wait for 1 us;
      mon_ena1 <= '1';
      gen_ptrn <= 19; -- reacts as a SpaceWire Link in Start mode
      checkState(S_Run, 30 us);
      -- store RXFIFO read pointer value
      rxfifo_raddr := spwstream_regs_uut.rxfifo_raddr;
      
      -- read Empty RXFIFO
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      ReadAckToUUT;
      
      -- check that the RXFIFO read pointer is the same as before reading
      -- this means that there is no effect on reading while empty
      if rxfifo_raddr /= spwstream_regs_uut.rxfifo_raddr then
         PrintLine(GetExecutedTestCaseName, LS_FAILURE, "testFlow: Read empty RXFIFO failed!");
      end if; -- rxfifo_raddr
      
      wait for 1 us;
      gen_ptrn <= 0;
      mon_ena1 <= '0';
      --------------------------------------------------------------------------
      -- Case : Write full TXFIFO.
      -- Objective: Evaluate the behavior of the UUT when the TXFIFO is write.
      -- 
      case_number <= 8;
      tf := 8;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Write full TXFIFO.");
      --------------------------------------------------------------------------
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      wait for 1 us;
      --mon_ena1 <= '1';
      --gen_ptrn <= 19; -- reacts as a SpaceWire Link in Start mode
      --checkState(S_Run, 30 us);
      
      -- store TXFIFO write pointer value
      txfifo_waddr := spwstream_regs_uut.txfifo_waddr;
      
      -- write 65 bytes to TXFIFO
      bytes_cnt := 0;
      while (end_sim = false and (bytes_cnt < 65)) loop
         -- data generation to send from UUT to gen_ptrn
         GenData(64,bytes_cnt);
         -- send random data to UUT ignoring the TXRDY signal
         TBWriteByteToSPWIGTXRDY;
      end loop;
      
      -- check that internal 's_txfifo_wen' signal was stable at '0' for the last clock cycle.
      CheckSignalStable(s_txfifo_wen, "s_txfifo_wen", UUT_T_SYSCLK, "" );
      
      -- check that the TXFIFO write pointer is the same as before writing
      if txfifo_waddr /= spwstream_regs_uut.txfifo_waddr then
         PrintLine(GetExecutedTestCaseName, LS_FAILURE, "testFlow: Write full TXFIFO failed!");
      end if; -- txfifo_waddr
      
      wait for 1 us;
      
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
      -- cp_ds_in_simtrans
      --------------------------------------------------------------------------
      cp_ds_in_simtrans.SetName("cp_ds_in_simtrans");
      cp_ds_in_simtrans.AddBins("Data Strobe simultaneous transition",
      DSSIMTRANS_GOAL, PASSED_BIN );
      cp_ds_in_simtrans.AddBins(ALL_ILLEGAL);
      cp_ds_in_simtrans.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_linkcon_onedir
      --------------------------------------------------------------------------
      cp_linkcon_onedir.SetName("cp_linkcon_onedir");
      cp_linkcon_onedir.AddBins("Link connected in one direction",
      LINKCONONEDIR_GOAL, PASSED_BIN );
      cp_linkcon_onedir.AddBins(ALL_ILLEGAL);
      cp_linkcon_onedir.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_onestarts_otherdiscon
      --------------------------------------------------------------------------
      cp_onestarts_otherdiscon.SetName("cp_onestarts_otherdiscon");
      cp_onestarts_otherdiscon.AddBins("One end starts, the other disconnects",
      ONESTARTSOTHERDISCON_GOAL, PASSED_BIN );
      cp_onestarts_otherdiscon.AddBins(ALL_ILLEGAL);
      cp_onestarts_otherdiscon.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_d_con_s_discon
      --------------------------------------------------------------------------
      cp_d_con_s_discon.SetName("cp_d_con_s_discon");
      cp_d_con_s_discon.AddBins("Data connected, Strobe disconnected",
      DCONSDISCON_GOAL, PASSED_BIN );
      cp_d_con_s_discon.AddBins(ALL_ILLEGAL);
      cp_d_con_s_discon.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_s_con_d_discon
      --------------------------------------------------------------------------
      cp_s_con_d_discon.SetName("cp_s_con_d_discon");
      cp_s_con_d_discon.AddBins("Strobe connected, Data disconnected",
      SCONDDISCON_GOAL, PASSED_BIN );
      cp_s_con_d_discon.AddBins(ALL_ILLEGAL);
      cp_s_con_d_discon.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_lnk_err_recov
      --------------------------------------------------------------------------
      cp_lnk_err_recov.SetName("cp_lnk_err_recov");
      cp_lnk_err_recov.AddBins("Correct link error recovery",
      LNKERRRECOV_GOAL, PASSED_BIN );
      cp_lnk_err_recov.AddBins(ALL_ILLEGAL);
      cp_lnk_err_recov.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      prevlinkst :=link_state;
      prevrstst := rst_n;
      --collecting coverage
      MainCovLoop: while not ( cp_ds_in_simtrans.IsCovered and
                               cp_linkcon_onedir.IsCovered and
                               cp_onestarts_otherdiscon.IsCovered and
                               cp_d_con_s_discon.IsCovered and
                               cp_s_con_d_discon.IsCovered and
                               cp_lnk_err_recov.IsCovered and
                               end_testflow
                              ) loop
         wait until falling_edge(clk);
         -----------------------------------------------------------------------
         -- check if cp_ds_in_simtrans is covered
         -----------------------------------------------------------------------
         if ( bad_init_seq = '1' and case_number = 1 ) then
            cp_ds_in_simtrans.ICover(FAILED);
            StopProcess(control);
         end if; -- bad_init_seq
         -- NOTE: JTO 15.01.21 For the XOR only version of RXCLK recovery, The receiver does not 
         -- generate any error.         
         if ( spw_host_out.err_disc_cnt = X"00" and spw_host_out.err_par_cnt = X"00" and
              spw_host_out.err_esc_cnt = X"00" and spw_host_out.err_cred_cnt = X"00" and
              case_number = 1 ) then
            cp_ds_in_simtrans.ICover(PASSED);
         end if; -- spw_host_out.err_par_cnt
         -----------------------------------------------------------------------
         -- check if cp_linkcon_onedir is covered
         -----------------------------------------------------------------------
         if ( bad_init_seq = '1' and case_number = 2 ) then
            cp_linkcon_onedir.ICover(FAILED);
            StopProcess(control);
         end if; -- bad_init_seq
         if (uut_ok_response = '1' and case_number = 2 ) then
            cp_linkcon_onedir.ICover(PASSED);
         end if; -- uut_ok_response
         -----------------------------------------------------------------------
         -- check if cp_onestarts_otherdiscon is covered
         -----------------------------------------------------------------------
         if ( bad_init_seq = '1' and case_number = 3 ) then
            cp_onestarts_otherdiscon.ICover(FAILED);
            StopProcess(control);
         end if; -- bad_init_seq
         if (uut_ok_response = '1' and case_number = 3 ) then
            cp_onestarts_otherdiscon.ICover(PASSED);
         end if; -- uut_ok_response
         -----------------------------------------------------------------------
         -- check if cp_d_con_s_discon is covered
         -----------------------------------------------------------------------
         if ( bad_init_seq = '1' and case_number = 4 ) then
            cp_d_con_s_discon.ICover(FAILED);
            StopProcess(control);
         end if; -- bad_init_seq
         if (uut_ok_response = '1' and case_number = 4 ) then
            cp_d_con_s_discon.ICover(PASSED);
         end if; -- uut_ok_response
         -----------------------------------------------------------------------
         -- check if cp_s_con_d_discon is covered
         -----------------------------------------------------------------------
         if ( bad_init_seq = '1' and case_number = 5 ) then
            cp_s_con_d_discon.ICover(FAILED);
            StopProcess(control);
         end if; -- bad_init_seq
         if (uut_ok_response = '1' and case_number = 5 ) then
            cp_s_con_d_discon.ICover(PASSED);
         end if; -- uut_ok_response
         -----------------------------------------------------------------------
         -- check if cp_lnk_err_recov is covered
         -----------------------------------------------------------------------
         if ( bad_init_seq = '1' and case_number = 6 ) then
            cp_lnk_err_recov.ICover(FAILED);
            StopProcess(control);
         end if; -- bad_init_seq
         if ( uut_notok_response = '1' and case_number = 6 ) then
            cp_lnk_err_recov.ICover(FAILED);
            StopProcess(control);
         end if; -- bad_init_seq
         if (uut_ok_response = '1' and case_number = 6 ) then
            cp_lnk_err_recov.ICover(PASSED);
         end if; -- uut_ok_response
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
         if not cp_ds_in_simtrans.IsCovered then
            errcov := errcov + 1;
            cp_ds_in_simtrans.WriteCovHoles;
         end if; -- cp_ds_in_simtrans
         if not cp_linkcon_onedir.IsCovered then
            errcov := errcov + 1;
            cp_linkcon_onedir.WriteCovHoles;
         end if; -- cp_linkcon_onedir
         if not cp_onestarts_otherdiscon.IsCovered then
            errcov := errcov + 1;
            cp_onestarts_otherdiscon.WriteCovHoles;
         end if; -- cp_onestarts_otherdiscon
         if not cp_d_con_s_discon.IsCovered then
            errcov := errcov + 1;
            cp_d_con_s_discon.WriteCovHoles;
         end if; -- cp_d_con_s_discon
         if not cp_s_con_d_discon.IsCovered then
            errcov := errcov + 1;
            cp_s_con_d_discon.WriteCovHoles;
         end if; -- cp_s_con_d_discon
         if not cp_lnk_err_recov.IsCovered then
            errcov := errcov + 1;
            cp_lnk_err_recov.WriteCovHoles;
         end if; -- cp_lnk_err_recov
      else
         PrintResultLine( "FC: SUCCESS! The functional coverage goal was achieved.");
         PrintResultLine( "FC: 6 coverage points checked." );
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
end architecture TC6ExceptCond_beh;
--------------------------------------------------------------------------------
-- end TC6ExceptCond.vhd
--------------------------------------------------------------------------------