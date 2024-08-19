-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:SpwStream:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY SW_standalone_tb_SpwStream_0_0 IS
  PORT (
    AUTOSTART : IN STD_LOGIC;
    LINKSTART : IN STD_LOGIC;
    LINKDIS : IN STD_LOGIC;
    TXDIVCNT : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    TICK_IN : IN STD_LOGIC;
    CTRL_IN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    TIME_IN : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    TXWRITE : IN STD_LOGIC;
    TXFLAG : IN STD_LOGIC;
    TXDATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    RXREAD : IN STD_LOGIC;
    SPW_DI : IN STD_LOGIC;
    SPW_SI : IN STD_LOGIC;
    CLK : IN STD_LOGIC;
    TXCLK : IN STD_LOGIC;
    ARST_N : IN STD_LOGIC;
    CNT_RST : IN STD_LOGIC;
    TXRDY : OUT STD_LOGIC;
    TXHALFF : OUT STD_LOGIC;
    TICK_OUT : OUT STD_LOGIC;
    CTRL_OUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    TIME_OUT : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    RXVALID : OUT STD_LOGIC;
    RXHALFF : OUT STD_LOGIC;
    RXFLAG : OUT STD_LOGIC;
    RXDATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    STARTED : OUT STD_LOGIC;
    CONNECTING : OUT STD_LOGIC;
    RUNNING : OUT STD_LOGIC;
    ERRDISC_CNT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    ERRPAR_CNT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    ERRESC_CNT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    ERRCRED_CNT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    EMPTY_CNT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    SPW_DO : OUT STD_LOGIC;
    SPW_SO : OUT STD_LOGIC
  );
END SW_standalone_tb_SpwStream_0_0;

ARCHITECTURE SW_standalone_tb_SpwStream_0_0_arch OF SW_standalone_tb_SpwStream_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF SW_standalone_tb_SpwStream_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT SpwStream IS
    PORT (
      AUTOSTART : IN STD_LOGIC;
      LINKSTART : IN STD_LOGIC;
      LINKDIS : IN STD_LOGIC;
      TXDIVCNT : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      TICK_IN : IN STD_LOGIC;
      CTRL_IN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      TIME_IN : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      TXWRITE : IN STD_LOGIC;
      TXFLAG : IN STD_LOGIC;
      TXDATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      RXREAD : IN STD_LOGIC;
      SPW_DI : IN STD_LOGIC;
      SPW_SI : IN STD_LOGIC;
      CLK : IN STD_LOGIC;
      TXCLK : IN STD_LOGIC;
      ARST_N : IN STD_LOGIC;
      CNT_RST : IN STD_LOGIC;
      TXRDY : OUT STD_LOGIC;
      TXHALFF : OUT STD_LOGIC;
      TICK_OUT : OUT STD_LOGIC;
      CTRL_OUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      TIME_OUT : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      RXVALID : OUT STD_LOGIC;
      RXHALFF : OUT STD_LOGIC;
      RXFLAG : OUT STD_LOGIC;
      RXDATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      STARTED : OUT STD_LOGIC;
      CONNECTING : OUT STD_LOGIC;
      RUNNING : OUT STD_LOGIC;
      ERRDISC_CNT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      ERRPAR_CNT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      ERRESC_CNT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      ERRCRED_CNT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      EMPTY_CNT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      SPW_DO : OUT STD_LOGIC;
      SPW_SO : OUT STD_LOGIC
    );
  END COMPONENT SpwStream;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF CLK: SIGNAL IS "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF CLK: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF CNT_RST: SIGNAL IS "XIL_INTERFACENAME CNT_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF CNT_RST: SIGNAL IS "xilinx.com:signal:reset:1.0 CNT_RST RST";
BEGIN
  U0 : SpwStream
    PORT MAP (
      AUTOSTART => AUTOSTART,
      LINKSTART => LINKSTART,
      LINKDIS => LINKDIS,
      TXDIVCNT => TXDIVCNT,
      TICK_IN => TICK_IN,
      CTRL_IN => CTRL_IN,
      TIME_IN => TIME_IN,
      TXWRITE => TXWRITE,
      TXFLAG => TXFLAG,
      TXDATA => TXDATA,
      RXREAD => RXREAD,
      SPW_DI => SPW_DI,
      SPW_SI => SPW_SI,
      CLK => CLK,
      TXCLK => TXCLK,
      ARST_N => ARST_N,
      CNT_RST => CNT_RST,
      TXRDY => TXRDY,
      TXHALFF => TXHALFF,
      TICK_OUT => TICK_OUT,
      CTRL_OUT => CTRL_OUT,
      TIME_OUT => TIME_OUT,
      RXVALID => RXVALID,
      RXHALFF => RXHALFF,
      RXFLAG => RXFLAG,
      RXDATA => RXDATA,
      STARTED => STARTED,
      CONNECTING => CONNECTING,
      RUNNING => RUNNING,
      ERRDISC_CNT => ERRDISC_CNT,
      ERRPAR_CNT => ERRPAR_CNT,
      ERRESC_CNT => ERRESC_CNT,
      ERRCRED_CNT => ERRCRED_CNT,
      EMPTY_CNT => EMPTY_CNT,
      SPW_DO => SPW_DO,
      SPW_SO => SPW_SO
    );
END SW_standalone_tb_SpwStream_0_0_arch;
