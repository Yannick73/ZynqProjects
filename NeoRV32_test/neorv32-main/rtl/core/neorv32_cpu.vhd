-- ================================================================================ --
-- NEORV32 CPU - CPU Top Entity                                                     --
-- -------------------------------------------------------------------------------- --
-- HQ:           https://github.com/stnolting/neorv32                               --
-- Data Sheet:   https://stnolting.github.io/neorv32                                --
-- User Guide:   https://stnolting.github.io/neorv32/ug                             --
-- Software Ref: https://stnolting.github.io/neorv32/sw/files.html                  --
-- -------------------------------------------------------------------------------- --
-- The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              --
-- Copyright (c) NEORV32 contributors.                                              --
-- Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  --
-- Licensed under the BSD-3-Clause license, see LICENSE for details.                --
-- SPDX-License-Identifier: BSD-3-Clause                                            --
-- ================================================================================ --

library ieee;
use ieee.std_logic_1164.all;

library neorv32;
use neorv32.neorv32_package.all;

entity neorv32_cpu is
  generic (
    -- General --
    HART_ID             : std_ulogic_vector(31 downto 0); -- hardware thread ID
    VENDOR_ID           : std_ulogic_vector(31 downto 0); -- vendor's JEDEC ID
    BOOT_ADDR           : std_ulogic_vector(31 downto 0); -- cpu boot address
    DEBUG_PARK_ADDR     : std_ulogic_vector(31 downto 0); -- cpu debug mode parking loop entry address
    DEBUG_EXC_ADDR      : std_ulogic_vector(31 downto 0); -- cpu debug mode exception entry address
    -- RISC-V ISA Extensions --
    RISCV_ISA_C         : boolean; -- implement compressed extension
    RISCV_ISA_E         : boolean; -- implement embedded RF extension
    RISCV_ISA_M         : boolean; -- implement mul/div extension
    RISCV_ISA_U         : boolean; -- implement user mode extension
    RISCV_ISA_Zalrsc    : boolean; -- implement atomic reservation-set extension
    RISCV_ISA_Zba       : boolean; -- implement shifted-add bit-manipulation extension
    RISCV_ISA_Zbb       : boolean; -- implement basic bit-manipulation extension
    RISCV_ISA_Zbkb      : boolean; -- implement bit-manipulation instructions for cryptography
    RISCV_ISA_Zbkc      : boolean; -- implement carry-less multiplication instructions
    RISCV_ISA_Zbkx      : boolean; -- implement cryptography crossbar permutation extension
    RISCV_ISA_Zbs       : boolean; -- implement single-bit bit-manipulation extension
    RISCV_ISA_Zfinx     : boolean; -- implement 32-bit floating-point extension
    RISCV_ISA_Zicntr    : boolean; -- implement base counters
    RISCV_ISA_Zicond    : boolean; -- implement integer conditional operations
    RISCV_ISA_Zihpm     : boolean; -- implement hardware performance monitors
    RISCV_ISA_Zknd      : boolean; -- implement cryptography NIST AES decryption extension
    RISCV_ISA_Zkne      : boolean; -- implement cryptography NIST AES encryption extension
    RISCV_ISA_Zknh      : boolean; -- implement cryptography NIST hash extension
    RISCV_ISA_Zksed     : boolean; -- implement ShangMi hash extension
    RISCV_ISA_Zksh      : boolean; -- implement ShangMi block cypher extension
    RISCV_ISA_Zmmul     : boolean; -- implement multiply-only M sub-extension
    RISCV_ISA_Zxcfu     : boolean; -- implement custom (instr.) functions unit
    RISCV_ISA_Sdext     : boolean; -- implement external debug mode extension
    RISCV_ISA_Sdtrig    : boolean; -- implement trigger module extension
    RISCV_ISA_Smpmp     : boolean; -- implement physical memory protection
    -- Tuning Options --
    FAST_MUL_EN         : boolean; -- use DSPs for M extension's multiplier
    FAST_SHIFT_EN       : boolean; -- use barrel shifter for shift operations
    REGFILE_HW_RST      : boolean; -- implement full hardware reset for register file
    -- Physical Memory Protection (PMP) --
    PMP_NUM_REGIONS     : natural range 0 to 16; -- number of regions (0..16)
    PMP_MIN_GRANULARITY : natural; -- minimal region granularity in bytes, has to be a power of 2, min 4 bytes
    PMP_TOR_MODE_EN     : boolean; -- implement TOR mode
    PMP_NAP_MODE_EN     : boolean; -- implement NAPOT/NA4 modes
    -- Hardware Performance Monitors (HPM) --
    HPM_NUM_CNTS        : natural range 0 to 13; -- number of implemented HPM counters (0..13)
    HPM_CNT_WIDTH       : natural range 0 to 64  -- total size of HPM counters (0..64)
  );
  port (
    -- global control --
    clk_i      : in  std_ulogic; -- switchable global clock, rising edge
    clk_aux_i  : in  std_ulogic; -- always-on clock, rising edge
    rstn_i     : in  std_ulogic; -- global reset, low-active, async
    sleep_o    : out std_ulogic; -- cpu is in sleep mode when set
    debug_o    : out std_ulogic; -- cpu is in debug mode when set
    -- interrupts --
    msi_i      : in  std_ulogic; -- risc-v machine software interrupt
    mei_i      : in  std_ulogic; -- risc-v machine external interrupt
    mti_i      : in  std_ulogic; -- risc-v machine timer interrupt
    firq_i     : in  std_ulogic_vector(15 downto 0); -- custom fast interrupts
    dbi_i      : in  std_ulogic; -- risc-v debug halt request interrupt
    -- instruction bus interface --
    ibus_req_o : out bus_req_t; -- request bus
    ibus_rsp_i : in  bus_rsp_t; -- response bus
    -- data bus interface --
    dbus_req_o : out bus_req_t; -- request bus
    dbus_rsp_i : in  bus_rsp_t  -- response bus
  );
end neorv32_cpu;

architecture neorv32_cpu_rtl of neorv32_cpu is

  -- auto-configuration --
  constant rf_rs3_en_c : boolean := RISCV_ISA_Zxcfu or RISCV_ISA_Zfinx; -- 3rd register file read port
  constant riscv_b_c   : boolean := RISCV_ISA_Zba and RISCV_ISA_Zbb and RISCV_ISA_Zbs; -- B: bit manipulation
  constant riscv_zkt_c : boolean := FAST_SHIFT_EN; -- Zkt: data-independent execution time for cryptographic operations
  constant riscv_zkn_c : boolean := RISCV_ISA_Zbkb and RISCV_ISA_Zbkc and RISCV_ISA_Zbkx and
                                    RISCV_ISA_Zkne and RISCV_ISA_Zknd and RISCV_ISA_Zknh; -- Zkn: NIST suite
  constant riscv_zks_c : boolean := RISCV_ISA_Zbkb and RISCV_ISA_Zbkc and RISCV_ISA_Zbkx and
                                    RISCV_ISA_Zksh and RISCV_ISA_Zksed; -- Zks: ShangMi suite

  -- external CSR interface --
  signal xcsr_we        : std_ulogic;
  signal xcsr_addr      : std_ulogic_vector(11 downto 0);
  signal xcsr_wdata     : std_ulogic_vector(XLEN-1 downto 0);
  signal xcsr_rdata_pmp : std_ulogic_vector(XLEN-1 downto 0);
  signal xcsr_rdata_alu : std_ulogic_vector(XLEN-1 downto 0);
  signal xcsr_rdata_res : std_ulogic_vector(XLEN-1 downto 0);

  -- local signals --
  signal ctrl          : ctrl_bus_t; -- main control bus
  signal alu_imm       : std_ulogic_vector(XLEN-1 downto 0); -- immediate
  signal rf_wdata      : std_ulogic_vector(XLEN-1 downto 0); -- register file write data
  signal rs1, rs2, rs3 : std_ulogic_vector(XLEN-1 downto 0); -- source registers
  signal alu_res       : std_ulogic_vector(XLEN-1 downto 0); -- alu result
  signal alu_add       : std_ulogic_vector(XLEN-1 downto 0); -- alu address result
  signal alu_cmp       : std_ulogic_vector(1 downto 0);      -- comparator result
  signal lsu_rdata     : std_ulogic_vector(XLEN-1 downto 0); -- lsu memory read data
  signal alu_cp_done   : std_ulogic;                         -- alu co-processor operation done
  signal lsu_wait      : std_ulogic;                         -- wait for current data bus access
  signal csr_rdata     : std_ulogic_vector(XLEN-1 downto 0); -- csr read data
  signal lsu_mar       : std_ulogic_vector(XLEN-1 downto 0); -- lsu memory address register
  signal lsu_err       : std_ulogic_vector(3 downto 0);      -- lsu alignment/access errors
  signal pc_fetch      : std_ulogic_vector(XLEN-1 downto 0); -- pc for instruction fetch
  signal pc_curr       : std_ulogic_vector(XLEN-1 downto 0); -- current pc (for currently executed instruction)
  signal pc_next       : std_ulogic_vector(XLEN-1 downto 0); -- next pc (return address)
  signal pmp_ex_fault  : std_ulogic;                         -- pmp instruction fetch fault
  signal pmp_rw_fault  : std_ulogic;                         -- pmp read/write access fault
  signal irq_machine   : std_ulogic_vector(2 downto 0);      -- risc-v standard machine-level interrupts

begin

  -- Sanity Checks --------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  -- CPU ISA configuration (in alphabetical order - not in canonical order!) --
  assert false report "[NEORV32] CPU ISA: rv32" &
    cond_sel_string_f(RISCV_ISA_E,      "e",         "i") &
    cond_sel_string_f(riscv_b_c,        "b",         "" ) &
    cond_sel_string_f(RISCV_ISA_C,      "c",         "" ) &
    cond_sel_string_f(RISCV_ISA_M,      "m",         "" ) &
    cond_sel_string_f(RISCV_ISA_U,      "u",         "" ) &
    cond_sel_string_f(true,             "x",         "" ) & -- always enabled
    cond_sel_string_f(RISCV_ISA_Zalrsc, "_zalrsc",   "" ) &
    cond_sel_string_f(RISCV_ISA_Zba,    "_zba",      "" ) &
    cond_sel_string_f(RISCV_ISA_Zbb,    "_zbb",      "" ) &
    cond_sel_string_f(RISCV_ISA_Zbkb,   "_zbkb",     "" ) &
    cond_sel_string_f(RISCV_ISA_Zbkc,   "_zbkc",     "" ) &
    cond_sel_string_f(RISCV_ISA_Zbkx,   "_zbkx",     "" ) &
    cond_sel_string_f(RISCV_ISA_Zbs,    "_zbs",      "" ) &
    cond_sel_string_f(RISCV_ISA_Zicntr, "_zicntr",   "" ) &
    cond_sel_string_f(RISCV_ISA_Zicond, "_zicond",   "" ) &
    cond_sel_string_f(true,             "_zicsr",    "" ) & -- always enabled
    cond_sel_string_f(true,             "_zifencei", "" ) & -- always enabled
    cond_sel_string_f(RISCV_ISA_Zihpm,  "_zihpm",    "" ) &
    cond_sel_string_f(RISCV_ISA_Zfinx,  "_zfinx",    "" ) &
    cond_sel_string_f(riscv_zkn_c,      "_zkn",      "" ) &
    cond_sel_string_f(RISCV_ISA_Zknd,   "_zknd",     "" ) &
    cond_sel_string_f(RISCV_ISA_Zkne,   "_zkne",     "" ) &
    cond_sel_string_f(RISCV_ISA_Zknh,   "_zknh",     "" ) &
    cond_sel_string_f(riscv_zks_c,      "_zks",      "" ) &
    cond_sel_string_f(RISCV_ISA_Zksed,  "_zksed",    "" ) &
    cond_sel_string_f(RISCV_ISA_Zksh,   "_zksh",     "" ) &
    cond_sel_string_f(riscv_zkt_c,      "_zkt",      "" ) &
    cond_sel_string_f(RISCV_ISA_Zmmul,  "_zmmul",    "" ) &
    cond_sel_string_f(RISCV_ISA_Zxcfu,  "_zxcfu",    "" ) &
    cond_sel_string_f(RISCV_ISA_Sdext,  "_sdext",    "" ) &
    cond_sel_string_f(RISCV_ISA_Sdtrig, "_sdtrig",   "" ) &
    cond_sel_string_f(RISCV_ISA_Smpmp,  "_smpmp",    "" )
    severity note;

  -- CPU tuning options --
  assert false report "[NEORV32] CPU tuning options: " &
    cond_sel_string_f(FAST_MUL_EN,    "fast_mul ",   "") &
    cond_sel_string_f(FAST_SHIFT_EN,  "fast_shift ", "") &
    cond_sel_string_f(REGFILE_HW_RST, "rf_hw_rst ",  "")
    severity note;

  -- simulation notifier --
  assert not is_simulation_c report "[NEORV32] Assuming this is a simulation." severity warning;


  -- Control Unit ---------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  neorv32_cpu_control_inst: entity neorv32.neorv32_cpu_control
  generic map (
    -- General --
    HART_ID          => HART_ID,          -- hardware thread ID
    VENDOR_ID        => VENDOR_ID,        -- vendor's JEDEC ID
    BOOT_ADDR        => BOOT_ADDR,        -- cpu boot address
    DEBUG_PARK_ADDR  => DEBUG_PARK_ADDR,  -- cpu debug mode parking loop entry address
    DEBUG_EXC_ADDR   => DEBUG_EXC_ADDR,   -- cpu debug mode exception entry address
    -- RISC-V ISA Extensions --
    RISCV_ISA_B      => riscv_b_c,        -- implement bit-manipulation extension
    RISCV_ISA_C      => RISCV_ISA_C,      -- implement compressed extension
    RISCV_ISA_E      => RISCV_ISA_E,      -- implement embedded RF extension
    RISCV_ISA_M      => RISCV_ISA_M,      -- implement mul/div extension
    RISCV_ISA_U      => RISCV_ISA_U,      -- implement user mode extension
    RISCV_ISA_Zalrsc => RISCV_ISA_Zalrsc, -- implement atomic reservation-set extension
    RISCV_ISA_Zba    => RISCV_ISA_Zba,    -- implement shifted-add bit-manipulation extension
    RISCV_ISA_Zbb    => RISCV_ISA_Zbb,    -- implement basic bit-manipulation extension
    RISCV_ISA_Zbkb   => RISCV_ISA_Zbkb,   -- implement bit-manipulation instructions for cryptography
    RISCV_ISA_Zbkc   => RISCV_ISA_Zbkc,   -- implement carry-less multiplication instructions
    RISCV_ISA_Zbkx   => RISCV_ISA_Zbkx,   -- implement cryptography crossbar permutation extension
    RISCV_ISA_Zbs    => RISCV_ISA_Zbs,    -- implement single-bit bit-manipulation extension
    RISCV_ISA_Zfinx  => RISCV_ISA_Zfinx,  -- implement 32-bit floating-point extension
    RISCV_ISA_Zicntr => RISCV_ISA_Zicntr, -- implement base counters
    RISCV_ISA_Zicond => RISCV_ISA_Zicond, -- implement integer conditional operations
    RISCV_ISA_Zihpm  => RISCV_ISA_Zihpm,  -- implement hardware performance monitors
    RISCV_ISA_Zkn    => riscv_zkn_c,      -- NIST algorithm suite available
    RISCV_ISA_Zknd   => RISCV_ISA_Zknd,   -- implement cryptography NIST AES decryption extension
    RISCV_ISA_Zkne   => RISCV_ISA_Zkne,   -- implement cryptography NIST AES encryption extension
    RISCV_ISA_Zknh   => RISCV_ISA_Zknh,   -- implement cryptography NIST hash extension
    RISCV_ISA_Zks    => riscv_zks_c,      -- ShangMi algorithm suite available
    RISCV_ISA_Zksed  => RISCV_ISA_Zksed,  -- implement ShangMi block cypher extension
    RISCV_ISA_Zksh   => RISCV_ISA_Zksh,   -- implement ShangMi hash extension
    RISCV_ISA_Zkt    => riscv_zkt_c,      -- data-independent execution time available (for cryptographic operations)
    RISCV_ISA_Zmmul  => RISCV_ISA_Zmmul,  -- implement multiply-only M sub-extension
    RISCV_ISA_Zxcfu  => RISCV_ISA_Zxcfu,  -- implement custom (instr.) functions unit
    RISCV_ISA_Sdext  => RISCV_ISA_Sdext,  -- implement external debug mode extension
    RISCV_ISA_Sdtrig => RISCV_ISA_Sdtrig, -- implement trigger module extension
    RISCV_ISA_Smpmp  => RISCV_ISA_Smpmp,  -- implement physical memory protection
    -- Tuning Options --
    FAST_MUL_EN      => FAST_MUL_EN,      -- use DSPs for M extension's multiplier
    FAST_SHIFT_EN    => FAST_SHIFT_EN,    -- use barrel shifter for shift operations
    REGFILE_HW_RST   => REGFILE_HW_RST,   -- implement full hardware reset for register file
    -- Hardware Performance Monitors (HPM) --
    HPM_NUM_CNTS     => HPM_NUM_CNTS,     -- number of implemented HPM counters (0..13)
    HPM_CNT_WIDTH    => HPM_CNT_WIDTH     -- total size of HPM counters
  )
  port map (
    -- global control --
    clk_i         => clk_i,          -- global clock, rising edge
    clk_aux_i     => clk_aux_i,      -- always-on clock, rising edge
    rstn_i        => rstn_i,         -- global reset, low-active, async
    ctrl_o        => ctrl,           -- main control bus
    -- instruction fetch interface --
    ibus_pmperr_i => pmp_ex_fault,   -- instruction fetch pmp fault
    ibus_req_o    => ibus_req_o,     -- request
    ibus_rsp_i    => ibus_rsp_i,     -- response
    -- data path interface --
    alu_cp_done_i => alu_cp_done,    -- ALU iterative operation done
    alu_cmp_i     => alu_cmp,        -- comparator status
    alu_add_i     => alu_add,        -- ALU address result
    alu_imm_o     => alu_imm,        -- immediate
    rf_rs1_i      => rs1,            -- rf source 1
    pc_fetch_o    => pc_fetch,       -- instruction fetch address
    pc_curr_o     => pc_curr,        -- current PC (corresponding to current instruction)
    pc_next_o     => pc_next,        -- next PC (return address)
    csr_rdata_o   => csr_rdata,      -- CSR read data
    -- external CSR interface --
    xcsr_we_o     => xcsr_we,        -- global write enable
    xcsr_addr_o   => xcsr_addr,      -- address
    xcsr_wdata_o  => xcsr_wdata,     -- write data
    xcsr_rdata_i  => xcsr_rdata_res, -- read data
    -- interrupts --
    irq_dbg_i     => dbi_i,          -- debug mode (halt) request
    irq_machine_i => irq_machine,    -- risc-v mti, mei, msi
    irq_fast_i    => firq_i,         -- fast interrupts
    -- load/store unit interface --
    lsu_wait_i    => lsu_wait,       -- wait for data bus
    lsu_mar_i     => lsu_mar,        -- memory address register
    lsu_err_i     => lsu_err         -- alignment/access errors
  );

  -- RISC-V machine interrupts --
  irq_machine <= mti_i & mei_i & msi_i;

  -- external CSR read-back --
  xcsr_rdata_res <= xcsr_rdata_pmp or xcsr_rdata_alu;

  -- CPU state --
  sleep_o <= ctrl.cpu_sleep; -- set when CPU is sleeping (after WFI)
  debug_o <= ctrl.cpu_debug; -- set when CPU is in debug mode


  -- Register File --------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  neorv32_cpu_regfile_inst: entity neorv32.neorv32_cpu_regfile
  generic map (
    RST_EN => REGFILE_HW_RST, -- enable dedicated hardware reset ("ASIC style")
    RVE_EN => RISCV_ISA_E,    -- implement embedded RF extension
    RS3_EN => rf_rs3_en_c     -- enable 3rd read port
  )
  port map (
    -- global control --
    clk_i  => clk_i,    -- global clock, rising edge
    rstn_i => rstn_i,   -- global reset, low-active, async
    ctrl_i => ctrl,     -- main control bus
    -- operands --
    rd_i   => rf_wdata, -- destination operand rd
    rs1_o  => rs1,      -- source operand rs1
    rs2_o  => rs2,      -- source operand rs2
    rs3_o  => rs3       -- source operand rs3
  );

  -- all buses are zero unless there is an according operation --
  rf_wdata <= alu_res or lsu_rdata or csr_rdata or pc_next;


  -- ALU (Arithmetic/Logic Unit) and ALU Co-Processors --------------------------------------
  -- -------------------------------------------------------------------------------------------
  neorv32_cpu_alu_inst: entity neorv32.neorv32_cpu_alu
  generic map (
    -- RISC-V CPU Extensions --
    RISCV_ISA_M      => RISCV_ISA_M,      -- implement mul/div extension
    RISCV_ISA_Zba    => RISCV_ISA_Zba,    -- implement address-generation instruction
    RISCV_ISA_Zbb    => RISCV_ISA_Zbb,    -- implement basic bit-manipulation instruction
    RISCV_ISA_Zbkb   => RISCV_ISA_Zbkb,   -- implement bit-manipulation instructions for cryptography
    RISCV_ISA_Zbkc   => RISCV_ISA_Zbkc,   -- implement carry-less multiplication instructions
    RISCV_ISA_Zbkx   => RISCV_ISA_Zbkx,   -- implement cryptography crossbar permutation extension
    RISCV_ISA_Zbs    => RISCV_ISA_Zbs,    -- implement single-bit instructions
    RISCV_ISA_Zfinx  => RISCV_ISA_Zfinx,  -- implement 32-bit floating-point extension
    RISCV_ISA_Zicond => RISCV_ISA_Zicond, -- implement integer conditional operations
    RISCV_ISA_Zknd   => RISCV_ISA_Zknd,   -- implement cryptography NIST AES decryption extension
    RISCV_ISA_Zkne   => RISCV_ISA_Zkne,   -- implement cryptography NIST AES encryption extension
    RISCV_ISA_Zknh   => RISCV_ISA_Zknh,   -- implement cryptography NIST hash extension
    RISCV_ISA_Zksed  => RISCV_ISA_Zksed,  -- implement ShangMi block cypher extension
    RISCV_ISA_Zksh   => RISCV_ISA_Zksh,   -- implement ShangMi hash extension
    RISCV_ISA_Zmmul  => RISCV_ISA_Zmmul,  -- implement multiply-only M sub-extension
    RISCV_ISA_Zxcfu  => RISCV_ISA_Zxcfu,  -- implement custom (instr.) functions unit
    -- Tuning Options --
    FAST_MUL_EN      => FAST_MUL_EN,      -- use DSPs for M extension's multiplier
    FAST_SHIFT_EN    => FAST_SHIFT_EN     -- use barrel shifter for shift operations
  )
  port map (
    -- global control --
    clk_i       => clk_i,          -- global clock, rising edge
    rstn_i      => rstn_i,         -- global reset, low-active, async
    ctrl_i      => ctrl,           -- main control bus
    -- CSR interface --
    csr_we_i    => xcsr_we,        -- global write enable
    csr_addr_i  => xcsr_addr,      -- address
    csr_wdata_i => xcsr_wdata,     -- write data
    csr_rdata_o => xcsr_rdata_alu, -- read data
    -- data input --
    rs1_i       => rs1,            -- rf source 1
    rs2_i       => rs2,            -- rf source 2
    rs3_i       => rs3,            -- rf source 3
    pc_i        => pc_curr,        -- current PC
    imm_i       => alu_imm,        -- immediate
    -- data output --
    cmp_o       => alu_cmp,        -- comparator status
    res_o       => alu_res,        -- ALU result
    add_o       => alu_add,        -- address computation result
    -- status --
    cp_done_o   => alu_cp_done     -- iterative processing units done?
  );


  -- Load/Store Unit ------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  neorv32_cpu_lsu_inst: entity neorv32.neorv32_cpu_lsu
  generic map (
    AMO_LRSC_ENABLE => RISCV_ISA_Zalrsc -- enable atomic LR/SC operations
  )
  port map (
    -- global control --
    clk_i       => clk_i,        -- global clock, rising edge
    rstn_i      => rstn_i,       -- global reset, low-active, async
    ctrl_i      => ctrl,         -- main control bus
    -- cpu data access interface --
    addr_i      => alu_add,      -- access address
    wdata_i     => rs2,          -- write data
    rdata_o     => lsu_rdata,    -- read data
    mar_o       => lsu_mar,      -- memory address register
    wait_o      => lsu_wait,     -- wait for access to complete
    err_o       => lsu_err,      -- alignment/access errors
    pmp_fault_i => pmp_rw_fault, -- PMP read/write access fault
    -- data bus --
    dbus_req_o  => dbus_req_o,   -- request
    dbus_rsp_i  => dbus_rsp_i    -- response
  );


  -- Physical Memory Protection -------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  pmp_inst_true:
  if RISCV_ISA_Smpmp generate
    neorv32_cpu_pmp_inst: entity neorv32.neorv32_cpu_pmp
    generic map (
      NUM_REGIONS => PMP_NUM_REGIONS,     -- number of regions (0..16)
      GRANULARITY => PMP_MIN_GRANULARITY, -- minimal region granularity in bytes, has to be a power of 2, min 4 bytes
      TOR_EN      => PMP_TOR_MODE_EN,     -- implement TOR mode
      NAP_EN      => PMP_NAP_MODE_EN      -- implement NAPOT/NA4 modes
    )
    port map (
      -- global control --
      clk_i       => clk_i,          -- global clock, rising edge
      rstn_i      => rstn_i,         -- global reset, low-active, async
      ctrl_i      => ctrl,           -- main control bus
      -- CSR interface --
      csr_we_i    => xcsr_we,        -- global write enable
      csr_addr_i  => xcsr_addr,      -- address
      csr_wdata_i => xcsr_wdata,     -- write data
      csr_rdata_o => xcsr_rdata_pmp, -- read data
      -- address input --
      addr_if_i   => pc_fetch,       -- instruction fetch address
      addr_ls_i   => alu_add,        -- load/store address
      -- faults --
      fault_ex_o  => pmp_ex_fault,   -- instruction fetch fault
      fault_rw_o  => pmp_rw_fault    -- read/write access fault
    );
  end generate;

  pmp_inst_false:
  if not RISCV_ISA_Smpmp generate
    xcsr_rdata_pmp <= (others => '0');
    pmp_ex_fault   <= '0';
    pmp_rw_fault   <= '0';
  end generate;


end neorv32_cpu_rtl;