-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1.2 (win64) Build 5164865 Thu Sep  5 14:37:11 MDT 2024
-- Date        : Tue Oct  8 19:52:15 2024
-- Host        : DESKTOP-MEH5DGT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_clk_wiz_0_0/SPW_ZynqSetup_clk_wiz_0_0_stub.vhdl
-- Design      : SPW_ZynqSetup_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SPW_ZynqSetup_clk_wiz_0_0 is
  Port ( 
    TX_clk : out STD_LOGIC;
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end SPW_ZynqSetup_clk_wiz_0_0;

architecture stub of SPW_ZynqSetup_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "TX_clk,resetn,clk_in1";
begin
end;
