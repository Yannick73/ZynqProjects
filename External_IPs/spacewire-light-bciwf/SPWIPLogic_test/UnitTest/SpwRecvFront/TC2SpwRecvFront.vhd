--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         TC2SpwRecvFront.vhd
--!
--! \brief        Implementation of the test case 2 SPW Receiver front-end unit test.
--!               
--! \author       Jorge Tonfat  (JTO)       jorge.tonfat@oeaw.ac.at
--! \date         Created: 25.04.2019
--! \date         Updated: 14.10.2020
--! \version      V 1.00
--
-- Unit         : TC2SpwRecvFront (BEH) (entity, architecture)
-- File version : $Revision $
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

--! FPGA logic library
library SPWIP;  
--! SPWIP SPWCodec SpwRecvFront implementation.
use SPWIP.SpwRecvFront_pkg.all;
--! SPWIP SpwRecvFront unit
use SPWIP.SpwRecvFront; 

--! OSVVM library
library OSVVM;
--! OSVVM Random Base package
use OSVVM.RandomBasePkg.all;
--! OSVVM Random package
use OSVVM.RandomPkg.all;
--! OSVVM Coverage package
use OSVVM.CoveragePkg.all;

--! work library
library work;
--! Simulation support package
use work.SimulationSupport_pkg.all;
--------------------------------------------------------------------------------
-- Entity TC2SpwRecvFront
--! \brief        TC2SpwRecvFront - test case 2 of the SPW Receiver front-end unit.
--! \details      The unit executes the test case 2 of SPW Receiver front-end unit.
--!               Evaluate with RXCHUNK = 1 receiving SpW characters at nominal rate (10 Mbps).
--! \refTC_ID     RDCU-UTB-TC-0226
-- Comments     : The valid combinations of RXCHUNK and T_SYSCLK for a 10 Mbps rate are:
--                RXCHUNK = 1, T_SYSCLK < 100 ns
--                RXCHUNK = 2, T_SYSCLK < 200 ns
--                RXCHUNK = 4, T_SYSCLK < 400 ns
--                RXCHUNK = 6, T_SYSCLK < 600 ns
-- Updates      :
--------------------------------------------------------------------------------
entity TC2SpwRecvFront is
   generic (
      SEED           : integer      := 1;         --! seed for random generation.
      HOLD_TIME      : delay_length := 1 ns;      --! define the default hold time.
      T_SYSCLK       : time   := 40 ns;           --! define the period of the clk signal.
      DELAY          : delay_length := 2 ns
   );
   port (
      CONTROL_IN  : in execution; --! the test case execution control information.
      CONTROL_OUT : out result    --! the test case execution result information.
   );
end entity TC2SpwRecvFront;

--------------------------------------------------------------------------------
-- Architecture TC2SpwRecvFront_beh
--! \brief  Implementation of the test case 2 for the SPW receiver front-end unit.
--------------------------------------------------------------------------------
architecture TC2SpwRecvFront_beh of TC2SpwRecvFront is
   -----------------------------------------------------------------------------
   -- Component SpwRecovClk
   --! \brief  SpaceWire clock recovery from SI and DI signals.
   -----------------------------------------------------------------------------
   component SpwRecovClk is 
      port ( 
         RXCLK  : out std_logic; --! Recovered clock out.
         SPW_DI : in std_logic;  --! Data In SpaceWire signal.
         SPW_SI : in std_logic   --! Strobe In SpaceWire signal.
      );
   end component SpwRecovClk;
   -----------------------------------------------------------------------------
   -- Simulation related signals, variables and constants
   -----------------------------------------------------------------------------
   signal control        : result;            --! internal execution result
   signal error          : integer := 0;      --! total error counter
   -----------------------------------------------------------------------------
   -- Clock related signals, variables and constants
   -----------------------------------------------------------------------------
   signal   sysclk         : std_logic; --! System clock
   constant MAX_INPUT_RATE : real   := 100.0e6; --! maximum input data rate of the SPW Rx : 100 Mbps.
   constant MIN_INPUT_RATE : real   := 2.0e6;   --! minimum input data rate of the SPW Rx : 2 Mbps.
   constant NOM_INPUT_RATE : real   := 10.0e6;  --! nominal input data rate of the SPW Rx : 10 Mbps.
   type input_rate_type is (max_rate, nom_rate, min_rate); 
   signal   input_rate     : input_rate_type := max_rate;
   constant MIN_INBIT_PERIOD : time := (1 sec) / MAX_INPUT_RATE ; --! max data rate in the Run state
   constant MAX_INBIT_PERIOD : time := (1 sec) / MIN_INPUT_RATE ; --! min data rate in the Run state
   constant NOM_INBIT_PERIOD : time := (1 sec) / NOM_INPUT_RATE ; --! nom data rate in the Run state
   -----------------------------------------------------------------------------
   -- Input generator related signals, variables and constants
   -----------------------------------------------------------------------------
   signal input_par        : std_logic;         --! the parity bit of the input generator.
   signal input_idle       : std_logic;         --! high when the input generator is idle.
   signal input_pattern    : integer := 0;      --! selects the input pattern.
   signal input_strobeflip : std_logic := '0';  --! The value of spw_si when the sim starts.

   -----------------------------------------------------------------------------
   -- SPW receiver front-end (UUT) interface signals and constants
   -----------------------------------------------------------------------------
   constant RXCHUNK : integer range 1 to 6 := 1; --! maximum number of bits received per system clock.
   signal rxen     : std_logic; --! receiver enable signal.
   signal inact    : std_logic; --! high if there has been recent activity on the input lines.
   signal inbvalid : std_logic; --! high if inbits contains a valid group of received bits.
   signal inbits   : std_logic_vector(RXCHUNK-1 downto 0); --! received bits.
   signal spw_di   : std_logic; --! Data In SpaceWire signal.
   signal spw_si   : std_logic; --! Strobe In SpaceWire signal.
   signal rxclk    : std_logic; --! Recovered clock in.
   signal sysrst_n : std_logic; --! unit reset (active-low).
   ---------------------------------------------------------------------------------
   signal inact_exp    : std_logic; --! expected inact signal
   signal inbvalid_exp : std_logic; --! expected inbvalid signal 
   signal inbits_exp   : std_logic_vector(RXCHUNK-1 downto 0); --! expected inbits signal

begin

   ---------------------------------------------------------------------------
   -- Unit under test
   ---------------------------------------------------------------------------
   UUT: SpwRecvFront
   generic map (RXCHUNK => RXCHUNK) -- RXCHUNK = 1
   port map(
      CLK       => sysclk,
      RXCLK_IN  => rxclk,
      RST_N     => sysrst_n,
      RXEN      => rxen,
      INACT     => inact, 
      INBVALID  => inbvalid,
      INBITS    => inbits,
      SPW_SI    => spw_si,
      SPW_DI    => spw_di 
      );
   UUT2: SpwRecovClk
   port map(
      RXCLK   => rxclk,
      SPW_DI  => spw_di,
      SPW_SI  => spw_si
      );
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
   --!               UUT_T_SYSCLK generic with random initial offset in the time range
   --!               [0;3*UUT_T_SYSCLK]
   -----------------------------------------------------------------------------
   clockSys: process
      variable rv         : RandomPType;
      variable initdelay  : time;
   begin
      -- initialize
      sysclk <= '0';
      rv.InitSeed(rv'instance_name & integer'image(SEED) );
      initdelay := rv.RandTime(0 ns, 3*T_SYSCLK);
      WaitForStart( CONTROL_IN );
      wait for initdelay;
      loop
         sysclk <= '0';
         wait for T_SYSCLK/2;
         sysclk <= '1';
         wait for T_SYSCLK/2;
         StopAtEnd( control );
      end loop;
   end process clockSys;
   
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
      -----------------------------------------------------------------------------
      -- Procedure inputReset
      --! \brief        Reset the SPW data and strobe signals.
      -----------------------------------------------------------------------------
      procedure inputReset is
      begin
         spw_di <= '0';
         spw_si <= input_strobeflip;
         input_par   <= '0';
         random_seq  := (others => '0');
      end procedure inputReset;
      ----------------------------------------------------------------------------
      -- Procedure genBit
      --! \brief        Sends one bit.
      -----------------------------------------------------------------------------
      procedure genBit(
         b: std_logic
      ) is
      begin
         spw_si <= not (spw_si xor spw_di xor b);
         spw_di <= b;
         if input_rate = min_rate then
            wait for MAX_INBIT_PERIOD;
         elsif input_rate = max_rate then
            wait for MIN_INBIT_PERIOD;
         elsif input_rate = nom_rate then
            wait for NOM_INBIT_PERIOD;
         end if; -- input_rate      
      end procedure genBit;
      -----------------------------------------------------------------------------
      -- Procedure genfct
      --! \brief        Sends FCT control code.
      -----------------------------------------------------------------------------
      procedure genfct is
      begin
         genBit(input_par);
         genBit('1');
         genBit('0');
         input_par <= '0';
         genBit('0');
      end procedure genfct;
      -----------------------------------------------------------------------------
      -- Procedure genesc
      --! \brief        Sends ESC control code.
      -----------------------------------------------------------------------------
      procedure genesc is
      begin
         genBit(input_par);
         genBit('1');
         genBit('1');
         input_par <= '0';
         genBit('1');
      end procedure genesc;
      -----------------------------------------------------------------------------
      -- Procedure geneop
      --! \brief        Send EOP or EEP control code.
      -----------------------------------------------------------------------------
      procedure geneop(
         e: std_logic
      )  is
      begin
         genBit(input_par);
         genBit('1');
         genBit(e);
         input_par <= '1';
         genBit(not e);
      end procedure geneop;
      -----------------------------------------------------------------------------
      -- Procedure gendat
      --! \brief        Send an 8-bit data.
      -----------------------------------------------------------------------------
      procedure gendat(
         dat: std_logic_vector(7 downto 0)
      )  is
      begin
         genBit(not input_par);
         genBit('0');
         genBit(dat(0)); genBit(dat(1)); genBit(dat(2)); genBit(dat(3));
         genBit(dat(4)); genBit(dat(5)); genBit(dat(6));
         input_par <= dat(0) xor dat(1) xor dat(2) xor dat(3) xor
                      dat(4) xor dat(5) xor dat(6) xor dat(7);
         genBit(dat(7));
      end procedure gendat;
--! \endcond
   begin
      -- initializing the generator with the seed
      RV.InitSeed(RV'instance_name & integer'image(SEED));
      input_idle <= '1';
      inputReset;
      wait until input_pattern /= 0;
      input_idle <= '0';
      while input_pattern /= 0 loop
         if input_pattern = 1 then
            -- NULL tokens
            genesc;
            genfct;
         elsif input_pattern = 2 then
            -- FCT tokens
            genfct;
         elsif input_pattern = 5 then
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
            while input_pattern = 5 loop
               genesc;
               genfct;
            end loop;
         else
             PrintFailureLine(GetExecutedTestCaseName, "genInputProc: ", integer'image(input_pattern), " Unknown input pattern selected!" );
         end if; -- input_pattern
      end loop;
   end process genInputProc;
   
   -----------------------------------------------------------------------------
   -- Process stimulate
   --! \brief        Main process for UUT.
   --! \details      The process handles the execution of UUT.
   --!
   --  Comments:     Adapted from SpaceWire Light IP from opencores.org
   -----------------------------------------------------------------------------
   stimulate: process
      variable RV       : RandomPType ;
      
   begin
      rxen     <= '0';
      sysrst_n <= '0';
      input_pattern <= 0;
      input_rate <= nom_rate;
      WaitForStart( CONTROL_IN );
      wait for 200 ns;
      WaitForCLKCycle(sysclk, 1); 
      sysrst_n <= '1';
      --wait for 200 ns;
      WaitForCLKCycle(sysclk, 2); 
      rxen <= '1';
      WaitForCLKCycle(sysclk, 3); 
      input_pattern <= 1;
      
      -- begin     
      wait for 1 us;
      input_pattern <= 0;
      
      wait for 500 ns;
      WaitForCLKCycle(sysclk, 1); 
      
      -- Stop simulation
      WaitForCLKCycle(sysclk, 1); 
      rxen <= '0';
      input_pattern <= 0;
      wait for 1 ns; -- to update the error signal
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
      inact_exp      <= '0' after delay;
      inbvalid_exp   <= '0' after delay;
      inbits_exp     <= (others => '0') after delay;
      
      -- generate
      -- reset
      WaitForStart( CONTROL_IN );
      wait for 100 ns; --  0 fs
      WaitForCLKCycle(sysclk, 2, false); -- 100 ns
      ------
      WaitForCLKCycle(sysclk, 9, false); 
      --inbits_exp     <= "11" & X"0" after delay;
      inact_exp      <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp      <= '0' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp      <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp      <= '0' after delay;
      --
      WaitForCLKCycle(sysclk, 2, false);
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      --
      WaitForCLKCycle(sysclk, 2, false);
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '0' after delay;
      --
      WaitForCLKCycle(sysclk, 2, false);
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '1' after delay;
      inbits_exp     <= "1" after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '0' after delay;
      inbits_exp     <= "0" after delay;
      --
      WaitForCLKCycle(sysclk, 1, false);
      inbits_exp     <= "1" after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '0' after delay;
      inbits_exp     <= "0" after delay;
      --
      WaitForCLKCycle(sysclk, 2, false);
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '1' after delay;
      inbits_exp     <= "1" after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '0' after delay;
      inbits_exp     <= "0" after delay;
      --
      WaitForCLKCycle(sysclk, 2, false);
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '0' after delay;
      --
      WaitForCLKCycle(sysclk, 2, false);
      inact_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inact_exp   <= '0' after delay;
      inbvalid_exp   <= '1' after delay;
      WaitForCLKCycle(sysclk, 1, false);
      inbvalid_exp   <= '0' after delay;
      --
      WaitForCLKCycle(sysclk, 2, false);
      --
      wait for 50 us; --  ns
      StopAtEnd( control );
   end process expect;
   
   
   -----------------------------------------------------------------------------
   -- Process monitor
   --! \brief        monitor the results.
   --! \details      The process compare the expected values with the resulting 
   --!               values from the UUT.
   -----------------------------------------------------------------------------
   monitor: process
   begin
      MonitorWaitForStart( "SpwRecvFront", 3, CONTROL_IN ); 
      wait on control, inact_exp, inbvalid_exp, inbits_exp, sysclk; -- compare expected with result
      MonitorStopAtEnd( control, error, CONTROL_OUT );
      MonitorSignal( inact, inact_exp, "inact", error );
      MonitorSignal( inbvalid, inbvalid_exp, "inbvalid", error );
      MonitorSignal( inbits, inbits_exp, "inbits", error );

   end process monitor;
   
end architecture TC2SpwRecvFront_beh;

--------------------------------------------------------------------------------
-- end TC2SpwRecvFront.vhd
--------------------------------------------------------------------------------