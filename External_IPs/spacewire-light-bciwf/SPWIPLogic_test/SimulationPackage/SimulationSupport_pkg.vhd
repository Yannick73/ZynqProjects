--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SimulationSupport_pkg.vhd
--!
--! \brief        Package with different data type, functions and procedures
--!               to support the unit and integration tests.
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 25.10.2016
--! \date         Updated: 16.12.2016
--! \version      V 1.00
--
-- Package      : Simulation support functions (declaration, body)
-- File version : $Revision: 139 $
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
--! VHUNIT Assert package
use VHUNIT.Assert_pkg.all;

--! OSVVM library
library OSVVM;
--! OSVVM Random Base package
use OSVVM.RandomBasePkg.all;
--! OSVVM Random package
use OSVVM.RandomPkg.all;
--! OSVVM Coverage package
use OSVVM.CoveragePkg.all;
--------------------------------------------------------------------------------
-- Package SimulationSupport_pkg
--! \brief        SimulationSupport_pkg - Simulation support functions
--! \details      Implements functions and procedures to support the unit and
--!               integration tests for the SpaceWire IP.
--!
--! - Procedures
--! \li \ref      GlobalReset    - Generates a random duration reset signal.
--! \li \ref      WriteByteToSPW - Writes one data byte or EOP or EEP in the tx queue.
--! \li \ref      PrintMonitorStatsAtEnd - Print on the selected logs the
--!                                        output monitor stats.
--! \li \ref      PrintInputGeneratorStatsAtEnd - Print on the selected logs the
--!                                               input generator stats.
--! \li \ref      WaitForCLKCycle - wait for a defined number of clock cycles.
-- Comments     :
-- Updates      :
--------------------------------------------------------------------------------
package SimulationSupport_pkg is

   -----------------------------------------------------------------------------
   -- Type spw_char_type
   --! \brief        Type definition for the possible characters in a SPW link.
   --! \details      The type contains the possible characters in a SPW link.
   -----------------------------------------------------------------------------
   type spw_char_type is (BLANK, FCT, ESC, EEP, EOP, DATA_char, NULL_char,
                          TIMECODE, ESCAPE_ERROR, CONTROL_CODE_ERROR);
   -----------------------------------------------------------------------------
   -- Type monitor_stats
   --! \brief        Record for the output monitor statistics.
   --! \details      The type contains the statistics of the output monitor.
   -----------------------------------------------------------------------------
   type monitor_stats_type is record
      fcts           : integer;
      escs           : integer;
      datachars      : integer;
      eops           : integer;
      eeps           : integer;
      timecodes      : integer;
      nullchars      : integer;
      escerrors      : integer;
      ctrlcodeerrors : integer;
   end record monitor_stats_type;
   constant MONITOR_STATS_RESET: monitor_stats_type := (
      fcts           => 0,
      escs           => 0,
      datachars      => 0,
      eops           => 0,
      eeps           => 0,
      timecodes      => 0,
      nullchars      => 0,
      escerrors      => 0,
      ctrlcodeerrors => 0
   );
   -----------------------------------------------------------------------------
   -- Type generator_stats
   --! \brief        Record for the data generator statistics in TC2SPW.
   --! \details      The type contains the statistics of the data generator
   --!               TC2SPW.
   -----------------------------------------------------------------------------
   type generator_stats_type is record
      bytestx          : integer;
      databytestx      : integer;
      eopstx           : integer;
      eepstx           : integer;
      wrongcontroltx   : integer;
      timecodestx      : integer;
   end record generator_stats_type;
   constant GENERATOR_STATS_RESET: generator_stats_type := (
      bytestx        => 0,
      databytestx    => 0,
      eopstx         => 0,
      eepstx         => 0,
      wrongcontroltx => 0,
      timecodestx    => 0
   );
   
   -----------------------------------------------------------------------------
   -- Type monitor_inputs_type
   --! \brief        Record for the monitor configuration and necessary inputs.
   --! \details      The type contains the monitor configuration parameters.
   -----------------------------------------------------------------------------
   type monitor_inputs_type is record
      spw_name         : string(1 to 4);
      spw_divcnt       : std_logic_vector(7 downto 0);
      spw_run_state    : std_logic;
      spw_tx_clk_freq  : real;
   end record;
   -----------------------------------------------------------------------------
   -- Type monitor_outputs_type
   --! \brief        Record for the monitor outputs.
   --! \details      The type contains the monitor outputs.
   -----------------------------------------------------------------------------
   type monitor_outputs_type is record
      spw_bit_errors      : integer;
      spw_rate_changed    : std_logic;
      spw_sim_ds_switch   : std_logic;
      spw_s_first_trans   : std_logic;
      spw_d_first_trans   : std_logic;
      spw_bit_period      : time;
      spw_char_errors     : integer;
      spw_char_stats      : monitor_stats_type;
   end record;
   constant MONITOR_OUTPUTS_RESET : monitor_outputs_type := (
      spw_bit_errors    => 0,
      spw_rate_changed  => '0',
      spw_sim_ds_switch => '0',
      spw_s_first_trans => '0',
      spw_d_first_trans => '0',
      spw_bit_period    => 0 ns,
      spw_char_errors   => 0,
      spw_char_stats    => MONITOR_STATS_RESET
   );
   -----------------------------------------------------------------------------
   -- Type bfm_inputs_type
   --! \brief        Record for the BFM configuration and necessary inputs.
   --! \details      The type contains the BFM configuration parameters.
   -----------------------------------------------------------------------------
   type bfm_inputs_type is record
      spw_name             : string(1 to 4);
      seed                 : integer;
      spw_output_bit_period: time;      -- to set the output bit period of BFM
      packet_length        : natural;
      fixed_packet_length  : boolean;
      spw_divcnt           : std_logic_vector(7 downto 0); -- to set the input bit period of BFM
      spw_tx_clk_freq      : real;                         -- to set the input bit period of BFM
      spw_autostart        : std_logic;
      spw_linkstart        : std_logic;
   end record;
   -----------------------------------------------------------------------------
   -- Type bfm_status_type
   --! \brief        Record for the BFM status values.
   --! \details      The type contains the BFM status values.
   -----------------------------------------------------------------------------
   type bfm_status_type is record
      started     : std_logic;
      connecting  : std_logic;
      running     : std_logic;
      err_disc    : std_logic;
      err_par     : std_logic;
      err_esc     : std_logic;
      err_cred    : std_logic;
   end record;
   constant BFM_STATUS_RESET : bfm_status_type := (
      started    => '0',
      connecting => '0',
      running    => '0',
      err_disc   => '0',
      err_par    => '0',
      err_esc    => '0',
      err_cred   => '0'
   );
   -----------------------------------------------------------------------------
   -- Type bfm_outputs_type
   --! \brief        Record for the BFM outputs.
   --! \details      The type contains the BFM outputs.
   -----------------------------------------------------------------------------
   type bfm_outputs_type is record
      spw_status                 : bfm_status_type;
      -- Monitor outputs
      spw_detected_bit_period  : time;
      spw_bit_errors           : integer;
      spw_rate_changed         : std_logic;
      spw_bit_period           : time;
      spw_char_errors          : integer;
      spw_char_stats           : monitor_stats_type;
   end record;
   constant BFM_OUTPUTS_RESET : bfm_outputs_type := (
      spw_status              => BFM_STATUS_RESET,
      -- Monitor outputs
      spw_detected_bit_period => 0 ns,
      spw_bit_errors    => 0,
      spw_rate_changed  => '0',
      spw_bit_period    => 0 ns,
      spw_char_errors   => 0,
      spw_char_stats    => MONITOR_STATS_RESET
   );

   -----------------------------------------------------------------------------
   -- Type spw_host_interface_in
   --! \brief        Record for the SPW host interface input ports.
   --! \details      The type contains the input signals of the host interface.
   -----------------------------------------------------------------------------
   type spw_host_interface_in is record
      auto_start : std_logic;  --! Enables automatic link start on receipt of
                               --! a NULL character.
      link_start : std_logic;  --! Enables link start once the Ready state is
                               --! reached.
      link_dis   : std_logic;  --! Do not start link (overrides linkstart and
                               --! autostart) and/or disconnect a running link.
      tx_div_cnt : std_logic_vector(7 downto 0); --! Scaling factor minus 1, used to scale
                                                 --! the tx base clock into the tx bit rate.
      tick_in    : std_logic;  --! High for one clock cycle to request tx of a TimeCode.
      ctrl_in    : std_logic_vector(1 downto 0); --! Control bits of the TimeCode
                                                 --! to be sent.
      time_in    : std_logic_vector(5 downto 0); --! Counter value of the TimeCode
                                                 --! to be sent.
      tx_write   : std_logic;  --! Pulled high by the application to write an N-Char
                               --! to the transmit queue.
      tx_flag    : std_logic;  --! High if the tx char is EOP or EEP;
                               --! low if the tx char is a data byte.
      tx_data    : std_logic_vector(7 downto 0); --! Byte to be sent, or 0x00 (EOP)
                                                 --! or 0x01 (EEP)
      rx_read    : std_logic; --! Pulled high by the application to accept
                              --! a received character.
   end record spw_host_interface_in;
   -----------------------------------------------------------------------------
   -- Type spw_host_interface_out
   --! \brief        Record for the SPW host interface output ports.
   --! \details      The type contains the output signals of the host interface.
   -----------------------------------------------------------------------------
   type spw_host_interface_out is record
      tx_rdy      : std_logic;  --! High if the entity is ready to accept an N-Char for tx.
      tx_halff    : std_logic;  --! High if the tx queue is at least half full.
      tick_out    : std_logic;  --! High for one clock cycle if a TimeCode was just received.
      ctrl_out    : std_logic_vector(1 downto 0); --! Control bits of the last
                                                  --! received TimeCode.
      time_out    : std_logic_vector(5 downto 0); --! Counter value of the last
                                                  --! received TimeCode.
      rx_valid    : std_logic;  --! High if "rxflag" and "rxdata" contain valid data.
      rx_halff    : std_logic;  --! High if the receive FIFO is at least half full.
      rx_flag     : std_logic;  --! High if the rx char is EOP or EEP;
                                --! low if the rx char is a data byte.
      rx_data     : std_logic_vector(7 downto 0); --! Received byte, or 0x00 (EOP)
                                                  --! or 0x01 (EEP)
      started     : std_logic; --! High if the link FSM = 'Started'
      connecting  : std_logic; --! High if the link FSM = 'Connecting'
      running     : std_logic; --! High if the link FSM = 'Run'
      err_disc_cnt : std_logic_vector(7 downto 0); --! Disconnect error counter
      err_par_cnt  : std_logic_vector(7 downto 0); --! Parity error counter
      err_esc_cnt  : std_logic_vector(7 downto 0); --! Escape error counter
      err_cred_cnt : std_logic_vector(7 downto 0); --! Credit error counter
      empty_cnt   : std_logic_vector(7 downto 0); --! Empty packet counter
   end record spw_host_interface_out;
   constant SPW_HOST_INTERFACE_IN_RESET: spw_host_interface_in := (
      auto_start => '0',
      link_start => '0',
      link_dis   => '0',
      tx_div_cnt => (others => '0'),
      tick_in    => '0',
      ctrl_in    => (others => '0'),
      time_in    => (others => '0'),
      tx_write   => '0',
      tx_flag    => '0',
      tx_data    => (others => '0'),
      rx_read    => '0'
   );
   constant SPW_HOST_INTERFACE_OUT_RESET: spw_host_interface_out := (
      tx_rdy     => 'U',
      tx_halff   => 'U',
      tick_out   => 'U',
      ctrl_out   => (others => 'U'),
      time_out   => (others => 'U'),
      rx_valid   => 'U',
      rx_halff   => 'U',
      rx_flag    => 'U',
      rx_data    => (others => 'U'),
      started    => 'U',
      connecting => 'U',
      running    => 'U',
      err_disc_cnt => (others => 'U'),
      err_par_cnt  => (others => 'U'),
      err_esc_cnt  => (others => 'U'),
      err_cred_cnt => (others => 'U'),
      empty_cnt   => (others => 'U')
   );
   -----------------------------------------------------------------------------
   -- Type spw_link_interface
   --! \brief        Record for the SPW link interface.
   --! \details      The type contains the data and strobe signals of SPW link
   --!               interface.
   -----------------------------------------------------------------------------
   type spw_link_interface is record
      di  : std_logic; --! Data In
      si  : std_logic; --! Strobe In
      do  : std_logic; --! Data Out
      so  : std_logic; --! Strobe Out
   end record spw_link_interface;
   -----------------------------------------------------------------------------
   -- Procedure GlobalReset
   --! \brief   Generate the reset signal for the SPW UUT.
   -----------------------------------------------------------------------------
   procedure GlobalReset (
             min_time : in    time;
             max_time : in    time;
             randvar  : inout RandomPType;
      signal reset    : out   std_logic
   );
   -----------------------------------------------------------------------------
   -- Procedure WriteByteToSPW
   --! \brief     Writes one data byte or EOP or EEP in the tx queue.
   -----------------------------------------------------------------------------
   procedure WriteByteToSPW (
      signal clk              : in std_logic;
             datatimecodeflag : in integer;
             running          : in std_logic;
      signal tick_in          : out std_logic;
      signal ctrl_in          : out std_logic_vector(1 downto 0);
      signal time_in          : out std_logic_vector(5 downto 0);
             ctrlin           : in  std_logic_vector(1 downto 0);
             timein           : in  std_logic_vector(5 downto 0);
      signal tx_data          : out std_logic_vector(7 downto 0);
      signal tx_flag          : out std_logic;
      signal tx_rdy           : in std_logic;
      signal tx_write         : out std_logic;
             txdata           : in std_logic_vector(7 downto 0);
             txflag           : in integer;
             HOLD_TIME        : in delay_length;
             T_CLK            : in time
   );
   -----------------------------------------------------------------------------
   -- Procedure PrintMonitorStatsAtEnd
   --! \brief   Print on the selected logs the output monitor stats.
   -----------------------------------------------------------------------------
   procedure PrintMonitorStatsAtEnd (
      testcasename            : in string;
      processname             : in string;
      output_monitor_errors   : in integer;
      stats                   : in monitor_stats_type
   );
   -----------------------------------------------------------------------------
   -- Procedure PrintInputGeneratorStatsAtEnd
   --! \brief   Print on the selected logs the input generator stats.
   -----------------------------------------------------------------------------
   procedure PrintInputGeneratorStatsAtEnd (
      testcasename  : in string;
      processname   : in string;
      stats         : in generator_stats_type
   );
   
   -----------------------------------------------------------------------------
   -- Procedure WaitForCLKCycle                                              
   --! \brief  Wait for a defined number of clock cycles.   
   -----------------------------------------------------------------------------
   procedure WaitForCLKCycle( 
      signal clk        : in std_logic;
             cycle      : in natural;
             hold       : in boolean := true;
             hold_time  : in delay_length := 1 ns;
             edge       : in boolean := true
   );
   -----------------------------------------------------------------------------
   -- Type bool_to_logic_type
   --! \brief        Convert boolean to std_logic type.
   --! \details      The type converts a boolean value to std_logic value.
   -- Comments     :
   -----------------------------------------------------------------------------
   type bool_to_logic_type is array(boolean) of std_ulogic;
   constant BOOL_TO_LOGIC    : bool_to_logic_type := (false => '0', true => '1');
   -----------------------------------------------------------------------------
   -- Component SpwMonitor
   --! \brief   SpwMonitor is the bit and character monitor unit. Only for simulation.
   -----------------------------------------------------------------------------
   component SpwMonitor is
   port (
      CONTROL        : in    result;               --! internal execution result
      SPW_DI         : in    std_logic;            --! SPW data in
      SPW_SI         : in    std_logic;            --! SPW strobe in
      MON_ENABLE     : in    std_logic;            --! monitor enable
      MON_DATA       : out   std_logic_vector(7 downto 0); --! received data 
      MON_DATA_VLD   : out   std_logic;            --! data valid flag
      MON_TC         : out   std_logic_vector(7 downto 0); --! received timecode 
      MON_TC_VLD     : out   std_logic;            --! timecode valid flag
      MON_INPUTS     : in    monitor_inputs_type;  --! monitor inputs/config parameters
      MON_OUTPUTS    : inout monitor_outputs_type  --! monitor outputs
   );
   end component SpwMonitor;
   -----------------------------------------------------------------------------
   -- Component SpwBFM
   --! \brief   SpwBFM is a bus functional model of a SPW link. Only for simulation.
   -----------------------------------------------------------------------------
   component SpwBFM is
   port (
      CONTROL        : in    result;               --! internal execution result
      SPW_DI         : in    std_logic;            --! SPW data in
      SPW_SI         : in    std_logic;            --! SPW strobe in
      SPW_DO         : out   std_logic;            --! SPW data out
      SPW_SO         : out   std_logic;            --! SPW strobe out
      BFM_ENABLE     : in    std_logic;            --! BFM enable
      BFM_INPUTS     : in    bfm_inputs_type;  --! BFM inputs/config parameters
      BFM_OUTPUTS    : out   bfm_outputs_type := BFM_OUTPUTS_RESET  --! BFM outputs
   );
   end component SpwBFM;

end package SimulationSupport_pkg;
--------------------------------------------------------------------------------
-- Body SimulationSupport_pkg
--!\brief  Simulation support package implementation.
--------------------------------------------------------------------------------
package body SimulationSupport_pkg is

   -----------------------------------------------------------------------------
   -- Procedure GlobalReset
   --! \brief        Generate the reset signal for the UUT
   --! \details      The procedure generates a random duration reset signal for
   --!               the UUT. It must be longer than one clock cycle period.
   --! \param     min_time    the minimum reset time.
   --! \param     max_time    the maximum reset time.
   --! \param     randvar     the random variable.
   --! \param     reset       the reset signal generated.
   --  Comments:  Adapted from OSVVM FIFO example.
   -----------------------------------------------------------------------------
   procedure GlobalReset (
              min_time : in    time;
              max_time : in    time;
              randvar  : inout RandomPType;
      signal  reset    : out   std_logic
   ) is
      variable reset_time : time;
   begin
      reset <='0' ;
      reset_time := randvar.RandTime(min_time, max_time);
      wait for reset_time;
      reset <='1' ;
   end procedure GlobalReset;
   -----------------------------------------------------------------------------
   -- Procedure WriteByteToSPW
   --! \brief        WriteByteToSPW - Write one byte to the host interface of SPW.
   --! \details      The procedure writes one byte in the SPW tx queue.
   --!
   --! \param        clk        system clock.
   --! \param        tx_data    data bus for host interface.
   --! \param        tx_flag    data flag for host interface.
   --! \param        tx_rdy     high if SPW is ready to accept one byte in tx queue.
   --! \param        tx_write   high to push one byte into the tx queue.
   --! \param        txdata     data byte or X"00" for EOP or X"01" for EEP.
   --! \param        txflag     low for data byte, high for EOP or EEP.
   --! \param        HOLD_TIME  time of the hold time.
   --! \param        T_CLK      time of a clock period.
   --  Comments:
   -----------------------------------------------------------------------------
   procedure WriteByteToSPW (
      signal clk              : in  std_logic;
             datatimecodeflag : in  integer;
             running          : in  std_logic;
      signal tick_in          : out std_logic;
      signal ctrl_in          : out std_logic_vector(1 downto 0);
      signal time_in          : out std_logic_vector(5 downto 0);
             ctrlin           : in  std_logic_vector(1 downto 0);
             timein           : in  std_logic_vector(5 downto 0);
      signal tx_data          : out std_logic_vector(7 downto 0);
      signal tx_flag          : out std_logic;
      signal tx_rdy           : in  std_logic;
      signal tx_write         : out std_logic;
             txdata           : in  std_logic_vector(7 downto 0);
             txflag           : in  integer;
             HOLD_TIME        : in  delay_length;
             T_CLK            : in  time
   ) is
   begin
      wait until ( rising_edge(clk) );
      wait for HOLD_TIME;
      if (datatimecodeflag = 0 or datatimecodeflag = 2) then
         while (tx_rdy = '0') loop
            wait until ( rising_edge(clk) );
            wait for HOLD_TIME;
         end loop;
         tx_data <= txdata;
         if (txflag = 0) then
            tx_flag <= '0';
         elsif (txflag = 1) then
            tx_flag <= '1';
         else
            AssertFailure(txflag <= 1,"WriteByteToSPW", "Wrong random generation of txflag!" );
         end if; -- txflag
         tx_write <= '1';
      end if; -- datatimecodeflag
      if (datatimecodeflag = 1 or datatimecodeflag = 2) then
         --if running = '1' then
         tick_in <= '1';
         ctrl_in <= ctrlin;
         time_in <= timein;
         --end if; -- running
      end if; -- datatimecodeflag
      wait for T_CLK;
      tx_write <= '0';
      tick_in <= '0';
   end procedure WriteByteToSPW;
   -----------------------------------------------------------------------------
   -- Procedure PrintMonitorStatsAtEnd
   --! \brief     Print on the selected logs the output monitor stats
   --!
   --! \param     testcasename            string of test case name.
   --! \param     processname             string of the monitor process name.
   --! \param     output_monitor_errors   integer with the total number of errors.
   --! \param     stats                   output monitor stats data structure.
   -----------------------------------------------------------------------------
   procedure PrintMonitorStatsAtEnd (
      testcasename            : in string;
      processname             : in string;
      output_monitor_errors   : in integer;
      stats                   : in monitor_stats_type
   ) is
   begin
      PrintLine(testcasename, LS_LOG, processname & " NULL chars        = " & integer'image(stats.nullchars) );
      PrintLine(testcasename, LS_LOG, processname & " FCT chars         = " & integer'image(stats.fcts) );
      PrintLine(testcasename, LS_LOG, processname & " ESC chars         = " & integer'image(stats.escs) );
      PrintLine(testcasename, LS_LOG, processname & " EOP chars         = " & integer'image(stats.eops) );
      PrintLine(testcasename, LS_LOG, processname & " EEP chars         = " & integer'image(stats.eeps) );
      PrintLine(testcasename, LS_LOG, processname & " Data chars        = " & integer'image(stats.datachars) );
      PrintLine(testcasename, LS_LOG, processname & " Timecodes chars   = " & integer'image(stats.timecodes) );
      PrintLine(testcasename, LS_LOG, processname & " ESC errors        = " & integer'image(stats.escerrors) );
      PrintLine(testcasename, LS_LOG, processname & " CTRL codes errors = " & integer'image(stats.ctrlcodeerrors) );
      PrintLine(testcasename, LS_LOG, processname & " Monitor errors    = " & integer'image(output_monitor_errors) );
   end procedure PrintMonitorStatsAtEnd;
   -----------------------------------------------------------------------------
   -- Procedure PrintInputGeneratorStatsAtEnd
   --! \brief     Print on the selected logs the input generator stats
   --!
   --! \param     testcasename   string of test case name.
   --! \param     processname    string of the monitor process name.
   --! \param     stats          input generator stats data structure.
   -----------------------------------------------------------------------------
   procedure PrintInputGeneratorStatsAtEnd (
      testcasename : in string;
      processname  : in string;
      stats        : in generator_stats_type
   ) is
   begin
      PrintLine(testcasename, LS_LOG, processname & " Bytes Tx              = " & integer'image(stats.bytestx) );
      PrintLine(testcasename, LS_LOG, processname & " Data Bytes Tx         = " & integer'image(stats.databytestx) );
      PrintLine(testcasename, LS_LOG, processname & " EOPs Tx               = " & integer'image(stats.eopstx) );
      PrintLine(testcasename, LS_LOG, processname & " EEPs Tx               = " & integer'image(stats.eepstx) );
      PrintLine(testcasename, LS_LOG, processname & " Wrong EOPs or EEPs Tx = " & integer'image(stats.wrongcontroltx) );
      PrintLine(testcasename, LS_LOG, processname & " Timecodes Tx          = " & integer'image(stats.timecodestx) );
   end procedure PrintInputGeneratorStatsAtEnd;
   
   -----------------------------------------------------------------------------
   -- Procedure WaitForCLKCycle
   --! \brief        WaitForCLKCycle - wait for a defined number of clock cycles.
   --! \details      The procedure waits for a defined number of clock cycles. 
   --!               The starting edge of the cycle can be defined.
   --! \param        clk         clock signal to wait on.
   --! \param        cycle       number of clock cycle to wait.
   --! \param        hold        hold_time usage (true = is used / false = not used)
   --! \param        hold_time   hold_time value
   --! \param        edge        edge of the clock to wait (true = rise / false = fall).
   -----------------------------------------------------------------------------
   procedure WaitForCLKCycle( 
      signal clk        : in std_logic;
             cycle      : in natural;
             hold       : in boolean := true;
             hold_time  : in delay_length := 1 ns;
             edge       : in boolean := true
   ) is
   begin         
      for i in 0 to cycle-1 loop  
         if ( edge ) then -- true = rise
            wait until ( rising_edge(clk) ); 
         else             -- false = fall
            wait until ( falling_edge(clk) );
         end if; -- edge
      end loop; -- i      
      if ( hold ) then
         wait for hold_time;
      end if; -- hold
   end procedure WaitForCLKCycle;
   
end package body SimulationSupport_pkg;
------------------------------------------------------------------------------
-- end SimulationSupport_pkg.vhd
------------------------------------------------------------------------------