--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC3RecvErr.vhd
--!
--! \brief        Implementation of the test case Receiver Errors 
--!               unit test. One SPW link is connected to a SPW TLM (Transaction level model).
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 27.06.2018
--! \date         Updated: 06.03.2019
--! \version      V 1.00
--
-- Unit         : TC3RecvErr (BEH) (entity, architecture)
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
-- Entity TC3RecvErr
--! \brief        TC3RecvErr - test case Receiver Errors of the SPW unit.
--! \details      The unit executes the test case Receiver Errors. Evaluates the  
--!               response to errors in the receiver. 
--!
--!               List of Error/Corner cases:
--!               - Error Case: Disconnect Error
--!               - Error Case: Parity Error
--!               - Error Case: Escape Error
--!               - Error Case: Credit Error
--!               - Error Case: Character sequence Error
--!
--!               List of associated clauses from the SpW Standard (ECSS-E-ST-50-12C):
--!               - All cases: 8.5.2.2.a, 8.5.2.3.e, 8.5.2.4.e, 8.5.2.5.g, 8.5.2.6.e, 8.5.2.7.b, 8.9.1.a, 8.9.1.b, 8.9.5.a, 8.9.5.b, 8.9.5.c
--!               - Error Case: Disconnect Error 8.5.3.7.2.a, 8.5.3.7.2.b, 8.9.2.1.2.a, 8.9.2.1.2.b, 8.9.2.1.2.c, 8.9.2.1.2.f, 8.10.2, 8.11.2.a
--!               - Error Case: Parity Error 8.5.3.7.3.a, 8.5.3.7.3.b, 8.9.2.2.a, 8.9.2.2.c, 8.10.4 
--!               - Error Case: Escape Error 7.3.e, 8.5.3.7.4.a, 8.5.3.7.4.b, 8.9.2.3.a, 8.9.2.3.c
--!               - Error Case: Credit Error 8.3.i, 8.5.3.8.a, 8.9.2.4.a, 8.9.2.4.c
--!               - Error Case: Character sequence Error 8.5.3.3.a, 8.5.3.4.a, 8.5.3.5.a, 8.5.3.9.a, 8.5.3.9.c, 8.5.3.9.d, 8.9.2.5.1, 8.9.2.5.2.a
--!
--!               List of coverage points used here:
--!               - cp_link_fsm, cp_discerr, cp_parerr, cp_escerr, cp_crederr, cp_chserr
--!               - cp_crlerr
-- Comments     :
-- Updates      :
--------------------------------------------------------------------------------
entity TC3RecvErr is
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
end entity TC3RecvErr;
--------------------------------------------------------------------------------
-- Architecture TC3RecvErr_beh
--! \brief  Implementation of the test case 3 for the SPW unit.
--------------------------------------------------------------------------------
architecture TC3RecvErr_beh of TC3RecvErr is
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
   signal spw_host_in   : spw_host_interface_in := spw_host_interface_in_reset; --! SPW host  input interface
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
   --! Handling correctly a disconnect error. It is also verified the timing
   --! 850 ns (nominal). [0.727 1]us.
   shared variable cp_discerr : CovPType;
   constant DISCERR_BIN   : integer := 1; -- disconnect error bin
   constant DISCERR_GOAL  : integer := 5; -- disc. error goal = num of errors inserted in testbench
   constant DISCERRT_BIN  : integer := 2; -- disc. error time bin
   constant DISCERRT_GOAL : integer := 5; -- disc. error time goal is set to the num of errors inserted
   constant IDISCERR_BIN  : integer := 99; -- illegal (unintended) disconnection error
   constant IDISCERRT_BIN : integer := 98; -- detection of disconnect error out of time
   signal ins_discerr     : std_logic := '0'; -- inserted disconnect error
   -----------------------------------------------------------------------------
   --! Correctly detecting a parity error.
   shared variable cp_parerr : CovPType;
   constant PARERR_BIN  : integer := 1; -- parity error bin
   constant PARERR_GOAL : integer := 4; -- parity error goal is set to the num of errors inserted
   constant IPARERR_BIN : integer := 99; -- illegal parity error bin
   signal ins_parerr    : std_logic := '0'; -- inserted parity error
   -----------------------------------------------------------------------------
   --! Correctly detecting an escape error.
   shared variable cp_escerr : CovPType;
   constant ESCERR_BIN  : integer := 1; -- escape error bin
   constant ESCERR_GOAL : integer := 4; -- escape error goal is set to the number of errors inserted
   constant IESCERR_BIN : integer := 99; -- illegal escape error bin
   signal ins_escerr    : std_logic := '0'; -- inserted escape error
   -----------------------------------------------------------------------------
   --! Correctly detecting a credit error.
   shared variable cp_crederr : CovPType;
   constant CREDERR_BIN  : integer := 1; -- credit error bin
   constant CREDERR_GOAL : integer := 2; -- credit error goal is set to the number of errors inserted
   constant ICREDERR_BIN : integer := 99; -- illegal credit error bin
   signal ins_crederr    : std_logic := '0'; -- inserted credit error
   -----------------------------------------------------------------------------
   --! Correctly detecting a character sequence error.
   shared variable cp_chserr : CovPType; -- cp character sequence error
   constant GFCTERR_BIN  : integer := 1; -- got FCT error bin
   constant GFCTERR_GOAL : integer := 2; -- got FCT error goal is set to the number of errors inserted
   constant GNCERR_BIN   : integer := 2; -- got N-char error bin
   constant GNCERR_GOAL  : integer := 9; -- got N-char error  goal is set to the number of errors inserted
   constant GTCERR_BIN   : integer := 3; -- got timecode error bin
   constant GTCERR_GOAL  : integer := 3; -- got timecode error goal is set to the number of errors inserted
   constant ICSERR_BIN   : integer := 99; -- illegal char sequence error bin
   signal ins_cserr      : std_logic := '0'; -- inserted char sequence error 
   -----------------------------------------------------------------------------
   --! Verify that errors are only reported in the Run state.
   shared variable cp_crlerr : CovPType; -- cp correct report link error
   constant DER_BIN  : integer := 1; -- disconnect error report bin
   constant DER_GOAL : integer := 5; -- disconnect error report goal set to 5 (due to states logic)
   constant PER_BIN  : integer := 2; -- parity error report bin
   constant PER_GOAL : integer := 4; -- parity error report goal set to 4 (due to states logic)
   constant EER_BIN  : integer := 3; -- escape error report bin
   constant EER_GOAL : integer := 4; -- escape error report goal set to 4 (due to states logic)
   constant CER_BIN  : integer := 4; -- credit error report bin
   constant CER_GOAL : integer := 2; -- credit error report goal set to 2 (due to types of credit error)
   constant IREP_BIN : integer := 99; -- illegal report bin
   -----------------------------------------------------------------------------
begin
   
   ---------------------------------------------------------------------------
   -- Unit under test
   ---------------------------------------------------------------------------
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
      end if;
      gen_idle <= '0';
      while gen_ptrn /= 0 loop
         if gen_ptrn = 1 then
            -- NULL tokens
            genesc;
            genfct;
         elsif gen_ptrn = 2 then
            -- FCT tokens
            genfct;
         elsif gen_ptrn = 4 then
            -- EOP token
            geneop('0');
         elsif gen_ptrn = 6 then
             -- ESC tokens
            genesc;
         elsif gen_ptrn = 12 then
            -- FCT with wrong parity
            genBit(gen_par);
            genBit('1');
            genBit('0');
            gen_par <= '1'; -- wrong parity
            genBit('0');
         elsif gen_ptrn = 13 then
            -- ESC, EOP
            genesc;
            geneop('0');
         elsif gen_ptrn = 14 then
            -- ESC, EEP
            genesc;
            geneop('1');
         elsif gen_ptrn = 15 then
            -- data chars
            gendat("00111010");
         elsif gen_ptrn = 16 then
            -- EEPs
            geneop('1');
         elsif gen_ptrn = 17 then
            -- timecodes
            genesc;
            gendat("01110001");
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
      -----------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Reset asserted in the ErrorReset state
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -----------------------------------------------------------------------------
      -- Case 1: Disconnect Error.
      -- Objective: Evaluates the FSM response and signals after a disconnect error
      -- in each FSM state.
      case_number <= 1;
      tf := 1;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Disconnect error.");
      -----------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Disconnect error in ErrorWait state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 6; -- send ESCs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to ErrorWait state
      wait until link_state = S_ErrorWait;
      wait for 10*INIT_INBIT_PD; -- to be able to activate the disconnect mechanism.
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      ins_discerr <= '1';
      wait for 1.2 us; -- 1 us is the max time defined in the standard. Time incremented in 20%.
      ins_discerr <= '0';
      -----------------------------------------------------------------------------
      -- Disconnect error in Ready state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 6; -- send ESCs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Ready state
      wait until link_state = S_Ready;
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      ins_discerr <= '1';
      wait for 1.2 us; -- 1 us is the max time defined in the standard. Time incremented in 20%.
      ins_discerr <= '0';
      -----------------------------------------------------------------------------
      -- Disconnect error in Started state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 6; -- send ESCs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.link_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Started state
      wait until link_state = S_Started;
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      ins_discerr <= '1';
      wait for 1.2 us; -- 1 us is the max time defined in the standard. Time incremented in 20%.
      ins_discerr <= '0';
      -----------------------------------------------------------------------------
      -- Disconnect error in Connecting state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Connecting state
      wait until link_state = S_Connecting;
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      ins_discerr <= '1';
      wait for 1.2 us; -- 1 us is the max time defined in the standard. Time incremented in 20%.
      ins_discerr <= '0';
      -----------------------------------------------------------------------------
      -- Disconnect error in Run state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Run state
      wait until link_state = S_Connecting;
      gen_ptrn <= 2; -- send FCTs
      wait until link_state = S_Run;
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      ins_discerr <= '1';
      wait for 1.2 us; -- 1 us is the max time defined in the standard. Time incremented in 20%.
      ins_discerr <= '0';
      -----------------------------------------------------------------------------
      -- Case 2: Parity error.
      -- Objective: Evaluates the FSM response and signals after a parity error
      -- in each FSM state. Not able in Started state.
      case_number <= 2;
      tf := 2;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Parity error.");
      -----------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Parity error in ErrorWait state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to ErrorWait state
      wait until link_state = S_ErrorWait;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      if gen_idle = '0' then
         wait until gen_idle = '1';
      end if; -- gen_idle
      gen_ptrn <= 12; -- send FCTs with wrong parity
      ins_parerr <= '1';
      --wait for 14 * INIT_INBIT_PD; -- max time for one character (time-code)
      wait for 34 * INIT_INBIT_PD; -- max time for one character (time-code), 2000 ns added for clock recv front-end
      ins_parerr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Parity error in Ready state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '0';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Ready state
      wait until link_state = S_Ready;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 12; -- send FCTs with wrong parity
      ins_parerr <= '1';
      --wait for 14 * INIT_INBIT_PD; -- max time for one character (time-code)
      wait for 34 * INIT_INBIT_PD; -- max time for one character (time-code), 2000 ns added for clock recv front-end
      ins_parerr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Parity error in Started state
      -- OBS: Not possible to test because to enable parity detection, the first NULL
      -- should be already received. However, this is the condition to jump to the
      -- connecting state.
      -- Set Init state of UUT and stimulus
      -- gen_ptrn <= 0; -- disabled
      -- spw_host_in <= spw_host_interface_in_reset;
      -- spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      -- spw_host_in.link_start <= '1';
      -- GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Started state
      -- wait until link_state = S_Started;
      -- gen_ptrn <= 11; -- First Null with parity error
      -----------------------------------------------------------------------------
      -- Parity error in Connecting state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.link_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Connecting state
      wait until link_state = S_Connecting;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 12; -- send FCTs with wrong parity
      ins_parerr <= '1';
      --wait for 14 * INIT_INBIT_PD; -- max time for one character (time-code)
      wait for 34 * INIT_INBIT_PD; -- max time for one character (time-code), 2000 ns added for clock recv front-end
      ins_parerr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Parity error in Run state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.link_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Run state
      wait until link_state = S_Connecting;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 2; -- FCTs
      wait until link_state = S_Run;
      gen_ptrn <= 12; -- send FCTs with wrong parity
      ins_parerr <= '1';
      --wait for 14 * INBIT_PD; -- max time for one character (time-code)
      wait for 34 * INIT_INBIT_PD; -- max time for one character (time-code), 2000 ns added for clock recv front-end
      ins_parerr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Case 3: Escape error.
      -- Objective: Evaluates the FSM response and signals after an escape error
      -- in each FSM state. Not able in Started state.
      case_number <= 3;
      tf := 3;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Escape error.");
      -----------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Escape error in ErrorWait state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to ErrorWait state
      wait until link_state = S_ErrorWait;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 6; -- ESCs
      ins_escerr <= '1';
      --wait for 12 * INIT_INBIT_PD; -- IP dependent time for two control chars (ex. ESC+ESC)
      wait for 32 * INIT_INBIT_PD; -- IP dependent time for two control chars (ex. ESC+ESC), 2000 ns added for clock recv front-end
      ins_escerr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Escape error in Ready state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Ready state
      wait until link_state = S_Ready;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 13; -- ESC, EOP
      ins_escerr <= '1';
      --wait for 12 * INIT_INBIT_PD; -- IP dependent time for two control chars (ex. ESC+EOP)
      wait for 32 * INIT_INBIT_PD; -- IP dependent time for two control chars (ex. ESC+ESC), 2000 ns added for clock recv front-end
      ins_escerr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Escape error in Started state
      -- OBS: Not possible to test because to enable escape detection, the first NULL
      -- should be already received. However, this is the condition to jump to the
      -- connecting state.
      -----------------------------------------------------------------------------
      -- Escape error in Connecting state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Connecting state
      wait until link_state = S_Connecting;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 14; -- ESC, EEP
      ins_escerr <= '1';
      --wait for 12 * INIT_INBIT_PD; -- IP dependent time for two control chars (ex. ESC+EOP)
      wait for 24 * INIT_INBIT_PD; -- IP dependent time for two control chars (ex. ESC+ESC), 1200 ns added for clock recv front-end
      ins_escerr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Escape error in Run state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Run state
      wait until link_state = S_Connecting;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 2; -- FCTs
      wait until link_state = S_Run;
      gen_ptrn <= 6; -- send ESCs
      ins_escerr <= '1';
      --wait for 12 * INBIT_PD; -- IP dependent time for two control chars (ex. ESC+EOP)
      wait for 22 * INIT_INBIT_PD; -- IP dependent time for two control chars (ex. ESC+ESC), 1000 ns added for clock recv front-end
      ins_escerr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Case 4: Credit error.
      -- Objective: Evaluates the FSM response and signals after a credit error
      -- in each FSM state. Only in Run state. There are two types of credit error:
      -- when rx more data than expected or when rx more FCT than expected.
      case_number <= 4;
      tf := 4;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Credit error.");
      -----------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Credit error in Run state type 1: rx more than expected data chars
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Run state
       wait until link_state = S_Connecting;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 2; -- FCTs
      wait until link_state = S_Run;
      gen_ptrn <= 15; -- send data chars
      ins_crederr <= '1';
      -- wait for 10 * 58 * INBIT_PD; -- aprox time for 56 data chars.
      wait for 10 * 69 * INBIT_PD; -- aprox time for 56 data chars, 4000 ns added for clock recv front-end.
      ins_crederr <= '0';
      gen_ptrn <= 0; -- disabled
      wait for 10*UUT_T_SYSCLK; -- wait for the error credit dectection in coverage process
      -----------------------------------------------------------------------------
      -- Credit error in Run state type 2: rx more fcts than maximum (7FCTs)
      -- Set Init state of UUT and stimulus
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Run state
       wait until link_state = S_Connecting;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 2; -- FCTs
      wait until link_state = S_Run;
      ins_crederr <= '1';
      -- wait for 4 * 8 * INBIT_PD; -- aprox time for 7 FCTs.
      wait for 10 * 8 * INBIT_PD; -- aprox time for for 7 FCTs., 1600 ns added for clock recv front-end.
      ins_crederr <= '0';
      gen_ptrn <= 0; -- disabled
      wait for 10*UUT_T_SYSCLK; -- wait for the error credit dectection in coverage process
      -----------------------------------------------------------------------------
      -- Case 5: Character sequence error.
      -- Objective: Evaluates the FSM response and signals after a char seq error
      -- in each FSM state. There are three types of character sequence error:
      -- when rx FCT unexpected, when rx N char (data, EOP or EEP) unexpected or when rx
      -- timecode unexpected.
      case_number <= 5;
      tf := 5;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "TF" & to_string(tf) & ". Char sequence error.");
      -----------------------------------------------------------------------------
      wait until rising_edge(clk);
      wait for HOLD_TIME;
      -- Rx FCT in ErrorWait state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to ErrorWait state
      wait until link_state = S_ErrorWait;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 2; -- FCTs
      ins_cserr <= '1';
      --wait for 8 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT)
      wait for 28 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT), 2000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Rx FCT in Ready state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '0';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Ready state
      wait until link_state = S_Ready;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 2; -- FCTs
      ins_cserr <= '1';
      --wait for 8 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT)
      wait for 28 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT), 2000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Rx FCT in Started state
      -- OBS: Not possible to test because to enable got_fct, the first NULL
      -- should be already received. However, this is the condition to jump to the
      -- connecting state.
      -- The following code sends FCTs before sending the first NULL, the UUT does not
      -- detect the FCT and will fall into a disconnect error if the input generator stops
      -- or a timeout error.
      -- gen_ptrn <= 0; -- send NULLs
      -- spw_host_in <= spw_host_interface_in_reset;
      -- spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      -- spw_host_in.link_start <= '1';
      -- GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- -- Move to Started state
      -- wait until link_state = S_Started;
      -- gen_ptrn <= 2; -- FCTs
      -- ins_cserr <= '1';
      -- wait for 8 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT)
      -- ins_cserr <= '0';
      -- gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Rx N-char (data char) in ErrorWait state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '0';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to ErrorWait state
      wait until link_state = S_ErrorWait;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 15; -- data chars
      ins_cserr <= '1';
      --wait for 14 * INIT_INBIT_PD; -- IP dependent time for one data char
      wait for 24 * INIT_INBIT_PD; -- IP dependent time for one data char, 1000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      ----------------------------------------------------------------------------
      -- Rx N-char (EOP) in ErrorWait state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '0';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to ErrorWait state
      wait until link_state = S_ErrorWait;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 4; -- EOPs
      ins_cserr <= '1';
      --wait for 8 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT)
      wait for 18 * INIT_INBIT_PD; -- IP dependent time for one data char, 1000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      ----------------------------------------------------------------------------
      -- Rx N-char (EEP) in ErrorWait state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '0';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to ErrorWait state
      wait until link_state = S_ErrorWait;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 16; -- EEPs
      ins_cserr <= '1';
      --wait for 8 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT)
      wait for 18 * INIT_INBIT_PD; -- IP dependent time for one data char, 1000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Rx N-char (data char) in Ready state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '0';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Ready state
      wait until link_state = S_Ready;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 15; -- data chars
      ins_cserr <= '1';
      --wait for 14 * INIT_INBIT_PD; -- IP dependent time for one data char.
      wait for 24 * INIT_INBIT_PD; -- IP dependent time for one data char, 1000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      ----------------------------------------------------------------------------
      -- Rx N-char (EOP) in Ready state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '0';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Ready state
      wait until link_state = S_Ready;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 4; -- EOPs
      ins_cserr <= '1';
      --wait for 8 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT)
      wait for 18 * INIT_INBIT_PD; -- IP dependent time for one data char, 1000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      ----------------------------------------------------------------------------
      -- Rx N-char (EEP) in Ready state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '0';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Ready state
      wait until link_state = S_Ready;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 16; -- EEPs
      ins_cserr <= '1';
      -- wait for 8 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT)
      wait for 18 * INIT_INBIT_PD; -- IP dependent time for one data char, 1000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Rx N-char in Started state
      -- OBS: Not possible to test because to enable got_rxchar, the first NULL
      -- should be already received. However, this is the condition to jump to the
      -- connecting state.
      -----------------------------------------------------------------------------
      -- Rx N-char (data char) in Connecting state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Connecting state
      wait until link_state = S_Connecting;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 15; -- data chars
      ins_cserr <= '1';
      -- wait for 14 * INIT_INBIT_PD; -- IP dependent time for one data char.
      wait for 34 * INIT_INBIT_PD; -- IP dependent time for one data char, 2000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      ----------------------------------------------------------------------------
      -- Rx N-char (EOP) in Connecting state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Connecting state
      wait until link_state = S_Connecting;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 4; -- EOPs
      ins_cserr <= '1';
      -- wait for 8 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT)
      wait for 18 * INIT_INBIT_PD; -- IP dependent time for one data char, 1000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      ----------------------------------------------------------------------------
      -- Rx N-char (EEP) in Connecting state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Connecting state
      wait until link_state = S_Connecting;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 16; -- EEPs
      ins_cserr <= '1';
      -- wait for 8 * INIT_INBIT_PD; -- IP dependent time for one control chars (ex. FCT)
      wait for 18 * INIT_INBIT_PD; -- IP dependent time for one data char, 1000 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Rx timecode in ErrorWait state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '0';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to ErrorWait state
      wait until link_state = S_ErrorWait;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 17; -- timecodes
      ins_cserr <= '1';
      -- wait for 18 * INIT_INBIT_PD; -- IP dependent time for one timecode
      wait for 30 * INIT_INBIT_PD; -- IP dependent time for one data char, 1200 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Rx timecode in Ready state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '0';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Ready state
      wait until link_state = S_Ready;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 17; -- timecodes
      ins_cserr <= '1';
      -- wait for 18 * INIT_INBIT_PD; -- IP dependent time for one timecode
      wait for 30 * INIT_INBIT_PD; -- IP dependent time for one data char, 1200 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
      -- Rx timecode in Started state
      -- OBS: Not possible to test because to enable got_timecode, the first NULL
      -- should be already received. However, this is the condition to jump to the
      -- connecting state.
      -----------------------------------------------------------------------------
      -- Rx timecode in Connecting state
      -- Set Init state of UUT and stimulus
      gen_ptrn <= 1; -- send NULLs
      spw_host_in <= spw_host_interface_in_reset;
      spw_host_in.tx_div_cnt <= TX_CLK_DIV_SLV;
      spw_host_in.auto_start <= '1';
      GlobalReset(5*UUT_T_SYSCLK, MAX_RST_T,rv, rst_n);
      -- Move to Connecting state
      wait until link_state = S_Connecting;
      if got_null = '0' then
         wait until got_null = '1';
      end if; -- got_null
      gen_ptrn <= 0; -- disabled
      wait until gen_idle = '1';
      gen_ptrn <= 17; -- timecodes
      ins_cserr <= '1';
      -- wait for 18 * INIT_INBIT_PD; -- IP dependent time for one timecode
      wait for 30 * INIT_INBIT_PD; -- IP dependent time for one data char, 1200 ns added for clock recv front-end.
      ins_cserr <= '0';
      gen_ptrn <= 0; -- disabled
      -----------------------------------------------------------------------------
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
      variable edisctime     : time := 0 ns; -- elapsed disconnect time
      variable mdisctime     : boolean; -- measure disconnect time
      -------------------------------------------------------
      variable prevrstst  : std_logic; -- previous reset signal state
      variable prevlinkst : link_st_t; -- previous link fsm state
      variable prevcond   : cond_t;  -- previous condition
   begin
      -----------------------------------------------------------------------------
      WaitForStart( CONTROL_IN );
      wait until falling_edge(clk);
      -----------------------------------------------------------------------------
      -- creating bins for cp_link_fsm cover point
      -----------------------------------------------------------------------------
      cp_link_fsm.SetName("cp_link_fsm");
      -- state transitions are based on the clause 8.5 of the SpaceWire standard
      -----------------------------------------------------------------------------
      -- S_ErrorReset (0)
      -----------------------------------------------------------------------------
      cp_link_fsm.AddCross("S_ErrorReset(C_reset)->S_ErrorReset",
      BIN_ERRORRESET, BIN_ERRORRESET,BIN_C_RESET);
      cp_link_fsm.AddCross("S_ErrorReset(C_timer_6_4u)->S_ErrorWait",
      BIN_ERRORRESET, BIN_ERRORWAIT,BIN_C_TMR64U);
      
      -- IgnoreBins when other conditions occurs, the state should remain the same.
      cp_link_fsm.AddCross("S_ErrorReset(C_others)->S_ErrorReset",
      IGBIN_ERRORRESET, IGBIN_ERRORRESET,IGBIN_C_OTHERS);
      -----------------------------------------------------------------------------
      -- S_ErrorWait (1)
      -----------------------------------------------------------------------------
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
      -----------------------------------------------------------------------------
      -- S_Ready (2)
      -----------------------------------------------------------------------------
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
      -----------------------------------------------------------------------------
      -- S_Run (5)
      -----------------------------------------------------------------------------
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
      -----------------------------------------------------------------------------
      -- Mark the rest as illegal
      cp_link_fsm.AddCross(ALL_ILLEGAL, ALL_ILLEGAL, ALL_ILLEGAL);
      cp_link_fsm.SetIllegalMode(ILLEGALMODE);
      -----------------------------------------------------------------------------
      -- Load coverage data from previous testcase
      cp_link_fsm.ReadCovDb( "$dsn\src\Unit Test\SpwStream\TC2CpLinkFsmDb.txt", TRUE);
      -----------------------------------------------------------------------------
      -- Creating bins for the rest of cover points
      -----------------------------------------------------------------------------
      -----------------------------------------------------------------------------
      -- cp_discerr
      -----------------------------------------------------------------------------
      cp_discerr.SetName("cp_discerr");
      cp_discerr.AddBins("Handling disc error",
      DISCERR_GOAL, GenBin(DISCERR_BIN) );
      cp_discerr.AddBins("Timing of disc error detection",
      DISCERRT_GOAL, GenBin(DISCERRT_BIN) );
      cp_discerr.AddBins(ALL_ILLEGAL);
      cp_discerr.SetIllegalMode(ILLEGALMODE);
      mdisctime := False;
      -----------------------------------------------------------------------------
      -- cp_parerr
      -----------------------------------------------------------------------------
      cp_parerr.SetName("cp_parerr");
      cp_parerr.AddBins("Handling par error",
      PARERR_GOAL, GenBin(PARERR_BIN) );
      cp_parerr.AddBins(ALL_ILLEGAL);
      cp_parerr.SetIllegalMode(ILLEGALMODE);
      -----------------------------------------------------------------------------
      -- cp_escerr
      -----------------------------------------------------------------------------
      cp_escerr.SetName("cp_escerr");
      cp_escerr.AddBins("Handling esc error",
      ESCERR_GOAL, GenBin(ESCERR_BIN) );
      cp_escerr.AddBins(ALL_ILLEGAL);
      cp_escerr.SetIllegalMode(ILLEGALMODE);
      -----------------------------------------------------------------------------
      -- cp_crederr
      -----------------------------------------------------------------------------
      cp_crederr.SetName("cp_crederr");
      cp_crederr.AddBins("Handling credit error",
      CREDERR_GOAL, GenBin(CREDERR_BIN) );
      cp_crederr.AddBins(ALL_ILLEGAL);
      cp_crederr.SetIllegalMode(ILLEGALMODE);
      -----------------------------------------------------------------------------
      -- cp_chserr
      -----------------------------------------------------------------------------
      cp_chserr.SetName("cp_chserr");
      cp_chserr.AddBins("Handling got fct error",
      GFCTERR_GOAL, GenBin(GFCTERR_BIN) );
      cp_chserr.AddBins("Handling got N char error",
      GNCERR_GOAL, GenBin(GNCERR_BIN) );
      cp_chserr.AddBins("Handling got timecode error",
      GTCERR_GOAL, GenBin(GTCERR_BIN) );
      cp_chserr.AddBins(ALL_ILLEGAL);
      cp_chserr.SetIllegalMode(ILLEGALMODE);
      -----------------------------------------------------------------------------
      -- cp_crlerr
      -----------------------------------------------------------------------------
      cp_crlerr.SetName("cp_crlerr");
      cp_crlerr.AddBins("Report disc error",
      DER_GOAL, GenBin(DER_BIN) );
      cp_crlerr.AddBins("Report par error",
      PER_GOAL, GenBin(PER_BIN) );
      cp_crlerr.AddBins("Report esc error",
      EER_GOAL, GenBin(EER_BIN) );
      cp_crlerr.AddBins("Report cred error",
      CER_GOAL, GenBin(CER_BIN) );
      cp_crlerr.AddBins(ALL_ILLEGAL);
      cp_crlerr.SetIllegalMode(ILLEGALMODE);
      -----------------------------------------------------------------------------
      prevlinkst :=link_state;
      prevrstst := rst_n;
      prevgotnull := got_null;
      --collecting coverage
      MainCovLoop: while not (--cp_link_fsm.IsCovered and
                              cp_discerr.IsCovered and
                              cp_parerr.IsCovered and
                              cp_escerr.IsCovered and
                              cp_crederr.IsCovered and
                              cp_chserr.IsCovered and
                              cp_crlerr.IsCovered and
                              end_testflow
                              )   loop
         wait until falling_edge(clk);
         -----------------------------------------------------------------------------
         -- collect cp_link_fsm coverage
         -----------------------------------------------------------------------------
         cp_link_fsm.Icover( (link_st_t'pos(prevlinkst),link_st_t'pos(link_state), cond_t'pos(cond) ) );
         -----------------------------------------------------------------------------
         -- check if cp_discerr is covered
         -- OBS: to be sure that the UUT detected all the disconnect errors inserted,
         -- the goal for the cp_discerr cover point is set to the number of inserted errors.
         -- This fact is also valid for the other types of errors.
         -----------------------------------------------------------------------------
         if recvo_errdisc = '1' and pvdiscerr = '0' then
            if ins_discerr = '1' then
               cp_discerr.ICover(DISCERR_BIN);
            else
               cp_discerr.ICover(IDISCERR_BIN);
               errcov := errcov + 1;
            end if; -- ins_discerr
         end if; -- recvo_errdisc
         -- verify detection time
         if ins_discerr = '1' and pvidiscerr = '0' then
            mdisctime := True;
         end if; -- ins_discerr
         if (mdisctime = True and recvo_errdisc = '1') then
            mdisctime := False;
            edisctime := ins_discerr'last_event;
            if (edisctime >= 727 ns) and (edisctime <= 1 us) then
               cp_discerr.ICover(DISCERRT_BIN);
            else
               cp_discerr.ICover(IDISCERRT_BIN);
            end if; -- edisctime
         end if; -- mdisctime
         -----------------------------------------------------------------------------
         -- check if cp_parerr is covered
         -----------------------------------------------------------------------------
         if recvo_errpar = '1' and prevparerr = '0' then
            if ins_parerr = '1' then
               cp_parerr.ICover(PARERR_BIN);
            else
               cp_parerr.ICover(IPARERR_BIN);
               errcov := errcov + 1;
            end if; -- ins_parerr
         end if; -- recvo_errpar
         -----------------------------------------------------------------------------
         -- check if cp_escerr is covered
         -----------------------------------------------------------------------------
         if recvo_erresc = '1' and prevescerr = '0' then
            if ins_escerr = '1' then
               cp_escerr.ICover(ESCERR_BIN);
            else
               cp_escerr.ICover(IESCERR_BIN);
               errcov := errcov + 1;
            end if; -- ins_escerr
         end if; -- recvo_erresc
         -----------------------------------------------------------------------------
         -- check if cp_crederr is covered
         -----------------------------------------------------------------------------
         if linko_errcred = '1' and prevcrediterr = '0' then
            if ins_crederr = '1' then
               cp_crederr.ICover(CREDERR_BIN);
            else
               cp_crederr.ICover(ICREDERR_BIN);
               errcov := errcov + 1;
            end if; -- ins_crederr
         end if; -- linko_errcred
         -----------------------------------------------------------------------------
         -- check if cp_chserr is covered
         -----------------------------------------------------------------------------
         if got_fct = '1' and prevgotfct = '0' and (link_state = S_ErrorWait
            or link_state = S_Ready or link_state = S_Started)  then
            if ins_cserr = '1' then
               cp_chserr.ICover(GFCTERR_BIN);
            else
               cp_chserr.ICover(ICSERR_BIN);
               errcov := errcov + 1;
            end if; -- ins_cserr
         end if; -- got_fct
         if got_rxchar = '1' and prevgotrxchar = '0' and (link_state = S_ErrorWait
            or link_state = S_Ready or link_state = S_Started or link_state = S_Connecting ) then
            if ins_cserr = '1' then
               cp_chserr.ICover(GNCERR_BIN);
            else
               cp_chserr.ICover(ICSERR_BIN);
               errcov := errcov + 1;
            end if; -- ins_cserr
         end if; -- got_rxchar
         if got_timecode = '1' and prevgottc = '0' and (link_state = S_ErrorWait
            or link_state = S_Ready or link_state = S_Started or link_state = S_Connecting ) then
            if ins_cserr = '1' then
               cp_chserr.ICover(GTCERR_BIN);
            else
               cp_chserr.ICover(ICSERR_BIN);
               errcov := errcov + 1;
            end if; -- ins_cserr
         end if; -- got_timecode
         -----------------------------------------------------------------------------
         -- check if cp_crlerr is covered
         -----------------------------------------------------------------------------
         if recvo_errdisc = '1' and pvdiscerr = '0' then
            if (link_state = S_Run) then
               if linko_errdisc = '1' then
                  cp_crlerr.Icover(DER_BIN);
               else
                  cp_crlerr.Icover(IREP_BIN);
                  errcov := errcov + 1;
               end if; -- linko_errdisc
            else
               if linko_errdisc = '0' then
                  cp_crlerr.Icover(DER_BIN);
               else
                  cp_crlerr.Icover(IREP_BIN);
                  errcov := errcov + 1;
               end if; -- linko_errdisc
            end if; -- link_state
         end if; -- recvo_errdisc
         if recvo_errpar = '1' and prevparerr = '0' then
            if (link_state = S_Run) then
               if linko_errpar = '1' then
                  cp_crlerr.Icover(PER_BIN);
               else
                  cp_crlerr.Icover(IREP_BIN);
                  errcov := errcov + 1;
               end if; -- linko_errpar
            else
               if linko_errpar = '0' then
                  cp_crlerr.Icover(PER_BIN);
               else
                  cp_crlerr.Icover(IREP_BIN);
                  errcov := errcov + 1;
               end if; -- linko_errpar
            end if; -- link_state
         end if; -- recvo_errpar
         if recvo_erresc = '1' and prevescerr = '0' then
            if (link_state = S_Run) then
               if linko_erresc = '1' then
                  cp_crlerr.Icover(EER_BIN);
               else
                  cp_crlerr.Icover(IREP_BIN);
                  errcov := errcov + 1;
               end if; -- linko_erresc
            else
               if linko_erresc = '0' then
                  cp_crlerr.Icover(EER_BIN);
               else
                  cp_crlerr.Icover(IREP_BIN);
                  errcov := errcov + 1;
               end if; -- linko_erresc
            end if; -- link_state
         end if; -- recvo_erresc
         if linko_errcred = '1' and prevcrediterr = '0' then
            if (link_state = S_Run) then
               if linko_errcred = '1' then
                  cp_crlerr.Icover(CER_BIN);
               else
                  cp_crlerr.Icover(IREP_BIN);
                  errcov := errcov + 1;
               end if; -- linko_errcred
            else
               if linko_errcred = '0' then
                  cp_crlerr.Icover(CER_BIN);
               else
                  cp_crlerr.Icover(IREP_BIN);
                  errcov := errcov + 1;
               end if; -- linko_errcred
            end if; -- link_state
         end if; -- linko_errcred
         -----------------------------------------------------------------------------
         prevlinkst := link_state;
         prevrstst  := rst_n;
         pvdiscerr   := recvo_errdisc;
         pvidiscerr := ins_discerr;
         prevparerr := recvo_errpar;
         prevescerr := recvo_erresc;
         prevcrediterr := linko_errcred;
         prevgotfct := got_fct;
         prevgotrxchar := got_rxchar;
         prevgottc := got_timecode;
         prevgotnull := got_null;
         prevcond := cond;
         -----------------------------------------------------------------------------
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
         if not cp_discerr.IsCovered then
            errcov := errcov + 1;
            cp_discerr.WriteCovHoles;
         end if; -- cp_discerr
         if not cp_parerr.IsCovered then
            errcov := errcov + 1;
            cp_parerr.WriteCovHoles;
         end if; -- cp_parerr
         if not cp_escerr.IsCovered then
            errcov := errcov + 1;
            cp_escerr.WriteCovHoles;
         end if; -- cp_escerr
         if not cp_crederr.IsCovered then
            errcov := errcov + 1;
            cp_crederr.WriteCovHoles;
         end if; -- cp_crederr
         if not cp_chserr.IsCovered then
            errcov := errcov + 1;
            cp_chserr.WriteCovHoles;
         end if; -- cp_chserr
         if not cp_crlerr.IsCovered then
            errcov := errcov + 1;
            cp_crlerr.WriteCovHoles;
         end if; -- cp_crlerr
         
      else
         PrintResultLine( "FC: SUCCESS! The functional coverage goal was achieved.");
         PrintResultLine( "FC: 7 coverage points checked." );
         PrintResultLine( "FC: More details on the coverage report." );
         -- writing cp_link_fsm coverage results to file to load it in the next testcase
         cp_link_fsm.WriteCovDb( "$dsn\src\Unit Test\SpwStream\TC3CpLinkFsmDb.txt", WRITE_MODE ) ;
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
end architecture TC3RecvErr_beh;
--------------------------------------------------------------------------------
-- end TC3RecvErr.vhd
--------------------------------------------------------------------------------