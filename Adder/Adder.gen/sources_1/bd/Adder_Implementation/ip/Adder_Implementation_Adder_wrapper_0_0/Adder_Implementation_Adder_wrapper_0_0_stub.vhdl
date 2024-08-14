-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Wed Jul  3 23:17:46 2024
-- Host        : yannick-AB350-Gaming-3 running 64-bit Ubuntu 22.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/yannick/Vivado/Adder/Adder.gen/sources_1/bd/Adder_Implementation/ip/Adder_Implementation_Adder_wrapper_0_0/Adder_Implementation_Adder_wrapper_0_0_stub.vhdl
-- Design      : Adder_Implementation_Adder_wrapper_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_Implementation_Adder_wrapper_0_0 is
  Port ( 
    CA : in STD_LOGIC;
    CB : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 7 downto 0 );
    carry : out STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end Adder_Implementation_Adder_wrapper_0_0;

architecture stub of Adder_Implementation_Adder_wrapper_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CA,CB,S[7:0],carry,clk_100MHz,data[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Adder_wrapper,Vivado 2024.1";
begin
end;
