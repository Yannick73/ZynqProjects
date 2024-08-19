--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC7NormalOp.vhd
--!
--! \brief        Implementation of the test case Normal Operation unit test. Two
--!               SpaceWire links connected. UUT1 sends data to UUT2. Monitoring
--!               SPW link signals and internal IP registers, verify that the
--!               data transfer is according to SPW standard.
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 25.10.2016
--! \date         Updated: 07.10.2020
--! \version      V 1.00
--
-- Unit         : TC7NormalOp (BEH) (entity, architecture)
-- File version : $Revision: 144 $
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
--! IEEE standard logic textio package
use ieee.std_logic_textio.all;
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
use spwip.SpwStream_pkg.all;
--! SPWIP registers definition.
use spwip.SpwRegisters_pkg.all;
--! SPWIP record type definitions.
use SPWIP.SpwProtocol_pkg.all;
--! SPWIP SpwStream unit
use SPWIP.SpwStream;

--! OSVVM library
library OSVVM;
--! OSVVM Random Base package
use OSVVM.RandomBasePkg.all;
--! OSVVM Random package
use OSVVM.RandomPkg.all;
--! OSVVM Coverage package
use OSVVM.CoveragePkg.all;
--! Work library
library work;
--! Simulation support package
use work.SimulationSupport_pkg.all;
--------------------------------------------------------------------------------
-- Entity TC7NormalOp
--! \brief        TC7NormalOp - normal operation test case.
--! \details      The unit executes the normal operation test case, communication between 2 SPW
--!               links, pseudo-random data sent and received.  UUT1 sends data
--!               to UUT2.
--!
--!               List of Error/Corner cases:
--!               - Corner case: RX FIFO Full
--!               - Corner case: RX FIFO Empty
--!               - Corner case: TX FIFO Full
--!               - Corner case: TX FIFO Empty
--!               - Corner case: Minimum data signalling rate
--!               - Corner case: Maximum data signalling rate
--!               - Corner Case: One link TX at min rate and the other link TX at max rate
--!               - Corner Case: Send special N-chars: diff EOP, diff EEP. 
--!                 A diff EOP/EEP means that a different byte from 0x00 (EOP) 
--!                 or 0x01 (EEP) is sent from the host interface.
--!
--!               List of associated clauses from the SpW Standard (ECSS-E-ST-50-12C):
--!               - All cases: 6.3.1.c, 6.3.1.d, 6.6.5.a, 6.6.5.b, 6.6.6.a, 7.2.b, 7.2.c, 7.3.b, 7.3.c, 7.4.c, 7.6.a, 7.7.b, 7.7.c,
--!               8.2.2.a, 8.3.b, 8.3.c, 8.3.o, 8.3.p, 8.3.q, 8.3.r, 8.3.s, 8.5.2.3.a, 8.5.2.3.b, 8.5.2.3.c, 8.5.2.3.d, 8.5.2.4.a, 8.5.2.4.a,
--!               8.5.2.4.b, 8.5.2.4.c, 8.5.2.4.d, 8.5.2.5.a, 8.5.2.5.c, 8.5.2.5.d, 8.5.2.5.e, 8.5.2.5.f, 8.5.2.6.a, 8.5.2.6.c, 8.5.2.6.d,
--!               8.5.2.7.a, 8.5.3.2.a, 8.5.3.2.b, 8.5.3.2.e, 8.5.3.3.a, 8.5.3.4.a, 8.6.b, 8.7, 8.8, 8.12.2.e, 8.12.2.f
--!               - Corner case: RX FIFO Full 8.8
--!               - Corner case: RX FIFO Empty 8.8
--!               - Corner case: TX FIFO Full 8.8
--!               - Corner case: TX FIFO Empty 8.8
--!               - Corner case: Minimum data signalling rate 6.6.1.a
--!               - Corner case: Maximum data signalling rate 6.6.2.a
--!               - Corner Case: One link TX at min rate and the other link TX at max rate 6.6.3.a
--!               - Corner Case: Send special N-chars: diff EOP, diff EEP 7.6.a, 7.6.b, 7.6.c
--!
--!               List of coverage points used here:
--!               - cp_tx_full, cp_tx_empty
--!               - cp_rx_full, cp_rx_empty
--!               - cp_illegal_disc, cp_illegal_par, cp_illegal_esc, cp_illegal_cred
--!               - cp_tx_rx_null_chars, cp_tx_rx_fct_chars, cp_tx_rx_eop_chars,
--!               - cp_tx_rx_eep_chars, cp_tx_rx_esc_chars, cp_tx_rx_data,
--!               - cp_tx_rx_timecode, cp_illegal_link_char, cp_fct_send_condition
--!               - cp_2_min_rate, cp_100_max_rate
--!               - cp_tx_rx_diff_rates
--!               - cp_diff_EOP_tx, cp_diff_EEP_tx
--!               - cp_chars_priority_on_tx
-- Comments     :
-- Updates      :
--------------------------------------------------------------------------------
entity TC7NormalOp is
   generic (
      TOTAL_BYTES_TX : integer      := 2000; --! Maximum number of bytes to Tx.
      SEED           : integer      := 1;    --! seed for random generation.
      SETUP_TIME     : delay_length := 1 ns; --! the default setup time.
      HOLD_TIME      : delay_length := 1 ns; --! the default hold time.
      TX_CLK_FREQ    : real  := 100.0e6 ;    --! Transmit clock frequency in Hz. Should be the same as TXCLKFREQ in SpwRegisters_pkg.vhd
      TX_CLOCK_DIV   : integer := 0;         --! Divisor for SPW Tx clock
      TX_CLOCK_DIV_2 : integer := 49    --! Divisor for SPW Tx clock(UUT2). Scaling
                                        --! factor minus 1, used to scale the
                                        --! transmit base clock into the
                                        --! transmission bit rate.
   );
   port (
      CONTROL_IN  : in execution; --! the test case execution control information.
      CONTROL_OUT : out result    --! the test case execution result information.
   );
end entity TC7NormalOp;
--------------------------------------------------------------------------------
-- Architecture TC7NormalOp_beh
--! \brief  implementation of the test case 7 for the SPW unit.
--------------------------------------------------------------------------------
architecture TC7NormalOp_beh of TC7NormalOp is
   -----------------------------------------------------------------------------
   -- Simulation related signals, variables and constants
   -----------------------------------------------------------------------------
   constant UUT1_T_SYSCLK    : time := (1 sec)/SYSFREQ; --! define the UUT clk signal period.
   constant UUT2_T_SYSCLK    : time := (1 sec)/SYSFREQ; --! define the UUT clk signal period.
   constant TX_CLK_DIV_SLV   : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(TX_CLOCK_DIV, 8));
   constant TX_CLK_DIV_2MBPS_SLV : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(49, 8));
   constant TX_CLK_DIV_UUT2_SLV  : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(TX_CLOCK_DIV_2, 8));
   signal control            : result;       --! internal execution result
   signal error              : integer := 0; --! total error counter
   signal error_testFlow     : integer := 0; --! test flow 1 data error counter
   signal error_testflow2dat : integer := 0; --! test flow 2 data error counter
   signal error_testflow2tc  : integer := 0; --! test flow 2 timecodes error counter
   signal error_cover        : integer := 0; --! functional coverage error counter
   signal testflow1_end      : boolean := false; --! testflow1 process end flag
   signal testflow2_end      : boolean := false; --! testflow2 process end flag
   signal end_sim            : boolean := false; --! end of simulation flag
   signal uut2_link_start    : boolean := false; --! flag to assert UUT2 link_start signal
   -----------------------------------------------------------------------------
   subtype chars is std_logic_vector(8 downto 0); -- 1 bit for ctrl flag (MSB)
                                                  -- 8 bits for data.
   -----------------------------------------------------------------------------
   -- Type data_FIFO
   --! \brief        Type definition for a data FIFO between input generator and receiver.
   --! \details      The type is an array of 9-bits chars.
   -----------------------------------------------------------------------------
   type data_FIFO is array (0 to TOTAL_BYTES_TX) of chars; -- FIFO for data comparison
                                                           -- at receiver link
   signal tx_chars         : data_FIFO := (others => chars'(others => 'U'));
   signal data_fifo_rd_ptr : integer := 0;  --! Read pointer for tx_chars
   signal data_fifo_wr_ptr : integer := 0;  --! Write pointer for tx_chars
   -----------------------------------------------------------------------------
   subtype timecode_chars is std_logic_vector(7 downto 0); -- 2 bits for control code
                                                           -- 6 bits for time code
   -----------------------------------------------------------------------------
   -- Type timecode_FIFO
   --! \brief        Type definition for the timecode FIFO between data generator and receiver.
   --! \details      The type is an array of 8-bits chars.
   -----------------------------------------------------------------------------
   type timecode_FIFO is array (0 to TOTAL_BYTES_TX) of timecode_chars; -- FIFO for timecode
                                                                        -- comparison at
                                                                        -- receiver link.
   signal tx_timecodes         : timecode_FIFO :=  (others => timecode_chars'(others => 'U'));
   signal timecode_FIFO_rd_ptr : integer := 0;  --! Read pointer for tx_timecodes
   signal timecode_FIFO_wr_ptr : integer := 0;  --! Write pointer for tx_timecodes
   constant MIN_TX_DELAY  : integer := 1;    --! init minimum tx delay (in clk cycles)
   constant MAX_TX_DELAY  : integer := 50;   --! init maximum tx delay (in clk cycles)
   constant MIN_RX_DELAY  : integer := 1;    --! init minimum rx delay (in clk cycles)
   constant MAX_RX_DELAY  : integer := 50;   --! init maximum rx delay (in clk cycles)
   constant FAVORSMALL  : RandomParmType := (FAVOR_SMALL,0.0,0.0);
   constant FAVORBIG    : RandomParmType := (FAVOR_BIG,0.0,0.0);
   constant UNIFORM     : RandomParmType := (UNIFORM,0.0,0.0);
   
   signal input_gen_stats  : generator_stats_type := GENERATOR_STATS_RESET;
   signal diff_eop_tx : std_logic := '0'; -- set flag if a wrong EOP is Tx
   signal diff_eep_tx : std_logic := '0'; -- set flag if a wrong EEP is Tx
   -----------------------------------------------------------------------------
   -- Link bit and character monitor related signals, variables and constants
   -----------------------------------------------------------------------------
   signal mon_ena1   : std_logic := '0';     --! monitor enable
   signal mon_data1  : std_logic_vector(7 downto 0); --! received data
   signal mon_data1_vld : std_logic; --! data valid flag
   signal mon_tc1    : std_logic_vector(7 downto 0); --! received timecode
   signal mon_tc1_vld   : std_logic; --! timecode valid flag
   signal mon_inputs : monitor_inputs_type;  --! monitor inputs/config parameters
   signal mon_outputs: monitor_outputs_type; --! monitor outputs
   
   signal rate_changed    : std_logic := '0'; --! Tx rate change flag
   signal bit_mon_errors  : integer := 0;     --! bit monitor error counter
   signal char_mon_stats  : monitor_stats_type := MONITOR_STATS_RESET;
   signal char_mon_errors : integer := 0;     --! char monitor error counter
   
   signal mon_ena2   : std_logic := '0';     --! monitor enable
   signal mon_data2  : std_logic_vector(7 downto 0); --! received data
   signal mon_data2_vld : std_logic; --! data valid flag
   signal mon_tc2    : std_logic_vector(7 downto 0); --! received timecode
   signal mon_tc2_vld   : std_logic; --! timecode valid flag
   signal mon_inputs2 : monitor_inputs_type;  --! monitor inputs/config parameters
   signal mon_outputs2: monitor_outputs_type; --! monitor outputs
   
   signal rate_changed2    : std_logic := '0'; --! Tx rate change flag
   signal bit_mon_errors2  : integer := 0;     --! bit monitor error counter
   signal char_mon_stats2  : monitor_stats_type := MONITOR_STATS_RESET;
   signal char_mon_errors2 : integer := 0;     --! char monitor error counter
   -----------------------------------------------------------------------------
   -- spwstream (UUT1) interface signals
   -----------------------------------------------------------------------------
   signal clk1    : std_logic; --! UUT1 System clock
   signal txclk1  : std_logic; --! UUT1 Transmit clock
   signal rst1_n  : std_logic; --! asynchronous reset (active-low)
   signal spw_host1_in: spw_host_interface_in := spw_host_interface_in_reset; 
   signal spw_host1_out: spw_host_interface_out := spw_host_interface_out_reset;
   signal spw_link1: spw_link_interface; --! SPW link interface
   -- misc signals for interface
   signal err_any1:  std_logic; --! OR signal of error outputs
   -----------------------------------------------------------------------------
   -- spwstream (UUT2) interface signals
   -----------------------------------------------------------------------------
   signal clk2    : std_logic; --! UUT2 System clock
   signal txclk2  : std_logic; --! UUT2 Transmit clock
   signal rst2_n  : std_logic; --! asynchronous reset (active-low)
   signal spw_host2_in : spw_host_interface_in := spw_host_interface_in_reset;
   signal spw_host2_out: spw_host_interface_out := spw_host_interface_out_reset;
   signal spw_link2: spw_link_interface; --! SPW link interface
   -- misc signals for interface
   signal err_any2:  std_logic; --! OR signal of error outputs
   -----------------------------------------------------------------------------
   -- Clock related signals, variables and constants
   -----------------------------------------------------------------------------
   constant OUTBIT_PERIOD : time := (1 sec) * real(TX_CLOCK_DIV+1) / TX_CLK_FREQ; --! SPW output bit period
                                       
   constant TXCLK_PERIOD  : time := (1 sec) / TX_CLK_FREQ; --! Tx clock period
   -----------------------------------------------------------------------------
   -- Reset generation related signals, variables and constants
   -----------------------------------------------------------------------------
   constant MAX_RESET_TIME  : time := 20*UUT1_T_SYSCLK; --! maximum reset time for UUT1
   constant MAX_RESET_TIME2 : time := 20*UUT2_T_SYSCLK; --! maximum reset time for UUT2
   -----------------------------------------------------------------------------
   -- Functional Coverage related signals, variables and constants
   -----------------------------------------------------------------------------
   constant ILLEGALMODE : IllegalModeType := ILLEGAL_ON; -- can also be ILLEGAL_FAILURE
   -----------------------------------------------------------------------------
   -- The TX FIFO is monitored in UUT1
   shared variable cp_tx_full  : CovPType;     --! Tx FIFO full
   constant TX_FULL            : integer := 1; --! The bin value is set to 1.
   constant TX_FULL_GOAL       : integer := 3; --! The goal is set to 1.
   signal txfifo_full          : std_logic;
   shared variable cp_tx_empty : CovPType;     --! Tx FIFO empty
   constant TX_EMPTY           : integer := 1; --! The bin value is set to 1.
   constant TX_EMPTY_GOAL      : integer := 3; --! The goal is set to 1.

   -----------------------------------------------------------------------------
   -- Type spwstream_regs_type
   --! \brief        internal registers for the Spwstream module.
   --! \details      The type contains the registers used by the Spwstream
   --!               module.
   -----------------------------------------------------------------------------
   type spwstream_regs_type is record
      -- packet state
      rxpacket       : std_logic; --! '1' when receiving a packet
      rxeep          : std_logic; --! '1' when rx EEP character pending
      txpacket       : std_logic; --! '1' when transmitting a packet
      txdiscard      : std_logic; --! '1' when discarding a tx packet
      rxemptydiscard : std_logic; --! '1' when rx empty packet (consecutive EOP or EEP)
      -- FIFO pointers
      rxfifo_raddr   : std_logic_vector(RXFIFOSIZE_BITS-1 downto 0); --! RX FIFO read addr pointer
      rxfifo_waddr   : std_logic_vector(RXFIFOSIZE_BITS-1 downto 0); --! RX FIFO write addr pointer
      txfifo_raddr   : std_logic_vector(TXFIFOSIZE_BITS-1 downto 0); --! TX FIFO read addr pointer
      txfifo_waddr   : std_logic_vector(TXFIFOSIZE_BITS-1 downto 0); --! TX FIFO write addr pointer
      -- FIFO state
      rxfifo_rvalid  : std_logic; --! '1' if s_rxfifo_rdata is valid
      txfifo_rvalid  : std_logic; --! '1' if s_txfifo_rdata is valid
      rxfull         : std_logic; --! '1' if RX fifo is full
      rxhalff        : std_logic; --! '1' if RX fifo is at least half full
      txfull         : std_logic; --! '1' if TX fifo is full
      txhalff        : std_logic; --! '1' if TX fifo is at least half full
      rxroom         : std_logic_vector(5 downto 0); --! nr of free positions in the rx fifo
      rxfiforoom     : std_logic_vector (RXFIFOSIZE_BITS downto 0); -- RX FIFO room.
      txfiforoom     : std_logic_vector (TXFIFOSIZE_BITS downto 0); -- TX FIFO room.
      disc_cnt       : std_logic_vector(7 downto 0); --! disconnect error counter
      par_cnt        : std_logic_vector(7 downto 0); --! parity error counter
      esc_cnt        : std_logic_vector(7 downto 0); --! escape error counter
      cred_cnt       : std_logic_vector(7 downto 0); --! credit error counter
      empty_cnt      : std_logic_vector(7 downto 0); --! empty packet counter
   end record;
--! \cond VHDL2008
   --! UUT1 SpwStream registers.
   alias spwstream_regs_uut1 is <<signal uut1.res_seq : spwstream_regs_type>>;
   --! UUT1 Tx FIFO read valid signal.
   alias txfifo_rvalid is spwstream_regs_uut1.txfifo_rvalid;
--! \endcond
   signal txfifo_empty : std_logic; --! generated from the txfifo_rvalid alias from UUT1
   -----------------------------------------------------------------------------
   -- The RX FIFO is monitored in UUT2
   shared variable cp_rx_full  : CovPType;     --! Rx FIFO full
   constant RX_FULL            : integer := 1; --! The bin value is set to 1.
   constant RX_FULL_GOAL       : integer := 3; --! The goal is set to 1.
--! \cond VHDL2008
   --! UUT2 SpwStream registers.
   alias spwstream_regs_uut2   is <<signal uut2.res_seq : spwstream_regs_type>>;
   --! UUT2 Rx FIFO full signal
   alias rxfifo_full           is spwstream_regs_uut2.rxfull;
--! \endcond
   shared variable cp_rx_empty : CovPType;     --! Rx FIFO empty
   constant RX_EMPTY           : integer := 1; --! The bin value is set to 1.
   constant RX_EMPTY_GOAL      : integer := 3; --! The goal is set to 1.
   signal rxfifo_empty         : std_logic;
   -----------------------------------------------------------------------------
   -- The link errors are monitored in both UUTs
--! \cond VHDL2008
   --! Signals from SpwLink to SpwStream
   alias spwlink_linko_uut1 is <<signal uut1.link_inst.linko : spw_link_out_type>>;
   alias spwlink_linko_uut2 is <<signal uut2.link_inst.linko : spw_link_out_type>>;
--! \endcond
   --
   shared variable cp_illegal_disc : CovPType;  --! No disconnection error
   signal disc_err                 : std_logic;
   --! linko_errdisc1 is std_logic.
   alias linko_errdisc1 is spwlink_linko_uut1.errdisc;
   --! linko_errdisc2 is std_logic.
   alias linko_errdisc2 is spwlink_linko_uut2.errdisc;
   --
   shared variable cp_illegal_par  : CovPType;  --! No parity error
   signal par_err                  : std_logic;
   --! linko_errpar1 is std_logic.
   alias linko_errpar1 is spwlink_linko_uut1.errpar;
   --! linko_errpar2 is std_logic.
   alias linko_errpar2 is spwlink_linko_uut2.errpar;
   --
   shared variable cp_illegal_esc  : CovPType;  --! No ESC error
   signal esc_err                  : std_logic;
   --! linko_erresc1 is std_logic.
   alias linko_erresc1 is spwlink_linko_uut1.erresc;
   --! linko_erresc2 is std_logic.
   alias linko_erresc2 is spwlink_linko_uut2.erresc;
   --
   shared variable cp_illegal_cred : CovPType;  --! No credit error
   signal cred_err                 : std_logic;
   --! linko_errcred1 is std_ulogic.
   alias linko_errcred1 is spwlink_linko_uut1.errcred;
   --! linko_errcred2 is std_ulogic.
   alias linko_errcred2 is spwlink_linko_uut2.errcred;
   -----------------------------------------------------------------------------
   --! Handling null chars. Includes the correct detection of first NULL.
   shared variable cp_tx_rx_null_chars : CovPType;
--! \cond VHDL2008
   --! UUT2 receiver output signals to SpwLink.
   alias spwlink_recvo_uut2 is <<signal uut2.link_inst.recvo : spw_recv_out_type>>;
--! \endcond
   --! UUT2 got Null signal.
   alias got_null           is spwlink_recvo_uut2.gotnull;
   constant RX_NULL      : integer := 0; --! The bin value is set to 0.
   constant TX_NULL      : integer := 1; --! The bin value is set to 1.
   constant RX_NULL_GOAL : integer := 1; --! The goal is set to 1 because it is
                                         --! not possible to detect more than one.
   constant TX_NULL_GOAL : integer := 30;--! The goal is set to 30.
   -----------------------------------------------------------------------------
   --! Handling FCT chars
   shared variable cp_tx_rx_fct_chars : CovPType;
--! \cond VHDL2008
   --! UUT1 receiver output signals to SpwLink.
   alias spwlink_recvo_uut1 is <<signal uut1.link_inst.recvo : spw_recv_out_type>>;
--! \endcond
   --! UUT1 got FCT signal.
   alias got_fct            is spwlink_recvo_uut1.gotfct;
   constant RX_FCT      : integer := 0;  --! The bin value is set to 0.
   constant TX_FCT      : integer := 1;  --! The bin value is set to 1.
   constant RX_FCT_GOAL : integer := 10; --! The goal is set to 10.
   constant TX_FCT_GOAL : integer := 7;  --! The goal is set to 7.
   -----------------------------------------------------------------------------
   --! Handling EOP chars
   shared variable cp_tx_rx_eop_chars : CovPType; 
   constant RX_EOP      : integer := 0; --! The bin value is set to 0.
   constant TX_EOP      : integer := 1; --! The bin value is set to 1.
   constant RX_EOP_GOAL : integer := 3; --! The goal is set to 3.
   constant TX_EOP_GOAL : integer := 3; --! The goal is set to 3.
   -----------------------------------------------------------------------------
   --! Handling EEP chars
   shared variable cp_tx_rx_eep_chars : CovPType; 
   constant RX_EEP      : integer := 0; --! The bin value is set to 0.
   constant TX_EEP      : integer := 1; --! The bin value is set to 1.
   constant RX_EEP_GOAL : integer := 3; --! The goal is set to 3.
   constant TX_EEP_GOAL : integer := 3; --! The goal is set to 3.
   -----------------------------------------------------------------------------
   --! Handling ESC chars
   shared variable cp_tx_rx_esc_chars : CovPType; 
--! \cond VHDL2008
   --! UUT2 receiver registers.
   alias spwrecv_regs_uut2 is <<signal uut2.recv_inst.res_seq : spwrecv_regs_type>>;
--! \endcond
   --! UUT2 got ESC signal.
   alias got_esc is spwrecv_regs_uut2.escaped;
   constant RX_ESC      : integer := 0;   --! The bin value is set to 0.
   constant TX_ESC      : integer := 1;   --! The bin value is set to 1.
   constant RX_ESC_GOAL : integer := 100; --! The goal is set to 100.
   constant TX_ESC_GOAL : integer := 100; --! The goal is set to 100.
--------------------------------------------------------------------------------
   --! Handling data chars
   shared variable cp_tx_rx_data : CovPType; 
   constant RX_DATA      : integer := 0;     --! The bin value is set to 0.
   constant TX_DATA      : integer := 1;     --! The bin value is set to 1.
   constant RX_DATA_GOAL : integer := 50;    --! The goal is set to 50.
   constant TX_DATA_GOAL : integer := 50;    --! The goal is set to 50.
   -----------------------------------------------------------------------------
   --! Tx timecode chars. Send only in Run state. Send immediately.
   --! Rx timecode chars. Receive only in Run state.
   shared variable cp_tx_rx_timecode : CovPType;
   constant RX_TIMECODE      : integer := 0;     --! The bin value is set to 0.
   constant TX_TIMECODE      : integer := 1;     --! The bin value is set to 1.
   constant RX_TIMECODE_GOAL : integer := 3;     --! The goal is set to 3.
   constant TX_TIMECODE_GOAL : integer := 3;     --! The goal is set to 3.
   constant ILLEGAL_TX_TIMECODE : integer := 99; --! Illegal tx of timecode (not in run state)
   -----------------------------------------------------------------------------
   --! L-chars should not appear in the host data interface.
   shared variable cp_illegal_link_char : CovPType;
   signal not_N_chars : integer := 0;            --! counter for not Normal-chars.
   -----------------------------------------------------------------------------
   --! Handling a Tx of different code from EOP (X"00").
   shared variable cp_diff_EOP_tx   : CovPType;
   constant DIFF_EOP                : integer := 1; --! The bin value is set to 1
                                                    --! to match with flag diff_EOP_tx.
   constant DIFF_EOP_TX_GOAL        : integer := 1; --! The goal is set to 1.
   --! Handling a Tx of different code from EEP (X"01").
   shared variable cp_diff_EEP_tx   : CovPType;
   constant DIFF_EEP                : integer := 1; --! The bin value is set to 1
                                                    --! to match with flag diff_EEP_tx.
   constant DIFF_EEP_TX_GOAL        : integer := 1; --! The goal is set to 1.
   
   -----------------------------------------------------------------------------
   --! TX and RX at different rates. Evaluated at UUT1.
   --! Verify that the Tx rate can only be changed after connection.
   --! Verify that the initial Tx rate is 10 Mbps
   shared variable cp_tx_rx_diff_rates : CovPType;
   constant DIFF_RATES_BIN       : integer := 1; --! Tx and rx at different rates
   constant DIFF_RATES_GOAL      : integer := 1;
   constant INIT_TX_RATE_BIN     : integer := 2; --! defined as (10+-1) Mbps
   constant INIT_TX_RATE_GOAL    : integer := 1;
   constant CHANGE_TX_RATE_BIN   : integer := 3; --! Tx rate changed at Run state
   constant CHANGE_TX_RATE_GOAL  : integer := 1;
   constant ILLEGAL_INIT_TX_RATE : integer := 99; --! Tx rate changed at other state
--! \cond VHDL2008
   alias spwlink_regs_uut2 is <<signal uut2.link_inst.state_seq : spwlink_regs_type>>;
   --! UUT2 link state
   alias uut2_link_state is spwlink_regs_uut2.state; -- state is link_st_t.
--! \endcond
   -----------------------------------------------------------------------------
   --! FCT send when at least 8 bytes are free and not reserved in Rx FIFO. 
   -- Evaluated at UUT2.
   shared variable cp_fct_send_condition : CovPType;
   constant FCT_COND_VIOLATION   :  integer := 1; --! The bin value is set to 1.
   constant FCT_COND_RESPECTED   :  integer := 2; --! The bin value is set to 2.
--! \cond VHDL2008
   --! UUT2 Send FCT signal to transmitter.
   alias xmit_fct_in is spwlink_regs_uut2.xmit_fct_in; -- std_ulogic
   --! UUT2 Rx credit register.
   alias rx_credit is spwlink_regs_uut2.rx_credit;     -- unsigned(5 downto 0)
   --! UUT2 Rx room register.
   alias rx_room is spwstream_regs_uut2.rxroom;       -- std_logic_vector(5 downto 0)
--! \endcond
   -----------------------------------------------------------------------------
   --! Verify the request to send nulls in the started state.
--! \cond VHDL2008
   --! Signals from SpwLink to SpwXmit
   alias spwlink_xmiti_uut is <<signal uut1.link_inst.xmiti : spw_xmit_in_type>>;
   --! UUT1 SpwLink registers.
   alias spwlink_regs_uut1 is <<signal uut1.link_inst.state_seq : spwlink_regs_type>>;
   --! UUT1 link state
   alias uut1_link_state   is spwlink_regs_uut1.state; -- state is link_st_t.
--! \endcond
   shared variable cp_snullreq: CovPType;  -- cp stnull req in S_started
   constant SNULLREQ_BIN  : integer := 1;  -- send null request bin
   constant SNULLREQ_GOAL : integer := 1; -- send null request goal 
   constant ISNULLREQ_BIN : integer := 99; -- illegal send null request bin
   alias stnull_req is spwlink_xmiti_uut.stnull; -- stnull is std_logic
   -----------------------------------------------------------------------------
   --! Verify the request to send fcts in the connecting state.
   shared variable cp_sfctreq: CovPType;  -- cp stfct req in S_connecting
   constant SFCTREQ_BIN  : integer := 1;  -- send fct request bin
   constant SFCTREQ_GOAL : integer := 1; -- send fct request goal
   constant ISFCTREQ_BIN : integer := 99; -- illegal send fct request bin
   alias stfct_req  is spwlink_xmiti_uut.stfct; -- stfct is std_logic.
   -----------------------------------------------------------------------------
   --! Evaluates that the link can run at the minimum rate of 2 Mbps.
   shared variable cp_2_min_rate : CovPType; -- cp 2 Mbps minimum data rate
   constant MINRATE_BIN  : integer := 1;  -- tx and rx at 2 Mbps
   constant MINRATE_GOAL : integer := 1;  -- MINRATE_BIN goal
   
   -----------------------------------------------------------------------------
   --! Evaluates that the link can run at the maximum rate of 100 Mbps.
   shared variable cp_100_max_rate : CovPType; -- cp 100 Mbps maximum data rate
   constant MAXRATE_BIN  : integer := 1;  -- tx and rx at 100 Mbps
   constant MAXRATE_GOAL : integer := 1;  -- MAXRATE_BIN goal
   
   -----------------------------------------------------------------------------
   -- TODO: implement this functional coverage items
   --! evaluation of the link tx priority of 1-timecodes, 2-FCT, 3-N-chars, and 4-NULL chars.
   shared variable cp_chars_priority_on_tx : CovPType;
   
   -----------------------------------------------------------------------------
begin
   -----------------------------------------------------------------------------
   -- Unit under test 1
   -----------------------------------------------------------------------------
   UUT1: spwstream
   port map(
      CLK        =>  clk1,
      TXCLK      =>  txclk1,
      ARST_N     =>  rst1_n,
      AUTOSTART  =>  spw_host1_in.auto_start,
      LINKSTART  =>  spw_host1_in.link_start,
      LINKDIS    =>  spw_host1_in.link_dis,
      TXDIVCNT   =>  spw_host1_in.tx_div_cnt,
      TICK_IN    =>  spw_host1_in.tick_in,
      CTRL_IN    =>  spw_host1_in.ctrl_in,
      TIME_IN    =>  spw_host1_in.time_in,
      TXWRITE    =>  spw_host1_in.tx_write,
      TXFLAG     =>  spw_host1_in.tx_flag,
      TXDATA     =>  spw_host1_in.tx_data,
      TXRDY      =>  spw_host1_out.tx_rdy,
      TXHALFF    =>  spw_host1_out.tx_halff,
      TICK_OUT   =>  spw_host1_out.tick_out,
      CTRL_OUT   =>  spw_host1_out.ctrl_out,
      TIME_OUT   =>  spw_host1_out.time_out,
      RXVALID    =>  spw_host1_out.rx_valid,
      RXHALFF    =>  spw_host1_out.rx_halff,
      RXFLAG     =>  spw_host1_out.rx_flag,
      RXDATA     =>  spw_host1_out.rx_data,
      RXREAD     =>  spw_host1_in.rx_read,
      STARTED    =>  spw_host1_out.started,
      CONNECTING =>  spw_host1_out.connecting,
      RUNNING    =>  spw_host1_out.running,
      --
      CNT_RST     => (not rst1_n),
      ERRDISC_CNT => spw_host1_out.err_disc_cnt, 
      ERRPAR_CNT  => spw_host1_out.err_par_cnt,  
      ERRESC_CNT  => spw_host1_out.err_esc_cnt,  
      ERRCRED_CNT => spw_host1_out.err_cred_cnt, 
      EMPTY_CNT   => spw_host1_out.empty_cnt,
      --
      SPW_DI     =>  spw_link1.di,
      SPW_SI     =>  spw_link1.si,
      SPW_DO     =>  spw_link1.do,
      SPW_SO     =>  spw_link1.so
      );
   -- Logic OR of all error signals.
   err_any1 <= (linko_errdisc1 or linko_errpar1 or linko_erresc1 or linko_errcred1);
   -- Misc signals for functional coverage.
   txfifo_full  <= not spw_host1_out.tx_rdy;
   txfifo_empty <= not txfifo_rvalid;

   -----------------------------------------------------------------------------
   -- Unit under test 2
   -----------------------------------------------------------------------------
   UUT2: spwstream
   port map(
      CLK        =>  clk2,
      TXCLK      =>  txclk2,
      ARST_N     =>  rst2_n,
      AUTOSTART  =>  spw_host2_in.auto_start,
      LINKSTART  =>  spw_host2_in.link_start,
      LINKDIS    =>  spw_host2_in.link_dis,
      TXDIVCNT   =>  spw_host2_in.tx_div_cnt,
      TICK_IN    =>  spw_host2_in.tick_in,
      CTRL_IN    =>  spw_host2_in.ctrl_in,
      TIME_IN    =>  spw_host2_in.time_in,
      TXWRITE    =>  spw_host2_in.tx_write,
      TXFLAG     =>  spw_host2_in.tx_flag,
      TXDATA     =>  spw_host2_in.tx_data,
      TXRDY      =>  spw_host2_out.tx_rdy,
      TXHALFF    =>  spw_host2_out.tx_halff,
      TICK_OUT   =>  spw_host2_out.tick_out,
      CTRL_OUT   =>  spw_host2_out.ctrl_out,
      TIME_OUT   =>  spw_host2_out.time_out,
      RXVALID    =>  spw_host2_out.rx_valid,
      RXHALFF    =>  spw_host2_out.rx_halff,
      RXFLAG     =>  spw_host2_out.rx_flag,
      RXDATA     =>  spw_host2_out.rx_data,
      RXREAD     =>  spw_host2_in.rx_read,
      STARTED    =>  spw_host2_out.started,
      CONNECTING =>  spw_host2_out.connecting,
      RUNNING    =>  spw_host2_out.running,
      --
      CNT_RST     => (not rst2_n),
      ERRDISC_CNT => spw_host2_out.err_disc_cnt, 
      ERRPAR_CNT  => spw_host2_out.err_par_cnt,  
      ERRESC_CNT  => spw_host2_out.err_esc_cnt,  
      ERRCRED_CNT => spw_host2_out.err_cred_cnt, 
      EMPTY_CNT   => spw_host2_out.empty_cnt,
      --
      SPW_DI     =>  spw_link2.di,
      SPW_SI     =>  spw_link2.si,
      SPW_DO     =>  spw_link2.do,
      SPW_SO     =>  spw_link2.so
      );
   -- Logic OR of all error signals.
   err_any2 <= (linko_errdisc2 or linko_errpar2 or linko_erresc2 or linko_errcred2);
   -- Misc signals for functional coverage.
   rxfifo_empty <= not spw_host2_out.rx_valid;
   -----------------------------------------------------------------------------
   -- Connecting UUT1 with UUT2
   -----------------------------------------------------------------------------
   -- link from UUT1 to UUT2
   spw_link2.di <= spw_link1.do;
   spw_link2.si <= spw_link1.so;
   -- link from UUT2 to UUT1
   spw_link1.di <= spw_link2.do;
   spw_link1.si <= spw_link2.so;
   -- error signals for functional coverage.
   disc_err  <=  linko_errdisc1 or linko_errdisc2;
   par_err   <=  linko_errpar1  or linko_errpar2;
   esc_err   <=  linko_erresc1  or linko_erresc2;
   cred_err  <=  linko_errcred1 or linko_errcred2;
   error <= bit_mon_errors + char_mon_errors + error_testFlow + error_testflow2dat + error_testflow2tc + error_cover;
   
   -----------------------------------------------------------------------------
   -- Connecting Spw Monitor on UUT1 
   -----------------------------------------------------------------------------
   mon_inputs.spw_name        <= "UUT1";
   mon_inputs.spw_divcnt      <= spw_host1_in.tx_div_cnt;
   mon_inputs.spw_run_state   <= spw_host1_out.running;
   mon_inputs.spw_tx_clk_freq <= TX_CLK_FREQ;
   
   SPW1_MON: SpwMonitor
   port map(
      CONTROL     => control,
      SPW_DI      => spw_link1.do,
      SPW_SI      => spw_link1.so,
      MON_ENABLE  => mon_ena1,
      MON_DATA    => mon_data1,  
      MON_DATA_VLD=> mon_data1_vld, 
      MON_TC      => mon_tc1, 
      MON_TC_VLD  => mon_tc1_vld,
      MON_INPUTS  => mon_inputs,
      MON_OUTPUTS => mon_outputs
      );
   
   bit_mon_errors  <= mon_outputs.spw_bit_errors;
   rate_changed    <= mon_outputs.spw_rate_changed;
   char_mon_errors <= mon_outputs.spw_char_errors;
   char_mon_stats  <= mon_outputs.spw_char_stats;
   -----------------------------------------------------------------------------
   -- Connecting Spw Monitor on UUT2 
   -----------------------------------------------------------------------------
   
   mon_inputs2.spw_name        <= "UUT2";
   mon_inputs2.spw_divcnt      <= spw_host2_in.tx_div_cnt;
   mon_inputs2.spw_run_state   <= spw_host2_out.running;
   mon_inputs2.spw_tx_clk_freq <= TX_CLK_FREQ;
   
   SPW2_MON: SpwMonitor
   port map(
      CONTROL     => control,
      SPW_DI      => spw_link2.do,
      SPW_SI      => spw_link2.so,
      MON_ENABLE  => mon_ena2,
      MON_DATA    => mon_data2,  
      MON_DATA_VLD=> mon_data2_vld, 
      MON_TC      => mon_tc2, 
      MON_TC_VLD  => mon_tc2_vld,
      MON_INPUTS  => mon_inputs2,
      MON_OUTPUTS => mon_outputs2
      );
   
   bit_mon_errors2  <= mon_outputs2.spw_bit_errors;
   rate_changed2    <= mon_outputs2.spw_rate_changed;
   char_mon_errors2 <= mon_outputs2.spw_char_errors;
   char_mon_stats2  <= mon_outputs2.spw_char_stats;
   
   -----------------------------------------------------------------------------
   -- Process executeTC
   --! \brief        test case execution.
   --! \details      The process execute the test case and stop it if the end of
   --!               the run time is reached.
   -----------------------------------------------------------------------------
   executeTC: process
   begin
      WaitForStart( CONTROL_IN );
      ExecuteUntilCond( CONTROL_IN, end_sim, error, 50*UUT1_T_SYSCLK , control, CONTROL_OUT );
      wait for 10 ns; -- wait to execute other process;
   end process executeTC;
   -----------------------------------------------------------------------------
   -- Process clockSys1
   --! \brief        generate the system clock for UUT1.
   --! \details      The process generates the system clock signal defined by
   --!               UUT1_T_SYSCLK generic with random initial offset in the time range
   --!               [0;10*UUT1_T_SYSCLK]
   -----------------------------------------------------------------------------
   clockSys1: process
      variable rv1        : RandomPType;
      variable initdelay1 : time;
   begin
      -- initialize
      clk1 <= '0';
      rv1.InitSeed(rv1'instance_name & integer'image(10*SEED));
      initdelay1 := rv1.RandTime(0 ns, 10*UUT1_T_SYSCLK);
      WaitForStart( CONTROL_IN );
      wait for initdelay1;
      loop
         clk1 <= '0';
         wait for UUT1_T_SYSCLK/2;
         clk1 <= '1';
         wait for UUT1_T_SYSCLK/2;
         StopAtEnd( control );
      end loop;
   end process clockSys1;
   -----------------------------------------------------------------------------
   -- Process clockSys2
   --! \brief        generate the system clock for UUT2.
   --! \details      The process generates the system clock signal defined by
   --!               UUT2_T_SYSCLK generic with random initial offset in the time range
   --!               [0;10*UUT2_T_SYSCLK]
   -----------------------------------------------------------------------------
   clockSys2: process
      variable rv2        : RandomPType;
      variable initdelay2 : time;
   begin
      -- initialize
      clk2 <= '0';
      rv2.InitSeed(rv2'instance_name & integer'image(10*SEED));
      initdelay2 := rv2.RandTime(0 ns, 10*UUT2_T_SYSCLK);
      initdelay2 := rv2.RandTime(0 ns, 10*UUT2_T_SYSCLK);
      WaitForStart( CONTROL_IN );
      wait for initdelay2;
      loop
         clk2 <= '0';
         wait for UUT2_T_SYSCLK/2;
         clk2 <= '1';
         wait for UUT2_T_SYSCLK/2;
         StopAtEnd( control );
      end loop;
   end process clockSys2;
   -----------------------------------------------------------------------------
   -- Process clockTx1
   --! \brief        generate the transmit clock for UUT1.
   --! \details      The process generates the transmit clock signal defined by
   --!               TX_CLK_FREQ generic with random initial offset in the time
   --!               range [0;10*TXCLK_PERIOD]
   -----------------------------------------------------------------------------
   clockTx1: process
      variable rv        : RandomPType;
      variable initdelay : time;
   begin
      -- initialize
      txclk1 <= '0';
      rv.InitSeed(rv'instance_name & integer'image(10*SEED));
      initdelay := rv.RandTime(0 ns, 10*TXCLK_PERIOD);
      WaitForStart( CONTROL_IN );
      wait for initdelay;
      loop
         txclk1 <= '0';
         wait for TXCLK_PERIOD/2;
         txclk1 <= '1';
         wait for TXCLK_PERIOD/2;
         StopAtEnd( control );
      end loop;
   end process clockTx1;
   -----------------------------------------------------------------------------
   -- Process clockTx2
   --! \brief        generate the transmit clock for UUT2.
   --! \details      The process generates the transmit clock signal defined by
   --!               TX_CLK_FREQ generic with random initial offset in the time
   --!               range [0;10*TXCLK_PERIOD]
   -----------------------------------------------------------------------------
   clockTx2: process
      variable rv        : RandomPType;
      variable initdelay : time;
   begin
      -- initialize
      txclk2 <= '0';
      rv.InitSeed(rv'instance_name & integer'image(10*SEED));
      initdelay := rv.RandTime(0 ns, 10*TXCLK_PERIOD);
      initdelay := rv.RandTime(0 ns, 10*TXCLK_PERIOD);
      WaitForStart( CONTROL_IN );
      wait for initdelay;
      loop
         txclk2 <= '0';
         wait for TXCLK_PERIOD/2;
         txclk2 <= '1';
         wait for TXCLK_PERIOD/2;
         StopAtEnd( control );
      end loop;
   end process clockTx2;
   
   -----------------------------------------------------------------------------
   -- Process testFlow1
   --! \brief        Main process for UUT1.
   --! \details      The process handles the execution of UUT1.
   --!
   --  Comments:     Adapted from SpaceWire Light IP from opencores.org
   -----------------------------------------------------------------------------
   testFlow1: process
      variable txdelay     : integer;
      variable rv          : RandomPType;

      variable FC_prev     : integer:= 0;
      variable FC          : integer;
      variable txdata      : std_logic_vector(7 downto 0) := (others => '0');
      variable running_st  : std_logic; --! copy of SPW signal to have the same
                                        --! value in GenRandomData and
                                        --! SendtoTestbenchFIFO processes
      constant ONLY_DATA_CHARS : boolean := TRUE; 
      --------------------------------------------------------------------------
      variable txflag         : integer := 0;  --! flag to decide the txdata (N-char) type.
      constant TXFLAG_PROB_0  : integer := 90; --! 0 for data
      constant TXFLAG_PROB_1  : integer := 10;  --! 1 for control
      --------------------------------------------------------------------------
      variable endofpacketflag: integer := 0;  --! flag to decide the end of
                                               --! packet type. 0 for EOP, 1 for EEP, 2 for wrong EOP/EEP
      constant ENDOFPACKET_PROB_0: integer := 45;  --! 45% prob of EOP
      constant ENDOFPACKET_PROB_1: integer := 45;  --! 45% prob of EEP
      constant ENDOFPACKET_PROB_2: integer := 10;  --! 10% prob of wrong EOP/EEP
      --------------------------------------------------------------------------
      variable datatimecodeflag: integer := 0; --! 0 for N-char, 1 for timecode, 2 for both
      constant DATATIMECODE_PROB_0: integer := 97; --! 97% prob of send data
      constant DATATIMECODE_PROB_1: integer := 2 ; --! 2% prob of send timecode
      constant DATATIMECODE_PROB_2: integer := 1 ; --! 1% prob of send both
      variable ctrlin : std_logic_vector(1 downto 0) := (others => '0');
      variable timein : std_logic_vector(5 downto 0) := (others => '0');
      --------------------------------------------------------------------------
      variable wrongeoptx : std_logic := '0';  -- set flag if a wrong EOP is Tx
      variable wrongeeptx : std_logic := '0';  -- set flag if a wrong EEP is Tx
      --------------------------------------------------------------------------
      variable inputgenstats : generator_stats_type := generator_stats_reset;
--! \cond ProcessProcedure
      --------------------------------------------------------------------------
      -- WriteByteToSPW -> TBWriteByteToSPW
      procedure TBWriteByteToSPW is
      begin
         WriteByteToSPW(clk1, datatimecodeflag, spw_host1_out.running, spw_host1_in.tick_in,
                        spw_host1_in.ctrl_in, spw_host1_in.time_in, ctrlin, timein,
                        spw_host1_in.tx_data, spw_host1_in.tx_flag, spw_host1_out.tx_rdy,
                        spw_host1_in.tx_write,txdata, txflag, HOLD_TIME, UUT1_T_SYSCLK);
      end procedure TBWriteByteToSPW;
      --------------------------------------------------------------------------
      procedure WaitRandomDelay is
      begin
         -- The algorithm below is just used as an example and by no means is the
         -- most efficient in adjusting left and right range for values generation.
         if (cp_tx_full.IsCovered = FALSE or cp_rx_full.IsCovered = FALSE ) then
            --rv.SetRandomParm(FAVORSMALL);
            txdelay := rv.FavorSmall(MIN_TX_DELAY, MAX_TX_DELAY);
         else
            if (cp_tx_empty.IsCovered = FALSE or cp_rx_empty.IsCovered = FALSE) then
               --rv.SetRandomParm(FAVORBIG);
               txdelay := rv.FavorBig(MIN_TX_DELAY, MAX_TX_DELAY);
            else
               if (cp_diff_EOP_tx.IsCovered = FALSE or cp_diff_EEP_tx.IsCovered =FALSE) then
                  --rv.SetRandomParm(FAVORSMALL);
                  txdelay := rv.FavorSmall(MIN_TX_DELAY, MAX_TX_DELAY);
               -- all coverage points evaluated in this function were covered
               else
                  --rv.SetRandomParm(UNIFORM);
                  txdelay := rv.Uniform(MIN_TX_DELAY, MAX_TX_DELAY);
               end if; -- cp_diff_EOP_tx
            end if; -- cp_tx_empty
         end if; -- cp_tx_full
      
         --txdelay := rv.RandInt(MIN_TX_DELAY, MAX_TX_DELAY);
         wait until end_sim = True for txdelay * UUT1_T_SYSCLK;
      end procedure WaitRandomDelay;
      --------------------------------------------------------------------------
      -- Generates the inputs for UUT
      -- TODO: change to a generation of random size packets. including packets ending with EEP
      procedure GenRandomData (only_data_chars : in boolean := FALSE ) is
      begin
         datatimecodeflag := rv.DistValInt(((0,DATATIMECODE_PROB_0),
                                            (1,DATATIMECODE_PROB_1),
                                            (2,DATATIMECODE_PROB_2)));
         if (datatimecodeflag = 0 or datatimecodeflag = 2) then
            txflag := rv.DistValInt(((0,TXFLAG_PROB_0), (1,TXFLAG_PROB_1)));
            if ( only_data_chars = TRUE ) then
               txflag := 0;
            end if;
            if (txflag = 0 ) then
               txdata := rv.RandSlv(0, 255, 8);
               inputgenstats.databytestx := inputgenstats.databytestx + 1;
               inputgenstats.bytestx := inputgenstats.bytestx + 1;
            else
               endofpacketflag := rv.DistValInt(((0,ENDOFPACKET_PROB_0),
                                                 (1,ENDOFPACKET_PROB_1),
                                                 (2,ENDOFPACKET_PROB_2)));
               if (endofpacketflag = 0) then
                  txdata := X"00";
                  inputgenstats.eopstx := inputgenstats.eopstx + 1;
                  inputgenstats.bytestx := inputgenstats.bytestx + 1;
               elsif (endofpacketflag = 1) then
                  txdata := X"01";
                  inputgenstats.eepstx := inputgenstats.eepstx + 1;
                  inputgenstats.bytestx := inputgenstats.bytestx + 1;
               else
                  if wrongeoptx = '0' then
                     txdata     :=  rv.RandSlv(0, 127, 7) & '0';
                     wrongeoptx := '1';
                  else
                     txdata     :=  rv.RandSlv(0, 127, 7) & '1';
                     wrongeeptx := '1';
                  end if; -- wrongeoptx
                  inputgenstats.wrongcontroltx := inputgenstats.wrongcontroltx + 1;
                  inputgenstats.bytestx := inputgenstats.bytestx + 1;
               end if; -- endofpacketflag
            end if; -- txflag
         end if; -- datatimecodeflag
         if (datatimecodeflag = 1 or datatimecodeflag = 2) then
            -- the IP should only send timecodes only when the link is running
            -- when the link is not running, this request should be ignored.
            running_st := spw_host1_out.running;
            ctrlin := rv.RandSlv(0, 3, 2);
            timein := rv.RandSlv(0, 63, 6);
            inputgenstats.timecodestx := inputgenstats.timecodestx + 1;
         end if; -- datatimecodeflag
         input_gen_stats <= inputgenstats;
         diff_eop_tx    <= wrongeoptx;
         diff_eep_tx    <= wrongeeptx;
      end procedure GenRandomData;
      --------------------------------------------------------------------------
      -- send generated data to the receiver FIFO for comparison
      procedure SendtoTestbenchFIFO is
         variable prevchar : std_logic_vector(8 downto 0);
      begin
         if (datatimecodeflag = 0 or datatimecodeflag = 2) then
            if (txflag = 0) then
               tx_chars(data_fifo_wr_ptr) <= '0' & txdata;
               data_fifo_wr_ptr <= data_fifo_wr_ptr + 1; 
            else
               -- verify if last char was EOP or EEP, in this case
               -- discard the char as the receiver (UUT2) will do.
               prevchar := tx_chars(data_fifo_wr_ptr-1);
               if prevchar(8) = '0' then
                  -- when a wrong control code is generated,
                  -- the core should send a EOP(X"00") if the LSB is 0
                  -- or should send a EEP(X"01") if the LSB is 1
                  if (endofpacketflag = 2) then
                     if txdata(0) = '0' then
                        tx_chars(data_fifo_wr_ptr) <= '1' & X"00";
                     else
                        tx_chars(data_fifo_wr_ptr) <= '1' & X"01";
                     end if; -- endofpacketflag
                  else
                     tx_chars(data_fifo_wr_ptr) <= '1' & txdata;
                  end if; -- endofpacketflag
                  data_fifo_wr_ptr <= data_fifo_wr_ptr + 1;  
               end if; -- prevchar        
            end if; -- txflag
            
         end if; -- datatimecodeflag
         if (datatimecodeflag = 1 or datatimecodeflag = 2) then
            if running_st = '1' then
               tx_timecodes(timecode_FIFO_wr_ptr) <= ctrlin & timein;
               timecode_FIFO_wr_ptr <= timecode_FIFO_wr_ptr + 1;
            end if; -- spw_host1_out.running
         end if; -- datatimecodeflag
      end procedure SendtoTestbenchFIFO;
      --------------------------------------------------------------------------
      -- Assert Link disable signal for two clock cycles to work correctly
      procedure AssertLinkDisable is
      begin
         wait until rising_edge(clk1); -- sync with clk1
         wait for HOLD_TIME;
         spw_host1_in.link_dis  <= '1';
         wait until rising_edge(clk1); -- sync with clk1
         wait for HOLD_TIME;
         wait until rising_edge(clk1); -- sync with clk1
         wait for HOLD_TIME;
         spw_host1_in.link_dis  <= '0';
      end procedure AssertLinkDisable;
      --------------------------------------------------------------------------
--! \endcond 
    begin
      testflow1_end <= False;
      --init the seed of random generator
      rv.InitSeed(rv'instance_name & integer'image(10*SEED));
      rst1_n                   <= '0';
      spw_host1_in.link_start  <= '1';
      spw_host1_in.tx_div_cnt  <= TX_CLK_DIV_2MBPS_SLV;
      WaitForStart( CONTROL_IN );
      wait until rising_edge(clk1); -- sync with clk1
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT1: Reset Started.");
      --reset UUT1
      GlobalReset(10*UUT1_T_SYSCLK, MAX_RESET_TIME, rv, rst1_n);
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT1: Reset Ended.");
      wait until rising_edge(clk1); -- sync with clk1
      wait for HOLD_TIME;
      -- enabling output bit and char monitors (after reset UUT always!)
      mon_ena1 <= '1';
      mon_ena2 <= '1';
      -- 
      wait until uut1_link_state = S_run for 40 us;
      if ( uut1_link_state /= S_run ) then
         error_testFlow <= error_testFlow + 1;
         --end_sim <= True;
         wait for 1 ns; -- to update the error signal
         PrintLine(GetExecutedTestCaseName, LS_FAILURE, "testFlow1: Link not running!");
         StopProcess(control);
      end if; -- uut1_link_state
      
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT1: Tx at 2 Mbps.");
      wait for 10 us;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT1: Tx at 100 Mbps.");
      spw_host1_in.tx_div_cnt  <= TX_CLK_DIV_SLV;
      
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT1: Tx and Rx data and timecodes.");

      --------------------------------------------------------------------------
      --Main loop
      
      -- send only 128 bytes, this should fill up the RXFIFO in UUT2 and TXFIFO in UUT1
      while (end_sim = false and (inputgenstats.bytestx < 128)) loop
         -- random delay between sending the next N-char or L-char
         WaitRandomDelay;
         -- random data generation
         GenRandomData(ONLY_DATA_CHARS);
         -- send random data to UUT.
         -- First ensures that the UUT has the data in txfifo. Then send to testbench FIFO
         TBWriteByteToSPW;
         -- Send generated data to testbench FIFO
         SendtoTestbenchFIFO;
      end loop;
      
      if not ( rxfifo_full = '1' and txfifo_full = '1' ) then
         wait until ( rxfifo_full = '1' and txfifo_full = '1' ) for 108 us;
         if not ( rxfifo_full = '1' and txfifo_full = '1' ) then
            error_testFlow <= error_testFlow + 1;
            --end_sim <= True;
            wait for 1 ns; -- to update the error signal
            PrintLine(GetExecutedTestCaseName, LS_FAILURE, "testFlow1: not reached the fifos full state!");
            StopProcess(control);
         end if; -- not rxfifo_full
      end if; -- not rxfifo_full
      
      while (end_sim = false and (inputgenstats.bytestx < TOTAL_BYTES_TX)) loop
         -- random delay between sending the next N-char or L-char
         WaitRandomDelay;
         -- random data generation
         GenRandomData;
         -- send random data to UUT.
         -- First ensures that the UUT has the data in txfifo. Then send to testbench FIFO
         TBWriteByteToSPW;
         -- Send generated data to testbench FIFO
         SendtoTestbenchFIFO;
      end loop;
      
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT1: Testflow1 Ended.");
      testflow1_end <= True;
      -- sync with the reading process before shutdown the link monitors
      if testflow2_end = false then
         wait until testflow2_end = True;
      end if; -- testflow2_end
      mon_ena1 <= '0';
      mon_ena2 <= '0';

      StopProcess(control);
   end process testFlow1;
   -----------------------------------------------------------------------------
   -- Process testFlow2
   --! \brief        Main process for UUT2.
   --! \details      The process handles the reading of data chars of UUT2.
   --!
   --  Comments:     Adapted from SpaceWire Light IP from opencores.org
   -----------------------------------------------------------------------------
   testFlow2: process
      variable rxdelay : integer;
      variable rv : RandomPType ;
      variable validdata : boolean := false;
      variable rdcntr    : integer;
--! \cond ProcessProcedure
      --------------------------------------------------------------------------
      procedure WaitRandomDelay is
      begin
         if (cp_tx_full.IsCovered = FALSE or cp_rx_full.IsCovered = FALSE ) then
            --rv.SetRandomParm(FAVORBIG);
            --rxdelay := rv.FavorBig(MIN_RX_DELAY, MAX_RX_DELAY);
            rxdelay := 2700;
         else
            if (cp_tx_empty.IsCovered = FALSE or cp_rx_empty.IsCovered = FALSE) then
               --rv.SetRandomParm(FAVORSMALL);
               rxdelay := rv.FavorSmall(MIN_RX_DELAY, MAX_RX_DELAY);
            else
               if (cp_diff_EOP_tx.IsCovered = FALSE or cp_diff_EEP_tx.IsCovered =FALSE) then
                  --rv.SetRandomParm(FAVORBIG);
                  rxdelay := rv.FavorBig(MIN_RX_DELAY, MAX_RX_DELAY);
               -- all coverage points evaluated in this function were covered
               else
                  --rv.SetRandomParm(UNIFORM);
                  rxdelay := rv.Uniform(MIN_RX_DELAY, MAX_RX_DELAY);
               end if; -- cp_diff_EOP_tx
            end if; -- cp_tx_empty
         end if; -- cp_tx_full
         --rxdelay := rv.RandInt(MIN_RX_DELAY, MAX_RX_DELAY);
         wait until end_sim = True for rxdelay * UUT2_T_SYSCLK;
         wait for HOLD_TIME;
         
      end procedure WaitRandomDelay;
      --------------------------------------------------------------------------
      impure function checkValidData return boolean is
         variable checkresult : boolean;
      begin
         if spw_host2_out.rx_valid = '1' then
            checkresult := true;
         else
            checkresult := false;
         end if; -- spw_host2_out.rx_valid
         return checkresult;
      end function checkValidData;
      --------------------------------------------------------------------------
      procedure CompareDataValues is
         variable chartmp: std_logic_vector(8 downto 0);
      begin
         -- read from testbench tx_data FIFO
         chartmp := tx_chars(data_fifo_rd_ptr);
         data_fifo_rd_ptr <= data_fifo_rd_ptr + 1;
         -- compare values
         if (spw_host2_out.rx_flag /= chartmp(8)) then
            PrintFailureLine(GetExecutedTestCaseName, spw_host2_out.rx_flag,
                             chartmp(8), "spw_host2_out.rx_flag" );
            error_testflow2dat <= error_testflow2dat + 1;
         end if; -- spw_host2_out.rx_flag
         if (spw_host2_out.rx_data /= chartmp(7 downto 0)) then
            PrintFailureLine(GetExecutedTestCaseName, spw_host2_out.rx_data,
                             chartmp(7 downto 0), "spw_host2_out.rx_data" );
            error_testflow2dat <= error_testflow2dat + 1;
         end if; -- spw_host2_out.rx_data
         if (spw_host2_out.rx_flag = '1') then
            if (spw_host2_out.rx_data /= X"00" and spw_host2_out.rx_data /= X"01") then
               not_N_chars <= not_N_chars + 1;
               error_testflow2dat <= error_testflow2dat + 1;
            end if; -- spw_host2_out.rx_flag
         end if;  -- spw_host2_out.rx_flag
      end procedure CompareDataValues;
      --------------------------------------------------------------------------
      procedure ReadAckToUUT2 is
      begin
         spw_host2_in.rx_read <= '1';
         wait for UUT2_T_SYSCLK;
         spw_host2_in.rx_read <= '0';
      end procedure ReadAckToUUT2;
      --------------------------------------------------------------------------
--! \endcond   
   begin
      testflow2_end <= False;
      --initializing the seed of random generator
      rv.InitSeed(rv'instance_name & integer'image(10*SEED));
      rst2_n                   <= '0';
	   spw_host2_in.auto_start  <= '1';
      --spw_host2_in.link_start  <= '1';
      spw_host2_in.tx_div_cnt  <= TX_CLK_DIV_UUT2_SLV;
      WaitForStart( CONTROL_IN );
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT2: Reset Started.");
      --resetting the UUT2
      GlobalReset(10*UUT2_T_SYSCLK, MAX_RESET_TIME2,rv, rst2_n);
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT2: Reset Ended.");
      --
      wait until uut2_link_state = S_run;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT2: Tx at 2 Mbps.");
      wait for 10 us;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT2: Tx at 100 Mbps.");
      spw_host2_in.tx_div_cnt  <= TX_CLK_DIV_SLV;
      
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT2: Tx and Rx data and timecodes.");
      
      rdcntr := 0;
      
      --Main loop
      readingLoop: while (end_sim = false) loop
                  
         -- for every long delay, make 9 continuous reading to free 9 positions 
         -- in the RXFIFO and an FCT control char is transmitted to UUT1
         -- 30.01.19 JTO: it is 9 positions because the FCT send condition was changed in SpwLink
         -- now is: vstate.rx_credit + 8 < rxroom
         if ( rdcntr = 0 ) then
            WaitRandomDelay;
            rdcntr := rdcntr + 1;
         elsif ( rdcntr = 7 ) then
            wait for UUT2_T_SYSCLK;
            --wait for HOLD_TIME;
            rdcntr := 0;
         else
            wait for UUT2_T_SYSCLK;
            --wait for HOLD_TIME;
            rdcntr := rdcntr + 1;
         end if;
         
         validdata := checkValidData;
         if (validdata = true) then
            -- read data from UUT and compare with tx_chars FIFO
            CompareDataValues;
            -- Read Ack To UUT2
            ReadAckToUUT2;
         end if; -- validdata
         if (uut2_link_start = True) then
            spw_host2_in.link_start  <= '1';
         else
            spw_host2_in.link_start  <= '0';
         end if; -- uut2_link_start
      end loop;
      PrintLine(GetExecutedTestCaseName, LS_LOG, "UUT2: Testflow2 Ended.");
      testflow2_end <= True;
      StopProcess(control);
   end process testFlow2;
   -----------------------------------------------------------------------------
   -- Process testFlow2Timecodes
   --! \brief        Auxiliary process for UUT2.
   --! \details      The process handles the reading of time codes of UUT2.
   --!
   --  Comments:
   -----------------------------------------------------------------------------
   testFlow2Timecodes: process
      variable validtimecode : boolean := false;
--! \cond ProcessProcedure
      impure function checkForValidTimeCode return boolean is
         variable checkresult : boolean;
      begin
         if spw_host2_out.tick_out = '1' then
            checkresult := true;
         else
            checkresult := false;
         end if; -- spw_host2_out.tick_out
         return checkresult;
      end function checkForValidTimeCode;
      procedure CompareTimecodesValues is
         variable timecode_tmp: std_logic_vector(7 downto 0);
      begin
         -- read from testbench tx_timecodes FIFO
         timecode_tmp:= tx_timecodes(timecode_FIFO_rd_ptr);
         timecode_FIFO_rd_ptr <= timecode_FIFO_rd_ptr + 1;
         -- compare values
         if (spw_host2_out.ctrl_out /= timecode_tmp(7 downto 6) ) then
            PrintFailureLine(GetExecutedTestCaseName, spw_host2_out.ctrl_out, timecode_tmp(7 downto 6), "spw_host2_out.ctrl_out" );
            error_testflow2tc <= error_testflow2tc + 1;
         end if; -- spw_host2_out.ctrl_out
         if (spw_host2_out.time_out /= timecode_tmp(5 downto 0) ) then
            PrintFailureLine(GetExecutedTestCaseName, spw_host2_out.time_out, timecode_tmp(5 downto 0), "spw_host2_out.time_out" );
            error_testflow2tc <= error_testflow2tc + 1;
         end if; -- spw_host2_out.time_out
      end procedure CompareTimecodesValues;
--! \endcond 
   begin
      WaitForStart( CONTROL_IN );
      --Main loop
      readingLoop: while (end_sim = false) loop
         wait until rising_edge(clk2); -- sync with clk2
         wait for HOLD_TIME;
         validtimecode := checkForValidTimeCode;
         if (validtimecode = true) then
            -- read timecode from UUT and compare with tx_timecodes FIFO
            CompareTimecodesValues;
         end if; -- validtimecode
      end loop;
      StopProcess(control);
   end process testFlow2Timecodes;
   -----------------------------------------------------------------------------
   -- Process coverageMonitor
   --! \brief        Defines the functional coverage objective.
   --! \details      The process defines the functional coverage of this testcase.
   --!
   --  Comments:     Adapted from OSVVM FIFO example.
   -----------------------------------------------------------------------------
   coverageMonitor: process
      variable errcov        : integer := 0; -- error coverage counter
      variable status_TXnotFull      : bit; -- status tx fifo is not full
      variable status_TXnotEmpty     : bit; -- status tx fifo is not empty
      variable status_RXnotFull      : bit; -- status rx fifo is not full
      variable status_RXnotEmpty     : bit; -- status rx fifo is not empty
      variable illegal_disc_err_int  : integer; -- integer for illegal disconnect error signal
      variable illegal_par_err_int   : integer; -- integer for illegal parity error signal
      variable illegal_esc_err_int   : integer; -- integer for illegal escape error signal
      variable illegal_cred_err_int  : integer; -- integer for illegal credit error signal
      variable last_stats_null_chars : integer; -- last count of tx null chars
      variable status_got_null       : bit;  -- status got_null
      variable last_stats_fct_chars  : integer; -- last count of tx fct chars
      variable status_got_fct        : bit; -- status got_fct
      variable last_stats_eop_chars  : integer; -- last count of tx eop chars
      variable status_got_eop        : bit; -- status got_eop
      variable got_eop               : bit; -- got eop
      variable last_stats_eep_chars  : integer; -- last count of tx eep chars
      variable status_got_eep        : bit; -- status got_eep
      variable got_eep               : bit; -- got eep
      variable last_stats_esc_chars  : integer; -- last count of tx escape chars
      variable status_got_esc        : bit; -- status got_esc
      variable last_stats_data_chars : integer; -- last count of tx data chars
      variable last_stats_timecode_chars : integer; -- last count of tx timecode chars
      variable status_got_timecode       : bit; -- status got_timecode
      variable got_timecode              : bit; -- got timecode
      variable fct_condition_status  : integer; -- fct condition status
      variable rx_credit_int         : integer; -- rx credit in integer type
      variable rx_room_int           : integer; -- rx room in integer type
      --------------------------------------------------------------------------
      variable prevlinkst : link_st_t; -- previous link fsm state
   begin
      --------------------------------------------------------------------------
      -- Creating bins for cover points
      --------------------------------------------------------------------------
      -- Monitored on UUT1: TX FIFO full and TX FIFO empty
      --------------------------------------------------------------------------
      -- Tx FIFO's full. Uses the txrdy signal of spwstream.
      cp_tx_full.SetName("cp_tx_full");
      cp_tx_full.AddBins("TX FIFO full", TX_FULL_GOAL,GenBin(TX_FULL));
      -- Tx FIFO's empty. Uses an internal signal of spwstream. (txfifo_empty)
      cp_tx_empty.SetName("cp_tx_empty");
      cp_tx_empty.AddBins("TX FIFO empty",TX_EMPTY_GOAL,GenBin(TX_EMPTY));
      --------------------------------------------------------------------------
      -- Monitored on UUT2: RX FIFO full and RX FIFO empty
      --------------------------------------------------------------------------
      -- Rx FIFO's full. Uses an internal signal of spwstream. (rxfifo_full)
      cp_rx_full.SetName("cp_rx_full");
      cp_rx_full.AddBins("RX FIFO full",RX_FULL_GOAL,GenBin(RX_FULL));
      -- Rx FIFO's empty. Uses the rxvalid signal of spwstream.
      cp_rx_empty.SetName("cp_rx_empty");
      cp_rx_empty.AddBins("RX FIFO empty",RX_EMPTY_GOAL,GenBin(RX_EMPTY));
      -- Setting the initial status. status are used for proper coverage
      -- event counting towards the goal. For instance,
      -- when FIFO gets full we don't want to increment the full coverage point
      -- again on the next clock cycle. Instead, we want to count the event when
      -- FIFO transitions from not being full to full.
      status_TXnotFull  := '1';
      status_TXnotEmpty := '1';
      status_RXnotFull  := '1';
      status_RXnotEmpty := '1';
      --------------------------------------------------------------------------
      -- Illegal errors are monitored on both UUTs
      --------------------------------------------------------------------------
      cp_illegal_disc.SetName("cp_illegal_disc");
      cp_illegal_disc.AddBins("Disconnect error",IllegalBin(1));
      cp_illegal_disc.SetIllegalMode(ILLEGALMODE);
      cp_illegal_par.SetName("cp_illegal_par");
      cp_illegal_par.AddBins("Parity error",IllegalBin(1));
      cp_illegal_par.SetIllegalMode(ILLEGALMODE);
      cp_illegal_esc.SetName("cp_illegal_esc");
      cp_illegal_esc.AddBins("Escape error",IllegalBin(1));
      cp_illegal_esc.SetIllegalMode(ILLEGALMODE);
      cp_illegal_cred.SetName("cp_illegal_cred");
      cp_illegal_cred.AddBins("Credit error",IllegalBin(1));
      cp_illegal_cred.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- TX of NULLs are monitored on the SPW signals by the charMonitorUUT1.
      -- RX of the first NULL is monitored on UUT2
      --------------------------------------------------------------------------
      -- Rx of the first NULL.
      cp_tx_rx_null_chars.SetName("cp_tx_rx_null_chars");
      cp_tx_rx_null_chars.AddBins("RX first null",RX_NULL_GOAL,GenBin(RX_NULL));
      -- Tx of NULL chars.
      cp_tx_rx_null_chars.AddBins("TX null chars",TX_NULL_GOAL,GenBin(TX_NULL));
      last_stats_null_chars := char_mon_stats.nullchars;
      status_got_null := '0';
      --------------------------------------------------------------------------
      -- TX of FCTs are monitored on the SPW signals by the charMonitorUUT1.
      -- RX of FTCs are monitored on UUT2
      --------------------------------------------------------------------------
      cp_tx_rx_fct_chars.SetName("cp_tx_rx_fct_chars");
      cp_tx_rx_fct_chars.AddBins("RX fct chars",RX_FCT_GOAL,GenBin(RX_FCT));
      cp_tx_rx_fct_chars.AddBins("TX fct chars",TX_FCT_GOAL,GenBin(TX_FCT));
      last_stats_fct_chars := char_mon_stats.fcts;
      status_got_fct := '0';
      --------------------------------------------------------------------------
      -- TX of EOPs are monitored on the SPW signals by the charMonitorUUT1.
      -- RX of EOPs are monitored on UUT2
      --------------------------------------------------------------------------
      cp_tx_rx_eop_chars.SetName("cp_tx_rx_eop_chars");
      cp_tx_rx_eop_chars.AddBins("RX eop chars",RX_EOP_GOAL,GenBin(RX_EOP));
      cp_tx_rx_eop_chars.AddBins("TX eop chars",TX_EOP_GOAL,GenBin(TX_EOP));
      last_stats_eop_chars := char_mon_stats.eops;
      status_got_eop := '0';
      got_eop := '0';
      --------------------------------------------------------------------------
      -- TX of EEPs are monitored on the SPW signals by the charMonitorUUT1.
      -- RX of EEPs are monitored on UUT2
      --------------------------------------------------------------------------
      cp_tx_rx_eep_chars.SetName("cp_tx_rx_eep_chars");
      cp_tx_rx_eep_chars.AddBins("RX eep chars",RX_EEP_GOAL,GenBin(RX_EEP));
      cp_tx_rx_eep_chars.AddBins("TX eep chars",TX_EEP_GOAL,GenBin(TX_EEP));
      last_stats_eep_chars := char_mon_stats.eeps;
      status_got_eep := '0';
      got_eep := '0';
      --------------------------------------------------------------------------
      -- TX of ESCs are monitored on the SPW signals by the charMonitorUUT1.
      -- RX of ESCs are monitored on UUT2
      --------------------------------------------------------------------------
      cp_tx_rx_esc_chars.SetName("cp_tx_rx_esc_chars");
      cp_tx_rx_esc_chars.AddBins("RX esc chars",RX_ESC_GOAL,GenBin(RX_ESC));
      cp_tx_rx_esc_chars.AddBins("TX esc chars",TX_ESC_GOAL,GenBin(TX_ESC));
      last_stats_esc_chars := char_mon_stats.escs;
      status_got_esc := '0';
      --------------------------------------------------------------------------
      -- TX of DATA chars are monitored on the SPW signals by the charMonitorUUT1.
      -- RX of DATA chars are monitored on UUT2
      --------------------------------------------------------------------------
      cp_tx_rx_data.SetName("cp_tx_rx_data");
      cp_tx_rx_data.AddBins("RX data chars",RX_DATA_GOAL,GenBin(RX_DATA));
      cp_tx_rx_data.AddBins("TX data chars",TX_DATA_GOAL,GenBin(TX_DATA));
      last_stats_data_chars := char_mon_stats.datachars;
      --------------------------------------------------------------------------
      -- TX of timecode chars are monitored on the SPW signals by the charMonitorUUT1.
      -- RX of timecode chars are monitored on UUT2
      --------------------------------------------------------------------------
      cp_tx_rx_timecode.SetName("cp_tx_rx_timecode");
      cp_tx_rx_timecode.AddBins("RX timecode chars",RX_TIMECODE_GOAL,GenBin(RX_TIMECODE));
      cp_tx_rx_timecode.AddBins("TX timecode chars",TX_TIMECODE_GOAL,GenBin(TX_TIMECODE));
      cp_tx_rx_timecode.AddBins("Illegal tx timecode", IllegalBin(ILLEGAL_TX_TIMECODE));
      cp_tx_rx_timecode.SetIllegalMode(ILLEGALMODE);
      last_stats_timecode_chars := char_mon_stats.timecodes;
      status_got_timecode := '0';
      got_timecode := '0';
      --------------------------------------------------------------------------
      -- Illegal link characters in the host data interface
      --------------------------------------------------------------------------
      cp_illegal_link_char.SetName("cp_illegal_link_char");
      cp_illegal_link_char.AddBins("Illegal not N-Chars",IllegalBin(1));
      cp_illegal_link_char.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- Different code from EOP (X"00") or EEP (X"01") in the host data interface
      --------------------------------------------------------------------------
      cp_diff_EOP_tx.SetName("cp_diff_EOP_tx");
      cp_diff_EOP_tx.AddBins("Different EOP Tx",DIFF_EOP_TX_GOAL,GenBin(DIFF_EOP));
      cp_diff_EEP_tx.SetName("cp_diff_EEP_tx");
      cp_diff_EEP_tx.AddBins("Different EEP Tx",DIFF_EEP_TX_GOAL,GenBin(DIFF_EEP));
      --------------------------------------------------------------------------
      -- FCT sending condition
      --------------------------------------------------------------------------
      cp_fct_send_condition.SetName("cp_fct_send_condition");
      cp_fct_send_condition.AddBins("FCT condition respected", GenBin(FCT_COND_RESPECTED));
      cp_fct_send_condition.AddBins("Illegal FCT condition",IllegalBin(FCT_COND_VIOLATION));
      cp_fct_send_condition.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- TX and RX at different rates, Init Tx rate, Change of Tx rate
      --------------------------------------------------------------------------
      cp_tx_rx_diff_rates.SetName("cp_tx_rx_diff_rates");
      cp_tx_rx_diff_rates.AddBins("Tx Rx at different rates", DIFF_RATES_GOAL, GenBin(DIFF_RATES_BIN));
      cp_tx_rx_diff_rates.AddBins("Init Tx rate", INIT_TX_RATE_GOAL, GenBin(INIT_TX_RATE_BIN));
      cp_tx_rx_diff_rates.AddBins("Change Tx rate", CHANGE_TX_RATE_GOAL, GenBin(CHANGE_TX_RATE_BIN));
      cp_tx_rx_diff_rates.AddBins("Illegal Init Tx rate", IllegalBin(ILLEGAL_INIT_TX_RATE));
      cp_tx_rx_diff_rates.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_snullreq
      --------------------------------------------------------------------------
      cp_snullreq.SetName("cp_snullreq");
      cp_snullreq.AddBins("Send Null requested", SNULLREQ_GOAL, GenBin(SNULLREQ_BIN) );
      cp_snullreq.AddBins(ALL_ILLEGAL);
      cp_snullreq.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_sfctreq
      --------------------------------------------------------------------------
      cp_sfctreq.SetName("cp_sfctreq");
      cp_sfctreq.AddBins("Send FCT requested", SFCTREQ_GOAL, GenBin(SFCTREQ_BIN) );
      cp_sfctreq.AddBins(ALL_ILLEGAL);
      cp_sfctreq.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_2_min_rate
      --------------------------------------------------------------------------
      cp_2_min_rate.SetName("cp_2_min_rate");
      cp_2_min_rate.AddBins("Running at 2 Mbps", MINRATE_GOAL, GenBin(MINRATE_BIN) );
      cp_2_min_rate.AddBins(ALL_ILLEGAL);
      cp_2_min_rate.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_100_max_rate
      --------------------------------------------------------------------------
      cp_100_max_rate.SetName("cp_100_max_rate");
      cp_100_max_rate.AddBins("Running at 100 Mbps", MAXRATE_GOAL, GenBin(MAXRATE_BIN) );
      cp_100_max_rate.AddBins(ALL_ILLEGAL);
      cp_100_max_rate.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      -- cp_chars_priority_on_tx
      --------------------------------------------------------------------------
      cp_chars_priority_on_tx.SetName("cp_chars_priority_on_tx");
      
      cp_chars_priority_on_tx.AddBins(ALL_ILLEGAL);
      cp_chars_priority_on_tx.SetIllegalMode(ILLEGALMODE);
      --------------------------------------------------------------------------
      WaitForStart( CONTROL_IN );
      prevlinkst := uut1_link_state;
      --collecting coverage
      MainCovLoop: while not (cp_tx_full.IsCovered and
                              cp_tx_empty.IsCovered and 
                              cp_rx_empty.IsCovered and 
                              cp_rx_full.IsCovered and 
                              cp_tx_rx_null_chars.IsCovered and 
                              cp_tx_rx_fct_chars.IsCovered and 
                              cp_tx_rx_eop_chars.IsCovered and 
                              cp_tx_rx_eep_chars.IsCovered and 
                              cp_tx_rx_esc_chars.IsCovered and 
                              cp_tx_rx_data.IsCovered and 
                              cp_tx_rx_timecode.IsCovered and 
                              cp_diff_EOP_tx.IsCovered and 
                              cp_diff_EEP_tx.IsCovered and 
                              cp_fct_send_condition.IsCovered and 
                              cp_tx_rx_diff_rates.IsCovered and 
                              cp_snullreq.IsCovered and
                              cp_sfctreq.IsCovered and
                              cp_2_min_rate.IsCovered and
                              cp_100_max_rate.IsCovered
                              ) loop
         wait until falling_edge(clk1) or falling_edge(clk2);
         -----------------------------------------------------------------------
         -- check if cp_tx_full is covered
         -----------------------------------------------------------------------
         if txfifo_full = '0' then
            status_TXnotFull := '1';
         end if; -- txfifo_full
         if (not cp_tx_full.IsCovered) and (status_TXnotFull = '1') then
            cp_tx_full.ICover(to_integer(txfifo_full));
            if txfifo_full = '1' then
               status_TXnotFull := '0';
            end if; -- txfifo_full
         end if; -- cp_tx_full
         -----------------------------------------------------------------------
         -- check if cp_tx_empty is covered
         -----------------------------------------------------------------------
         if txfifo_empty = '0' then
            status_TXnotEmpty := '1';
         end if; -- txfifo_empty
         if (not cp_tx_empty.IsCovered) and (status_TXnotEmpty = '1') then
            cp_tx_empty.ICover(to_integer(txfifo_empty));
            if txfifo_empty = '1' then
               status_TXnotEmpty := '0';
            end if; -- txfifo_empty
         end if; -- cp_tx_empty
         -----------------------------------------------------------------------
         -- check if cp_rx_full is covered
         -----------------------------------------------------------------------
         if rxfifo_full = '0' then
            status_RXnotFull := '1';
         end if; -- rxfifo_full
         if (not cp_rx_full.IsCovered) and (status_RXnotFull = '1') then
            cp_rx_full.ICover(to_integer(rxfifo_full));
            if rxfifo_full = '1' then
               status_RXnotFull := '0';
            end if; -- rxfifo_full
         end if; -- cp_rx_full
         -----------------------------------------------------------------------
         --check if cp_rx_empty is covered
         -----------------------------------------------------------------------
         if rxfifo_empty = '0' then
            status_RXnotEmpty := '1';
         end if; -- rxfifo_empty
         if (not cp_rx_empty.IsCovered) and (status_RXnotEmpty = '1') then
            cp_rx_empty.ICover(to_integer(rxfifo_empty));
            if rxfifo_empty = '1' then
               status_RXnotEmpty := '0';
            end if; -- rxfifo_empty
         end if; -- cp_rx_empty
         -----------------------------------------------------------------------
         -- check if illegal errors (disconnect, parity, escape and credit) happened
         -----------------------------------------------------------------------
         illegal_disc_err_int := to_integer(disc_err );
         illegal_par_err_int  := to_integer(par_err  );
         illegal_esc_err_int  := to_integer(esc_err  );
         illegal_cred_err_int := to_integer(cred_err );
         cp_illegal_disc.ICover(illegal_disc_err_int);
         cp_illegal_par.ICover(illegal_par_err_int);
         cp_illegal_esc.ICover(illegal_esc_err_int);
         cp_illegal_cred.ICover(illegal_cred_err_int);
         errcov := errcov + illegal_disc_err_int + illegal_par_err_int
                          + illegal_esc_err_int + illegal_cred_err_int;
         -----------------------------------------------------------------------
         -- check if cp_tx_rx_null_chars is covered
         -----------------------------------------------------------------------
         if cp_tx_rx_null_chars.IsCovered = FALSE then
            if (status_got_null = '0') and (got_null = '1') then
               status_got_null := '1';
               cp_tx_rx_null_chars.ICover(RX_NULL);
            end if; -- status_got_null
            if (char_mon_stats.nullchars = last_stats_null_chars + 1) then
               cp_tx_rx_null_chars.ICover(TX_NULL);
               last_stats_null_chars := char_mon_stats.nullchars;
            end if; -- char_mon_stats.nullchars
         end if; -- cp_tx_rx_null_chars
         -----------------------------------------------------------------------
         -- check if cp_tx_rx_fct_chars is covered
         -----------------------------------------------------------------------
         if got_fct = '0' then
            status_got_fct := '0';
         end if; -- got_fct
         if cp_tx_rx_fct_chars.IsCovered = FALSE then
            if (status_got_fct = '0') and (got_fct = '1') then
               cp_tx_rx_fct_chars.ICover(RX_FCT);
               status_got_fct := '1';
            end if; -- status_got_fct
            if (char_mon_stats.fcts = last_stats_fct_chars + 1) then
               cp_tx_rx_fct_chars.ICover(TX_FCT);
               last_stats_fct_chars := char_mon_stats.fcts;
            end if; -- char_mon_stats.fcts
         end if; -- cp_tx_rx_fct_chars
         -----------------------------------------------------------------------
         -- check if cp_tx_rx_eop_chars is covered
         -----------------------------------------------------------------------
         if (spw_host2_out.rx_valid = '1') and (spw_host2_out.rx_data = X"00") and (spw_host2_out.rx_flag = '1') then
            got_eop := '1';
         else
            got_eop := '0';
         end if; -- spw_host2_out.rx_valid
         if got_eop = '0' then
            status_got_eop := '0';
         end if; -- got_eop
         if cp_tx_rx_eop_chars.IsCovered = FALSE then
            if (status_got_eop = '0') and (got_eop = '1') then
               status_got_eop := '1';
               cp_tx_rx_eop_chars.ICover(RX_EOP);
            end if; -- status_got_eop
            if (char_mon_stats.eops = last_stats_eop_chars + 1) then
               cp_tx_rx_eop_chars.ICover(TX_EOP);
               last_stats_eop_chars := char_mon_stats.eops;
            end if; -- char_mon_stats.eops
         end if; -- cp_tx_rx_eop_chars
         -----------------------------------------------------------------------
         -- check if cp_tx_rx_eep_chars is covered
         -----------------------------------------------------------------------
         if (spw_host2_out.rx_valid = '1') and (spw_host2_out.rx_data = X"01") and (spw_host2_out.rx_flag = '1') then
            got_eep := '1';
         else
            got_eep := '0';
         end if; -- spw_host2_out.rx_valid
         if got_eep = '0' then
            status_got_eep := '0';
         end if; -- got_eep
         if cp_tx_rx_eep_chars.IsCovered = FALSE then
            if (status_got_eep = '0') and (got_eep = '1') then
               status_got_eep := '1';
               cp_tx_rx_eep_chars.ICover(RX_EEP);
            end if; -- status_got_eep
            if (char_mon_stats.eeps = last_stats_eep_chars + 1) then
               cp_tx_rx_eep_chars.ICover(TX_EEP);
               last_stats_eep_chars := char_mon_stats.eeps;
            end if; -- char_mon_stats.eeps
         end if; -- cp_tx_rx_eep_chars
         -----------------------------------------------------------------------
         -- check if cp_tx_rx_esc_chars is covered
         -----------------------------------------------------------------------
         if got_esc = '0' then
            status_got_esc := '0';
         end if; -- got_esc
         if cp_tx_rx_esc_chars.IsCovered = FALSE then
            if  (status_got_esc = '0') and (got_esc = '1') then
               cp_tx_rx_esc_chars.ICover(RX_ESC);
               status_got_esc := '1';
            end if; -- status_got_esc
            if (char_mon_stats.escs = last_stats_esc_chars + 1) then
               cp_tx_rx_esc_chars.ICover(TX_ESC);
               last_stats_esc_chars := char_mon_stats.escs;
            end if; -- char_mon_stats.escs
         end if; -- cp_tx_rx_esc_chars
         -----------------------------------------------------------------------
         -- check if cp_tx_rx_data is covered
         -----------------------------------------------------------------------
         if cp_tx_rx_data.IsCovered = FALSE then
            -- check RX data: rx_read is asserted to ACK each N-char received. rx_flag indicates if its a data byte
            if (spw_host2_in.rx_read = '1') and (spw_host2_out.rx_flag = '0') then
               cp_tx_rx_data.ICover(RX_DATA);
            end if; -- status_got_data
            -- check TX data
            if (char_mon_stats.datachars = last_stats_data_chars + 1) then
               cp_tx_rx_data.ICover(TX_DATA);
               last_stats_data_chars := char_mon_stats.datachars;
            end if; -- char_mon_stats.datachars
         end if; -- cp_tx_rx_data
         -----------------------------------------------------------------------
         -- check if cp_tx_rx_timecode is covered
         -----------------------------------------------------------------------
         if spw_host2_out.tick_out = '1' then
            got_timecode := '1';
         else
            got_timecode := '0';
         end if; -- spw_host2_out.tick_out
         if got_timecode = '0' then
            status_got_timecode := '0';
         end if; -- got_timecode
         if cp_tx_rx_timecode.IsCovered = FALSE then
            -- check RX timecode
            if (status_got_timecode = '0') and (got_timecode = '1') then
               status_got_timecode := '1';
               cp_tx_rx_timecode.ICover(RX_TIMECODE);
            end if; -- status_got_timecode
            -- check TX timecode
            if (char_mon_stats.timecodes = last_stats_timecode_chars + 1) then
               cp_tx_rx_timecode.ICover(TX_TIMECODE);
               last_stats_timecode_chars := char_mon_stats.timecodes;
            end if; -- char_mon_stats.timecodes
            if ((char_mon_stats.timecodes = last_stats_timecode_chars + 1) and uut1_link_state /= S_Run) then
               cp_tx_rx_timecode.ICover(ILLEGAL_TX_TIMECODE);
            end if; -- char_mon_stats.timecodes
         end if; -- cp_tx_rx_timecode
         -----------------------------------------------------------------------
         -- check for illegal Link chars (cp_illegal_link_char)
         -----------------------------------------------------------------------
         cp_illegal_link_char.ICover(not_N_chars);
         errcov := errcov + not_N_chars;
         -----------------------------------------------------------------------
         -- check for different EOPs or EEPs Tx (cp_diff_EOP_tx, cp_diff_EEP_tx)
         -----------------------------------------------------------------------
         if not (cp_diff_EOP_tx.IsCovered) then
            if diff_eop_tx = '1' then
               cp_diff_EOP_tx.ICover(to_integer(diff_eop_tx));
            end if; -- diff_eop_tx
         end if; -- not (cp_diff_EOP_tx.IsCovered)
         if not (cp_diff_EEP_tx.IsCovered) then
            if diff_eep_tx = '1' then
               cp_diff_EEP_tx.ICover(to_integer(diff_eep_tx));
            end if; -- diff_eep_tx
         end if; -- not (cp_diff_EEP_tx.IsCovered)
         -----------------------------------------------------------------------
         -- check for illegal FCT condition (cp_fct_send_condition)
         -----------------------------------------------------------------------
         if (xmit_fct_in = '1') then
            rx_credit_int := to_integer(rx_credit);
            rx_room_int   := to_integer(unsigned(rx_room));
            --NOTE: the condition should be rx_credit+8<=rx_room but it is possible that in the 
            --clock cycle rx_room is decremented by 1. So, the condition is changed to rx_credit+7<=rx_room
            if ( rx_credit_int + 7 <= rx_room_int ) then
               fct_condition_status := FCT_COND_RESPECTED;
            else
               fct_condition_status := FCT_COND_VIOLATION;
               errcov := errcov + 1;
            end if; -- rx_credit_int
            cp_fct_send_condition.ICover(fct_condition_status);
         end if; -- xmit_fct_in
         -----------------------------------------------------------------------
         --check for TX and RX at different rates (cp_tx_rx_diff_rates). Eval at UUT1.
         -----------------------------------------------------------------------
         if (uut1_link_state = S_Run and uut2_link_state = S_Run ) then 
            if (mon_outputs.spw_bit_period /= mon_outputs2.spw_bit_period) then
               cp_tx_rx_diff_rates.ICover(DIFF_RATES_BIN);
            end if; -- mon_outputs.spw_bit_period
         end if; -- uut1_link_state
         if (rate_changed = '1') then
            if (uut1_link_state = S_Run) then
               cp_tx_rx_diff_rates.ICover(CHANGE_TX_RATE_BIN);
            else
               cp_tx_rx_diff_rates.ICover(ILLEGAL_INIT_TX_RATE);
               errcov := errcov + 1;
            end if; -- uut1_link_state
         end if; -- rate_changed
         if spw_host1_out.running = '0' then
            if bit_mon_errors = 0  then
               cp_tx_rx_diff_rates.ICover(INIT_TX_RATE_BIN);
            else
               cp_tx_rx_diff_rates.ICover(ILLEGAL_INIT_TX_RATE);
               errcov := errcov + 1;
            end if; -- bit_mon_errors
         end if; -- spw_host1_out.running
         -----------------------------------------------------------------------
         -- check if cp_snullreq is covered
         -----------------------------------------------------------------------
         if uut1_link_state = S_Started and prevlinkst = S_Ready then
            if stnull_req = '1' then
               cp_snullreq.ICover(SNULLREQ_BIN);
            else
               cp_snullreq.ICover(ISNULLREQ_BIN);
               errcov := errcov + 1;
            end if; -- stnull_req
         end if; -- link_state
         -----------------------------------------------------------------------
         -- check if cp_sfctreq is covered
         -----------------------------------------------------------------------
         if uut1_link_state = S_Connecting and prevlinkst = S_Started then
            if stfct_req = '1' then
               cp_sfctreq.ICover(SFCTREQ_BIN);
            else
               cp_sfctreq.ICover(ISFCTREQ_BIN);
               errcov := errcov + 1;
            end if; -- stfct_req
         end if; -- link_state
         -----------------------------------------------------------------------
         -- check if cp_2_min_rate is covered
         -----------------------------------------------------------------------
         if not (cp_2_min_rate.IsCovered) then
            if (uut1_link_state = S_Run and uut2_link_state = S_Run ) then
               if mon_outputs.spw_bit_period = 500 ns and mon_outputs2.spw_bit_period = 500 ns then
                  cp_2_min_rate.ICover(MINRATE_BIN);
               end if; -- mon_outputs.spw_bit_period
            end if; -- uut1_link_state
         end if; -- not (cp_2_min_rate.IsCovered)
         
         -----------------------------------------------------------------------
         -- check if cp_100_max_rate is covered
         -----------------------------------------------------------------------
         if not (cp_100_max_rate.IsCovered) then
            if (uut1_link_state = S_Run and uut2_link_state = S_Run ) then
               if mon_outputs.spw_bit_period = 10 ns and mon_outputs2.spw_bit_period = 10 ns then
                  cp_100_max_rate.ICover(MAXRATE_BIN);
               end if; -- mon_outputs.spw_bit_period
            end if; -- mon_outputs.spw_bit_period
         end if; -- not (cp_100_max_rate.IsCovered)
         
         -----------------------------------------------------------------------
         -- check if cp_chars_priority_on_tx is covered
         -----------------------------------------------------------------------
         
         
         -----------------------------------------------------------------------
         prevlinkst := uut1_link_state;
         -----------------------------------------------------------------------
         --Check for TimeOut and force exit when now is greater than TimeOut value
         exit MainCovLoop when NOW > (CONTROL_IN.runtime - 1 us);
      end loop;
      --Final reporting
      PrintResultHeader( GetExecutedTestCaseName, "Functional Coverage" );
      if NOW >= (CONTROL_IN.runtime - 1 us) then
         errcov := errcov + 1;
         PrintResultLine( "FC: TIME OUT. Functional Coverage failed!");
         PrintResultLine( "FC: More details on the coverage report." );
         if not (cp_tx_full.IsCovered)  then
            errcov := errcov + 1;
            cp_tx_full.WriteCovHoles;
         end if; -- cp_tx_full
         if not (cp_tx_empty.IsCovered) then
            errcov := errcov + 1;
            cp_tx_empty.WriteCovHoles;
         end if; -- cp_tx_empty
         if not (cp_rx_full.IsCovered)  then
            errcov := errcov + 1;
            cp_rx_full.WriteCovHoles;
         end if; -- cp_rx_full
         if not (cp_rx_empty.IsCovered) then
            errcov := errcov + 1;
            cp_rx_empty.WriteCovHoles;
         end if; -- cp_rx_empty
         if not (cp_tx_rx_null_chars.IsCovered) then
            errcov := errcov + 1;
            cp_tx_rx_null_chars.WriteCovHoles;
         end if; -- cp_tx_rx_null_chars
         if not (cp_tx_rx_fct_chars.IsCovered) then
            errcov := errcov + 1;
            cp_tx_rx_fct_chars.WriteCovHoles;
         end if; -- cp_tx_rx_fct_chars
         if not (cp_tx_rx_eop_chars.IsCovered) then
            errcov := errcov + 1;
            cp_tx_rx_eop_chars.WriteCovHoles;
         end if; -- cp_tx_rx_eop_chars
         if not (cp_tx_rx_eep_chars.IsCovered) then
            errcov := errcov + 1;
            cp_tx_rx_eep_chars.WriteCovHoles;
         end if; -- cp_tx_rx_eep_chars
         if not (cp_tx_rx_esc_chars.IsCovered) then
            errcov := errcov + 1;
            cp_tx_rx_esc_chars.WriteCovHoles;
         end if; -- cp_tx_rx_esc_chars
         if not (cp_tx_rx_data.IsCovered) then
            errcov := errcov + 1;
            cp_tx_rx_data.WriteCovHoles;
         end if; -- cp_tx_rx_data
         if not (cp_tx_rx_timecode.IsCovered) then
            errcov := errcov + 1;
            cp_tx_rx_timecode.WriteCovHoles;
         end if; -- cp_tx_rx_timecode
         if not (cp_diff_EOP_tx.IsCovered) then
            errcov := errcov + 1;
            cp_diff_EOP_tx.WriteCovHoles;
         end if; -- cp_diff_EOP_tx
         if not (cp_diff_EEP_tx.IsCovered) then
            errcov := errcov + 1;
            cp_diff_EEP_tx.WriteCovHoles;
         end if; -- cp_diff_EEP_tx
         if not (cp_fct_send_condition.IsCovered) then
            errcov := errcov + 1;
            cp_fct_send_condition.WriteCovHoles;
         end if; -- cp_fct_send_condition
         if not (cp_tx_rx_diff_rates.IsCovered) then
            errcov := errcov + 1;
            cp_tx_rx_diff_rates.WriteCovHoles;
         end if; -- cp_tx_rx_diff_rates
         if not cp_snullreq.IsCovered then
            errcov := errcov + 1;
            cp_snullreq.WriteCovHoles;
         end if; -- cp_snullreq
         if not cp_sfctreq.IsCovered then
            errcov := errcov + 1;
            cp_sfctreq.WriteCovHoles;
         end if; -- cp_sfctreq
         if not cp_2_min_rate.IsCovered then
            errcov := errcov + 1;
            cp_2_min_rate.WriteCovHoles;
         end if; -- cp_2_min_rate
         if not cp_100_max_rate.IsCovered then
            errcov := errcov + 1;
            cp_100_max_rate.WriteCovHoles;
         end if; -- cp_100_max_rate
      else
         PrintResultLine( "FC: SUCCESS! The functional coverage goal was achieved." );
         PrintResultLine( "FC: 25 coverage points checked." );
         PrintResultLine( "FC: More details on the coverage report." );
      end if; --NOW	
	  
      -- The illegal bins errors are accumulated during coverage collection
      error_cover <= errcov;
      -- End the simulation by suspending all the processes.
      -- After assert end_sim, the error signal has a time defined
      -- in the executeTC process to update the final value.
      wait for 10 us;
      end_sim <= true;
      --let the simulation run for a little longer before stopping it
      wait for 40*UUT1_T_SYSCLK;
      if ( testflow1_end = False ) then
         PrintLine(GetExecutedTestCaseName, LS_LOG, "testFlow1: WARNING: The process have not ended.");
      end if; -- testflow1_end
      if ( testflow2_end = False ) then
         PrintLine(GetExecutedTestCaseName, LS_LOG, "testFlow2: WARNING: The process have not ended.");
      end if; -- testflow2_end
      -- print input generation stats
      PrintInputGeneratorStatsAtEnd(GetExecutedTestCaseName, "Input gen stats: ", input_gen_stats);
      -- print monitor stats
      PrintMonitorStatsAtEnd(GetExecutedTestCaseName, "Char mon stats: ", char_mon_errors, char_mon_stats);
      StopProcess(control);
   end process coverageMonitor;
end architecture TC7NormalOp_beh;
--------------------------------------------------------------------------------
-- end TC7NormalOp.vhd
--------------------------------------------------------------------------------