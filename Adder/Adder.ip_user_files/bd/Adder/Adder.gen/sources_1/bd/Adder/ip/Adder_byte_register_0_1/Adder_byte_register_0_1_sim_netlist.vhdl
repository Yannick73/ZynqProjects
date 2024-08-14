-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Wed Jul  3 23:27:55 2024
-- Host        : yannick-AB350-Gaming-3 running 64-bit Ubuntu 22.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/yannick/Vivado/Adder/Adder.gen/sources_1/bd/Adder/ip/Adder_byte_register_0_1/Adder_byte_register_0_1_sim_netlist.vhdl
-- Design      : Adder_byte_register_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Adder_byte_register_0_1_byte_register is
  port (
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of Adder_byte_register_0_1_byte_register : entity is "byte_register";
end Adder_byte_register_0_1_byte_register;

architecture STRUCTURE of Adder_byte_register_0_1_byte_register is
begin
\Q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => c,
      CE => '1',
      D => D(0),
      Q => Q(0),
      R => '0'
    );
\Q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => c,
      CE => '1',
      D => D(1),
      Q => Q(1),
      R => '0'
    );
\Q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => c,
      CE => '1',
      D => D(2),
      Q => Q(2),
      R => '0'
    );
\Q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => c,
      CE => '1',
      D => D(3),
      Q => Q(3),
      R => '0'
    );
\Q_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => c,
      CE => '1',
      D => D(4),
      Q => Q(4),
      R => '0'
    );
\Q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => c,
      CE => '1',
      D => D(5),
      Q => Q(5),
      R => '0'
    );
\Q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => c,
      CE => '1',
      D => D(6),
      Q => Q(6),
      R => '0'
    );
\Q_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => c,
      CE => '1',
      D => D(7),
      Q => Q(7),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Adder_byte_register_0_1 is
  port (
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Adder_byte_register_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of Adder_byte_register_0_1 : entity is "Adder_byte_register_0_1,byte_register,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of Adder_byte_register_0_1 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of Adder_byte_register_0_1 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of Adder_byte_register_0_1 : entity is "byte_register,Vivado 2024.1";
end Adder_byte_register_0_1;

architecture STRUCTURE of Adder_byte_register_0_1 is
begin
inst: entity work.Adder_byte_register_0_1_byte_register
     port map (
      D(7 downto 0) => D(7 downto 0),
      Q(7 downto 0) => Q(7 downto 0),
      c => c
    );
end STRUCTURE;
