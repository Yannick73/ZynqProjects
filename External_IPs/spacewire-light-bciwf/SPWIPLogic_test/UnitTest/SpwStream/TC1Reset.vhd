--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC1Reset.vhd
--!
--! \brief        Implementation of the test case Reset SpaceWire IP unit test.
--!               One SPW link is connected to a SPW TLM (Transaction level model).
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 07.06.2018
--! \date         Updated: 14.10.2020
--! \version      V 1.00
--
-- Unit         : TC1Reset (BEH) (entity, architecture)
-- File version : $Revision: 149 $
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
-- Entity TC1Reset
--! \brief        TC1Reset - test case Reset of the SPW unit.
--! \details      The unit executes the test case Reset. Evaluates the FSM 
--!               response and signals after reset is asserted in each FSM state.
--!
--!               List of Error/Corner cases:
--!               - Corner Case: Reset
--!
--!               List of associated clauses from the SpW Standard (ECSS-E-ST-50-12C):
--!               - Corner Case: Reset 6.3.2.b, 7.5.a, 7.5.b, 8.3.h, 8.3.m, 8.5.2.2.a, 8.5.2.2.b, 
--!                 8.5.2.2.c, 8.5.2.2.d, 8.11.1.a, 8.11.3.a, 8.11.3.b
--!
--!               List of coverage points used here:
--!               - cp_link_fsm, cp_xmite, cp_recve, cp_txcredzero, cp_rxcredzero,
--!                 cp_ds_status, cp_sim_ds_switch, cp_tmout1, cp_ds_out_init
-- Comments     :
-- Updates      :
--------------------------------------------------------------------------------
entity TC1Reset is
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
end entity TC1Reset;
--------------------------------------------------------------------------------
-- Architecture TC1Reset_beh
--! \brief  Implementation of the test case 1 for the SPW unit.
--------------------------------------------------------------------------------
architecture TC1Reset_beh of TC1Reset is
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
   signal s_first_trans   : std_logic := '0'; --! first transition on Strobe flag
   signal d_first_trans   : std_logic := '0'; --! first transition on Data flag
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
   --! In state ErrorReset tx credit should be zero.
   shared variable cp_txcredzero : CovPType;
   constant TXCIZ_BIN  : integer := 0; -- tx credit is zero bin
   constant TXCIZ_GOAL : integer := 5; -- tx credit is zero goal
   -----------------------------------------------------------------------------
   --! In state ErrorReset rx credit should be zero.
   shared variable cp_rxcredzero : CovPType;
   constant RXCIZ_BIN  : integer := 0; -- rx credit is zero bin
   constant RXCIZ_GOAL : integer := 5; -- rx credit is zero goal
   -----------------------------------------------------------------------------
   --! Verify that the transmitter is only enable in the Started, Connecting and Run states.
   shared variable cp_xmite : CovPType;  -- cp transmitter enable
   constant XMITED_STR_BIN  : integer := link_st_t'pos(S_Started); -- xmit enabled in S_Started bin
   constant XMITED_CON_BIN  : integer := link_st_t'pos(S_Connecting); -- xmit enabled in S_Connecting bin
   constant XMITED_RUN_BIN  : integer := link_st_t'pos(S_Run);  -- xmit enabled in S_Run bin
   constant XMITED_GOAL : integer := 5;  -- transmit enabled goal 
--! \cond VHDL2008
   alias txen is spwlink_xmiti_uut.txen; -- txen is std_logic
--! \endcond 
   -----------------------------------------------------------------------------
   --! Verify that the recv is on only in all the states except the ErrorReset state.
   shared variable cp_recve : CovPType;  -- cp receiver enable
   constant RECVED_EWA_BIN : integer := link_st_t'pos(S_ErrorWait); -- receiver enabled in S_ErrorWait bin
   constant RECVED_RDY_BIN  : integer := link_st_t'pos(S_Ready); -- receiver enabled in S_Ready bin
   constant RECVED_STR_BIN  : integer := link_st_t'pos(S_Started); -- receiver enabled in S_Started state bin
   constant RECVED_CON_BIN  : integer := link_st_t'pos(S_Connecting); -- receiver enabled in S_Connecting state bin
   constant RECVED_RUN_BIN  : integer := link_st_t'pos(S_Run); -- receiver enabled in S_Run state bin
   constant RECVED_GOAL : integer := 5; -- receiver enabled goal
--! \cond VHDL2008
   alias rxen is <<signal uut.link_inst.rxen : std_logic>>;
--! \endcond 
   -----------------------------------------------------------------------------
   --! Data and Strobe out should be zero in the ErrorReset, ErrorWait and Ready states.
   shared variable cp_ds_status : CovPType; -- cp Data Strobe status
   constant GOODDS_BIN  : integer := 1;  -- good DS status bin
   constant GOODDS_GOAL : integer := 10; -- good DS status goal
   constant IGOODDS_BIN : integer := 99; -- illegal DS status bin
   -----------------------------------------------------------------------------
   --! Data and Strobe out should not simultaneously switch.
   shared variable cp_sim_ds_switch :CovPType; -- cp simultaneous Data Strobe switching
   constant NOSIMDS_BIN  : integer := 0; -- No simultaneous DS switching bin
   constant NOSIMDS_GOAL : integer := 10; -- No simultaneous DS switching goal
   -----------------------------------------------------------------------------
   --! Verify that the 6.4 us timeout is in the range: [5.82 7.22] us. 
   shared variable cp_tmout1 : CovPType; -- cp timeout period 1
   constant TMOUT1_BIN  : integer := 1;  -- timeout 1 bin
   constant TMOUT1_GOAL : integer := 4; -- timeout 1 goal
   constant ITMOUT1_BIN : integer := 99; -- illegal timeout 1 bin
   -----------------------------------------------------------------------------
   --! The first transition after reset should be on the strobe out signal.
   shared variable cp_ds_out_init : CovPType; -- cp data strobe outputs initial transition.
   constant STBTRANS_BIN : integer := 1; -- strobe first transition bin
   constant STBTRANS_GOAL: integer := 4; -- strobe first transition goal
   constant IDATTRANS_BIN: integer := 2; -- illegal data first transition bin
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
   s_first_trans   <= mon_outputs.spw_s_first_trans;
   d_first_trans   <= mon_outputs.spw_d_first_trans;
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
      -- Case 1: Reset.
      -- Objective: Evaluates the FSM response and signals after reset is asserted
      -- in each FSM state.
      case_number <= 1;
      tf := 1;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Assert reset." );
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Reset asserted in the ErrorReset state
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      --------------------------------------------------------------------------
      -- Reset asserted in the ErrorWait state
      mon_ena1 <= '1'; 
      -- Move to ErrorWait state
      wait until link_state = S_ErrorWait;
      WaitForCLKCycle(clk, 10);
      rst_n <= '0';
      mon_ena1 <= '0';
      wait for UUT_T_SYSCLK;
      rst_n <= '1';
      mon_ena1 <= '1';
      --------------------------------------------------------------------------
      -- Reset asserted in the Ready state
      -- Move to Ready state
      wait until link_state = S_Ready;
      WaitForCLKCycle(clk, 10);
      rst_n <= '0';
      mon_ena1 <= '0';
      wait for UUT_T_SYSCLK;
      rst_n <= '1';
      mon_ena1 <= '1';
      --------------------------------------------------------------------------
      -- Reset asserted in the Started state
      -- Move to Started state
      spw_host_in.link_start <= '1';
      wait until link_state = S_Started;
      spw_host_in.link_start <= '0';
      WaitForCLKCycle(clk, 10);
      rst_n <= '0';
      mon_ena1 <= '0';
      wait for UUT_T_SYSCLK;
      rst_n <= '1';
      mon_ena1 <= '1';
      --------------------------------------------------------------------------
      -- Reset asserted in the Connecting state
      -- Move to Connecting state
      spw_host_in.auto_start <= '1';
      gen_ptrn <= 1; -- send NULLs
      wait until link_state = S_Connecting;
      WaitForCLKCycle(clk, 10);
      rst_n <= '0';
      mon_ena1 <= '0';
      wait for UUT_T_SYSCLK;
      rst_n <= '1';
      mon_ena1 <= '1';
      --------------------------------------------------------------------------
      -- Reset asserted in the Run state
      -- Move to Run state
      wait until link_state = S_Connecting;
      gen_ptrn <= 2; -- send FCTs
      wait until link_state = S_Run;
      gen_ptrn <= 0; -- disabled
      WaitForCLKCycle(clk, 10);
      rst_n <= '0';
      mon_ena1 <= '0';
      wait for UUT_T_SYSCLK;
      rst_n <= '1';
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
      variable waittmstrt : time := 0 ns; -- wait time start
      -------------------------------------------------------
      variable mtime1        : boolean; -- measure time 1
      variable tmpd1bgn      : time := 0 ns; -- time period 1 begin
      variable etime1        : time := 0 ns; -- elapsed time 1
      -------------------------------------------------------
      variable prevrstst  : std_logic; -- previous reset signal state
      variable prevlinkst : link_st_t; -- previous link fsm state
      variable prevcond   : cond_t;  -- previous condition
   begin
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
      --------------------------------------------------------------------------
      -- Creating bins for the rest of cover points
      --------------------------------------------------------------------------
      --------------------------------------------------------------------------
      -- cp_txcredzero
      --------------------------------------------------------------------------
      cp_txcredzero.SetName("cp_txcredzero");
      cp_txcredzero.AddBins("Tx credit zero", TXCIZ_GOAL,GenBin(TXCIZ_BIN) );
      cp_txcredzero.AddBins(ALL_ILLEGAL);
      cp_txcredzero.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_rxcredzero
      --------------------------------------------------------------------------
      cp_rxcredzero.SetName("cp_rxcredzero");
      cp_rxcredzero.AddBins("Rx credit zero", RXCIZ_GOAL,GenBin(RXCIZ_BIN) );
      cp_rxcredzero.AddBins(ALL_ILLEGAL);
      cp_rxcredzero.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_xmite
      --------------------------------------------------------------------------
      cp_xmite.SetName("Xmit enabled");
      cp_xmite.AddBins("In S_Started", XMITED_GOAL, GenBin(XMITED_STR_BIN));
      cp_xmite.AddBins("In S_Connecting", XMITED_GOAL, GenBin(XMITED_CON_BIN) );
      cp_xmite.AddBins("In S_Run", XMITED_GOAL, GenBin(XMITED_RUN_BIN) );
      cp_xmite.AddBins(ALL_ILLEGAL);
      cp_xmite.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_recve
      --------------------------------------------------------------------------
      cp_recve.SetName("Receiver enabled");
      cp_recve.AddBins("In S_ErrorWait", RECVED_GOAL, GenBin(RECVED_EWA_BIN) );
      cp_recve.AddBins("In S_Ready", RECVED_GOAL, GenBin(RECVED_RDY_BIN) );
      cp_recve.AddBins("In S_Started", RECVED_GOAL, GenBin(RECVED_STR_BIN) );
      cp_recve.AddBins("In S_Connecting", RECVED_GOAL, GenBin(RECVED_CON_BIN) );
      cp_recve.AddBins("In S_Run", RECVED_GOAL, GenBin(RECVED_RUN_BIN) );
      cp_recve.AddBins(ALL_ILLEGAL);
      cp_recve.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_ds_status
      --------------------------------------------------------------------------
      cp_ds_status.SetName("cp_ds_status");
      cp_ds_status.AddBins("Host outputs and DS status OK", GOODDS_GOAL, GenBin(GOODDS_BIN) );
      cp_ds_status.AddBins(ALL_ILLEGAL);
      cp_ds_status.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_sim_ds_switch
      --------------------------------------------------------------------------
      cp_sim_ds_switch.SetName("cp_sim_ds_switch");
      cp_sim_ds_switch.AddBins("No simultaneous DS switch", NOSIMDS_GOAL, GenBin(NOSIMDS_BIN) );
      cp_sim_ds_switch.AddBins(ALL_ILLEGAL);
      cp_sim_ds_switch.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_tmout1
      --------------------------------------------------------------------------
      cp_tmout1.SetName("cp_tmout1");
      cp_tmout1.AddBins("Correct timeout 1", TMOUT1_GOAL, GenBin(TMOUT1_BIN) );
      cp_tmout1.AddBins(ALL_ILLEGAL);
      cp_tmout1.SetIllegalMode(ILLEGALMODE);
      mtime1 := False;
      --------------------------------------------------------------------------
      -- cp_ds_out_init
      --------------------------------------------------------------------------
      cp_ds_out_init.SetName("cp_ds_out_init");
      cp_ds_out_init.AddBins("First transition on strobe", STBTRANS_GOAL, GenBin(STBTRANS_BIN) );
      cp_ds_out_init.AddBins(ALL_ILLEGAL);
      cp_ds_out_init.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      WaitForStart( CONTROL_IN );
      wait until falling_edge(clk);
      prevlinkst :=link_state;
      prevrstst := rst_n;
      --collecting coverage
      MainCovLoop: while not (--cp_link_fsm.IsCovered and
                              cp_txcredzero.IsCovered and
                              cp_rxcredzero.IsCovered and
                              cp_xmite.IsCovered and
                              cp_recve.IsCovered and
                              cp_ds_status.IsCovered and 
                              cp_sim_ds_switch.IsCovered and 
                              cp_tmout1.IsCovered and
                              cp_ds_out_init.Iscovered and
                              end_testflow
                              )   loop
         wait until falling_edge(clk);
         -----------------------------------------------------------------------
         -- collect cp_link_fsm coverage
         -----------------------------------------------------------------------
         cp_link_fsm.Icover( (link_st_t'pos(prevlinkst),link_st_t'pos(link_state), cond_t'pos(cond) ) );
         -----------------------------------------------------------------------
         -- check if cp_txcredzero is covered
         -----------------------------------------------------------------------
         if link_state = S_ErrorReset then
            cp_txcredzero.ICover(to_integer(tx_credit));
         end if; -- prevlinkst
         -----------------------------------------------------------------------
         -- check if cp_rxcredzero is covered
         -----------------------------------------------------------------------
         if link_state = S_ErrorReset then
            cp_rxcredzero.ICover(to_integer(rx_credit));
         end if; -- prevlinkst
         -----------------------------------------------------------------------
         -- check if cp_xmite is covered
         -----------------------------------------------------------------------
         if txen = '1' then
            cp_xmite.ICover(link_st_t'pos(link_state));
         end if; -- txen
         -----------------------------------------------------------------------
         -- check if cp_recve is covered
         -----------------------------------------------------------------------
         if rxen = '1' then
            cp_recve.ICover(link_st_t'pos(link_state));
         end if; -- rxen
         -----------------------------------------------------------------------
         -- check if cp_ds_status is covered
         -----------------------------------------------------------------------
         if link_state = S_ErrorReset or link_state = S_ErrorWait or link_state = S_Ready then
            errsigstatus := 0;
            if (link_state = S_ErrorReset and prevlinkst /= S_ErrorReset)then
               waittmstrt := NOW;
            end if; -- link_state
            MonitorSignalErrCntVar( spw_host_out.tick_out, logic_0, "tick_out", errsigstatus);
            MonitorSignalErrCntVar( spw_host_out.started, logic_0, "started", errsigstatus);
            MonitorSignalErrCntVar( spw_host_out.connecting, logic_0, "connecting", errsigstatus);
            MonitorSignalErrCntVar( spw_host_out.running, logic_0, "running", errsigstatus);
            MonitorSignalErrCntVar( linko_errdisc, logic_0, "err_disc", errsigstatus);
            MonitorSignalErrCntVar( linko_errpar, logic_0, "err_par", errsigstatus);
            MonitorSignalErrCntVar( linko_erresc, logic_0, "err_esc", errsigstatus);
            MonitorSignalErrCntVar( linko_errcred, logic_0, "err_cred", errsigstatus);
            -- checking compliance to clause 8.11.1.a of SPW standard and waiting 555 ns (max. bit period)
            -- to reset SPW signals.
            if (NOW > waittmstrt + 555 ns) then
               MonitorSignalErrCntVar( spw_link.do, logic_0, "spw_link.do", errsigstatus);
               MonitorSignalErrCntVar( spw_link.so, logic_0, "spw_link.so", errsigstatus);
            end if; -- NOW
            if errsigstatus = 0 then
               cp_ds_status.ICover(GOODDS_BIN);
            else
               cp_ds_status.ICover(IGOODDS_BIN);
               errcov := errcov + 1;
            end if; -- errsigstatus
         end if; -- link_state
         -----------------------------------------------------------------------
         -- check if cp_sim_ds_switch is covered
         -----------------------------------------------------------------------
         if mon_ena1 = '1' then
            cp_sim_ds_switch.ICover(to_integer(sim_ds_switch));
         end if; -- mon_ena1
         -----------------------------------------------------------------------
         -- check if cp_tmout1 is covered
         -----------------------------------------------------------------------
         if (link_state = S_ErrorReset) and (prevlinkst /= S_ErrorReset) then
            tmpd1bgn := NOW;
            mtime1 := True;
         end if; -- link_state
         if (rst_n = '0') and mtime1 = True then -- start when reset is de-asserted.
            tmpd1bgn := NOW;
         end if; -- rst_n
         if mtime1 = True and (timer_6_4u = 0) then
            mtime1 := False;
            etime1 := NOW - tmpd1bgn;
            if (etime1 >= 5.82 us ) and (etime1 <= 7.22 us) then
               cp_tmout1.Icover(TMOUT1_BIN);
            else
               cp_tmout1.Icover(ITMOUT1_BIN);
               errcov := errcov + 1;
            end if; -- etime1
         end if; -- mtime1
         -----------------------------------------------------------------------
         -- check if cp_ds_out_init is covered
         -----------------------------------------------------------------------
         if txen = '1' then
            if s_first_trans = '1' then
               cp_ds_out_init.ICover(STBTRANS_BIN);
            end if; -- s_first_trans
            if d_first_trans = '1' then
               cp_ds_out_init.ICover(IDATTRANS_BIN);
            end if; -- d_first_trans
         end if; -- txen
         -----------------------------------------------------------------------
         prevlinkst := link_state;
         prevrstst  := rst_n;
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
         if not cp_txcredzero.IsCovered then
            errcov := errcov + 1;
            cp_txcredzero.WriteCovHoles;
         end if; -- cp_txcredzero
         if not cp_rxcredzero.IsCovered then
            errcov := errcov + 1;
            cp_rxcredzero.WriteCovHoles;
         end if; --cp_rxcredzero
         if not cp_xmite.IsCovered then
            errcov := errcov + 1;
            cp_xmite.WriteCovHoles;
         end if; -- cp_xmite
         if not cp_recve.IsCovered then
            errcov := errcov + 1;
            cp_recve.WriteCovHoles;
         end if; -- cp_recve
         if not cp_ds_status.IsCovered then
            errcov := errcov + 1;
            cp_ds_status.WriteCovHoles;
         end if; -- cp_ds_status
         if not cp_sim_ds_switch.IsCovered then
            errcov := errcov + 1;
            cp_sim_ds_switch.WriteCovHoles;
         end if; -- cp_sim_ds_switch 
         if not cp_tmout1.IsCovered then
            errcov := errcov + 1;
            cp_tmout1.WriteCovHoles;
         end if; -- cp_tmout1
         if not cp_ds_out_init.IsCovered then
            errcov := errcov + 1;
            cp_ds_out_init.WriteCovHoles;
         end if; -- cp_ds_out_init
      else
         PrintResultLine( "FC: SUCCESS! The functional coverage goal was achieved." );
         PrintResultLine( "FC: 9 coverage points checked." );
         PrintResultLine( "FC: More details on the coverage report." );
         -- writing cp_link_fsm coverage results to file to load it in the next testcase
         cp_link_fsm.WriteCovDb( "$dsn\src\Unit Test\SpwStream\TC1CpLinkFsmDb.txt", WRITE_MODE ) ;
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
end architecture TC1Reset_beh;
--------------------------------------------------------------------------------
-- end TC1Reset.vhd
--------------------------------------------------------------------------------