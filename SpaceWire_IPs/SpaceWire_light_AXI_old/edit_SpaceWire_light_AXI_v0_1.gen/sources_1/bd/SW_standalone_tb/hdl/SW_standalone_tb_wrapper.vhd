--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Sun Aug 18 23:06:19 2024
--Host        : DESKTOP-MEH5DGT running 64-bit major release  (build 9200)
--Command     : generate_target SW_standalone_tb_wrapper.bd
--Design      : SW_standalone_tb_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SW_standalone_tb_wrapper is
  port (
    reset_rtl : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end SW_standalone_tb_wrapper;

architecture STRUCTURE of SW_standalone_tb_wrapper is
  component SW_standalone_tb is
  port (
    sys_clock : in STD_LOGIC;
    reset_rtl : in STD_LOGIC
  );
  end component SW_standalone_tb;
begin
SW_standalone_tb_i: component SW_standalone_tb
     port map (
      reset_rtl => reset_rtl,
      sys_clock => sys_clock
    );
end STRUCTURE;
