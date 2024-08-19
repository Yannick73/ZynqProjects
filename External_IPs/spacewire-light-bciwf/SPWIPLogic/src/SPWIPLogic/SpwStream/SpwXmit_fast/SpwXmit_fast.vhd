--------------------------------------------------------------------------------
-- Institut für Weltraumforschung (IWF)
-- Schmiedelstr. 6, 8042 Graz  Austria
-- www.iwf.oeaw.ac.at
--------------------------------------------------------------------------------
--! \file         SpwXmit_fast.vhd
--!
--! \brief        SpaceWire Transmitter using a separate transmission clock.
--!
--! \author       Joris Van Rantwijk (JVR)     jorisvr@opencores.org
--! \author       Jorge Tonfat  (JTO)          jorge.tonfat@oeaw.ac.at
--! \author       Harald Ottacher  (HOT)       harald.ottacher@oeaw.ac.at
--! \date         Created: 06.06.2010
--! \date         Updated: 03.10.2017
--! \version      V 1.00
--
-- Unit         : SpwXmit_fast (RTL|STR) (entity, architecture)
-- File version : $Revision: 111 $
--
-- Limitations  : None known
-- Errors       : None known
--
-- Copyright 2009-2013 Joris van Rantwijk
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
--  Adapted to IWF coding guidelines by Jorge Tonfat (JTO) jorge.tonfat@oeaw.ac.at
--
--  SpaceWire Transmitter
--
--  This entity translates outgoing characters and tokens into
--  data-strobe signalling.
--
--  The output stage is driven by a separate transmission clock "TXCLK" which
--  will typically be faster than the system clock. The actual transmission
--  rate is determined by dividing the transmission clock by an integer factor.
--
--  The code is tuned for implementation on Xilinx Spartan-3.
--
--  Concept
--  -------
--
--  Logic in the system clock domain generates a stream of tokens to be
--  transmitted. These tokens are encoded as instances of the token_type
--  record. Tokens are queued in a two-slot FIFO buffer (res_seq.token0 and res_seq.token1)
--  with a 1-bit pointer (res_seq.tokmux) pointing to the head of the queue.
--  When a token is pushed into the buffer, a flag register is flipped
--  (res_seq.sysflip0 and res_seq.sysflip1) to indicate to the TXCLK domain that the
--  buffer slot has been refilled.
--
--  The TXCLK domain pulls tokens from the FIFO buffer, flipping flag
--  registers (restx_seq.txflip0 and restx_seq.txflip1) to indicate to the system clock
--  domain that a token has been pulled. When the system clock domain detects
--  that a token has been consumed, it refills the buffer slot with a new
--  token (assuming that there are tokens waiting to be transmitted).
--  Whenever the FIFO buffer is empty, the TXCLK domain sends NULLs instead.
--  This can happen either when there are no tokens to send, or when the
--  system clock domain is late to refill the buffer.
--
--  Details
--  -------
--
--  Logic in the system clock domain accepts transmission requests through
--  the external interface of the entity. Pending requests are translated
--  into a stream of tokens. The tokens are pushed to the TXCLK domain through
--  the FIFO buffer as described above.
--
--  The data path through the TXCLK domain is divided into stages B through F
--  in a half-hearted attempt to keep things simple.
--
--  Stage B takes a token from the FIFO buffer and updates a buffer status
--  flag to indicate that the buffer slot needs to be refilled. If the FIFO
--  is empty, a NULL is inserted. Stage B is triggered one clock after
--  stage E switches to a new token. If the previous token was ESC, stage B
--  skips a turn because stage C will already know what to do.
--
--  Stage C takes a token from stage B and translates it into a bit pattern.
--  Time codes and NULL tokens are broken into two separate tokens starting
--  with ESC. Stage C is triggered one clock after the shift buffer in
--  stage E drops to 3 tokens.
--
--  Stage D completes the task of translating tokens to bit patterns and
--  distinguishes between 10-bit and 4-bit tokens. It is not explicitly
--  triggered but simply follows stage C.
--
--  Stage E is the bit shift register. It shifts when "txclken" is high.
--  A one-hot counter keeps track of the number of bits remaining in
--  the register. When the register falls empty, it loads a new 10-bit or
--  4-bit pattern as prepared by stage D. Stage E also computes parity.
--
--  Stage F performs data strobe encoding. When the transmitter is disabled,
--  the outputs of stage F fall to zero in a controlled way.
--
--  To generate the transmission bit clock, the TXCLK is divided by an
--  integer factor (DIVCNT+1) using an 8-bit down counter. The implementation
--  of this counter has become quite complicated in order to meet timing goals.
--  The counter consists of 4 blocks of two bits each (txclkcnt), with a
--  carry-save concept used between blocks (txclkcy). Detection of terminal
--  count (txclkdone) has a pipeline delay of two cycles. Therefore a separate
--  concept is used if the initial count is less than 2 (txdivnorm). This is
--  all glued together in the final assignment to txclken.
--
--  The initial count for TXCLK division (DIVCNT) comes from the system clock
--  domain and thus needs to be synchronized for use in the TXCLK domain.
--  To facilitate this, the system clock domain latches the value of DIVCNT
--  once every 6 sysclk cycles and sets a flag to indicate when the latched
--  value can safely be used by the TXCLK domain.
--
--  A tricky aspect of the design is the initial state of the TXCLK logic.
--  When the transmitter is enabled (txen goes high), the TXCLK logic starts
--  with the first ESC pattern already set up in stage D, and stage C ready
--  to produce the FCT part of the first NULL.
--
--  The following guidelines are used to get good timing for the TXCLK domain:
--   * The new value of a register depends on at most 4 inputs (single LUT),
--     or in a few cases on 5 inputs (two LUTs and F5MUX).
--   * Synchronous resets may be used, but only if the reset signal comes
--     directly from a register (no logic in set/reset path);
--   * Clock enables may be used, but only if the enable signal comes directly
--     from a register (no logic in clock enable path).
--
--  Synchronization issues
--  ----------------------
--
--  There is a two-slot FIFO buffer between the system and TXCLK domains.
--  After the TXCLK domain pulls a token from the buffer, the system clock
--  domain should ideally refill the buffer before the TXCLK domain again
--  tries to pull from the same buffer slot. If the refill occurs late,
--  the TXCLK domain needs to insert a NULL token which is inefficient
--  use of bandwidth.
--
--  Assuming the transmission consists of a stream of data characters,
--  10 bits per character, there are exactly 2*10 bit periods between
--  successive reads from the same buffer slot by the TXCLK logic.
--
--  The time needed for the system clock logic to refill a buffer slot =
--     1 TXCLK period   (update of restx_seq.txflipN)
--   + 1 TXCLK period   (routing delay between domains)
--   + 2 sysclk periods (synchronizer for txflipN)
--   + 1 sysclk period  (refill buffer slot and update res_seq.sysflipN)
--   + 1 TXCLK period   (routing delay between domains)
--   + 2 TXCLK periods  (synchronizer for sysflipN)
--   = 5 TXCLK periods + 3 sysclk periods
--
--  If for example TXCLK is 4 times as fast as sysclk, this amounts to
--   5 TXCLK + 3 sysclk = 5 + 3*4 TXCLK = 17 TXCLK
--  is less than 20 bit periods even at maximum transmission rate, so
--  no problem there.
--
--  This is different when the data stream includes 4-bit tokens.
--  See the manual for further comments.
--
--  Implementation guidelines
--  -------------------------
--
--  To minimize clock skew, IOB flip-flops should be used to drive
--  SPW_DO and SPW_SO.
--
--  "TXCLK" must be at least as fast as the system clock;
--  "TXCLK" does not need to be phase-related to the system clock;
--  it is allowed for "TXCLK" to be equal to "CLK".
--
--  The following timing constraints are needed:
--   * PERIOD constraint on the system clock;
--   * PERIOD constraint on "TXCLK";
--   * FROM-TO constraint from "TXCLK" to the system clock, equal to
--     one "TXCLK" period;
--   * FROM-TO constraint from the system clock to "TXCLK", equal to
--     one "TXCLK" period.
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

--! work library
library SPWIP;
--! SPWIP record type definitions.
use SPWIP.SpwProtocol_pkg.all;
--! SPWIP registers definition.
use SPWIP.SpwRegisters_pkg.all;

--------------------------------------------------------------------------------
-- Entity SpwXmit_fast
--! \brief        SpwXmit_fast - SpaceWire Transmitter using an independent 
--!               transmission clock.
--! \details      This unit encodes and transmits data or link control 
--!               characters using the data/strobe encoding and an independent 
--!               transmission clock.
-- Comments     : Unit skeleton created by VHDL Generator Plugin (VGP) V 1.09
-- Updates      : 
--------------------------------------------------------------------------------
entity SpwXmit_fast is 
   port ( 
      DIVCNT   : in  std_logic_vector (7 downto 0); --! The transmit clock is divided by (unsigned(DIVCNT) + 1).
      XMITI    : in  spw_xmit_in_type;              --! Input signals from spwlink.
      CLK      : in  std_logic;                     --! unit clock.
      TXCLK    : in  std_logic;                     --! Transmit clock.
      RST_N    : in  std_logic;                     --! unit reset (active-low).
      TX_RST_N : in  std_logic;                     --! tx clock domain reset (active-low).
      XMITO    : out spw_xmit_out_type;             --! Output signals to spwlink.
      SPW_DO   : out std_logic;                     --! Data Out SpaceWire signal.
      SPW_SO   : out std_logic                      --! Strobe Out SpaceWire signal.
   );
    -- -- Turn off FSM extraction to avoid synchronization problems.
    -- attribute FSM_EXTRACT: string;
    -- attribute FSM_EXTRACT of spwxmit_fast: entity is "NO";
    -- TODO: find equivalent commands for Microsemi
end entity SpwXmit_fast;

--------------------------------------------------------------------------------
-- Architecture spwxmit_fast_rtl
--! \brief  SpaceWire transmitter (fast version) behavioural implementation
--!
--! \cdc res_seq.sysflip0 -> synctx.sysflip0 synchronize sysflip0 flag to transmitter (TXCLK) clock (100 MHz).
--! \cdc res_seq.sysflip1 -> synctx.sysflip1 synchronize sysflip1 flag to transmitter (TXCLK) clock (100 MHz).
--! \cdc res_seq.txenreg -> synctx.txen synchronize transmitter enable register to transmitter (TXCLK) clock (100 MHz).
--! \cdc res_seq.txdivsafe -> synctx.txdivsafe synchronize transmission bitrate divider safe flag to transmitter (TXCLK) clock (100 MHz).
--! \cdc restx_seq.txflip0 -> syncsys.txflip0 synchronize txflip0 flag to system (CLK) clock (25 MHz).
--! \cdc restx_seq.txflip1 -> syncsys.txflip1 synchronize txflip1 flag to system (CLK) clock (25 MHz).
--! \cdc res_seq.token0 -> restx_seq.b_token crossing token0 containing the data to be transmitted to transmitter (TXCLK) clock (100 MHz).
--! \cdc res_seq.token1 -> restx_seq.b_token crossing token1 containing the data to be transmitted to transmitter (TXCLK) clock (100 MHz).
--! \cdc res_seq.txdivreg -> restx_seq.txclkdiv crossing transmission bitrate divider to transmitter (TXCLK) clock (100 MHz).
--! \cdc res_seq.txdivnorm -> restx_seq.txdivnorm crossing transmission bitrate divider normal flag to transmitter (TXCLK) clock (100 MHz).
--------------------------------------------------------------------------------
architecture spwxmit_fast_rtl of SpwXmit_fast is 
   -----------------------------------------------------------------------------
   -- spwxmit_fast_definitions - reset value for record type registers.
   -----------------------------------------------------------------------------
   --! reset value for token_type registers.
   constant TOKEN_RESET : token_type := ( tick => '0', fct => '0', fctpiggy => '0',
       flag => '0', char => (others => '0') );
   --! reset value for txregs_type registers.
   constant TXREGS_RESET : txregs_type := ( txflip0 => '0', txflip1 => '0',
       b_update => '0', b_mux => '0', b_txflip => '0',  b_valid => '0',
       b_token => TOKEN_RESET, c_update => '0', c_busy => '1', c_esc => '1',
       c_fct => '1', c_bits => "000000101", d_bits => "000000111", d_cnt4 => '1',
       d_cnt10 => '0', e_valid => '0', e_shift => (others => '0'),
       e_count => (0 => '1', others => '0'), e_parity => '0', f_spwdo => '0',
       f_spwso => '0', txclken => '0', txclkpre => '1', txclkcnt => (others => '0'),
       txclkcy => (others => '0'), txclkdone => "00", txclkdiv => (others => '0'),
       txdivnorm => '0');
   --! reset value for spwxmit_regs_type registers.
   constant REGS_RESET : spwxmit_regs_type := ( txenreg => '0',
       txdivreg => (others => '0'), txdivnorm => '0', txdivtmp => "00",
       txdivsafe => '0', sysflip0 => '0', sysflip1 => '0', token0 => TOKEN_RESET,
       token1 => TOKEN_RESET, tokmux => '0', pend_fct => '0', pend_char => '0',
       pend_data => (others => '0'), pend_tick => '0', pend_time => (others => '0'),
       allow_fct => '0', allow_char => '0', sent_fct => '0' );
   -----------------------------------------------------------------------------
   signal restx_seq : txregs_type;          --! txclk registers result sequential.
   signal restx_com : txregs_type;          --! txclk registers result combinatorial.
   signal res_seq   : spwxmit_regs_type;    --! system clock registers result sequential.
   signal res_com   : spwxmit_regs_type;    --! system clock registers result combinatorial.
   signal synctx    : spwxmit_synctx_type;  --! synchronized signals to the txclk domain.
   signal syncsys   : spwxmit_syncsys_type; --! synchronized signals to the system clock domain.
   signal s_spwdo   : std_logic;            --! output flipflop for SPW_DO.
   signal s_spwso   : std_logic;            --! output flipflop for SPW_SO.

   -----------------------------------------------------------------------------
   -- Component SyncDff
   --! \brief  Double flip-flop synchronizer.
   -----------------------------------------------------------------------------
   component SyncDff is 
      port ( 
         DI    : in  std_logic; -- input data.
         CLK   : in  std_logic; -- unit clock (destination clock domain).
         RST_N : in  std_logic; -- unit reset (active-low).
         DO    : out std_logic  -- output data.
      );
   end component SyncDff;

   -----------------------------------------------------------------------------
   -- -- Force use of IOB flip-flops
   -- attribute IOB: string;
   -- attribute IOB of s_spwdo: signal is "TRUE";
   -- attribute IOB of s_spwso: signal is "TRUE";
   -- LATER: place this flip flops near the PADS
begin

   -----------------------------------------------------------------------------
   -- STRUCTURE
   SYNCTXSYSFLIP0: SyncDff
   port map(res_seq.sysflip0, TXCLK, TX_RST_N, synctx.sysflip0);

   SYNCTXSYSFLIP1: SyncDff
   port map(res_seq.sysflip1, TXCLK, TX_RST_N, synctx.sysflip1);

   SYNCTXTXEN: SyncDff
   port map(res_seq.txenreg, TXCLK, TX_RST_N, synctx.txen);

   SYNCTXTXDIVSAFE: SyncDff
   port map(res_seq.txdivsafe, TXCLK, TX_RST_N, synctx.txdivsafe);

   SYNCSYSTXFLIP0: SyncDff
   port map(restx_seq.txflip0, CLK, RST_N, syncsys.txflip0);

   SYNCSYSTXFLIP1: SyncDff
   port map(restx_seq.txflip1, CLK, RST_N, syncsys.txflip1);

   -----------------------------------------------------------------------------
   -- Process setRegisters
   --! \brief        Combinatorial process of SpwXmit_fast unit.
   --! \details      Combinatorial process to set the registers from Tx and 
   --!               system clock domains.
   --!               [combinatorial process]
   --! - Sensitive To
   --! \arg \ref     DIVCNT    - Scaling factor of the transmit clock to transmit rate (level).
   --! \arg \ref     XMITI     - Input signals from spwlink (level).
   --! \arg \ref     res_seq   - registers in system clock domain (level).
   --! \arg \ref     restx_seq - registers in transmission clock domain (level).
   --! \arg \ref     synctx    - Synchronized signals from system clock to TXCLK domain (level).
   --! \arg \ref     syncsys   - Synchronized signals from TXCLK to system clock domain (level).
   --! \arg \ref     s_spwdo   - flipflop for SPW_DO.
   --! \arg \ref     s_spwso   - flipflop for SPW_SO.
   -----------------------------------------------------------------------------
   setRegisters: process( DIVCNT, XMITI, res_seq, restx_seq, synctx, syncsys, s_spwdo, s_spwso )
      variable v          : spwxmit_regs_type;
      variable vtx        : txregs_type;
      variable vneedtoken : std_ulogic;
      variable vhavetoken : std_ulogic;
      variable vtoken     : token_type;
   begin
      v          := res_seq;
      vtx        := restx_seq;
      vneedtoken := '0';
      vhavetoken := '0';
      vtoken     := token_reset;
      -- ---- FAST CLOCK DOMAIN ----
      -- Stage B: Multiplex tokens from system clock domain.
      -- Update stage B three bit periods after updating stage C
      -- (i.e. in time for the next update of stage C).
      -- Do not update stage B if stage C is indicating that it needs to
      -- send a second token to complete its task.
      vtx.b_update := restx_seq.txclken and restx_seq.e_count(0) and (not restx_seq.c_busy);
      if ( restx_seq.b_mux = '0' ) then
         vtx.b_txflip := restx_seq.txflip0;
      else
         vtx.b_txflip := restx_seq.txflip1;
      end if; -- restx_seq.b_mux
      if ( restx_seq.b_update = '1' ) then
         if ( restx_seq.b_mux = '0' ) then
            -- TODO: check the correctness of the timing of these signals: res_seq.token0 res_seq.token1
            -- Update JTO 26.11.18 The correct timing of these signals depends on 
            -- the frequency relation of system clock and transmission clock.
            -- See the OpenCores SpaceWire Light IP manual for more details.
            -- get token from slot 0
            vtx.b_valid := synctx.sysflip0 xor restx_seq.b_txflip;
            vtx.b_token := res_seq.token0;
            -- update mux flag if we got a valid token
            vtx.b_mux   := synctx.sysflip0 xor restx_seq.b_txflip;
            vtx.txflip0 := synctx.sysflip0;
            vtx.txflip1 := restx_seq.txflip1;
         else
            -- get token from slot 1
            vtx.b_valid := synctx.sysflip1 xor restx_seq.b_txflip;
            vtx.b_token := res_seq.token1;
            -- update mux flag if we got a valid token
            vtx.b_mux   := not (synctx.sysflip1 xor restx_seq.b_txflip);
            vtx.txflip0 := restx_seq.txflip0;
            vtx.txflip1 := synctx.sysflip1;
         end if; -- restx_seq.b_mux
      end if; -- restx_seq.b_update
      -- Stage C: Prepare to transmit EOP, EEP or a data character.
      vtx.c_update := restx_seq.txclken and restx_seq.e_count(3);
      if ( restx_seq.c_update = '1' ) then
         -- NULL is broken into two tokens: ESC + FCT.
         -- Time-codes are broken into two tokens: ESC + char.
         -- Enable c_esc on the first pass of a NULL or a time-code.
         vtx.c_esc   := (restx_seq.b_token.tick or (not restx_seq.b_valid)) and
                        (not restx_seq.c_esc);
         -- Enable c_fct on the first pass of an FCT and on
         -- the second pass of a NULL (also the first pass, but c_esc
         -- is stronger than c_fct).
         vtx.c_fct   := (restx_seq.b_token.fct and (not restx_seq.c_busy)) or
                     (not restx_seq.b_valid);
         -- Enable c_busy on the first pass of a NULL or a time-code
         -- or a piggy-backed FCT. This will tell stage B that we are
         -- not done yet.
         vtx.c_busy  := (restx_seq.b_token.tick or (not restx_seq.b_valid) or
                     restx_seq.b_token.fctpiggy) and (not restx_seq.c_busy);
         if ( restx_seq.b_token.flag = '1' ) then
            if ( restx_seq.b_token.char(0) = '0' ) then
               -- prepare to send EOP
               vtx.c_bits  := "000000101"; -- EOP = P101
            else
               -- prepare to send EEP
               vtx.c_bits  := "000000011"; -- EEP = P110
            end if; -- restx_seq.b_token.char(0)
         else
            -- prepare to send data char
            vtx.c_bits  := restx_seq.b_token.char & '0';
         end if; -- restx_seq.b_token.flag
      end if; -- restx_seq.c_update
      -- Stage D: Prepare to transmit FCT, ESC, or the stuff from stage C.
      if ( restx_seq.c_esc = '1' ) then
         -- prepare to send ESC
         vtx.d_bits  := "000000111";     -- ESC = P111
         vtx.d_cnt4  := '1';             -- 3 bits + implicit parity bit
         vtx.d_cnt10 := '0';
      elsif ( restx_seq.c_fct = '1' ) then
         -- prepare to send FCT
         vtx.d_bits  := "000000001";     -- FCT = P100
         vtx.d_cnt4  := '1';             -- 3 bits + implicit parity bit
         vtx.d_cnt10 := '0';
      else
         -- send the stuff from stage C.
         vtx.d_bits  := restx_seq.c_bits;
         vtx.d_cnt4  := restx_seq.c_bits(0);
         vtx.d_cnt10 := not restx_seq.c_bits(0);
      end if; -- restx_seq.c_fct
      -- Stage E: Shift register.
      if ( restx_seq.txclken = '1' ) then
         if ( restx_seq.e_count(0) = '1' ) then
            -- reload shift register; output parity bit
            vtx.e_valid  := '1';
            vtx.e_shift(vtx.e_shift'high downto 1) := restx_seq.d_bits;
            vtx.e_shift(0) := not (restx_seq.e_parity xor restx_seq.d_bits(0));
            vtx.e_count  := restx_seq.d_cnt10 & "00000" & restx_seq.d_cnt4 & "000";
            vtx.e_parity := restx_seq.d_bits(0);
         else
            -- shift bits to output; update parity bit
            vtx.e_shift  := '0' & restx_seq.e_shift(restx_seq.e_shift'high downto 1);
            vtx.e_count  := '0' & restx_seq.e_count(restx_seq.e_count'high downto 1);
            vtx.e_parity := restx_seq.e_parity xor restx_seq.e_shift(1);
         end if; -- restx_seq.e_count(0)
      end if; -- restx_seq.txclken
      -- Stage F: Data/strobe encoding.
      if ( restx_seq.txclken = '1' ) then
         if ( restx_seq.e_valid = '1' ) then
            -- output next data/strobe bits
            vtx.f_spwdo := restx_seq.e_shift(0);
            vtx.f_spwso := not (restx_seq.e_shift(0) xor restx_seq.f_spwdo xor restx_seq.f_spwso);
         else
            -- gentle reset of spacewire signals
            vtx.f_spwdo := restx_seq.f_spwdo and restx_seq.f_spwso;
            vtx.f_spwso := '0';
         end if; -- restx_seq.e_valid
      end if; -- restx_seq.txclken
      -- Generate tx clock enable
      -- An 8-bit counter decrements on every clock. A txclken pulse is
      -- produced 2 cycles after the counter reaches value 2. Counter reload
      -- values of 0 and 1 are handled as special cases.
      -- count down in blocks of two bits
      vtx.txclkcnt(1 downto 0) := std_logic_vector(unsigned(restx_seq.txclkcnt(1 downto 0)) - 1);
      vtx.txclkcnt(3 downto 2) := std_logic_vector(unsigned(restx_seq.txclkcnt(3 downto 2)) - unsigned(restx_seq.txclkcy(0 downto 0)));
      vtx.txclkcnt(5 downto 4) := std_logic_vector(unsigned(restx_seq.txclkcnt(5 downto 4)) - unsigned(restx_seq.txclkcy(1 downto 1)));
      vtx.txclkcnt(7 downto 6) := std_logic_vector(unsigned(restx_seq.txclkcnt(7 downto 6)) - unsigned(restx_seq.txclkcy(2 downto 2)));
      -- propagate carry in blocks of two bits
      vtx.txclkcy(0) := bool_to_logic(restx_seq.txclkcnt(1 downto 0) = "00");
      vtx.txclkcy(1) := restx_seq.txclkcy(0) and bool_to_logic(restx_seq.txclkcnt(3 downto 2) = "00");
      vtx.txclkcy(2) := restx_seq.txclkcy(1) and bool_to_logic(restx_seq.txclkcnt(5 downto 4) = "00");
      -- detect value 2 in counter
      vtx.txclkdone(0) := bool_to_logic(restx_seq.txclkcnt(3 downto 0) = "0010");
      vtx.txclkdone(1) := bool_to_logic(restx_seq.txclkcnt(7 downto 4) = "0000");
      -- trigger txclken
      vtx.txclken  := (restx_seq.txclkdone(0) and restx_seq.txclkdone(1)) or restx_seq.txclkpre;
      vtx.txclkpre := (not restx_seq.txdivnorm) and ((not restx_seq.txclkpre) or (not restx_seq.txclkdiv(0)));
      -- reload counter
      if ( restx_seq.txclken = '1' ) then
         vtx.txclkcnt  := restx_seq.txclkdiv;
         vtx.txclkcy   := "000";
         vtx.txclkdone := "00";
      end if; -- restx_seq.txclken
      -- Synchronize txclkdiv
      if ( synctx.txdivsafe = '1' ) then
         -- TODO: check the correctness of the timing of these signals
         -- Update JTO 26.11.18 This clock crossing domain is correct since 
         -- txdivsafe is synchronized using the SyncDff sub-unit.
         vtx.txclkdiv  := res_seq.txdivreg;
         vtx.txdivnorm := res_seq.txdivnorm;
      end if; --synctx.txdivsafe
      -- Transmitter disabled.
      if ( synctx.txen = '0' ) then
         vtx.txflip0   := '0';
         vtx.txflip1   := '0';
         vtx.b_update  := '0';
         vtx.b_mux     := '0';
         vtx.b_valid   := '0';
         vtx.c_update  := '0';
         vtx.c_busy    := '1';
         vtx.c_esc     := '1';           -- need to send 2nd part of NULL
         vtx.c_fct     := '1';
         vtx.d_bits    := "000000111";   -- ESC = P111
         vtx.d_cnt4    := '1';           -- 3 bits + implicit parity bit
         vtx.d_cnt10   := '0';
         vtx.e_valid   := '0';
         vtx.e_parity  := '0';
         vtx.e_count   := (0 => '1', others => '0');
      end if; -- synctx.txen
      -- ---- SYSTEM CLOCK DOMAIN ----
      -- Hold DIVCNT and txen for use by TXCLK domain.
      v.txdivtmp  := std_logic_vector(unsigned(res_seq.txdivtmp) - 1);
      if ( res_seq.txdivtmp = "00" ) then
         if ( res_seq.txdivsafe = '0' ) then
            -- Latch the current value of DIVCNT and txen.
            v.txdivsafe := '1';
            v.txdivtmp  := "01";
            v.txdivreg  := DIVCNT;
            if ( unsigned(DIVCNT(DIVCNT'high downto 1)) = 0 ) then
               v.txdivnorm := '0';
            else
               v.txdivnorm := '1';
            end if; -- unsigned(DIVCNT(DIVCNT'high downto 1))
            v.txenreg   := XMITI.txen;
         else
            -- Drop the txdivsafe flag but keep latched values.
            v.txdivsafe := '0';
         end if; -- res_seq.txdivsafe
      end if; -- res_seq.txdivtmp
      -- Pass falling edge of txen signal as soon as possible.
      if ( XMITI.txen = '0' ) then
         v.txenreg   := '0';
      end if; -- XMITI.txen
      -- Store requests for FCT transmission.
      if ( XMITI.fct_in = '1' and res_seq.allow_fct = '1' ) then
         v.pend_fct  := '1';
      end if; -- XMITI.fct_in
      if ( XMITI.txen = '0' ) then
         -- Transmitter disabled; reset state.
         v.sysflip0    := '0';
         v.sysflip1    := '0';
         v.tokmux      := '0';
         v.pend_fct    := '0';
         v.pend_char   := '0';
         v.pend_tick   := '0';
         v.allow_fct   := '0';
         v.allow_char  := '0';
         v.sent_fct    := '0';
      else
         -- Determine if a new token is needed.
         if ( res_seq.tokmux = '0' ) then
            if ( res_seq.sysflip0 = syncsys.txflip0 ) then
               vneedtoken := '1';
            end if; -- res_seq.sysflip0
         else
            if ( res_seq.sysflip1 = syncsys.txflip1 ) then
               vneedtoken := '1';
            end if; -- res_seq.sysflip1
         end if; -- res_seq.tokmux
         -- Prepare new token.
         if ( res_seq.allow_char = '1' and res_seq.pend_tick = '1' ) then
            -- prepare to send time code
            vtoken.tick  := '1';
            vtoken.fct   := '0';
            vtoken.fctpiggy := '0';
            vtoken.flag  := '0';
            vtoken.char  := res_seq.pend_time;
            vhavetoken   := '1';
            if ( vneedtoken = '1' ) then
               v.pend_tick := '0';
            end if; -- vneedtoken
         else
            if ( res_seq.allow_fct = '1' and (XMITI.fct_in = '1' or res_seq.pend_fct = '1') ) then
               -- prepare to send FCT
               vtoken.fct   := '1';
               vhavetoken   := '1';
               if ( vneedtoken = '1' ) then
                  v.pend_fct  := '0';
                  v.sent_fct  := '1';
               end if; -- vneedtoken
            end if; -- res_seq.allow_fct
            if ( res_seq.allow_char = '1' and res_seq.pend_char = '1' ) then
               -- prepare to send N-Char
               -- Note: it is possible to send an FCT and an N-Char
               -- together by enabling the fctpiggy flag.
               vtoken.fctpiggy := vtoken.fct;
               vtoken.flag  := res_seq.pend_data(8);
               vtoken.char  := res_seq.pend_data(7 downto 0);
               vhavetoken   := '1';
               if ( vneedtoken = '1' ) then
                  v.pend_char := '0';
               end if; -- vneedtoken
            end if; -- res_seq.allow_char
         end if; -- res_seq.allow_char
         -- Put new token in slot.
         if ( vhavetoken = '1' ) then
            if ( res_seq.tokmux = '0' ) then
               if ( res_seq.sysflip0 = syncsys.txflip0 ) then
                  v.sysflip0  := not res_seq.sysflip0;
                  v.token0    := vtoken;
                  v.tokmux    := '1';
               end if; -- res_seq.tokmux
            else
               if ( res_seq.sysflip1 = syncsys.txflip1 ) then
                  v.sysflip1  := not res_seq.sysflip1;
                  v.token1    := vtoken;
                  v.tokmux    := '0';
               end if; -- res_seq.sysflip1
            end if; -- res_seq.tokmux
         end if; -- vhavetoken
         -- Determine whether we are allowed to send FCTs and characters
         v.allow_fct  := not XMITI.stnull;
         v.allow_char := (not XMITI.stnull) and (not XMITI.stfct) and res_seq.sent_fct;
         -- Store request for data transmission.
         if ( XMITI.txwrite = '1' and res_seq.allow_char = '1' and res_seq.pend_char = '0' ) then
            v.pend_char  := '1';
            v.pend_data  := XMITI.txflag & XMITI.txdata;
         end if; -- XMITI.txwrite
         -- Store requests for time tick transmission.
         if ( XMITI.tick_in = '1' ) then
            v.pend_tick := '1';
            v.pend_time := XMITI.ctrl_in & XMITI.time_in;
         end if; -- XMITI.tick_in
      end if; -- XMITI.txen
      -- Drive outputs.
      -- Note: the outputs are combinatorially dependent on certain inputs.
      -- Set fctack high if (FCT requested) and (FCTs allowed) AND
      -- (no FCT pending)
      XMITO.fctack <= XMITI.fct_in and XMITI.txen and res_seq.allow_fct and
                  (not res_seq.pend_fct);
      -- Set txrdy high if (character requested) AND (characters allowed) AND
      -- (no character pending)
      XMITO.txack <= XMITI.txwrite and XMITI.txen and res_seq.allow_char and
                  (not res_seq.pend_char);

      -- Drive SpaceWire output signals
      SPW_DO      <= s_spwdo;
      SPW_SO      <= s_spwso;

      -- Update registers.
      res_com     <= v;
      restx_com   <= vtx;
   end process setRegisters;

   -----------------------------------------------------------------------------
   -- Process updateTxRegs
   --! \brief        Sequential process for txclk domain registers.
   --! \details      Sequential process to update the registers from Tx clock 
   --!               domain.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     TXCLK    - transmission clock (rising edge).
   --! \arg \ref     TX_RST_N - tx clock domain reset (active-low).
   -----------------------------------------------------------------------------
   updateTxRegs: process( TXCLK, TX_RST_N )
   begin
      if ( TX_RST_N = '0' ) then
         restx_seq <= TXREGS_RESET;
         -- not possible to gentle reset DO AND SO during reset
         s_spwdo <= '0';
         s_spwso <= '0';
      elsif ( rising_edge(TXCLK) ) then
         -- drive spacewire output signals
         s_spwdo <= restx_seq.f_spwdo;
         s_spwso <= restx_seq.f_spwso;
         -- update registers
         restx_seq <= restx_com;
      end if; -- rising_edge(TXCLK)
   end process updateTxRegs;

   -----------------------------------------------------------------------------
   -- Process updateRegs
   --! \brief        Sequential process for system clk domain registers.
   --! \details      Sequential process to update the registers from system 
   --!               clock domain.
   --!               [sequential process]
   --! - Sensitive To
   --! \arg \ref     CLK   - system clock (rising edge).
   --! \arg \ref     RST_N - system clock domain reset (active-low).
   -----------------------------------------------------------------------------
   updateRegs: process( CLK, RST_N )
   begin
      if ( RST_N = '0' ) then
         res_seq <= REGS_RESET;
      elsif ( rising_edge(CLK) ) then
         -- update registers
         res_seq <= res_com;
      end if; -- rising_edge(CLK)
   end process updateRegs;

end architecture spwxmit_fast_rtl;

--------------------------------------------------------------------------------
-- end SpwXmit_fast.vhd
--------------------------------------------------------------------------------
