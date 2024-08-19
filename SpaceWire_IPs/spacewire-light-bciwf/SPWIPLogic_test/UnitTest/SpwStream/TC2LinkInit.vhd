--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC2LinkInit.vhd
--!
--! \brief        Implementation of the test case Link Initialization SpaceWire IP 
--!               unit test. One SPW link is connected to a SPW TLM (Transaction level model).
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 26.06.2018
--! \date         Updated: 06.03.2019
--! \version      V 1.00
--
-- Unit         : TC2LinkInit (BEH) (entity, architecture)
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
-- Entity TC2LinkInit
--! \brief        TC2LinkInit - test case Link initialization of the SPW unit.
--! \details      The unit executes the test case Link initialization. Evaluates the FSM 
--!               response to errors during link initialization. 
--!
--!               List of Error/Corner cases:
--!               - Error Case: Wrong parity in first NULL and timeout in Started state
--!               - Corner Case: Wrong sequence of bits instead of first NULL
--!               - Error Case: Timeout in the Connecting state
--!               - Corner Case: Disable in Ready state
--!               - Corner Case: Disable in Run state
--!               - Corner Case: Relationship of FCT to data (Tx and Rx)
--!
--!               List of associated clauses from the SpW Standard (ECSS-E-ST-50-12C):
--!               - Error Case: Wrong parity in first NULL and timeout in Started state 8.2.2.b, 8.5.2.2.a, 8.5.2.5.b, 8.5.2.5.h, 8.5.3.2.f, 8.5.3.7.3.b, 8.11.3.b
--!               - Corner Case: Wrong sequence of bits instead of first NULL 8.5.3.2.c, 8.5.3.9.b
--!               - Error Case: Timeout in the Connecting state 8.5.2.6.b, 8.5.2.6.f, 8.11.3.b
--!               - Corner Case: Disable in Ready state 8.6.c
--!               - Corner Case: Disable in Run state 8.5.2.7.b, 8.5.3.6
--!               - Corner Case: Relationship of FCT to data (Tx and Rx) 8.3.d, 8.3.e, 8.3.f, 8.3.g, 8.3.j, 8.3.k, 8.3.n
--!
--!               List of coverage points used here:
--!               - cp_charbadpar, cp_link_fsm, cp_gotNULL, cp_tmout2
--!               - cp_txdcond, cp_rx7FCT, cp_txm7FCT
-- Comments     :
-- Updates      :
--------------------------------------------------------------------------------
entity TC2LinkInit is
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
end entity TC2LinkInit;
--------------------------------------------------------------------------------
-- Architecture TC2LinkInit_beh
--! \brief  Implementation of the test case 2 for the SPW unit.
--------------------------------------------------------------------------------
architecture TC2LinkInit_beh of TC2LinkInit is
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
   signal spw_host_in   : spw_host_interface_in := spw_host_interface_in_reset;  --! SPW host input interface
   signal spw_host_out  : spw_host_interface_out := spw_host_interface_out_reset;  --! SPW host output interface
   signal spw_link      : spw_link_interface; --! SPW link interface
   -----------------------------------------------------------------------------
   -- testFlow process signals
   -----------------------------------------------------------------------------
   -----------------------------------------------------------------------------
   -- Functional Coverage related signals, variables and constants
   -----------------------------------------------------------------------------
   constant ILLEGALMODE : IllegalModeType := ILLEGAL_ON; -- can also be ILLEGAL_FAILURE
   -----------------------------------------------------------------------------
   -- Functional coverage point for the link FSM
   -----------------------------------------------------------------------------
   -- Link FSM details
   -- States      : 6
   -- transitions : 11
   -- arcs        : 37
   -- conditions  : 14 - Reset         - got_timecode
   --                  - recvo_errdisc - timer_6_4u
   --                  - recvo_errpar  - timer_12_8u
   --                  - got_fct       - link_disable
   --                  - got_null      - link_start
   --                  - recvo_erresc  - link_autostart
   --                  - got_rxchar    - linko_errcred
   -----------------------------------------------------------------------------
   -- Type cond_t
   --! \brief        FSM Conditions type.
   --! \details      The type contains the state transition conditions
   --!               for the Link FSM.
   -- Comments     : Additional comments if needed, not included in source code
   --                documentation.
   -----------------------------------------------------------------------------
   type cond_t is (
   C_others, C_reset, C_disc_err, C_par_err, C_got_fct, C_got_null, C_esc_err,
   C_got_rxchar, C_got_timecode, C_timer_6_4u, C_timer_12_8u, C_link_disable ,
   C_credit_err, C_link_start, C_link_auto_start, C_got_null_fct);
   constant COND_T_LENGTH : natural := cond_t'pos(cond_t'right) + 1; --! Total number of conditions
   -- declaration of coverage bins for FSM conditions
   constant BIN_C_RESET     : CovBinType := GenBin(cond_t'pos(C_reset));
   constant BIN_C_DISCERR   : CovBinType := GenBin(cond_t'pos(C_disc_err));
   constant BIN_C_PARERR    : CovBinType := GenBin(cond_t'pos(C_par_err));
   constant BIN_C_GOTFCT    : CovBinType := GenBin(cond_t'pos(C_got_fct));
   constant BIN_C_GOTNULL   : CovBinType := GenBin(cond_t'pos(C_got_null));
   constant BIN_C_ESCERR    : CovBinType := GenBin(cond_t'pos(C_esc_err));
   constant BIN_C_GOTRXCHAR : CovBinType := GenBin(cond_t'pos(C_got_rxchar));
   constant BIN_C_GOTTC     : CovBinType := GenBin(cond_t'pos(C_got_timecode));
   constant BIN_C_TMR64U    : CovBinType := GenBin(cond_t'pos(C_timer_6_4u));
   constant BIN_C_TMR128U   : CovBinType := GenBin(cond_t'pos(C_timer_12_8u));
   constant BIN_C_LNKDIS    : CovBinType := GenBin(cond_t'pos(C_link_disable));
   constant BIN_C_CREDERR   : CovBinType := GenBin(cond_t'pos(C_credit_err));
   constant BIN_C_LNKSTRT   : CovBinType := GenBin(cond_t'pos(C_link_start));
   constant BIN_C_AUTOSTRT  : CovBinType := GenBin(cond_t'pos(C_link_auto_start));
   constant BIN_C_GOTNULLFCT: CovBinType := GenBin(cond_t'pos(C_got_null_fct));
   constant IGBIN_C_OTHERS  : CovBinType := IgnoreBin(cond_t'pos(C_others));
   --
   --! FSM conditions signal 
   signal cond : cond_t; 
   --! cover point for each of the states in the link FSM.
   shared variable cp_link_fsm : CovPType;
   -- declaration of coverage bins for the states of the FSM
   constant BIN_ERRORRESET   : CovBinType := GenBin(link_st_t'pos(S_ErrorReset));
   constant IGBIN_ERRORRESET : CovBinType := IgnoreBin(link_st_t'pos(S_ErrorReset));
   constant BIN_ERRORWAIT    : CovBinType := GenBin(link_st_t'pos(S_ErrorWait));
   constant IGBIN_ERRORWAIT  : CovBinType := IgnoreBin(link_st_t'pos(S_ErrorWait));
   constant BIN_READY        : CovBinType := GenBin(link_st_t'pos(S_Ready));
   constant IGBIN_READY      : CovBinType := IgnoreBin(link_st_t'pos(S_Ready));
   constant BIN_STARTED      : CovBinType := GenBin(link_st_t'pos(S_Started));
   constant IGBIN_STARTED    : CovBinType := IgnoreBin(link_st_t'pos(S_Started));
   constant BIN_CONNECTING   : CovBinType := GenBin(link_st_t'pos(S_Connecting));
   constant IGBIN_CONNECTING : CovBinType := IgnoreBin(link_st_t'pos(S_Connecting));
   constant BIN_RUN          : CovBinType := GenBin(link_st_t'pos(S_Run));
   constant IGBIN_RUN        : CovBinType := IgnoreBin(link_st_t'pos(S_Run));
--! \cond VHDL2008   
   --! Registers from SpwLink
   alias spwlink_regs_uut  is <<signal uut.link_inst.state_seq : spwlink_regs_type>>;
   --! Signals from SpwLink to SpwRecv
   alias spwlink_recvo_uut is <<signal uut.link_inst.recvo : spw_recv_out_type>>;
   --! Signals from SpwLink to SpwStream
   alias spwlink_linko_uut is <<signal uut.link_inst.linko : spw_link_out_type>>;
   --! Signals from SpwLink to SpwXmit
   alias spwlink_xmiti_uut is <<signal uut.link_inst.xmiti : spw_xmit_in_type>>;
   --! state is link_st_t.
   alias link_state    is spwlink_regs_uut.state;
   --! timercnt is unsigned(10 downto 0).
   alias timer_6_4u    is spwlink_regs_uut.timercnt;
   --! timerdone is std_ulogic.
   alias timer_12_8u   is spwlink_regs_uut.timerdone;
   --! gotfct is std_logic.
   alias got_fct       is spwlink_recvo_uut.gotfct;
   --! gotnull is std_logic.
   alias got_null      is spwlink_recvo_uut.gotnull;
   --! recvo_erresc is std_logic.
   alias recvo_erresc  is spwlink_recvo_uut.erresc;
   --! linko_erresc is std_logic.
   alias linko_erresc  is spwlink_linko_uut.erresc;
   --! recvo_errdisc is std_logic.
   alias recvo_errdisc is spwlink_recvo_uut.errdisc;
   --! linko_errdisc is std_logic.
   alias linko_errdisc is spwlink_linko_uut.errdisc;
   --! recvo_errpar is std_logic.
   alias recvo_errpar  is spwlink_recvo_uut.errpar;
   --! linko_errpar is std_logic.
   alias linko_errpar  is spwlink_linko_uut.errpar;
   --! rxchar is std_logic.
   alias got_rxchar    is spwlink_recvo_uut.rxchar;
   --! tick_out is std_logic.
   alias got_timecode  is spwlink_recvo_uut.tick_out;
   --! linko_errcred is std_ulogic.
   alias linko_errcred is spwlink_linko_uut.errcred;
   --! rx_credit is unsigned(5 downto 0).
   alias rx_credit     is spwlink_regs_uut.rx_credit;
   --! tx_credit is unsigned(5 downto 0).
   alias tx_credit     is spwlink_regs_uut.tx_credit;
   --! rx_null_fct is std_ulogic.
   alias rx_null_fct   is spwlink_regs_uut.rx_null_fct;
   --! xmit_fct_in is std_ulogic.
   alias xmit_fct_in   is spwlink_regs_uut.xmit_fct_in;
--! \endcond 
   -----------------------------------------------------------------------------
   --! L or N chars received with wrong parity should not be acted.
   shared variable cp_charbadpar  : CovPType;
   constant BPB1N_BIN  : integer := 1; -- bad parity before first null bin
   constant BPB1N_GOAL : integer := 1; -- bad parity before first null goal
   signal   bpb1n      : std_logic := '0'; -- bad parity before first null
   constant IBP_BIN    : integer := 99; --! illegal bad parity - unintended parity error
   -----------------------------------------------------------------------------
   --! Verify the reception of the first NULL.
   shared variable cp_gotNULL : CovPType; -- cp got NULL
   constant DFNULL_BIN  : integer := 1; -- detected first null bin
   constant DFNULL_GOAL : integer := 1; -- detected first null goal
   constant INNULL_BIN  : integer := 2; -- ignored not null bits bin
   constant INNULL_GOAL : integer := 1; -- ignored not null bits goal
   constant INNULLD_BIN : integer := 99; -- illegal not null detection bin
   -----------------------------------------------------------------------------
   --! Verify that the 12.8 us timeout is in the range: [11.64 14.33] us. Also verify
   --! the FSM goes to ErrorWait state.
   shared variable cp_tmout2 : CovPType; -- cp timeout period 2
   constant TMOUT2_BIN  : integer := 1;  -- timeout 2 bin
   constant TMOUT2_GOAL : integer := 4; -- timeout 2 goal
   constant ITMOUT2_BIN : integer := 99; -- illegal timeout 2 bin
   -----------------------------------------------------------------------------
   --! Verifies two scenarios: 1. If not rx FCT, not tx N-chars. 
   --! 2. If rx FCT, only the allowed number of N-chars bytes are tx.
   shared variable cp_txdcond : CovPType; -- cp tx data condition
   constant TXDARXF_BIN  : integer := 1; -- tx data after rx fct bin
   constant TXDARXF_GOAL : integer := 1; -- tx data after rx fct goal 
   constant NFNTXD_BIN   : integer := 2; -- no fct no tx data bin
   constant NFNTXD_GOAL  : integer := 1; -- no fct no tx data goal
   constant ITXD_BIN     : integer := 99; -- illegal tx data bin
   -----------------------------------------------------------------------------
   --! the IP should be able to receive 7 FCT chars.
   shared variable cp_rx7FCT : CovPType; -- cp rx 7 FCT
   constant RX7FCT_BIN  : integer := 1; -- rx 7 FCT bin
   constant RX7FCT_GOAL : integer := 1; -- rx 7 FCT goal
   constant IRX7FCT_BIN : integer := 99; -- illegal rx 7 fct bin
   -----------------------------------------------------------------------------
   --! verify that after reset or link disconnect the max number of FCTs send is
   --! 7 and rx credit = 56.
   shared variable cp_txm7FCT : CovPType; -- tx maximum of 7 FCTs
   constant TX7FCT_BIN  : integer := 1; -- tx 7 FCT bin
   constant TX7FCT_GOAL : integer := 1; -- tx 7 FCT goal
   constant ITX7FCT_BIN : integer := 99; -- illegal tx 7 FCT bin
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
         elsif gen_ptrn = 5 then
            -- FCT, TIME, 8 chars, NULLs
            genfct;
            genesc;
            gendat("00111000");
            gendat("01010101");
            gendat("10101010");
            gendat("01010101");
            gendat("10101010");
            gendat("01010101");
            gendat("10101010");
            gendat("01010101");
            gendat("10101010");
            while gen_ptrn = 5 loop
               genesc;
               genfct;
            end loop;
         elsif gen_ptrn = 9 then
             -- FCT, FCT, NULLs
            genfct;
            genfct;
            genfct;
            genfct;
            genfct;
            genfct;
            genfct;
            while gen_ptrn = 9 loop
               genesc;
               genfct;
            end loop;
         elsif gen_ptrn = 11 then
            -- Second NULL with wrong parity in the second parity bit
            genBit('1'); -- C(flag of esc)
            genBit('1'); -- CODE 1 of esc
            genBit('1'); -- CODE 2 of esc
            genBit('1'); -- P(esc code) => 'bad'
            genBit('1'); -- C(fct code)
            genBit('0'); -- CODE 1 of fct
            genBit('0'); -- CODE 2 of fct
            genBit('0'); -- P(fct code & flag of next code)
            -- First NULL with wrong parity in the first bit
            genBit('1'); -- P(flag of esc) => 'bad'
            genBit('1'); -- C(flag of esc)
            genBit('1'); -- CODE 1 of esc
            genBit('1'); -- CODE 2 of esc
            genBit('0'); -- P(esc code)
            genBit('1'); -- C(fct code)
            genBit('0'); -- CODE 1 of fct
            genBit('0'); -- CODE 2 of fct
            genBit('0'); -- P(fct code & flag of next code)
            -- Third NULL with wrong parity in the third parity bit
            genBit('1'); -- C(flag of esc)
            genBit('1'); -- CODE 1 of esc
            genBit('1'); -- CODE 2 of esc
            genBit('0'); -- P(esc code) => 'bad'
            genBit('1'); -- C(fct code)
            genBit('0'); -- CODE 1 of fct
            genBit('0'); -- CODE 2 of fct
                         -- P(fct code & flag of next code that will be
                         -- the first bit of first NULL
         elsif gen_ptrn = 18 then
            -- random bits instead of first NULL
            random_bit_vec := RV.RandSlv(0, 1, 1);
            random_bit := random_bit_vec(0);
            random_seq := random_seq(7 downto 0) & random_bit;
            if random_seq = "011101000" then -- avoid the seq = 011101000 (0xE8) (FIRST NULL)
               random_bit := '1';
               random_seq := "011101001";
            end if; -- random_seq
            genBit(random_bit);
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
      variable error_var  : integer := 0;
      variable tf         : integer := 0;
      --------------------------------------------------------------------------
      variable looptime   : time := 0 ns;  
      variable txflagdata : std_logic_vector(8 downto 0) := (others => '0');
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
      -- Case: Wrong parity in first NULL and timeout in Started state
      -- Objective: Test wrong parity in the first NULL in the Started state.
      case_number <= 1;
      tf := 1;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Wrong parity error in first NULL and timeout in Started state.");
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 0; -- disabled
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.link_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Started state
      wait until link_state = S_Started;
      gen_ptrn <= 11; -- First NULL with wrong parity in different parity bits
      wait until (timer_6_4u = 0 and timer_12_8u = '1') for 14.33 us; -- max time for timeout period 2
      if (timer_6_4u = 0 and timer_12_8u = '1') then
         wait until rising_edge(clk);
         bpb1n <= '1';
         wait until rising_edge(clk);
         bpb1n <= '0';
      end if; -- timer_6_4u
      gen_ptrn <= 0; -- disabled
      --------------------------------------------------------------------------
      -- Case: Wrong sequence of bits instead of first NULL
      -- Objective: Test different sequence of bits that are not first NULL.
      case_number <= 2;
      tf := 2;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Random bits instead of first NULL.");
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 0; -- disabled
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Connecting state
      wait until link_state = S_Ready;
      gen_ptrn <= 18; -- random bits not first NULL
      wait on link_state for 64 * 8 * INIT_INBIT_PD;
      if link_state = S_Started then
         PrintLine(GetExecutedTestCaseName, LS_FAILURE, "TF: ERROR in CASE " & to_string(case_number) );
         error_var := error_var + 1;
      end if; -- link_state
      gen_ptrn <= 0; -- disabled
      --------------------------------------------------------------------------
      -- Case: Timeout in the Connecting state
      -- Objective: Send NULLs up to the connecting state and wait for timeout 12.8 us.
      case_number <= 3;
      tf := 3;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Timeout in connecting state.");
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Connecting state
      wait until link_state = S_Connecting;
      wait until (timer_6_4u = 0 and timer_12_8u = '1') for 14.33 us; -- max time for timeout period 2
      gen_ptrn <= 0; -- disabled
      wait until link_state = S_ErrorReset;
      if link_state /= S_ErrorReset then
         PrintLine(GetExecutedTestCaseName, LS_FAILURE, "TF: ERROR in CASE " & to_string(case_number) );
         error_var := error_var + 1;
      end if; -- link_state
      --------------------------------------------------------------------------
      -- Case: Disable in Ready state.
      -- Objective: Evaluate link disable in Ready state. The FSM should stay in 
      -- Ready state when link_disable = ‘1’ even if link_start or 
      -- link_auto_start are ‘1’.
      case_number <= 4;
      tf := 4;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Disable in Ready state.");
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      spw_host_in.link_dis <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      mon_ena1 <= '1';
      wait until link_state = S_Connecting for 25 us;
      if link_state = S_Connecting then
         PrintLine(GetExecutedTestCaseName, LS_FAILURE, "TF: ERROR in CASE " & to_string(case_number) );
         error_var := error_var + 1;
      end if; -- link_state
      spw_host_in.link_start <= '1';
      spw_host_in.auto_start <= '0';
      wait until link_state = S_Connecting for 10 us;
      if link_state = S_Connecting then
         PrintLine(GetExecutedTestCaseName, LS_FAILURE, "TF: ERROR in CASE " & to_string(case_number) );
         error_var := error_var + 1;
      end if; -- link_state
      mon_ena1 <= '0';
      gen_ptrn <= 0; -- disabled
      --------------------------------------------------------------------------
      -- Case: Disable in the Run state
      -- Objective: Send NULLs, FCT and data up to the run state and disable the link.
      case_number <= 5;
      tf := 5;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Disable in run state.");
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.link_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Started state
      wait until link_state = S_Started;
      gen_ptrn <= 5; -- FCT, Timecode, 8 data chars, NULLs
      wait until link_state = S_Run;
      wait for 30 * INBIT_PD;
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      spw_host_in.link_dis <= '1';
      wait for UUT_T_SYSCLK;
      spw_host_in.link_dis <= '0';
      wait until link_state = S_ErrorReset for 1 us;
      if link_state /= S_ErrorReset then
         PrintLine(GetExecutedTestCaseName, LS_FAILURE, "TF: ERROR in CASE " & to_string(case_number) );
         error_var := error_var + 1;
      end if; -- link_state
      --------------------------------------------------------------------------
      -- Case 6: Relationship of FCT and data (Tx and Rx)
      -- Objective: Evaluate if the UUT is able to Rx 7 FCTs (max FCTs after reset) and
      --            should only send a maximum of 7 FCTs. Also if the UUT only tx
      --            data when is allowed (rx fcts).
      case_number <= 6;
      tf := 6;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Tx and Rx Max FCTs.");
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.link_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Connecting state
      mon_ena1 <= '1';
      wait until link_state = S_Connecting;
      gen_ptrn <= 9; -- 7 FCTs then NULLs
      wait for 10 us; -- wait to rx the 7 FCTs
      looptime := NOW + 10 us;
      -- send data through host interface
      SendData: while (link_state /= S_ErrorReset) loop
         wait until ( rising_edge(clk) );
         wait for HOLD_TIME;
         txflagdata := rv.RandSlv(0,511,9);
         while (spw_host_out.tx_rdy = '0') loop
            wait until ( rising_edge(clk) );
            wait for HOLD_TIME;
            exit SendData when NOW > looptime;
         end loop;
         spw_host_in.tx_flag <= txflagdata(8);
         spw_host_in.tx_data <= txflagdata(7 downto 0);
         spw_host_in.tx_write <= '1';
         wait for UUT_T_SYSCLK;
         spw_host_in.tx_write <= '0';
         exit SendData when NOW > looptime;
      end loop;
      if link_state = S_ErrorReset then
         PrintLine(GetExecutedTestCaseName, LS_FAILURE, "TF: ERROR in CASE " & to_string(case_number) );
         error_var := error_var + 1;
      end if; -- link_state
      gen_ptrn <= 0; -- disabled
      mon_ena1 <= '0';

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
   -- Process collectConditions
   --! \brief        Collect conditions from FSM.
   --! \details      The procedure collects the conditions of Link FSM.
   --!
   --  Comments:
   -----------------------------------------------------------------------------
   collectConditions: process
   begin
      -- Conditions have an order priority since only one can be active at a time.
      -- The priority of conditions depends on the current state of FSM.
      wait until rising_edge(clk) or rst_n = '0';
      case link_state is
         when S_ErrorReset =>
            if rst_n = '0' then
               cond <= C_reset; -- Condition = 1
            elsif timer_6_4u = 0  then
               cond <= C_timer_6_4u; -- Condition = 9
            else
               cond <= C_others; -- Condition = 0
            end if; -- rst_n
         when S_ErrorWait =>
            if rst_n = '0' then
               cond <= C_reset; -- Condition = 1
            elsif recvo_errdisc = '1' then
               cond <= C_disc_err; -- Condition = 2
            elsif recvo_erresc = '1' and got_null = '1' then
               cond <= C_esc_err; -- Condition = 6
            elsif recvo_errpar = '1' and got_null = '1' then
               cond <= C_par_err; -- Condition = 3
            elsif got_fct = '1' and got_null = '1' then
               cond <= C_got_fct; -- Condition = 4
            elsif got_rxchar = '1' and got_null = '1' then
               cond <= C_got_rxchar; -- Condition = 7
            elsif got_timecode = '1' and got_null = '1' then
               cond <= C_got_timecode; -- Condition = 8
            elsif timer_6_4u = 0 and timer_12_8u = '1' then
               cond <= C_timer_12_8u; -- Condition = 10
            elsif got_null = '1' then 
               cond <=C_got_null; -- Condition = 5
            else
               cond <= C_others; -- Condition = 0
            end if; -- rst_n
         when S_Ready =>
            if rst_n = '0' then
               cond <= C_reset; -- Condition = 1
            elsif recvo_errdisc = '1' then
               cond <= C_disc_err; -- Condition = 2
            elsif recvo_erresc = '1' and got_null = '1' then
               cond <= C_esc_err; -- Condition = 6
            elsif recvo_errpar = '1' and got_null = '1' then
               cond <= C_par_err; -- Condition = 3
            elsif got_fct = '1' and got_null = '1' then
               cond <= C_got_fct; -- Condition = 4 (Note: not valid to receive NULL and FCT concurrently)
            elsif got_rxchar = '1' and got_null = '1' then
               cond <= C_got_rxchar; -- Condition = 7
            elsif got_timecode = '1' and got_null = '1' then
               cond <= C_got_timecode; -- Condition = 8
            elsif (spw_host_in.link_dis = '0') and (spw_host_in.auto_start = '1' and got_null = '1') then
               cond <= C_link_auto_start; -- Condition = 14
            elsif (spw_host_in.link_dis = '0') and (spw_host_in.link_start = '1') and (xmit_fct_in = '1') then
               cond <= C_link_start; -- Condition = 13
            elsif (spw_host_in.link_dis = '1') then
               cond <= C_link_disable;  -- Condition = 11
            elsif got_null = '1' then
               cond <= C_got_null; -- Condition = 5
            else
               cond <= C_others; -- Condition = 0
            end if; -- rst_n
         when S_Started =>
            if rst_n = '0' then
               cond <= C_reset; -- Condition = 1
            elsif timer_6_4u = 0 and timer_12_8u = '1' then
               cond <= C_timer_12_8u; -- Condition = 10
            elsif recvo_errdisc = '1' then
               cond <= C_disc_err; -- Condition = 2
            elsif recvo_erresc = '1' and got_null = '1' then
               cond <= C_esc_err; -- Condition = 6
            elsif recvo_errpar = '1' and got_null = '1' then
               cond <= C_par_err; -- Condition = 3
            elsif got_fct = '1' and got_null = '1' then
               cond <= C_got_null_fct; -- Condition = 15
            elsif got_rxchar = '1' and got_null = '1' then
               cond <= C_got_rxchar; -- Condition = 7
            elsif got_timecode = '1' and got_null = '1' then
               cond <= C_got_timecode; -- Condition = 8
            elsif got_null = '1' then
               cond <= C_got_null; -- Condition = 5
            else
               cond <= C_others; -- Condition = 0
            end if; -- rst_n
         when S_Connecting =>
            if rst_n = '0' then
               cond <= C_reset; -- Condition = 1
            elsif timer_6_4u = 0 and timer_12_8u = '1' and got_null = '1' then
               cond <= C_timer_12_8u; -- Condition = 10
            elsif recvo_errdisc = '1' and got_null = '1' then
               cond <= C_disc_err; -- Condition = 2
            elsif recvo_erresc = '1' and got_null = '1' then
               cond <= C_esc_err; -- Condition = 6
            elsif recvo_errpar = '1' and got_null = '1' then
               cond <= C_par_err; -- Condition = 3
            elsif got_rxchar = '1' and got_null = '1' then
               cond <= C_got_rxchar; -- Condition = 7
            elsif got_timecode = '1' and got_null = '1' then
               cond <= C_got_timecode; -- Condition = 8
            elsif rx_null_fct = '1' then
               cond <= C_got_null_fct; -- Condition = 15 (consequence of rx null and fct in the prev state)
            elsif got_fct = '1' and got_null = '1' then
               cond <= C_got_fct; -- Condition = 4
            else
               cond <= C_others; -- Condition = 0
            end if; -- rst_n
         when S_Run =>
            if rst_n = '0' then
               cond <= C_reset; -- Condition = 1
            elsif recvo_errdisc = '1' and got_null = '1' then
               cond <= C_disc_err; -- Condition = 2
            elsif recvo_errpar = '1' and got_null = '1' then
               cond <= C_par_err; -- Condition = 3
            elsif recvo_erresc = '1' and got_null = '1' then
               cond <= C_esc_err; -- Condition = 6
            elsif linko_errcred = '1' and got_null = '1' then
               cond <= C_credit_err; -- Condition = 12
            elsif spw_host_in.link_dis = '1' then
               cond <= C_link_disable;  -- Condition = 11
            else
               cond <= C_others; -- Condition = 0
            end if; -- rst_n
      end case; -- link_state
   end process collectConditions;
   -----------------------------------------------------------------------------
   -- Process coverageMonitor
   --! \brief        Defines the functional coverage objective.
   --! \details      The process defines the functional coverage of this testcase.
   --  Comments:     Adapted from OSVVM FIFO example.
   -----------------------------------------------------------------------------
   coverageMonitor: process
      variable errcov        : integer := 0; -- error coverage counter
      -------------------------------------------------------
      variable errsigstatus  : integer := 0; -- error signal status
      -------------------------------------------------------
      variable prevparerr    : std_logic; -- previous value of parity error
      variable prevgotnull   : std_logic; -- previous value of signal got_null
      -------------------------------------------------------
      variable mtime2        : boolean; -- measure time 2
      variable tmpd2bgn      : time := 0 ns; -- time period 2 begin
      variable etime2        : time := 0 ns; -- elapsed time 2 
      -------------------------------------------------------
      variable txchrcnt      : integer := 0; -- tx chars counter
      variable rxfctcnt      : integer := 0; -- rx FCT counter
      -------------------------------------------------------
      variable prevrstst  : std_logic; -- previous reset signal state
      variable prevlinkst : link_st_t; -- previous link fsm state
      variable prevcond   : cond_t;  -- previous condition
   begin
      --------------------------------------------------------------------------
      WaitForStart( CONTROL_IN );
      wait until falling_edge(clk);
      --------------------------------------------------------------------------
      -- creating bins for cp_link_fsm cover point
      --------------------------------------------------------------------------
      cp_link_fsm.SetName("cp_link_fsm");
      -- state transitions are based on the clause 8.5 of the SpaceWire standard
      --------------------------------------------------------------------------
      -- S_ErrorReset (0)
      --------------------------------------------------------------------------
      cp_link_fsm.AddCross("S_ErrorReset(C_reset)->S_ErrorReset",
      BIN_ERRORRESET, BIN_ERRORRESET,BIN_C_RESET);
      cp_link_fsm.AddCross("S_ErrorReset(C_timer_6_4u)->S_ErrorWait",
      BIN_ERRORRESET, BIN_ERRORWAIT,BIN_C_TMR64U);
      
      -- IgnoreBins when other conditions occurs, the state should remain the same.
      cp_link_fsm.AddCross("S_ErrorReset(C_others)->S_ErrorReset",
      IGBIN_ERRORRESET, IGBIN_ERRORRESET,IGBIN_C_OTHERS);
      --------------------------------------------------------------------------
      -- S_ErrorWait (1)
      --------------------------------------------------------------------------
      cp_link_fsm.AddCross("S_ErrorWait(C_reset)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET,BIN_C_RESET);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_disc_err)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET,BIN_C_DISCERR);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_par_err)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET,BIN_C_PARERR);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_esc_err)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET,BIN_C_ESCERR);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_got_fct)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET,BIN_C_GOTFCT);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_got_rxchar)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET,BIN_C_GOTRXCHAR);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_got_timecode)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET,BIN_C_GOTTC);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_timer_12_8u)->S_Ready",
      BIN_ERRORWAIT, BIN_READY,BIN_C_TMR128U);
      -- 
      cp_link_fsm.AddCross("S_ErrorWait(C_got_null)->S_ErrorWait",
      BIN_ERRORWAIT, BIN_ERRORWAIT,BIN_C_GOTNULL);
      
      -- IgnoreBins when other conditions occurs, the state should remain the same.
      cp_link_fsm.AddCross("S_ErrorWait(C_others)->S_ErrorWait",
      IGBIN_ERRORWAIT, IGBIN_ERRORWAIT, IGBIN_C_OTHERS);
      --------------------------------------------------------------------------
      -- S_Ready (2)
      --------------------------------------------------------------------------
      cp_link_fsm.AddCross("S_Ready(C_reset)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET,BIN_C_RESET);
      
      cp_link_fsm.AddCross("S_Ready(C_disc_err)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET,BIN_C_DISCERR);
      
      cp_link_fsm.AddCross("S_Ready(C_par_err)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET,BIN_C_PARERR);
      
      cp_link_fsm.AddCross("S_Ready(C_esc_err)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET,BIN_C_ESCERR);
      
      cp_link_fsm.AddCross("S_Ready(C_got_fct)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET,BIN_C_GOTFCT);
      
      cp_link_fsm.AddCross("S_Ready(C_got_rxchar)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET,BIN_C_GOTRXCHAR);
      
      cp_link_fsm.AddCross("S_Ready(C_got_timecode)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET,BIN_C_GOTTC);
      
      cp_link_fsm.AddCross("S_Ready(C_link_start)->S_Started",
      BIN_READY, BIN_STARTED,BIN_C_LNKSTRT);
       
      cp_link_fsm.AddCross("S_Ready(C_link_auto_start)->S_Started",
      BIN_READY, BIN_STARTED,BIN_C_AUTOSTRT);
      
      cp_link_fsm.AddCross("S_Ready(C_got_null)->S_Ready",
      BIN_READY, BIN_READY,BIN_C_GOTNULL);
      
      cp_link_fsm.AddCross("S_Ready(C_link_disable)->S_Ready",
      BIN_READY, BIN_READY,BIN_C_LNKDIS);
      
      -- IgnoreBins when other conditions occurs, the state should remain the same.
      cp_link_fsm.AddCross("S_Ready(C_others)->S_Ready",
      IGBIN_READY, IGBIN_READY,IGBIN_C_OTHERS);
      
      --------------------------------------------------------------------------
      -- S_Started (3)
      --------------------------------------------------------------------------
      cp_link_fsm.AddCross("S_Started(C_reset)->S_ErrorReset",
      BIN_STARTED, BIN_ERRORRESET, BIN_C_RESET);
      
      cp_link_fsm.AddCross("S_Started(C_disc_err)->S_ErrorReset",
      BIN_STARTED, BIN_ERRORRESET, BIN_C_DISCERR);
      
      -- The following conditions cannot be tested in this IP since these conditions require first a C_got_null
      -- which will trigger a state change to the S_Connecting state.
      -- cp_link_fsm.AddCross("S_Started->S_ErrorReset",
      -- BIN_STARTED, BIN_ERRORRESET,BIN_C_PARERR);
      -- cp_link_fsm.AddCross("S_Started->S_ErrorReset",
      -- BIN_STARTED, BIN_ERRORRESET,BIN_C_ESCERR);
      -- cp_link_fsm.AddCross("S_Started->S_ErrorReset",
      -- BIN_STARTED, BIN_ERRORRESET,BIN_C_GOTFCT);
      -- cp_link_fsm.AddCross("S_Started->S_ErrorReset",
      -- BIN_STARTED, BIN_ERRORRESET,BIN_C_GOTRXCHAR);
      -- cp_link_fsm.AddCross("S_Started->S_ErrorReset",
      -- BIN_STARTED, BIN_ERRORRESET,BIN_C_GOTTC);
      
      cp_link_fsm.AddCross("S_Started(C_timer_12_8u)->S_ErrorReset",
      BIN_STARTED, BIN_ERRORRESET, BIN_C_TMR128U);
      
      
      cp_link_fsm.AddCross("S_Started(C_got_null)->S_Connecting",
      BIN_STARTED, BIN_CONNECTING, BIN_C_GOTNULL);
      
      cp_link_fsm.AddCross("S_Started(C_got_null_fct)->S_Connecting",
      BIN_STARTED, BIN_CONNECTING, BIN_C_GOTNULLFCT);
      
      -- IgnoreBins when other conditions occurs, the state should remain the same.
      cp_link_fsm.AddCross("S_Started(C_others)->S_Started",
      IGBIN_STARTED, IGBIN_STARTED, IGBIN_C_OTHERS);
      --------------------------------------------------------------------------
      -- S_Connecting (4)
      --------------------------------------------------------------------------
      cp_link_fsm.AddCross("S_Connecting(C_reset)->S_ErrorReset",
      BIN_CONNECTING, BIN_ERRORRESET, BIN_C_RESET);
      
      cp_link_fsm.AddCross("S_Connecting(C_disc_err)->S_ErrorReset",
      BIN_CONNECTING, BIN_ERRORRESET, BIN_C_DISCERR);
      
      cp_link_fsm.AddCross("S_Connecting(C_par_err)->S_ErrorReset",
      BIN_CONNECTING, BIN_ERRORRESET, BIN_C_PARERR);
      
      cp_link_fsm.AddCross("S_Connecting(C_esc_err)->S_ErrorReset",
      BIN_CONNECTING, BIN_ERRORRESET, BIN_C_ESCERR);
      
      cp_link_fsm.AddCross("S_Connecting(C_got_rxchar)->S_ErrorReset",
      BIN_CONNECTING, BIN_ERRORRESET, BIN_C_GOTRXCHAR);
      
      cp_link_fsm.AddCross("S_Connecting(C_got_timecode)->S_ErrorReset",
      BIN_CONNECTING, BIN_ERRORRESET, BIN_C_GOTTC);
      
      cp_link_fsm.AddCross("S_Connecting(C_timer_12_8u)->S_ErrorReset",
      BIN_CONNECTING, BIN_ERRORRESET, BIN_C_TMR128U);
      
      cp_link_fsm.AddCross("S_Connecting(C_got_fct)->S_Run",
      BIN_CONNECTING, BIN_RUN, BIN_C_GOTFCT);
      
      cp_link_fsm.AddCross("S_Connecting(C_got_null_fct)->S_Run",
      BIN_CONNECTING, BIN_RUN, BIN_C_GOTNULLFCT);
      
      -- IgnoreBins when other conditions occurs, the state should remain the same.
      cp_link_fsm.AddCross("S_Connecting(C_others)->S_Connecting",
      IGBIN_CONNECTING, IGBIN_CONNECTING, IGBIN_C_OTHERS);
      --------------------------------------------------------------------------
      -- S_Run (5)
      --------------------------------------------------------------------------
      cp_link_fsm.AddCross("S_Run(C_reset)->S_ErrorReset", 
      BIN_RUN, BIN_ERRORRESET, BIN_C_RESET);
      
      cp_link_fsm.AddCross("S_Run(C_disc_err)->S_ErrorReset", 
      BIN_RUN, BIN_ERRORRESET, BIN_C_DISCERR);
      
      cp_link_fsm.AddCross("S_Run(C_par_err)->S_ErrorReset", 
      BIN_RUN, BIN_ERRORRESET, BIN_C_PARERR);
      
      cp_link_fsm.AddCross("S_Run(C_esc_err)->S_ErrorReset", 
      BIN_RUN, BIN_ERRORRESET, BIN_C_ESCERR);
      
      cp_link_fsm.AddCross("S_Run(C_credit_err)->S_ErrorReset", 
      BIN_RUN, BIN_ERRORRESET, BIN_C_CREDERR);
      
      cp_link_fsm.AddCross("S_Run(C_link_disable)->S_ErrorReset", 
      BIN_RUN, BIN_ERRORRESET, BIN_C_LNKDIS);
      
      -- IgnoreBins when other conditions occurs, the state should remain the same.
      cp_link_fsm.AddCross("S_Run(C_others)->S_Run", 
      IGBIN_RUN, IGBIN_RUN, IGBIN_C_OTHERS);
      --------------------------------------------------------------------------
      -- Mark the rest as illegal
      cp_link_fsm.AddCross(ALL_ILLEGAL, ALL_ILLEGAL, ALL_ILLEGAL);
      cp_link_fsm.SetIllegalMode(ILLEGALMODE);
      -- Load coverage data from previous testcase
      cp_link_fsm.ReadCovDb( "$dsn\src\Unit Test\SpwStream\TC1CpLinkFsmDb.txt", TRUE);
      --------------------------------------------------------------------------
      -- Creating bins for the rest of cover points
      --------------------------------------------------------------------------
      --------------------------------------------------------------------------
      -- cp_charbadpar
      --------------------------------------------------------------------------
      cp_charbadpar.SetName("cp_charbadpar");
      cp_charbadpar.AddBins("Before 1st NULL",
      BPB1N_GOAL,GenBin(BPB1N_BIN));
      cp_charbadpar.AddBins(ALL_ILLEGAL);
      cp_charbadpar.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_gotNULL
      --------------------------------------------------------------------------
      cp_gotNULL.SetName("cp_gotNULL");
      cp_gotNULL.AddBins("Detect first NULL",
      DFNULL_GOAL, GenBin(DFNULL_BIN) );
      cp_gotNULL.AddBins("Ignore other than NULL pattern",
      INNULL_GOAL, GenBin(INNULL_BIN) );
      cp_gotNULL.AddBins(ALL_ILLEGAL);
      cp_gotNULL.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_tmout2
      --------------------------------------------------------------------------
      cp_tmout2.SetName("cp_tmout2");
      cp_tmout2.AddBins("Correct timeout 2", TMOUT2_GOAL, GenBin(TMOUT2_BIN) );
      cp_tmout2.AddBins(ALL_ILLEGAL);
      cp_tmout2.SetIllegalMode(ILLEGALMODE);
      mtime2 := False;
      --------------------------------------------------------------------------
      -- cp_txdcond
      --------------------------------------------------------------------------
      cp_txdcond.SetName("cp_txdcond");
      cp_txdcond.AddBins("Tx data after rx FCT", TXDARXF_GOAL,GenBin(TXDARXF_BIN) );
      cp_txdcond.AddBins("no FCT no tx data", NFNTXD_GOAL,GenBin(NFNTXD_BIN) );
      cp_txdcond.AddBins(ALL_ILLEGAL);
      cp_txdcond.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_rx7FCT
      --------------------------------------------------------------------------
      cp_rx7FCT.SetName("cp_rx7FCT");
      cp_rx7FCT.AddBins("Rx 7 FCT", RX7FCT_GOAL, GenBin(RX7FCT_BIN) );
      cp_rx7FCT.AddBins(ALL_ILLEGAL);
      cp_rx7FCT.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_txm7FCT
      --------------------------------------------------------------------------
      cp_txm7FCT.SetName("cp_txm7FCT");
      cp_txm7FCT.AddBins("Tx max 7 FCT",TX7FCT_GOAL, GenBin(TX7FCT_BIN));
      cp_txm7FCT.AddBins(ALL_ILLEGAL);
      cp_txm7FCT.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      prevlinkst :=link_state;
      prevrstst := rst_n;
      prevgotnull := got_null;
      --collecting coverage
      MainCovLoop: while not (--cp_link_fsm.IsCovered and
                              cp_charbadpar.IsCovered and
                              cp_gotNULL.IsCovered and
                              cp_tmout2.IsCovered and
                              cp_txdcond.IsCovered and
                              cp_rx7FCT.IsCovered and
                              cp_txm7FCT.IsCovered and
                              end_testflow
                              )   loop
         wait until falling_edge(clk);
         -----------------------------------------------------------------------
         -- collect cp_link_fsm coverage
         -----------------------------------------------------------------------
         cp_link_fsm.Icover( (link_st_t'pos(prevlinkst),link_st_t'pos(link_state), cond_t'pos(cond) ) );
         -----------------------------------------------------------------------
         -- check if cp_charbadpar is covered
         -----------------------------------------------------------------------
         if not cp_charbadpar.IsCovered then
            if gen_ptrn = 11 and bpb1n = '1' then
               cp_charbadpar.ICover(BPB1N_BIN);
            end if; -- gen_ptrn
            if recvo_errpar = '1' and prevparerr = '0'  then
               cp_charbadpar.ICover(IBP_BIN);
               errcov := errcov + 1;
            end if; -- recvo_errpar
         end if; -- cp_charbadpar
         -----------------------------------------------------------------------
         -- check if cp_gotNULL is covered
         -----------------------------------------------------------------------
         if got_null = '1' and prevgotnull = '0' then
            if (link_state /= S_ErrorReset and gen_ptrn = 1 ) then
               cp_gotNULL.ICover(DFNULL_BIN);
            else
               cp_gotNULL.ICover(INNULLD_BIN);
               errcov := errcov + 1;
            end if; -- link_state
         end if; -- got_null
         if gen_ptrn = 18 then
            if got_null = '0' then
               cp_gotNULL.ICover(INNULL_BIN);
            else
               cp_gotNULL.ICover(INNULLD_BIN);
               errcov := errcov + 1;
            end if; -- got_null
         end if; -- gen_ptrn
         -----------------------------------------------------------------------
         -- check if cp_tmout2 is covered
         -----------------------------------------------------------------------
         if (link_state = S_ErrorWait) and (prevlinkst /= S_ErrorWait) then
            tmpd2bgn := NOW;
            mtime2 := True;
         end if; -- link_state
         if (link_state = S_Started) and (prevlinkst /= S_Started) then
            tmpd2bgn := NOW;
            mtime2 := True;
         end if; -- link_state
         if (link_state = S_Connecting) and (prevlinkst /= S_Connecting) then
            tmpd2bgn := NOW;
            mtime2 := True;
         end if; -- link_state
         if (link_state = S_ErrorReset or link_state = S_Ready or link_state = S_Run) then
            mtime2 := False;
         end if; -- link_state
         if( mtime2 = True and (timer_6_4u = 0 and timer_12_8u = '1')) then
            mtime2 := False;
            etime2 := NOW - tmpd2bgn;
            if (etime2 >= 11.64 us ) and (etime2 <= 14.33 us) then
               cp_tmout2.Icover(TMOUT2_BIN);
            else
               cp_tmout2.Icover(ITMOUT2_BIN);
               errcov := errcov + 1;
            end if; -- etime2
         end if; -- mtime2
         -----------------------------------------------------------------------
         -- check if cp_txdcond is covered
         -----------------------------------------------------------------------
         if link_state /= S_Run and case_number = 6 then
            if char_mon_stats.datachars = 0 and char_mon_stats.eops = 0
            and char_mon_stats.eeps = 0 then
               cp_txdcond.ICover(NFNTXD_BIN);
            else
               cp_txdcond.ICover(ITXD_BIN);
               errcov := errcov + 1;
            end if; -- char_mon_stats
         else
            if case_number = 6 then
               txchrcnt := char_mon_stats.datachars + char_mon_stats.eops
                               + char_mon_stats.eeps;
               if (txchrcnt /= 0) then
                  if ( txchrcnt <= rxfctcnt*8 ) then
                     cp_txdcond.ICover(TXDARXF_BIN);
                  else
                     cp_txdcond.ICover(ITXD_BIN);
                     errcov := errcov + 1;
                  end if; -- txchrcnt
               end if; -- txchrcnt
            end if; -- case_number
         end if; -- link_state
         if case_number = 6 then
            if got_fct = '1' then
               rxfctcnt := rxfctcnt + 1;
            end if; -- got_fct
         else
            rxfctcnt := 0;
         end if; -- case_number
         -----------------------------------------------------------------------
         -- check if cp_rx7FCT is covered
         -----------------------------------------------------------------------
         if case_number = 6 and gen_ptrn = 9 then
            if link_state /= S_ErrorReset then
               if tx_credit = 56 then
                  cp_rx7FCT.ICover(RX7FCT_BIN);
               end if; -- rx_credit
            else
               cp_rx7FCT.ICover(IRX7FCT_BIN);
               errcov := errcov + 1;
            end if; -- link_state
         end if; -- case_number
         -----------------------------------------------------------------------
         -- check if cp_txm7FCT is covered
         -----------------------------------------------------------------------
         if case_number = 6 and mon_ena1 = '1' then
            if char_mon_stats.fcts > 7 then
               cp_txm7FCT.ICover(ITX7FCT_BIN);
               errcov := errcov + 1;
            else
               cp_txm7FCT.ICover(TX7FCT_BIN);
            end if; -- char_mon_stats
         end if; -- case_number
         -----------------------------------------------------------------------
         prevlinkst := link_state;
         prevrstst  := rst_n;
         prevgotnull := got_null;
         prevcond := cond;
         -----------------------------------------------------------------------
         --Check for TimeOut and force exit when now is greater than TimeOut value
         exit MainCovLoop when NOW > (CONTROL_IN.runtime - 10 ns);
      end loop;
      --Final reporting
      PrintResultHeader( GetExecutedTestCaseName, "Functional Coverage" );
      if NOW >= (CONTROL_IN.runtime - 10 ns) then
         PrintResultLine( "FC: TIME OUT. Functional Coverage failed!");
         PrintResultLine( "FC: More details on the coverage report." );
         if not cp_link_fsm.IsCovered then
            errcov := errcov + 1;
            --cp_link_fsm.writebin;
            cp_link_fsm.WriteCovHoles;
         end if; -- cp_link_fsm
         if not cp_charbadpar.IsCovered then
            errcov := errcov + 1;
            cp_charbadpar.WriteCovHoles;
         end if; -- cp_charbadpar
         if not cp_gotNULL.IsCovered then
            errcov := errcov + 1;
            cp_gotNULL.WriteCovHoles;
         end if; -- cp_gotNULL
         if not cp_tmout2.IsCovered then
            errcov := errcov + 1;
            cp_tmout2.WriteCovHoles;
         end if; -- cp_tmout2
         if not cp_txdcond.IsCovered then
            errcov := errcov + 1;
            cp_txdcond.WriteCovHoles;
         end if; -- cp_txdcond
         if not cp_rx7FCT.IsCovered then
            errcov := errcov + 1;
            cp_rx7FCT.WriteCovHoles;
         end if; -- cp_rx7FCT
         if not cp_txm7FCT.IsCovered then
            errcov := errcov + 1;
            cp_txm7FCT.WriteCovHoles;
         end if; -- cp_txm7FCT
      else
         PrintResultLine( "FC: SUCCESS! The functional coverage goal was achieved." );
         PrintResultLine( "FC: 7 coverage points checked." );
         PrintResultLine( "FC: More details on the coverage report." );
         -- writing cp_link_fsm coverage results to file to load it in the next testcase
         cp_link_fsm.WriteCovDb( "$dsn\src\Unit Test\SpwStream\TC2CpLinkFsmDb.txt", WRITE_MODE ) ;
         --cp_link_fsm.WriteCovHoles;
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
end architecture TC2LinkInit_beh;
--------------------------------------------------------------------------------
-- end TC2LinkInit.vhd
--------------------------------------------------------------------------------