-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Wed Jul  3 23:27:55 2024
-- Host        : yannick-AB350-Gaming-3 running 64-bit Ubuntu 22.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/yannick/Vivado/Adder/Adder.gen/sources_1/bd/Adder/ip/Adder_byte_register_0_1/Adder_byte_register_0_1_stub.vhdl
-- Design      : Adder_byte_register_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_byte_register_0_1 is
  Port ( 
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end Adder_byte_register_0_1;

architecture stub of Adder_byte_register_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "D[7:0],c,Q[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "byte_register,Vivado 2024.1";
begin
end;
