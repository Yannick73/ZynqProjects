--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwMonitor.vhd
--!
--! \brief        Monitor for SPW signals
--!
--! \author       Jorge Tonfat (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 31.10.2016
--! \date         Updated: 17.02.2017
--! \version      V 1.00
--
-- Unit         : SpwMonitor (BEH) (entity, architecture)
-- File Version : $Revision$
--
-- Limitations  : None known
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
--! standard library
library ieee; 
--! IEEE standard logic package
use ieee.std_logic_1164.all; 
--! IEEE standard unsigned logic package
use ieee.std_logic_unsigned.all; 
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
--! Work library
library work;
--! Simulation support package
use work.SimulationSupport_pkg.all;
--------------------------------------------------------------------------------
-- Entity SpwMonitor
--! \brief        SpwMonitor - Output monitor and decoder for SpW signals.
--! \details      The module analyses SpW output signals at bit and character level.
--!               It checks bit timing periods, detects changes of bit rates
--!               Detects invalid character sequences.
-- Comments     : 
--                
-- Updates      : 
--  
--------------------------------------------------------------------------------
entity SpwMonitor is

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
      MON_OUTPUTS    : out   monitor_outputs_type := MONITOR_OUTPUTS_RESET  --! monitor outputs
   );
end entity SpwMonitor;

--------------------------------------------------------------------------------
-- Architecture SpwMonitor_beh
--! \brief  behavioral implementation of the entity
--------------------------------------------------------------------------------
architecture SpwMonitor_beh of SpwMonitor is
   constant INITOUTBITPERIOD : time := 100 ns; -- bit period before the RUN state
   
begin

-----------------------------------------------------------------------------
   -- Process bitMonitor
   --! \brief        Monitor output bits on data and strobe signals.
   --! \details      The process monitors the output signals from the SpW output
   --!               data interface at bit level. Checks bit timing periods.
   --  Comments:     Adapted from SpaceWire Light IP from opencores.org
   -----------------------------------------------------------------------------
   bitMonitor: process
      variable timelast         : time;
      variable lastdo           : std_logic;
      variable lastso           : std_logic;
      variable firstbit         : boolean := true;
      
      variable ratechangedetected : boolean := false;
      variable lastdivcnt       : std_logic_vector(7 downto 0);
      variable lastrunstate     : std_logic := '0';
      variable outbitperiod     : time;
      variable longestperiod    : time;
   begin
      if MON_ENABLE = '1' then
         lastdo           := SPW_DI;
         lastso           := SPW_SI;
         lastdivcnt       := MON_INPUTS.spw_divcnt;
         lastrunstate     := MON_INPUTS.spw_run_state;
         outbitperiod     := (1 sec) * real(to_integer(unsigned(MON_INPUTS.spw_divcnt))+1)/ MON_INPUTS.spw_tx_clk_freq;
         MON_OUTPUTS.spw_bit_period <= outbitperiod;
         timelast         := now;
         -- for the first bit, the 850 ns time does not apply
         if firstbit = True then
            wait until (MON_ENABLE = '0') or (lastdo /= SPW_DI) or (lastso /= SPW_SI);
            -- check that the first transition is on strobe signal
            if (lastdo /= SPW_DI) then
               PrintLine(GetExecutedTestCaseName, LS_FAILURE, "(" & MON_INPUTS.spw_name & ")" & "bitMonitor: ERROR: first transition in data signal");
               MON_OUTPUTS.spw_bit_errors <= MON_OUTPUTS.spw_bit_errors + 1;
               MON_OUTPUTS.spw_d_first_trans <= '1';
            end if; -- lastdo
            if (lastso /= SPW_SI) then
               MON_OUTPUTS.spw_s_first_trans <= '1';
            end if; -- lastso
         else
            wait until (MON_ENABLE = '0') or (lastdo /= SPW_DI) or (lastso /= SPW_SI) for 850 ns;
         end if; -- firstbit
         StopAtEnd(CONTROL);
         -- check if the bitrate has changed
         if (lastdivcnt /= MON_INPUTS.spw_divcnt or lastrunstate /= MON_INPUTS.spw_run_state ) then
            ratechangedetected := True;
            outbitperiod       := (1 sec) * real(to_integer(unsigned(MON_INPUTS.spw_divcnt))+1)/ MON_INPUTS.spw_tx_clk_freq;
            MON_OUTPUTS.spw_bit_period <= outbitperiod;
         end if; -- lastdivcnt
         -- wait a transition time (3 SPW changes in SPW signal) to adapt to the new rate
         if (ratechangedetected = True) then
            MON_OUTPUTS.spw_rate_changed <= '1';
            lastdo           := SPW_DI;
            lastso           := SPW_SI;
            wait until (MON_ENABLE = '0') or (lastdo /= SPW_DI) or (lastso /= SPW_SI);
            lastdo           := SPW_DI;
            lastso           := SPW_SI;
            wait until (MON_ENABLE = '0') or (lastdo /= SPW_DI) or (lastso /= SPW_SI);
            lastdo           := SPW_DI;
            lastso           := SPW_SI;
            wait until (MON_ENABLE = '0') or (lastdo /= SPW_DI) or (lastso /= SPW_SI);
            MON_OUTPUTS.spw_rate_changed <= '0';
         end if; -- ratechangedetected
         if (MON_ENABLE = '1' and NOT (firstbit) ) then
            -- check for simultaneous transitions of D and S signals
            if (lastdo /= SPW_DI) and (lastso /= SPW_SI) then
               PrintLine(GetExecutedTestCaseName, LS_FAILURE, "(" & MON_INPUTS.spw_name & ")" & "bitMonitor: ERROR: simultaneous transitions of D and S signals");
               MON_OUTPUTS.spw_bit_errors <= MON_OUTPUTS.spw_bit_errors + 1;
               MON_OUTPUTS.spw_sim_ds_switch <= '1';
            end if; -- lastdo
            -- check for bit timing in the running state
            if (MON_INPUTS.spw_run_state = '1' and ratechangedetected = False ) then
               if (lastdo /= SPW_DI) or (lastso /= SPW_SI) then
                  if NOT(now > timelast + outbitperiod - 1 ns) then
                     PrintLine(GetExecutedTestCaseName, LS_LOG, "(" & MON_INPUTS.spw_name & ")" & "bitMonitor: Warning: bit period too short (SPW_DI or SPW_SI)");
                     MON_OUTPUTS.spw_bit_errors <= MON_OUTPUTS.spw_bit_errors + 1;
                  elsif NOT(now < timelast + outbitperiod + 1 ns) then
                     PrintLine(GetExecutedTestCaseName, LS_LOG, "(" & MON_INPUTS.spw_name & ")" & "bitMonitor: Warning: bit period too long (SPW_DI or SPW_SI)");
                     MON_OUTPUTS.spw_bit_errors <= MON_OUTPUTS.spw_bit_errors + 1;
                  end if; -- now
               else
                  PrintLine(GetExecutedTestCaseName, LS_LOG, "(" & MON_INPUTS.spw_name & ")" & "bitMonitor: No SpW output change in more than 850 ns");
                  MON_OUTPUTS.spw_bit_errors <= MON_OUTPUTS.spw_bit_errors + 1;
               end if; -- lastdo
            else
               -- check for bit timing before the running state
               if (ratechangedetected = False) then
                  if (lastdo /= SPW_DI) or (lastso /= SPW_SI) then
                     if NOT(now > timelast + INITOUTBITPERIOD - 9.1 ns) then -- 11 Mbps: 90.90 ns
                        PrintLine(GetExecutedTestCaseName, LS_LOG, "(" & MON_INPUTS.spw_name & ")" & "bitMonitor: Warning: INIT bit period too short (SPW_DI or SPW_SI)");
                        MON_OUTPUTS.spw_bit_errors <= MON_OUTPUTS.spw_bit_errors + 1;
                     elsif NOT(now < timelast + INITOUTBITPERIOD + 11.11 ns) then -- 9 Mbps: 111.11 ns
                        PrintLine(GetExecutedTestCaseName, LS_LOG, "(" & MON_INPUTS.spw_name & ")" & "bitMonitor: Warning: INIT bit period too long (SPW_DI or SPW_SI)");
                        MON_OUTPUTS.spw_bit_errors <= MON_OUTPUTS.spw_bit_errors + 1;
                     end if; -- NOT(now <
                  else
                     PrintLine(GetExecutedTestCaseName, LS_LOG, "(" & MON_INPUTS.spw_name & ")" & "bitMonitor: No spw output change in more than 850 ns");
                     MON_OUTPUTS.spw_bit_errors <= MON_OUTPUTS.spw_bit_errors + 1;
                  end if; -- lastdo
               else
                  -- after the transition time, back to false the rate change flag
                  ratechangedetected := False;
               end if; -- ratechangedetected
            end if; -- MON_INPUTS.spw_run_state
         end if; -- MON_ENABLE
         if (firstbit) then
            firstbit := False;
         end if; -- firstbit
      else
         -- reset the bit monitor
         MON_OUTPUTS.spw_bit_period <= 0 ns;
         MON_OUTPUTS.spw_rate_changed <= '0';
         MON_OUTPUTS.spw_sim_ds_switch <= '0';
         MON_OUTPUTS.spw_d_first_trans <= '0';
         MON_OUTPUTS.spw_s_first_trans <= '0';
         firstbit := True;
         ratechangedetected := False;
         lastdo := '0';
         lastso := '0';
         wait until MON_ENABLE = '1';
      end if; -- MON_ENABLE
      StopAtEnd(CONTROL);
   end process bitMonitor;
   -----------------------------------------------------------------------------
   -- Process charMonitor
   --! \brief        Analyses SpW output and decode signals to character level.
   --! \details      The process analyses SpW output and decode signals
   --!               to character level. Detects invalid character sequences.
   --  Comments:
   -----------------------------------------------------------------------------
   charMonitor: process
      variable firstbit    : boolean := true;
      variable lastspwdo1  : std_logic;
      variable lastspwso1  : std_logic;
      variable monitorbits : std_logic_vector (9 downto 0) := (others => '0');
      variable monitorptr  : integer := 0;
      variable controlflag : std_logic := '0';
      variable chardetected      : spw_char_type:= BLANK;
      variable lastchardetected  : spw_char_type:= BLANK;
      variable controlcode  : std_logic_vector(1 downto 0);
      variable datavalue    : std_logic_vector(7 downto 0) := (others => 'X');
      variable timevalue    : std_logic_vector(5 downto 0) := (others => 'X');
      variable controlvalue : std_logic_vector(1 downto 0) := (others => 'X');
      variable parity       : std_logic := '0';
      variable firstparitycheck  : boolean := true;
      variable charpar     : std_logic := '0'; --! character parity accumulator
   begin
      if MON_ENABLE = '1' then
         if monitorptr <= monitorbits'high then -- wait for next bit
            if (firstbit) then
               firstbit := false;
               if (SPW_DI /= '0') then
                  -- First bit in the link shall be zero (clause 7.5a)
                  PrintFailureLine(GetExecutedTestCaseName & "(" & MON_INPUTS.spw_name & ")" , '1', '0', "SPW_DI" );
                  MON_OUTPUTS.spw_char_errors <= MON_OUTPUTS.spw_char_errors + 1;
               end if; -- SPW_DI
            else
               monitorbits(monitorptr) := SPW_DI;
               monitorptr := monitorptr + 1;
            end if; -- firstbit
         end if; -- monitorptr
         lastspwdo1 := SPW_DI;
         lastspwso1 := SPW_SI;
         wait until (MON_ENABLE = '0') or (lastspwdo1 /= SPW_DI) or (lastspwso1 /= SPW_SI);
         MON_DATA_VLD <= '0';
         MON_DATA     <= (others => 'X');
         MON_TC_VLD   <= '0';
         MON_TC       <= (others => 'X');          
         if (MON_ENABLE = '1' and monitorptr = 1) then
            if (firstparitycheck) then
               firstparitycheck := false;
               -- first parity should be 0. See clause 7.5b
               if NOT (lastspwdo1 = '0') then
                  PrintLine(GetExecutedTestCaseName & "(" & MON_INPUTS.spw_name & ")", LS_FAILURE, "'FIRST PARITY' ERROR" );
                  MON_OUTPUTS.spw_char_errors <= MON_OUTPUTS.spw_char_errors + 1;
               end if; -- lastspwdo1
            else
               parity := charpar xor SPW_DI;
               if (parity = '0') then -- parity shall be odd. See clause 7.4
                  PrintLine(GetExecutedTestCaseName & "(" & MON_INPUTS.spw_name & ")", LS_FAILURE, "PARITY ERROR" );
                  MON_OUTPUTS.spw_char_errors <= MON_OUTPUTS.spw_char_errors + 1;
               end if; -- parity
               charpar := '0'; -- reset character parity accumulator
            end if; -- firstparitycheck
            controlflag := SPW_DI;
         end if; -- MON_ENABLE
         if (MON_ENABLE = '1' and controlflag = '1' and monitorptr > 1) then
            charpar := charpar xor SPW_DI;
            if (monitorptr = 4) then
               controlcode := monitorbits(3 downto 2);
               case controlcode is
                  when "00" => -- FCT: refer to SPW standard clause 7.3
                     datavalue := (others => 'X');
                     if (lastchardetected = ESC) then
                        chardetected := NULL_char;
                        MON_OUTPUTS.spw_char_stats.nullchars <= MON_OUTPUTS.spw_char_stats.nullchars + 1;
                     else
                        chardetected := FCT;
                        MON_OUTPUTS.spw_char_stats.fcts <= MON_OUTPUTS.spw_char_stats.fcts + 1;
                     end if; -- lastchardetected
                  when "01" => -- EEP: refer to SPW standard clause 7.3
                     datavalue := (others => 'X');
                     if (lastchardetected = ESC) then
                        chardetected := ESCAPE_ERROR;
                        MON_OUTPUTS.spw_char_stats.escerrors <= MON_OUTPUTS.spw_char_stats.escerrors + 1;
                        PrintLine(GetExecutedTestCaseName & "(" & MON_INPUTS.spw_name & ")", LS_FAILURE, "ESCAPE ERROR" );
                        MON_OUTPUTS.spw_char_errors <= MON_OUTPUTS.spw_char_errors + 1;
                     else
                        chardetected := EEP;
                        MON_OUTPUTS.spw_char_stats.eeps <= MON_OUTPUTS.spw_char_stats.eeps + 1;
                     end if; -- lastchardetected
                  when "10" => -- EOP: refer to SPW standard clause 7.3
                     datavalue := (others => 'X');
                     if (lastchardetected = ESC) then
                        chardetected := ESCAPE_ERROR;
                        MON_OUTPUTS.spw_char_stats.escerrors <= MON_OUTPUTS.spw_char_stats.escerrors + 1;
                        PrintLine(GetExecutedTestCaseName & "(" & MON_INPUTS.spw_name & ")", LS_FAILURE, "ESCAPE ERROR" );
                        MON_OUTPUTS.spw_char_errors <= MON_OUTPUTS.spw_char_errors + 1;
                     else
                        chardetected := EOP;
                        MON_OUTPUTS.spw_char_stats.eops <= MON_OUTPUTS.spw_char_stats.eops + 1;
                     end if; -- lastchardetected
                  when "11" => -- ESC: refer to SPW standard clause 7.3
                     datavalue := (others => 'X');
                     if (lastchardetected = ESC) then
                        chardetected := ESCAPE_ERROR;
                        MON_OUTPUTS.spw_char_stats.escerrors <= MON_OUTPUTS.spw_char_stats.escerrors + 1;
                        PrintLine(GetExecutedTestCaseName & "(" & MON_INPUTS.spw_name & ")", LS_FAILURE, "ESCAPE ERROR" );
                        MON_OUTPUTS.spw_char_errors <= MON_OUTPUTS.spw_char_errors + 1;
                     else
                        chardetected := ESC;
                        MON_OUTPUTS.spw_char_stats.escs <= MON_OUTPUTS.spw_char_stats.escs + 1;
                     end if; -- lastchardetected
                  when others =>
                     datavalue := (others => 'X');
                     chardetected := CONTROL_CODE_ERROR;
                     MON_OUTPUTS.spw_char_stats.ctrlcodeerrors <= MON_OUTPUTS.spw_char_stats.ctrlcodeerrors + 1;
                     PrintLine(GetExecutedTestCaseName & "(" & MON_INPUTS.spw_name & ")", LS_FAILURE, "CONTROL CODE ERROR" );
                     MON_OUTPUTS.spw_char_errors <= MON_OUTPUTS.spw_char_errors + 1;
               end case; -- controlcode
               lastchardetected := chardetected;
               monitorptr := 0;
            end if; -- monitorptr
         end if; -- MON_ENABLE
         if (MON_ENABLE = '1' and controlflag = '0') then
            if monitorptr > 1 then
               charpar := charpar xor SPW_DI;
               if (monitorptr = 2) then
                  if (lastchardetected = ESC ) then
                     chardetected := TIMECODE;
                  else
                     chardetected := DATA_char;
                  end if; -- lastchardetected
                  lastchardetected := chardetected;
               end if; -- monitorptr = 2
               if (monitorptr = 10) then
                  if (lastchardetected = TIMECODE) then
                     MON_OUTPUTS.spw_char_stats.timecodes <= MON_OUTPUTS.spw_char_stats.timecodes + 1;
                     timevalue := monitorbits(7 downto 2) ;
                     controlvalue :=  monitorbits(9 downto 8) ;
                  else
                     datavalue := monitorbits(9 downto 2) ;
                     MON_OUTPUTS.spw_char_stats.datachars <= MON_OUTPUTS.spw_char_stats.datachars + 1;
                     MON_DATA <= datavalue;
                     MON_DATA_VLD <= '1';
                  end if; -- lastchardetected
                  monitorptr := 0;
               end if; -- monitorptr = 10
            end if; -- monitorptr > 1
         end if; -- MON_ENABLE
      else
         -- reset the char monitor
         lastchardetected  := BLANK;
         chardetected      := BLANK;
         charpar           := '0';
         monitorptr        := 0;
         firstparitycheck  := true;
         firstbit          := true;
         lastspwdo1        := '0';
         lastspwso1        := '0';
         MON_DATA_VLD      <= '0';
         MON_DATA          <= (others => 'X');
         MON_TC_VLD        <= '0';
         MON_TC            <= (others => 'X');
         wait until MON_ENABLE = '1';
      end if; -- MON_ENABLE
      StopAtEnd(CONTROL);
   end process charMonitor;

end architecture SpwMonitor_beh;

--------------------------------------------------------------------------------
-- end SpwMonitor.vhd
--------------------------------------------------------------------------------
