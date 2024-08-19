--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwRegisters_pkg.vhd
--!
--! \brief        spwip register definitions.
--!
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 20.09.2017
--! \date         Updated: 02.10.2017
--! \version      V 1.00
--
-- Package      : SpwRegisters (declaration | declaration, body)
-- File version : $Revision: 112 $
--
-- Limitations  : None known
-- Errors       : None known
--
-- Copyright 2021 IWF
-- 
-- This file is part of SpaceWire Light.
--
-- SpaceWire Light is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 2.1 of the License, or
-- (at your option) any later version.
--
-- SpaceWire Light is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public License
-- along with SpaceWire Light.  If not, see <https://www.gnu.org/licenses/>.
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
--! IEEE standard numeric package
use ieee.numeric_std.all;
--------------------------------------------------------------------------------
-- Package SpwRegisters
--! \brief        SpwRegisters - registers definition.
--! \details      The package contains definitions for the internal used 
--!               registers in the SPWIP.
--! - Types
--! \li \ref      spwlink_regs_type - Internal registers for the Spwlink module.
--! \li \ref      spwrecv_regs_type - internal registers for the Spwrecv module.
--! \li \ref      token_type - Token record type.
--! \li \ref      txregs_type - Registers in TXCLK domain.
--! \li \ref      spwxmit_regs_type - Registers in system clock domain.
--! \li \ref      spwxmit_synctx_type - Synchronize to TXCLK type.
--! \li \ref      spwxmit_syncsys_type - Synchronize to system clock type.
-- Comments     : Package skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
package SpwRegisters_pkg is 

   --! Indicates a platform-specific implementation.
   type spw_implementation_type is (
      impl_generic,impl_fast,impl_recovclk );

   --! link fsm type.
   type link_st_t is (
      s_errorreset,s_errorwait,s_ready,s_started,s_connecting,s_run );

   -----------------------------------------------------------------------------
   -- spw_definitions - SPW definitions.
   -----------------------------------------------------------------------------
   --! Convert boolean to std_logic type.
   type bool_to_logic_type is array(boolean) of std_ulogic;
   --! use the bool_to_logic_type to map boolean to std_ulogic.
   constant BOOL_TO_LOGIC : bool_to_logic_type := (false => '0', true => '1');
   --! system clock frequency in Hz.
   constant SYSFREQ : real := 25.0e6;
   --! transmit clock frequency in Hz (only if TXIMPL = impl_fast).
   constant TXCLKFREQ : real := 100.0e6;
   --! maximum number of bits received per system clock.
   constant RXCHUNK : integer range 1 to 6 := 6;
   --! selection of a transmitter implementation.
   constant TXIMPL : spw_implementation_type := impl_fast;
   --! size of the receive FIFO as the 2-logarithm of the number of bytes.
   constant RXFIFOSIZE_BITS : integer := 6;
   --! size of the transmit FIFO as the 2-logarithm of the number of bytes.
   constant TXFIFOSIZE_BITS : integer := 6;

   -----------------------------------------------------------------------------
   -- Type spwlink_regs_type
   --! \brief        Internal registers for the Spwlink module.
   --! \details      The type contains the registers used by the spwlink unit.
   -----------------------------------------------------------------------------
   type spwlink_regs_type is record 
      state       : link_st_t; --! link state machine register.
      tx_credit   : unsigned (5 downto 0); --! tx credit accounting.
      rx_credit   : unsigned (5 downto 0); --! rx credit accounting.
      errcred     : std_ulogic; --! credit error.
      timercnt    : unsigned (10 downto 0); --! reset timer register.
      timerdone   : std_ulogic; --! reset timer done flag.
      xmit_fct_in : std_ulogic; --! signal to transmitter: Tx of FCT is allowed.
      rxen        : std_ulogic; --! receiver enable.
      rx_null_fct : std_ulogic; --! concurrent first null and fct received.
   end record spwlink_regs_type;
   -----------------------------------------------------------------------------
   -- spwrecv unit
   -----------------------------------------------------------------------------
   -- Type spwrecv_regs_type
   --! \brief        internal registers for the Spwrecv module.
   --! \details      The type contains the registers used by the Spwrecv unit.
   -----------------------------------------------------------------------------
   type spwrecv_regs_type is record 
      bit_seen   : std_ulogic; --! got a bit transition.
      null_seen  : std_ulogic; --! got a NULL token.
      bitshift   : std_logic_vector (8 downto 0); --! shift register to receive incoming bits.
      bitcnt     : std_logic_vector (9 downto 0); --! one-hot counter.
      parity     : std_ulogic; --! bit to calculate the parity of the incoming bits.
      control    : std_ulogic; --! next code is control code.
      escaped    : std_ulogic; --! last code was ESC.
      pendeop    : std_ulogic; --! pending EOP.
      pendeep    : std_ulogic; --! pending EEP.
      penderresc : std_ulogic; --! pending escape error.
      pendfct    : unsigned (1 downto 0); --! pending rx FCT. to be able to process two fcts in 1 chunk.
      gotfct     : std_ulogic; --! last code was FCT.
      tick_out   : std_ulogic; --! High for one clock cycle if a TimeCode was just received.
      rxchar     : std_ulogic; --! last code was a normal character (DATA, EOP or EEP).
      rxflag     : std_ulogic; --! High if the received character is EOP or EEP; low if the  received character is a data byte.
      timereg    : std_logic_vector (7 downto 0); --! register for the last TimeCode data.
      datareg    : std_logic_vector (7 downto 0); --! register for the last normal character.
      disccnt    : unsigned (7 downto 0); --! disconnect timer register.
      errpar     : std_ulogic; --! parity error flag.
      erresc     : std_ulogic; --! escape error flag.
   end record spwrecv_regs_type;
   
   -----------------------------------------------------------------------------
   -- spwxmit_fast unit
   -----------------------------------------------------------------------------
   -- Type token_type
   --! \brief        Token record type.
   --! \details      The record contains the data to be transmitted. Data 
   --!               records are passed between clock domains.
   -----------------------------------------------------------------------------
   type token_type is record 
      tick     : std_ulogic; --! send time code.
      fct      : std_ulogic; --! send FCT.
      fctpiggy : std_ulogic; --! send FCT and N-char.
      flag     : std_ulogic; --! send char or (EOP/EEP).
      char     : std_logic_vector (7 downto 0); --! character or time code.
   end record token_type;

   -----------------------------------------------------------------------------
   -- Type txregs_type
   --! \brief        Registers in TXCLK domain.
   --! \details      The record contains the registers in the TXCLK domain.
   -----------------------------------------------------------------------------
   type txregs_type is record 
      -- sync to system clock domain
      txflip0   : std_ulogic; --! flag that ack that token0 has been pulled.
      txflip1   : std_ulogic; --! flag that ack that token1 has been pulled.
      -- stage B
      b_update  : std_ulogic; --! enables the execution of stage B.
      b_mux     : std_ulogic; --! mux selector between token0 and token1.
      b_txflip  : std_ulogic; --! current txflip flag (either txflip0 or txflip1).
      b_valid   : std_ulogic; --! valid flag for the token at stage B.
      b_token   : token_type; --! data/control token at stage B.
      -- stage C
      c_update  : std_ulogic; --! enables the execution of stage C.
      c_busy    : std_ulogic; --! flag to block stage C for more than one pass (for NULL and timecodes).
      c_esc     : std_ulogic; --! flag to send one ESC char.
      c_fct     : std_ulogic; --! flag to send one FCT char.
      c_bits    : std_logic_vector (8 downto 0); --! data bits to be send (EOP, EEP or databyte).
      -- stage D
      d_bits    : std_logic_vector (8 downto 0); --! data bits to be send at stage D (ESC, FCT or c_bits).
      d_cnt4    : std_ulogic; --! flag that denotes that 4 bits are sent.
      d_cnt10   : std_ulogic; --! flag that denotes that 10 bits are sent.
      -- stage E
      e_valid   : std_ulogic; --! flag to load new d_bits to tx and send parity.
      e_shift   : std_logic_vector (9 downto 0); --! 10 bit shift register.
      e_count   : std_logic_vector (9 downto 0); --! one hot counter to know how many bits should be shifted out.
      e_parity  : std_ulogic; --! the calculated parity bit to be sent.
      -- stage F
      f_spwdo   : std_ulogic; --! the value of SPW_DO.
      f_spwso   : std_ulogic; --! the value of SPW_SO.
      -- tx clock enable logic
      txclken   : std_ulogic; --! enables the transmission of 1 bit (denote the bit period).
      txclkpre  : std_ulogic; --! enables the transmission of 1 bit for special divcnt = 0 or 1.
      txclkcnt  : std_logic_vector (7 downto 0); --! counter register.
      txclkcy   : std_logic_vector (2 downto 0); --! counter carry propagate signals.
      txclkdone : std_logic_vector (1 downto 0); --! is "11" when counter = 2.
      txclkdiv  : std_logic_vector (7 downto 0); --! DIVCNT value for Tx bit period.
      txdivnorm : std_ulogic; --! defines if counter divider is 0 or 1 (special cases), so divnorm = 0.
   end record txregs_type;

   -----------------------------------------------------------------------------
   -- Type spwxmit_regs_type
   --! \brief        Registers in system clock domain.
   --! \details      The record contains the registers in the system clock 
   --!               domain for spwxmit_fast unit.
   -----------------------------------------------------------------------------
   type spwxmit_regs_type is record 
      -- sync status to TXCLK domain
      txenreg    : std_ulogic; --! registered value of TXEN.
      txdivreg   : std_logic_vector (7 downto 0); --! registered value of DIVCNT.
      txdivnorm  : std_ulogic; --! defines if counter divider is 0 or 1 (special cases), so divnorm = 0.
      txdivtmp   : std_logic_vector (1 downto 0); --! counter to denote the sampling freq of DIVCNT input.
      txdivsafe  : std_ulogic; --! flag that denotes that txdivreg can be sampled to TXCLK.
      -- data stream to TXCLK domain
      sysflip0   : std_ulogic; --! flag that ack that token0 has been pushed.
      sysflip1   : std_ulogic; --! flag that ack that token1 has been pushed.
      token0     : token_type; --! data/control token.
      token1     : token_type; --! data/control token.
      tokmux     : std_ulogic; --! two-slot FIFO pointer.
      -- transmitter management
      pend_fct   : std_ulogic; --! '1' if an outgoing FCT is pending.
      pend_char  : std_ulogic; --! '1' if an outgoing N-Char is pending.
      pend_data  : std_logic_vector (8 downto 0); --! control flag and data bits of pending char.
      pend_tick  : std_ulogic; --! '1' if an outgoing time tick is pending.
      pend_time  : std_logic_vector (7 downto 0); --! data bits of pending time tick.
      allow_fct  : std_ulogic; --! '1' when allowed to send FCTs.
      allow_char : std_ulogic; --! '1' when allowed to send data and time.
      sent_fct   : std_ulogic; --! '1' when at least one FCT token was sent.
   end record spwxmit_regs_type;

   -----------------------------------------------------------------------------
   -- Type spwxmit_synctx_type
   --! \brief        Synchronize to TXCLK type.
   --! \details      Signals that are re-synchronized from system clock to TXCLK 
   --!               domain.
   -----------------------------------------------------------------------------
   type spwxmit_synctx_type is record 
      sysflip0  : std_ulogic; --! txclk sync of spwxmit_regs_type sysflip0.
      sysflip1  : std_ulogic; --! txclk sync of spwxmit_regs_type sysflip1.
      txen      : std_ulogic; --! txclk sync of spwxmit_regs_type txenreg.
      txdivsafe : std_ulogic; --! txclk sync of spwxmit_regs_type txdivsafe.
   end record spwxmit_synctx_type;

   -----------------------------------------------------------------------------
   -- Type spwxmit_syncsys_type
   --! \brief        Synchronize to system clock type.
   --! \details      Signals that are re-synchronized from TXCLK to system clock 
   --!               domain.
   -----------------------------------------------------------------------------
   type spwxmit_syncsys_type is record 
      txflip0 : std_ulogic; --! sysclk sync of txregs_type txflip0.
      txflip1 : std_ulogic; --! sysclk sync of txregs_type txflip1.
   end record spwxmit_syncsys_type;

end package SpwRegisters_pkg;

--------------------------------------------------------------------------------
-- end SpwRegisters_pkg.vhd
--------------------------------------------------------------------------------
