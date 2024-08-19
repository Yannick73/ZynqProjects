--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC1SpwXmit_fast.vhd
--!
--! \brief        implementation of the SpwXmit_fast unit test
--!
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 16.10.2017
--! \date         Updated: 14.10.2020
--! \version      V 1.00
--
-- Unit         : TC1SpwXmit_fast (BEH) (entity, architecture)
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
--! standard library
library ieee;
--! standard logic package
use ieee.std_logic_1164.all; 
--! VHUNIT test library
library VHUNIT;
--! VHUNIT test execution package
use VHUNIT.TestExecution_pkg.all;
--! VHUNIT test monitor package
use VHUNIT.TestMonitor_pkg.all;

--! VHDL SPW IP library
library SPWIP;
--! SPWIP SpwXmit_fast implementation
use SPWIP.SpwXmit_fast_pkg.all;
--! SPWIP record type definitions.
use SPWIP.SpwProtocol_pkg.all;
--! SPWIP registers definition.
use SPWIP.SpwRegisters_pkg.all;
--! SPWIP SpwXmit_fast unit
use SPWIP.SpwXmit_fast;

--! OSVVM library
library OSVVM;
--! OSVVM Random package
use OSVVM.RandomPkg.all;

library work;
--! Simulation support package
use work.SimulationSupport_pkg.all;
--------------------------------------------------------------------------------
-- Entity TC1SpwXmit_fast
--! \brief        TC1SpwXmit_fast - test case 1 of the SpwXmit_fast unit.
--! \details      The unit executes the test case 1. Transmit different types of
--!               SpW data and control characters.
-- Comments     : 
-- Updates      : 
--------------------------------------------------------------------------------
entity TC1SpwXmit_fast is 
   generic ( 
      SEED           : integer      := 1;    --! seed for random generation.
      UUT_T_SYSCLK   : time         := 40 ns;--! clk period of the sysclk
                                             --! signal for UUT.
      UUT_T_TXCLK    : time         := 10 ns;--! clk period of the txclk
                                             --! signal for UUT
      HOLD_TIME      : delay_length := 1 ns; --! the default hold time.
      DELAY          : delay_length := 2 ns
      );
   port ( 
      CONTROL_IN  : in execution; --! the test case execution control information.
      CONTROL_OUT : out result    --! the test case execution result information.
      );
end entity TC1SpwXmit_fast;
--------------------------------------------------------------------------------
-- Architecture TC1SpwXmit_fast_beh
--! \brief  implementation of the test case 1 for the SpwXmit_fast unit.
--------------------------------------------------------------------------------
architecture TC1SpwXmit_fast_beh of TC1SpwXmit_fast is 
   ---------------------------------------------------------------------------
   signal control : result;  --! internal execution result
   signal error   : integer := 0; --! error counter
   ---------------------------------------------------------------------------
   signal divcnt  : std_logic_vector(7 downto 0); --! tx clock divider (DIVCNT) + 1.
   signal xmiti   : spw_xmit_in_type;  --! Input signals from spwlink.
   signal xmito   : spw_xmit_out_type; --! Output signals to spwlink.
   signal spw_do  : std_logic;         --! Data Out SpaceWire signal.
   signal spw_so  : std_logic;         --! Strobe Out SpaceWire signal.
   --
   signal clk        : std_logic;     --! UUT System clock
   signal txclk      : std_logic;     --! UUT Transmit clock
   signal rst_n      : std_logic;     --! UUT System reset
   signal tx_rst_n   : std_logic;     --! UUT tx clock domain reset
   ---------------------------------------------------------------------------
   signal xmito_exp  : spw_xmit_out_type; --! expected xmito output
   signal spw_do_exp : std_logic;         --! expected spw_do output
   signal spw_so_exp : std_logic;         --! expected spw_so output
   ---------------------------------------------------------------------------
   type test_op_type is ( NONE, TX_DATA, TX_TIMECODE, TX_FCT, TX_NULL, TX_EOP_EEP );
   signal test_op : test_op_type := NONE;
begin
   ---------------------------------------------------------------------------
   -- Unit under test
   ---------------------------------------------------------------------------
   UUT: SpwXmit_fast
   port map( divcnt, xmiti, clk, txclk, rst_n, tx_rst_n,  xmito, spw_do, spw_so );
   -----------------------------------------------------------------------------
   -- Process executeTC
   --! \brief        test case execution.
   --! \details      The process execute the test case and stop it if the end of 
   --!               the run time is reached.
   -----------------------------------------------------------------------------
   executeTC: process
   begin
      WaitForStart( CONTROL_IN );
      RunUntilTime( CONTROL_IN, control );
      wait for 10 ns; -- wait to execute other process;
   end process executeTC;
   
   -----------------------------------------------------------------------------
   -- Process clockSys
   --! \brief        generate the system clock for UUT.
   --! \details      The process generates the system clock signal defined by
   --!               UUT_T_SYSCLK generic.
   -----------------------------------------------------------------------------
   clockSys: process
      variable rv         : RandomPType;
      variable initdelay  : time;
   begin
      -- initialize
      clk <= '0';
      rv.InitSeed(rv'instance_name & integer'image(10*SEED) );
      initdelay := rv.RandTime(0 ns, UUT_T_SYSCLK);
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
   --! \brief        generate the system clock for UUT.
   --! \details      The process generates the system clock signal defined by
   --!               UUT_T_TXCLK generic.
   -----------------------------------------------------------------------------
   clockTx: process
      variable rv         : RandomPType;
      variable initdelay  : time;
   begin
      -- initialize
      txclk <= '0';
      rv.InitSeed(rv'instance_name & integer'image(10*SEED) );
      initdelay := rv.RandTime(0 ns, UUT_T_TXCLK);
      WaitForStart( CONTROL_IN );
      wait for initdelay;
      loop
         txclk <= '0';
         wait for UUT_T_TXCLK/2;
         txclk <= '1';
         wait for UUT_T_TXCLK/2;
         StopAtEnd( control );
      end loop;
   end process clockTx;
   
   -----------------------------------------------------------------------------
   -- Process stimulate
   --! \brief        Main process for UUT.
   --! \details      The process stimulate the UUT to send L-chars or N-chars 
   --!               through the SPW signals SO, DO.
   --  Comments:     
   -----------------------------------------------------------------------------
   stimulate: process
   begin
      -- INIT UUT inputs
      test_op  <= NONE;
      rst_n    <= '0';
      tx_rst_n <= '0';
      divcnt   <= X"09";
      --
      xmiti.txen     <= '0';
      xmiti.stnull   <= '0';
      xmiti.stfct    <= '0';
      xmiti.fct_in   <= '0';
      xmiti.tick_in  <= '0';
      xmiti.ctrl_in  <= (others => '0');
      xmiti.time_in  <= (others => '0');
      xmiti.txwrite  <= '0';
      xmiti.txflag   <= '0';
      xmiti.txdata   <= (others => '0');
      --
      WaitForStart( CONTROL_IN );
      wait for 100 ns; -- 0 fs
      WaitForCLKCycle(clk, 1, true, HOLD_TIME); -- 100 ns
      rst_n <= '1';
      WaitForCLKCycle(txclk, 1, true, HOLD_TIME); 
      tx_rst_n <= '1';
      WaitForCLKCycle(clk, 1, true, HOLD_TIME); 
      -----------------------------------
      -- TX_NULL
      test_op       <= TX_NULL;
      WaitForCLKCycle(clk, 5, true, HOLD_TIME); 
      xmiti.fct_in  <= '1';
      WaitForCLKCycle(clk, 5, true, HOLD_TIME); 
      xmiti.txen    <= '1';
      xmiti.stnull  <= '1';
      WaitForCLKCycle(clk, 1, true, HOLD_TIME); 
      xmiti.stnull  <= '0';
      WaitForCLKCycle(clk, 10, true, HOLD_TIME); 
      -----------------------------------
      -- TX_FCT
      test_op       <= TX_FCT;
      xmiti.stfct   <= '1';
      WaitForCLKCycle(clk, 20, true, HOLD_TIME); 
      xmiti.stfct   <= '1';
      WaitForCLKCycle(clk, 5, true, HOLD_TIME); 
      xmiti.stfct   <= '0';
      xmiti.fct_in  <= '0';
      WaitForCLKCycle(clk, 5, true, HOLD_TIME); 
      -----------------------------------
      -- TX_DATA
      test_op       <= TX_DATA;
      divcnt        <= X"00";
      xmiti.txdata  <= X"AA";
      WaitForCLKCycle(clk, 1, true, HOLD_TIME); 
      xmiti.txwrite <= '1';
      WaitForCLKCycle(clk, 1, true, HOLD_TIME); 
      xmiti.txwrite <= '0';
      WaitForCLKCycle(clk, 4, true, HOLD_TIME); 
      -----------------------------------
      -- TX_TIMECODE
      test_op       <= TX_TIMECODE;
      xmiti.ctrl_in <= "11";
      xmiti.time_in <= "010101";
      xmiti.tick_in <= '1';
      WaitForCLKCycle(clk, 1, true, HOLD_TIME); 
      xmiti.tick_in <= '0';
      WaitForCLKCycle(clk, 10, true, HOLD_TIME); 
      -----------------------------------
      -- TX_EOP_EEP
      test_op       <= TX_EOP_EEP;
      xmiti.txdata  <= X"00";
      xmiti.txflag  <= '1';
      WaitForCLKCycle(clk, 1, true, HOLD_TIME); 
      xmiti.txwrite <= '1';
      WaitForCLKCycle(clk, 1, true, HOLD_TIME); 
      xmiti.txwrite <= '0';
      WaitForCLKCycle(clk, 5, true, HOLD_TIME); 
      --
      xmiti.txdata  <= X"01";
      xmiti.txflag  <= '1';
      WaitForCLKCycle(clk, 1, true, HOLD_TIME); 
      xmiti.txwrite <= '1';
      WaitForCLKCycle(clk, 1, true, HOLD_TIME); 
      xmiti.txwrite <= '0';
      divcnt        <= X"09";
      WaitForCLKCycle(clk, 10, true, HOLD_TIME); 
      xmiti.txen    <= '0';

      wait for 1000 ns; -- ns
      StopProcess(control);
   end process stimulate;
   -----------------------------------------------------------------------------
   -- Process expect
   --! \brief        generate the expected values.
   --! \details      The process define the expected signal values.
   -----------------------------------------------------------------------------
   expect: process
   begin 
      -- initialize
      xmito_exp.fctack  <= '0' after delay;
      xmito_exp.txack   <= '0' after delay;
      -- generate
      -- reset
      WaitForStart( CONTROL_IN );
      wait for 100 ns; --  0 fs
      WaitForCLKCycle(clk, 1, false);  -- 100 ns
      WaitForCLKCycle(clk, 13, false);
      xmito_exp.fctack  <= '1' after delay;
      WaitForCLKCycle(clk, 3, false);
      xmito_exp.fctack  <= '0' after delay;
      WaitForCLKCycle(clk, 11, false);
      xmito_exp.fctack  <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmito_exp.fctack  <= '0' after delay;
      WaitForCLKCycle(clk, 9, false);
      xmito_exp.fctack  <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmito_exp.fctack  <= '0' after delay;
      --
      WaitForCLKCycle(clk, 15, false); 
      xmito_exp.txack   <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmito_exp.txack   <= '0' after delay;
      WaitForCLKCycle(clk, 16, false);
      xmito_exp.txack   <= '1' after delay;
      WaitForCLKCycle(clk, 1, false);
      xmito_exp.txack   <= '0' after delay;
      WaitForCLKCycle(clk, 6, false);
      xmito_exp.txack   <= '1' after delay;
      WaitForCLKCycle(clk, 1, false); 
      xmito_exp.txack   <= '0' after delay;
      --
      wait for 1000 ns; --  ns
      StopAtEnd( control );
   end process expect;
   
    -----------------------------------------------------------------------------
   -- Process expecttx
   --! \brief        generate the expected values for SPW_SO and SPW_DO.
   --! \details      The process define the expected signal values in txclk domain.
   -----------------------------------------------------------------------------
   expecttx: process
   begin 
      -- initialize
      spw_do_exp     <= '0' after delay;
      spw_so_exp     <= '0' after delay;
      -- generate
      -- reset
      WaitForStart( CONTROL_IN );
      wait for 100 ns; --  0 fs
      WaitForCLKCycle(txclk, 74, false); -- 100 ns
      
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 10, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 7, false); 
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false); 
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 1, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 10, false);
      spw_so_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 10, false);
      spw_do_exp  <= '1' after delay;
      WaitForCLKCycle(txclk, 10, false);
      spw_so_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 10, false);
      spw_do_exp  <= '0' after delay;
      WaitForCLKCycle(txclk, 10, false);

      --
      wait for 1000 ns; --  ns
      StopAtEnd( control );
   end process expecttx;
   
   -----------------------------------------------------------------------------
   -- Process monitor
   --! \brief        monitor the results.
   --! \details      The process compare the expected values with the resulting 
   --!               values from the UUT.
   -----------------------------------------------------------------------------
   monitor: process
   begin
      MonitorWaitForStart( "SpwXmit_fast", 4, CONTROL_IN ); 
      wait on control,xmito_exp, spw_do_exp, spw_so_exp ,clk, txclk; -- compare expected with result
      MonitorStopAtEnd( control, error, CONTROL_OUT );
      if (clk'last_event = 0 ns or xmito_exp'last_event = 0 ns) then
         MonitorSignal( xmito.fctack, xmito_exp.fctack, "xmito.fctack", error );
         MonitorSignal( xmito.txack, xmito_exp.txack, "xmito.txack", error );
      end if; -- clk'last_event
      if (txclk'last_event = 0 ns or spw_do_exp'last_event = 0 ns or spw_so_exp'last_event = 0 ns) then
         MonitorSignal( spw_do, spw_do_exp, "spw_do", error );
         MonitorSignal( spw_so, spw_so_exp, "spw_so", error );
      end if; -- txclk'last_event
   end process monitor;
end architecture TC1SpwXmit_fast_beh;
--------------------------------------------------------------------------------
-- end TC1SpwXmit_fast.vhd
--------------------------------------------------------------------------------