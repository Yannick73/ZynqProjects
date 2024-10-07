// ================================================================================ //
// The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              //
// Copyright (c) NEORV32 contributors.                                              //
// Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  //
// Licensed under the BSD-3-Clause license, see LICENSE for details.                //
// SPDX-License-Identifier: BSD-3-Clause                                            //
// ================================================================================ //

/**
 * @file neorv32_cpu_amo.c
 * @brief Atomic memory access (read-modify-write) emulation functions using LR/SC pairs - source file.
 *
 * @see https://stnolting.github.io/neorv32/sw/files.html
 */

#include <neorv32.h>


/**********************************************************************//**
 * Atomic SWAP (AMOSWAP.W).
 * return <= MEM[addr]; MEM[addr] <= wdata
 *
 * @note This function requires the CPU A ISA extension.
 *
 * @param[in] addr 32-bit memory address, word-aligned.
 * @param[in] wdata Data word to be atomically stored to address (32-bit).
 * @return Pre-operation data loaded from address (32-bit)
 **************************************************************************/
uint32_t neorv32_cpu_amoswapw(uint32_t addr, uint32_t wdata) {

#if defined __riscv_atomic
  uint32_t rdata;
  uint32_t status;

  while(1) {
    rdata  = neorv32_cpu_amolr(addr);
    status = neorv32_cpu_amosc(addr, wdata);
    if (status == 0) {
      break;
    }
  }

  return rdata;
#else
  (void)addr;
  (void)wdata;

  return 0;
#endif
}


/**********************************************************************//**
 * Atomic ADD (AMOADD.W).
 * return <= MEM[addr]; MEM[addr] <= MEM[addr] + wdata
 *
 * @note This function requires the CPU A ISA extension.
 *
 * @param[in] addr 32-bit memory address, word-aligned.
 * @param[in] wdata Data word to be atomically added to original data at address (32-bit).
 * @return Pre-operation data loaded from address (32-bit)
 **************************************************************************/
uint32_t neorv32_cpu_amoaddw(uint32_t addr, uint32_t wdata) {

#if defined __riscv_atomic
  uint32_t rdata;
  uint32_t tmp;
  uint32_t status;

  while(1) {
    rdata  = neorv32_cpu_amolr(addr);
    tmp    = rdata + wdata;
    status = neorv32_cpu_amosc(addr, tmp);
    if (status == 0) {
      break;
    }
  }

  return rdata;
#else
  (void)addr;
  (void)wdata;

  return 0;
#endif
}


/**********************************************************************//**
 * Atomic AND (AMOAND.W).
 * return <= MEM[addr]; MEM[addr] <= MEM[addr] and wdata
 *
 * @note This function requires the CPU A ISA extension.
 *
 * @param[in] addr 32-bit memory address, word-aligned.
 * @param[in] wdata Data word to be atomically AND-ed with original data at address (32-bit).
 * @return Pre-operation data loaded from address (32-bit)
 **************************************************************************/
uint32_t neorv32_cpu_amoandw(uint32_t addr, uint32_t wdata) {

#if defined __riscv_atomic
  uint32_t rdata;
  uint32_t tmp;
  uint32_t status;

  while(1) {
    rdata  = neorv32_cpu_amolr(addr);
    tmp    = rdata & wdata;
    status = neorv32_cpu_amosc(addr, tmp);
    if (status == 0) {
      break;
    }
  }

  return rdata;
#else
  (void)addr;
  (void)wdata;

  return 0;
#endif
}


/**********************************************************************//**
 * Atomic OR (AMOOR.W).
 * return <= MEM[addr]; MEM[addr] <= MEM[addr] or wdata
 *
 * @note This function requires the CPU A ISA extension.
 *
 * @param[in] addr 32-bit memory address, word-aligned.
 * @param[in] wdata Data word to be atomically OR-ed with original data at address (32-bit).
 * @return Pre-operation data loaded from address (32-bit)
 **************************************************************************/
uint32_t neorv32_cpu_amoorw(uint32_t addr, uint32_t wdata) {

#if defined __riscv_atomic
  uint32_t rdata;
  uint32_t tmp;
  uint32_t status;

  while(1) {
    rdata  = neorv32_cpu_amolr(addr);
    tmp    = rdata | wdata;
    status = neorv32_cpu_amosc(addr, tmp);
    if (status == 0) {
      break;
    }
  }

  return rdata;
#else
  (void)addr;
  (void)wdata;

  return 0;
#endif
}


/**********************************************************************//**
 * Atomic XOR (AMOXOR.W).
 * return <= MEM[addr]; MEM[addr] <= MEM[addr] xor wdata
 *
 * @note This function requires the CPU A ISA extension.
 *
 * @param[in] addr 32-bit memory address, word-aligned.
 * @param[in] wdata Data word to be atomically XOR-ed with original data at address (32-bit).
 * @return Pre-operation data loaded from address (32-bit)
 **************************************************************************/
uint32_t neorv32_cpu_amoxorw(uint32_t addr, uint32_t wdata) {

#if defined __riscv_atomic
  uint32_t rdata;
  uint32_t tmp;
  uint32_t status;

  while(1) {
    rdata  = neorv32_cpu_amolr(addr);
    tmp    = rdata ^ wdata;
    status = neorv32_cpu_amosc(addr, tmp);
    if (status == 0) {
      break;
    }
  }

  return rdata;
#else
  (void)addr;
  (void)wdata;

  return 0;
#endif
}


/**********************************************************************//**
 * Atomic signed MAX (AMOMAX.W).
 * return <= MEM[addr]; MEM[addr] <= maximum_signed(MEM[addr], wdata)
 *
 * @note This function requires the CPU A ISA extension.
 *
 * @param[in] addr 32-bit memory address, word-aligned.
 * @param[in] wdata Data word to be atomically MAX-ed with original data at address (signed 32-bit).
 * @return Pre-operation data loaded from address (signed 32-bit)
 **************************************************************************/
int32_t neorv32_cpu_amomaxw(uint32_t addr, int32_t wdata) {

#if defined __riscv_atomic
  int32_t rdata;
  int32_t tmp;
  uint32_t status;

  while(1) {
    rdata  = (int32_t)neorv32_cpu_amolr(addr);
    tmp    = neorv32_aux_max(rdata, wdata);
    status = neorv32_cpu_amosc(addr, tmp);
    if (status == 0) {
      break;
    }
  }

  return rdata;
#else
  (void)addr;
  (void)wdata;

  return 0;
#endif
}


/**********************************************************************//**
 * Atomic unsigned MAX (AMOMAXU.W).
 * return <= MEM[addr]; MEM[addr] <= maximum_unsigned(MEM[addr], wdata)
 *
 * @note This function requires the CPU A ISA extension.
 *
 * @param[in] addr 32-bit memory address, word-aligned.
 * @param[in] wdata Data word to be atomically MAX-ed with original data at address (unsigned 32-bit).
 * @return Pre-operation data loaded from address (unsigned 32-bit)
 **************************************************************************/
uint32_t neorv32_cpu_amomaxuw(uint32_t addr, uint32_t wdata) {

#if defined __riscv_atomic
  uint32_t rdata;
  uint32_t tmp;
  uint32_t status;

  while(1) {
    rdata  = (uint32_t)neorv32_cpu_amolr(addr);
    tmp    = neorv32_aux_max(rdata, wdata);
    status = neorv32_cpu_amosc(addr, tmp);
    if (status == 0) {
      break;
    }
  }

  return rdata;
#else
  (void)addr;
  (void)wdata;

  return 0;
#endif
}


/**********************************************************************//**
 * Atomic signed MIN (AMOMIN.W).
 * return <= MEM[addr]; MEM[addr] <= minimum_signed(MEM[addr], wdata)
 *
 * @note This function requires the CPU A ISA extension.
 *
 * @param[in] addr 32-bit memory address, word-aligned.
 * @param[in] wdata Data word to be atomically MIN-ed with original data at address (signed 32-bit).
 * @return Pre-operation data loaded from address (signed 32-bit)
 **************************************************************************/
int32_t neorv32_cpu_amominw(uint32_t addr, int32_t wdata) {

#if defined __riscv_atomic
  int32_t rdata;
  int32_t tmp;
  uint32_t status;

  while(1) {
    rdata  = (int32_t)neorv32_cpu_amolr(addr);
    tmp    = neorv32_aux_min(rdata, wdata);
    status = neorv32_cpu_amosc(addr, tmp);
    if (status == 0) {
      break;
    }
  }

  return rdata;
#else
  (void)addr;
  (void)wdata;

  return 0;
#endif
}


/**********************************************************************//**
 * Atomic unsigned MIN (AMOMINU.W).
 * return <= MEM[addr]; MEM[addr] <= minimum_unsigned(MEM[addr], wdata)
 *
 * @note This function requires the CPU A ISA extension.
 *
 * @param[in] addr 32-bit memory address, word-aligned.
 * @param[in] wdata Data word to be atomically MIN-ed with original data at address (unsigned 32-bit).
 * @return Pre-operation data loaded from address (unsigned 32-bit)
 **************************************************************************/
uint32_t neorv32_cpu_amominuw(uint32_t addr, uint32_t wdata) {

#if defined __riscv_atomic
  uint32_t rdata;
  uint32_t tmp;
  uint32_t status;

  while(1) {
    rdata  = (uint32_t)neorv32_cpu_amolr(addr);
    tmp    = neorv32_aux_min(rdata, wdata);
    status = neorv32_cpu_amosc(addr, tmp);
    if (status == 0) {
      break;
    }
  }

  return rdata;
#else
  (void)addr;
  (void)wdata;

  return 0;
#endif
}
