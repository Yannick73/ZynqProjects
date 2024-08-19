--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC5ExchgSilence.vhd
--!
--! \brief        Implementation of the test case Exchange of Silence procedure  
--!               unit test. The UUT is connected to a SPW TLM (Transaction 
--!               level model).
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 27.06.2018
--! \date         Updated: 06.03.2019
--! \version      V 1.00
--
-- Unit         : TC5ExchgSilence (BEH) (entity, architecture)
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

--! OSVVM Scoreboard package for std logic vectors
use OSVVM.ScoreboardPkg_slv.all;

   
--! Work library
library work;
--! Simulation support package
use work.SimulationSupport_pkg.all;
--------------------------------------------------------------------------------
-- Entity TC5ExchgSilence
--! \brief        TC5ExchgSilence - test case Exchange of Silence procedure of the SPW unit.
--! \details      The unit executes the test case Exchange of Silence procedure.
--!               List of Error/Corner cases:
--!               - Corner Case: Exchange of silence: both links enabled.
--!               - Corner Case: Exchange of silence: one link enabled.
--!               - Corner Case: The exchange of silence is triggered by a disconnect error.
--!               - Corner Case: The exchange of silence is triggered by a parity error.
--!               - Corner Case: The exchange of silence is triggered by an escape error.
--!               - Corner Case: The exchange of silence is triggered by a credit error.
--!
--!               List of associated clauses from the SpW Standard (ECSS-E-ST-50-12C):
--!               - Corner Case: Exchange of silence: both links enabled 8.9.4.2.a, 8.9.4.2.b
--!               - Corner Case: Exchange of silence: one link enabled 8.9.4.2.a, 8.9.4.2.c
--!               - Corner Case: The exchange of silence is triggered by a disconnect error 8.9.2.1.2.e
--!               - Corner Case: The exchange of silence is triggered by a parity error 8.9.2.2.b
--!               - Corner Case: The exchange of silence is triggered by an escape error 8.9.2.3.b
--!               - Corner Case: The exchange of silence is triggered by a credit error 8.9.2.4.b
--!
--!               List of coverage points used here:
--!               - cp_exchng_silence, cp_link_fsm
-- Comments     :
-- Updates      :
--------------------------------------------------------------------------------
entity TC5ExchgSilence is
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
end entity TC5ExchgSilence;
--------------------------------------------------------------------------------
-- Architecture TC5ExchgSilence_beh
--! \brief  Implementation of the test case 5 for the SPW unit.
--------------------------------------------------------------------------------
architecture TC5ExchgSilence_beh of TC5ExchgSilence is
   -----------------------------------------------------------------------------
   -- Simulation related signals, variables and constants
   -----------------------------------------------------------------------------
   constant UUT_T_SYSCLK  : time := (1 sec)/SYSFREQ;  --! define the UUT clk signal period.
   constant MAX_RST_T      : time := 20 * UUT_T_SYSCLK; --! maximum reset time
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
   signal gen_started : std_logic;         --! high when the input generator is started.
   signal gen_connect : std_logic;         --! high when the input generator is connecting.
   signal gen_run     : std_logic;         --! high when the input generator is running.
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
   signal spw_host_out  : spw_host_interface_out := spw_host_interface_out_reset; --! SPW host output interface
   signal spw_link      : spw_link_interface; --! SPW link interface
   
   -----------------------------------------------------------------------------
   -- testFlow process signals
   -----------------------------------------------------------------------------
   -- Scoreboards for data and timecodes
   shared variable datachars_sb : ScoreboardPType ;
   --
   constant MIN_TX_DELAY  : integer := 1;    --! init minimum tx delay (in clk cycles)
   constant MAX_TX_DELAY  : integer := 50;   --! init maximum tx delay (in clk cycles)
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
   --! Exchange of silence error recovery procedure
   --! Evaluates when UUT and gen_ptrn process are enable. The link should be reestablished.
   --! Evaluates when only UUT is enable. UUT should cycle through Link FSM states to try to reestablish the link.
   --! Evaluates using the link disable pin in UUT. The link should not be reestablished.
   --! Evaluates a case where a disconnect error trigger the exchange of silence procedure.
   --! Evaluates a case where a parity error trigger the exchange of silence procedure.
   --! Evaluates a case where an escape error trigger the exchange of silence procedure.
   --! Evaluates a case where a credit error trigger the exchange of silence procedure.
   shared variable cp_exchng_silence : CovPType;
   constant BOTH_ENABLE            : integer := 1;
   constant BOTH_ENABLE_BIN        : CovBinType := GenBin(BOTH_ENABLE);
   constant BOTH_ENABLE_GOAL       : integer := 1;
   constant ONE_ENABLE             : integer := 2;
   constant ONE_ENABLE_BIN         : CovBinType := GenBin(ONE_ENABLE);
   constant ONE_ENABLE_GOAL        : integer := 1;
   constant WHEN_UUTDISABLE        : integer := 3;
   constant WHEN_UUTDISABLE_BIN    : CovBinType := GenBin(WHEN_UUTDISABLE);
   constant WHEN_UUTDISABLE_GOAL   : integer := 1;
   constant WHEN_DISCERR           : integer := 4;
   constant WHEN_DISCERR_BIN       : CovBinType := GenBin(WHEN_DISCERR);
   constant WHEN_DISCERR_GOAL      : integer := 1;
   constant WHEN_PARERR            : integer := 5;
   constant WHEN_PARERR_BIN        : CovBinType := GenBin(WHEN_PARERR);
   constant WHEN_PARERR_GOAL       : integer := 1;
   constant WHEN_ESCERR            : integer := 6;
   constant WHEN_ESCERR_BIN        : CovBinType := GenBin(WHEN_ESCERR);
   constant WHEN_ESCERR_GOAL       : integer := 1;
   constant WHEN_CREDERR           : integer := 7;
   constant WHEN_CREDERR_BIN       : CovBinType := GenBin(WHEN_CREDERR);
   constant WHEN_CREDERR_GOAL      : integer := 1;
   constant ILLEGAL_RECOVERY       : integer := 99;
   constant ILLEGAL_RECOVERY_BIN   : CovBinType := IllegalBin(ILLEGAL_RECOVERY);
   
   signal bad_init_seq           : std_logic := '0';
   signal both_ena_trig_disable  : std_logic := '0';
   signal one_ena_trig_disable   : std_logic := '0';
   signal both_ena_trig_discerr  : std_logic := '0';
   signal both_ena_trig_parerr   : std_logic := '0';
   signal both_ena_trig_escerr   : std_logic := '0';
   signal both_ena_trig_crederr  : std_logic := '0';
   
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
         elsif gen_ptrn = 19 then
            -- reacts as a normal SpaceWire Link in Start mode
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
            -- send null with bad parity
            genesc;
            genBit(gen_par);
            genBit('1');
            genBit('0');
            gen_par <= '1'; -- wrong parity
            genBit('0');
         elsif gen_ptrn = 21 then
            -- send two escape characters
            genesc;
            genesc;
         elsif gen_ptrn = 22 then   
            -- send data chars until provoke credit error
            gendat("10101010");
            gendat("01010101");
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
      variable error_var  : integer := 0;
      variable tf         : integer := 0;
      variable subtf      : integer := 0;
      --------------------------------------------------------------------------
      variable txdata      : std_logic_vector(7 downto 0) := (others => '0');
      variable txdelay     : integer;
      --------------------------------------------------------------------------
      variable txflag         : integer := 0;  --! flag to decide the txdata (N-char) type.
      --------------------------------------------------------------------------
      variable datatimecodeflag: integer := 0; --! 0 for N-char, 1 for timecode, 2 for both
      variable ctrlin : std_logic_vector(1 downto 0) := (others => '0');
      variable timein : std_logic_vector(5 downto 0) := (others => '0');
      --------------------------------------------------------------------------
      variable inputgenstats : generator_stats_type := generator_stats_reset;
--! \cond VHDL2008 
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
      procedure WaitRandomDelay is
      begin      
         txdelay := rv.RandInt(MIN_TX_DELAY, MAX_TX_DELAY);
         wait until end_sim = True for txdelay * UUT_T_SYSCLK;
      end procedure WaitRandomDelay;
      --------------------------------------------------------------------------
      -- Generates the inputs for UUT
      procedure GenRandomData is
      begin
         txdata := rv.RandSlv(0, 255, 8);
         inputgenstats.databytestx := inputgenstats.databytestx + 1;
         inputgenstats.bytestx := inputgenstats.bytestx + 1;
      end procedure GenRandomData;
      --------------------------------------------------------------------------
      -- send generated data to the corresponding scoreboard for comparison
      procedure SendtoScoreboard is
      begin
         datachars_sb.push(txdata);
      end procedure SendtoScoreboard;
      --------------------------------------------------------------------------
      -- Assert Link disable signal for two clock cycles to work correctly
      procedure AssertLinkDisable is
      begin
         wait until rising_edge(clk); -- sync with clk
         wait for HOLD_TIME;
         spw_host_in.link_dis  <= '1';
         wait until rising_edge(clk); -- sync with clk
         wait for HOLD_TIME;
         wait until rising_edge(clk); -- sync with clk
         wait for HOLD_TIME;
         spw_host_in.link_dis  <= '0';
      end procedure AssertLinkDisable;
      --------------------------------------------------------------------------
      -- check that the UUT and pattern generator are in running state
      procedure checkBothLinkRunning (waitperiod : in time ) is
      begin
         wait until ( link_state = S_Run ) and ( gen_run = '1' ) for waitperiod;
         if (link_state /= S_Run  ) or ( gen_run /= '1' ) then
            bad_init_seq <= '1';
            StopProcess(control);
         end if; -- link_state
      end procedure checkBothLinkRunning;
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
      -- Send a number of data bytes from UUT to pattern generator
      procedure SendDataBytes ( numbytes : in natural ) is
      begin
         while (inputgenstats.bytestx < numbytes) loop
            -- random delay between sending the next N-char or L-char
            WaitRandomDelay;
            -- random data generation
            GenRandomData;
            -- send random data to UUT.
            -- First ensures that the UUT has the data in txfifo. Then send to testbench scoreboard
            TBWriteByteToSPW;
            -- Send generated data to testbench scoreboard
            SendtoScoreboard;
         end loop;
      end procedure SendDataBytes;
      --------------------------------------------------------------------------
      -- Assert a testbench signal for one clock period 
      procedure AssertTestbenchSignal ( signal tbsig : out std_logic ) is
      begin
         tbsig <= '1';
         wait for UUT_T_SYSCLK;
         tbsig <= '0';
      end procedure AssertTestbenchSignal;
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
      -- Initialize the scoreboards
      SetAlertLogName("TC5ExchgSilence") ;
      datachars_sb.SetAlertLogId("data chars SB");
      
      --------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Reset asserted in the ErrorReset state
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      --------------------------------------------------------------------------
      -- Case : Evaluating exchange of silence
      -- Objective: Evaluate the exchange of silence error recovery procedure in 
      --            different scenarios.
      case_number <= 1;
      tf := 1;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Evaluating exchange of silence.");
      --------------------------------------------------------------------------
      --------------------------------------------------------------------------
      -- Scenario: UUT and gen_ptrn process are enabled. The exchange of silence 
      -- is triggered by the disable pin.
      --------------------------------------------------------------------------
      mon_ena1 <= '1';
      spw_host_in.link_start  <= '1';
      subtf := 1;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "Scenario " & to_string(subtf) & ". Both enabled.");
      gen_ptrn <= 19;
      checkBothLinkRunning(40 us);
      --------------------------------------------------------------------------
      -- Send some data
      SendDataBytes(10);

      -- wait until SPW monitor receive all data sent
      wait for 15 us;
      -- disable bit and char monitors
      mon_ena1 <= '0';
      gen_ptrn <= 0;
      -- clear pattern generator statistics
      inputgenstats := GENERATOR_STATS_RESET;
      -- assert link disable
      AssertLinkDisable;
      gen_ptrn <= 19;
      wait for 10 us;
      -- enable monitors
      mon_ena1 <= '1';
 
      -- now both UUTs should go to error recovery procedure and return automatically to
      -- the Run state.
      checkBothLinkRunning(40 us);
      AssertTestbenchSignal(both_ena_trig_disable); 
      
      --------------------------------------------------------------------------
      -- Send some data
      SendDataBytes(10);
      -- wait that SPW monitor receive all data
      wait for 15 us;
      --------------------------------------------------------------------------
      -- Evaluating exchange of silence
      -- Scenario: One link enabled. Only UUT is enabled. The exchange of silence 
      -- is triggered by the disable pin.
      --------------------------------------------------------------------------
      subtf := 2;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "Scenario " & to_string(subtf) & ". Only UUT enabled.");
      -- clear pattern generator statistics
      inputgenstats := GENERATOR_STATS_RESET;
      -- disable bit and char monitors
      mon_ena1 <= '0';
      gen_ptrn <= 0;
      -- assert link disable
      AssertLinkDisable;
      -- Now UUT should cycle between ErrorReset and Started states. 
      checkState(S_Started, 30 us);

      checkState(S_ErrorReset, 30 us);

      AssertTestbenchSignal(one_ena_trig_disable);
      
      -- wait that UUT finishes switching spwlink outputs SO, DO
      wait for 1 us;
      
      --------------------------------------------------------------------------
      -- Evaluating exchange of silence
      -- Scenario: UUT and gen_ptrn process are enabled. The exchange of silence 
      -- is triggered by a disconnect error.
      --------------------------------------------------------------------------
      subtf := 3;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "Scenario " & to_string(subtf) & ". Both enabled. Trigger: Disc. error");
      -- enable bit and char monitors
      mon_ena1 <= '1';
      -- enable pattern generator
      gen_ptrn <= 19;
      
      checkBothLinkRunning(40 us);

      -- disable bit and char monitors
      mon_ena1 <= '0';
      -- disable pattern generator (trigger disconnect error)
      gen_ptrn <= 0;
      wait until gen_idle = '1';
      -- check that the UUT goes to ErrorReset state
      checkState(S_ErrorReset, 1 us);

      -- check that the UUT goes to Started state
      checkState(S_Started, 20 us);
      
      -- check that the UUT goes back to ErrorReset state
      checkState(S_ErrorReset, 13 us);
      AssertTestbenchSignal(both_ena_trig_discerr);
      
      --------------------------------------------------------------------------
      -- Evaluating exchange of silence
      -- Scenario: UUT and gen_ptrn process are enabled. The exchange of silence 
      -- is triggered by a parity error.
      --------------------------------------------------------------------------
      wait for 555 ns; -- 555 ns is the maximum Data & Strobe reset timing
      subtf := 4;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "Scenario " & to_string(subtf) & ". Both enabled. Trigger: Par. error");
      -- enable bit and char monitors
      mon_ena1 <= '1';
      -- enable pattern generator
      gen_ptrn <= 19;
      
      checkBothLinkRunning(40 us);
      -- disable bit and char monitors
      mon_ena1 <= '0';
      -- insert fct with parity error (trigger parity error)
      gen_ptrn <= 20;
      -- check that the UUT goes to ErrorReset state
      checkState(S_ErrorReset, 1 us);
      -- disable pattern generator
      gen_ptrn <= 0;
      -- check that the UUT goes to Started state
      checkState(S_Started, 20 us);
      -- check that the UUT goes back to ErrorReset state
      checkState(S_ErrorReset, 13 us);
      AssertTestbenchSignal(both_ena_trig_parerr);

      --------------------------------------------------------------------------
      -- Evaluating exchange of silence
      -- Scenario: UUT and gen_ptrn process are enabled. The exchange of silence 
      -- is triggered by a escape error.
      --------------------------------------------------------------------------
      wait for 555 ns; -- 555 ns is the maximum Data & Strobe reset timing
      subtf := 5;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "Scenario " & to_string(subtf) & ". Both enabled. Trigger: Esc. error");
      -- enable bit and char monitors
      mon_ena1 <= '1';
      -- enable pattern generator
      gen_ptrn <= 19;
      
      checkBothLinkRunning(40 us);
      -- disable bit and char monitors
      mon_ena1 <= '0';
      -- send consecutive escape characters  (trigger escape error)
      gen_ptrn <= 21;
      -- check that the UUT goes to ErrorReset state
      checkState(S_ErrorReset, 1 us);
      -- disable pattern generator
      gen_ptrn <= 0;
      -- check that the UUT goes to Started state
      checkState(S_Started, 20 us);
      -- check that the UUT goes back to ErrorReset state
      checkState(S_ErrorReset, 13 us);
      AssertTestbenchSignal(both_ena_trig_escerr);
      
      --------------------------------------------------------------------------
      -- Evaluating exchange of silence
      -- Scenario: UUT and gen_ptrn process are enabled. The exchange of silence 
      -- is triggered by a credit error.
      --------------------------------------------------------------------------
      wait for 555 ns; -- 555 ns is the maximum Data & Strobe reset timing
      subtf := 6;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "Scenario " & to_string(subtf) & ". Both enabled. Trigger: Credit error");
      -- enable bit and char monitors
      mon_ena1 <= '1';
      -- enable pattern generator
      gen_ptrn <= 19;
      
      checkBothLinkRunning(40 us);
      -- disable bit and char monitors
      mon_ena1 <= '0';
      -- send data characters  (trigger credit error)
      gen_ptrn <= 22;
      -- check that the UUT goes to ErrorReset state
      checkState(S_ErrorReset, 10 us);
      -- disable pattern generator
      gen_ptrn <= 0;
      -- check that the UUT goes to Ready state
      checkState(S_Ready, 20 us); -- will go to ready state and stay there because the RXFIFO is full after the credit error.
      
      AssertTestbenchSignal(both_ena_trig_crederr);
     
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
   -- Process checkSPWMonData
   --! \brief        Check the data received by the SPW monitor.
   --! \details      The procedure checks the data received by the SPW monitor against
   --!               the data transmitted from the UUT.
   --!
   --  Comments:
   -----------------------------------------------------------------------------
   checkSPWMonData: process
   begin
      checkLoop: while (end_sim = false) loop
         if (mon_data_vld = '1') then
            datachars_sb.check(mon_data);
         end if; -- mon_data_vld
         wait until rising_edge(mon_data_vld);
      end loop;
      StopProcess(control);
   end process checkSPWMonData;
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
      variable pvdiscerr     : std_logic; -- previous value of disconnect error signal
      variable pvidiscerr    : std_logic; -- previous value of testbench signal ins_discerr
      variable prevparerr    : std_logic; -- previous value of parity error
      variable prevescerr    : std_logic; -- previous value of escape error
      variable prevcrediterr : std_logic; -- previous value of credit error
      variable prevgotfct    : std_logic; -- previous value of signal got_fct
      variable prevgotrxchar : std_logic; -- previous value of signal got_rxchar
      variable prevgottc     : std_logic; -- previous value of signal got_timecode
      variable prevgotnull   : std_logic; -- previous value of signal got_null
      -------------------------------------------------------
      variable disctmbgn     : time := 0 ns; -- disconnect time begin
      variable edisctime     : time := 0 ns; -- elapsed disconnect time
      variable mdisctime     : boolean; -- measure disconnect time
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
      BIN_ERRORRESET, BIN_ERRORRESET, BIN_C_RESET);
      cp_link_fsm.AddCross("S_ErrorReset(C_timer_6_4u)->S_ErrorWait",
      BIN_ERRORRESET, BIN_ERRORWAIT, BIN_C_TMR64U);
      
      -- IgnoreBins when other conditions occurs, the state should remain the same.
      cp_link_fsm.AddCross("S_ErrorReset(C_others)->S_ErrorReset",
      IGBIN_ERRORRESET, IGBIN_ERRORRESET, IGBIN_C_OTHERS);
      --------------------------------------------------------------------------
      -- S_ErrorWait (1)
      --------------------------------------------------------------------------
      cp_link_fsm.AddCross("S_ErrorWait(C_reset)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET, BIN_C_RESET);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_disc_err)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET, BIN_C_DISCERR);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_par_err)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET, BIN_C_PARERR);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_esc_err)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET, BIN_C_ESCERR);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_got_fct)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET, BIN_C_GOTFCT);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_got_rxchar)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET, BIN_C_GOTRXCHAR);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_got_timecode)->S_ErrorReset",
      BIN_ERRORWAIT, BIN_ERRORRESET, BIN_C_GOTTC);
      
      cp_link_fsm.AddCross("S_ErrorWait(C_timer_12_8u)->S_Ready",
      BIN_ERRORWAIT, BIN_READY, BIN_C_TMR128U);
      -- 
      cp_link_fsm.AddCross("S_ErrorWait(C_got_null)->S_ErrorWait",
      BIN_ERRORWAIT, BIN_ERRORWAIT, BIN_C_GOTNULL);
      
      -- IgnoreBins when other conditions occurs, the state should remain the same.
      cp_link_fsm.AddCross("S_ErrorWait(C_others)->S_ErrorWait",
      IGBIN_ERRORWAIT, IGBIN_ERRORWAIT, IGBIN_C_OTHERS);
      --------------------------------------------------------------------------
      -- S_Ready (2)
      --------------------------------------------------------------------------
      cp_link_fsm.AddCross("S_Ready(C_reset)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET, BIN_C_RESET);
      
      cp_link_fsm.AddCross("S_Ready(C_disc_err)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET, BIN_C_DISCERR);
      
      cp_link_fsm.AddCross("S_Ready(C_par_err)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET, BIN_C_PARERR);
      
      cp_link_fsm.AddCross("S_Ready(C_esc_err)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET, BIN_C_ESCERR);
      
      cp_link_fsm.AddCross("S_Ready(C_got_fct)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET, BIN_C_GOTFCT);
      
      cp_link_fsm.AddCross("S_Ready(C_got_rxchar)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET, BIN_C_GOTRXCHAR);
      
      cp_link_fsm.AddCross("S_Ready(C_got_timecode)->S_ErrorReset",
      BIN_READY, BIN_ERRORRESET, BIN_C_GOTTC);
      
      cp_link_fsm.AddCross("S_Ready(C_link_start)->S_Started",
      BIN_READY, BIN_STARTED, BIN_C_LNKSTRT);
       
      cp_link_fsm.AddCross("S_Ready(C_link_auto_start)->S_Started",
      BIN_READY, BIN_STARTED, BIN_C_AUTOSTRT);
      
      cp_link_fsm.AddCross("S_Ready(C_got_null)->S_Ready",
      BIN_READY, BIN_READY, BIN_C_GOTNULL);
      
      cp_link_fsm.AddCross("S_Ready(C_link_disable)->S_Ready",
      BIN_READY, BIN_READY, BIN_C_LNKDIS);
      
      -- IgnoreBins when other conditions occurs, the state should remain the same.
      cp_link_fsm.AddCross("S_Ready(C_others)->S_Ready",
      IGBIN_READY, IGBIN_READY, IGBIN_C_OTHERS);
      
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
      -- Load coverage data from previous testcase
      cp_link_fsm.ReadCovDb( "$dsn\src\Unit Test\SpwStream\TC3CpLinkFsmDb.txt", TRUE);
      --------------------------------------------------------------------------
      -- Creating bins for the rest of cover points
      --------------------------------------------------------------------------
      --------------------------------------------------------------------------
      --Exchange of silence error recovery procedure
      --------------------------------------------------------------------------
      cp_exchng_silence.SetName("exchange of silence procedure");
      cp_exchng_silence.AddBins("Both enabled", BOTH_ENABLE_GOAL, BOTH_ENABLE_BIN);
      cp_exchng_silence.AddBins("Only UUT enabled", ONE_ENABLE_GOAL, ONE_ENABLE_BIN);
      cp_exchng_silence.AddBins("UUT disabled", WHEN_UUTDISABLE_GOAL, WHEN_UUTDISABLE_BIN);
      cp_exchng_silence.AddBins("Trigger by disconnect error", WHEN_DISCERR_GOAL, WHEN_DISCERR_BIN);
      cp_exchng_silence.AddBins("Trigger by parity error", WHEN_PARERR_GOAL, WHEN_PARERR_BIN);
      cp_exchng_silence.AddBins("Trigger by escape error", WHEN_ESCERR_GOAL, WHEN_ESCERR_BIN);
      cp_exchng_silence.AddBins("Trigger by credit error", WHEN_CREDERR_GOAL, WHEN_CREDERR_BIN);
      cp_exchng_silence.AddBins("Illegal/bad recovery", ILLEGAL_RECOVERY_BIN);
      cp_exchng_silence.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      prevlinkst :=link_state;
      prevrstst := rst_n;
      prevgotnull := got_null;
      --collecting coverage
      MainCovLoop: while not (--cp_link_fsm.IsCovered and
                              cp_exchng_silence.IsCovered and
                              end_testflow
                              )   loop
         wait until falling_edge(clk);
         -----------------------------------------------------------------------
         -- collect cp_link_fsm coverage
         -----------------------------------------------------------------------
         cp_link_fsm.Icover( (link_st_t'pos(prevlinkst),link_st_t'pos(link_state), cond_t'pos(cond) ) );
         -----------------------------------------------------------------------
         --check for exchange of silence error recovery procedure (cp_exchng_silence).
         -----------------------------------------------------------------------
         if ( bad_init_seq = '1' ) then
            cp_exchng_silence.ICover(ILLEGAL_RECOVERY);
            StopProcess(control);
         end if; -- bad_init_seq
         if ( not cp_exchng_silence.IsCovered ) then
            if ( both_ena_trig_disable = '1' ) then
               cp_exchng_silence.ICover(BOTH_ENABLE);
               cp_exchng_silence.ICover(WHEN_UUTDISABLE);
            end if; -- both_ena_trig_disable
            if ( one_ena_trig_disable = '1' ) then
               cp_exchng_silence.ICover(ONE_ENABLE);
            end if; -- one_ena_trig_disable
            if ( both_ena_trig_discerr = '1' ) then
               cp_exchng_silence.ICover(WHEN_DISCERR);
            end if; -- both_ena_trig_discerr
            if ( both_ena_trig_parerr = '1' ) then
               cp_exchng_silence.ICover(WHEN_PARERR);
            end if; -- both_ena_trig_parerr
            if ( both_ena_trig_escerr = '1' ) then
               cp_exchng_silence.ICover(WHEN_ESCERR);
            end if; -- both_ena_trig_escerr
            if ( both_ena_trig_crederr = '1' ) then
               cp_exchng_silence.ICover(WHEN_CREDERR);
            end if; -- both_ena_trig_crederr
         end if; -- NOT cp_exchng_silence
         -----------------------------------------------------------------------
         prevlinkst := link_state;
         prevrstst  := rst_n;
         prevgotfct := got_fct;
         prevgotrxchar := got_rxchar;
         prevgottc := got_timecode;
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
         if not (cp_exchng_silence.IsCovered) then
            errcov := errcov + 1;
            cp_exchng_silence.WriteCovHoles;
         end if; -- cp_exchng_silence
      else
         PrintResultLine( "FC: SUCCESS! The functional coverage goal was achieved.");
         PrintResultLine( "FC: 2 coverage points checked." );
         PrintResultLine( "FC: More details on the coverage report." );
         -- writing cp_link_fsm coverage results to file to load it in the next testcase
         cp_link_fsm.WriteCovDb( "$dsn\src\Unit Test\SpwStream\TC5CpLinkFsmDb.txt", WRITE_MODE ) ;
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
end architecture TC5ExchgSilence_beh;
--------------------------------------------------------------------------------
-- end TC5ExchgSilence.vhd
--------------------------------------------------------------------------------