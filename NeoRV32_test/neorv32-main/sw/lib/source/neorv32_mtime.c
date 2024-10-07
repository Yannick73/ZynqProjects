// ================================================================================ //
// The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32              //
// Copyright (c) NEORV32 contributors.                                              //
// Copyright (c) 2020 - 2024 Stephan Nolting. All rights reserved.                  //
// Licensed under the BSD-3-Clause license, see LICENSE for details.                //
// SPDX-License-Identifier: BSD-3-Clause                                            //
// ================================================================================ //

/**
 * @file neorv32_mtime.c
 * @brief Machine System Timer (MTIME) HW driver source file.
 *
 * @note These functions should only be used if the MTIME unit was synthesized (IO_MTIME_EN = true).
 *
 * @see https://stnolting.github.io/neorv32/sw/files.html
 */

#include <neorv32.h>


/**********************************************************************//**
 * Check if MTIME unit was synthesized.
 *
 * @return 0 if MTIME was not synthesized, 1 if MTIME is available.
 **************************************************************************/
int neorv32_mtime_available(void) {

  if (NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_MTIME)) {
    return 1;
  }
  else {
    return 0;
  }
}


/**********************************************************************//**
 * Set current system time.
 *
 * @note The MTIME timer increments with the primary processor clock.
 *
 * @param[in] time New system time (uint64_t)
 **************************************************************************/
void neorv32_mtime_set_time(uint64_t time) {

  subwords64_t cycles;

  cycles.uint64 = time;

  // prevent low-to-high carry while writing
  NEORV32_MTIME->TIME_LO = 0;
  NEORV32_MTIME->TIME_HI = cycles.uint32[1];
  NEORV32_MTIME->TIME_LO = cycles.uint32[0];
}


/**********************************************************************//**
 * Get current system time.
 *
 * @note The MTIME timer increments with the primary processor clock.
 *
 * @return Current system time (uint64_t)
 **************************************************************************/
uint64_t neorv32_mtime_get_time(void) {

  subwords64_t cycles;

  uint32_t tmp1, tmp2, tmp3;
  while(1) {
    tmp1 = NEORV32_MTIME->TIME_HI;
    tmp2 = NEORV32_MTIME->TIME_LO;
    tmp3 = NEORV32_MTIME->TIME_HI;
    if (tmp1 == tmp3) {
      break;
    }
  }

  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}


/**********************************************************************//**
 * Set compare time register (MTIMECMP) for generating interrupts.
 *
 * @note The interrupt is triggered when MTIME >= MTIMECMP.
 * @note Global interrupts and the timer interrupt source have to be enabled.
 *
 * @param[in] timecmp System time for interrupt (uint64_t)
 **************************************************************************/
void neorv32_mtime_set_timecmp(uint64_t timecmp) {

  subwords64_t cycles;

  cycles.uint64 = timecmp;

  // prevent MTIMECMP from temporarily becoming smaller than the lesser of the old and new values
  NEORV32_MTIME->TIMECMP_LO = -1;
  NEORV32_MTIME->TIMECMP_HI = cycles.uint32[1];
  NEORV32_MTIME->TIMECMP_LO = cycles.uint32[0];
}


/**********************************************************************//**
 * Get compare time register (MTIMECMP).
 *
 * @return Current MTIMECMP value.
 **************************************************************************/
uint64_t neorv32_mtime_get_timecmp(void) {

  subwords64_t cycles;

  cycles.uint32[0] = NEORV32_MTIME->TIMECMP_LO;
  cycles.uint32[1] = NEORV32_MTIME->TIMECMP_HI;

  return cycles.uint64;
}


/**********************************************************************//**
 * Set TIME to Unix time.
 *
 * @param[in] unixtime Unix time since 00:00:00 UTC, January 1st, 1970 in seconds.
 **************************************************************************/
void neorv32_mtime_set_unixtime(uint64_t unixtime) {

  neorv32_mtime_set_time(((uint64_t)neorv32_sysinfo_get_clk()) * unixtime);
}


/**********************************************************************//**
 * Get Unix time from TIME.
 *
 * @return Unix time since 00:00:00 UTC, January 1st, 1970 in seconds.
 **************************************************************************/
uint64_t neorv32_mtime_get_unixtime(void) {

  return neorv32_mtime_get_time() / ((uint64_t)neorv32_sysinfo_get_clk());
}