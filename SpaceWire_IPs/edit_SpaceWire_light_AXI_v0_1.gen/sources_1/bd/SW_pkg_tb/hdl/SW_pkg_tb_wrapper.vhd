--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Fri Aug 16 18:41:11 2024
--Host        : DESKTOP-MEH5DGT running 64-bit major release  (build 9200)
--Command     : generate_target SW_pkg_tb_wrapper.bd
--Design      : SW_pkg_tb_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SW_pkg_tb_wrapper is
end SW_pkg_tb_wrapper;

architecture STRUCTURE of SW_pkg_tb_wrapper is
  component SW_pkg_tb is
  end component SW_pkg_tb;
begin
SW_pkg_tb_i: component SW_pkg_tb
 ;
end STRUCTURE;
