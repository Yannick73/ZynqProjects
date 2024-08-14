-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Wed Jul  3 23:17:46 2024
-- Host        : yannick-AB350-Gaming-3 running 64-bit Ubuntu 22.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/yannick/Vivado/Adder/Adder.gen/sources_1/bd/Adder_Implementation/ip/Adder_Implementation_Adder_wrapper_0_0/Adder_Implementation_Adder_wrapper_0_0_sim_netlist.vhdl
-- Design      : Adder_Implementation_Adder_wrapper_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Adder_Implementation_Adder_wrapper_0_0_Adder is
  port (
    CA : in STD_LOGIC;
    CB : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 7 downto 0 );
    carry : out STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of Adder_Implementation_Adder_wrapper_0_0_Adder : entity is "Adder.hwdef";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of Adder_Implementation_Adder_wrapper_0_0_Adder : entity is "Adder";
end Adder_Implementation_Adder_wrapper_0_0_Adder;

architecture STRUCTURE of Adder_Implementation_Adder_wrapper_0_0_Adder is
  component Adder_Implementation_Adder_wrapper_0_0_Adder_byte_register_0_1 is
  port (
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component Adder_Implementation_Adder_wrapper_0_0_Adder_byte_register_0_1;
  component Adder_Implementation_Adder_wrapper_0_0_Adder_byte_register_0_3 is
  port (
    D : in STD_LOGIC_VECTOR ( 7 downto 0 );
    c : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component Adder_Implementation_Adder_wrapper_0_0_Adder_byte_register_0_3;
  component Adder_Implementation_Adder_wrapper_0_0_Adder_c_addsub_0_0 is
  port (
    A : in STD_LOGIC_VECTOR ( 7 downto 0 );
    B : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC;
    C_OUT : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component Adder_Implementation_Adder_wrapper_0_0_Adder_c_addsub_0_0;
  signal byte_register_0_Q : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal byte_register_1_Q : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of byte_register_0 : label is "byte_register,Vivado 2024.1";
  attribute X_CORE_INFO of byte_register_1 : label is "byte_register,Vivado 2024.1";
  attribute X_CORE_INFO of c_addsub_0 : label is "c_addsub_v12_0_18,Vivado 2024.1";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CA : signal is "xilinx.com:signal:clock:1.0 CLK.CA CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CA : signal is "XIL_INTERFACENAME CLK.CA, CLK_DOMAIN Adder_CA, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of CB : signal is "xilinx.com:signal:clock:1.0 CLK.CB CLK";
  attribute X_INTERFACE_PARAMETER of CB : signal is "XIL_INTERFACENAME CLK.CB, CLK_DOMAIN Adder_CB, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of carry : signal is "xilinx.com:signal:data:1.0 DATA.CARRY DATA";
  attribute X_INTERFACE_PARAMETER of carry : signal is "XIL_INTERFACENAME DATA.CARRY, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of clk_100MHz : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK";
  attribute X_INTERFACE_PARAMETER of clk_100MHz : signal is "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN Adder_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
byte_register_0: component Adder_Implementation_Adder_wrapper_0_0_Adder_byte_register_0_1
     port map (
      D(7 downto 0) => data(7 downto 0),
      Q(7 downto 0) => byte_register_0_Q(7 downto 0),
      c => CB
    );
byte_register_1: component Adder_Implementation_Adder_wrapper_0_0_Adder_byte_register_0_3
     port map (
      D(7 downto 0) => data(7 downto 0),
      Q(7 downto 0) => byte_register_1_Q(7 downto 0),
      c => CA
    );
c_addsub_0: component Adder_Implementation_Adder_wrapper_0_0_Adder_c_addsub_0_0
     port map (
      A(7 downto 0) => byte_register_1_Q(7 downto 0),
      B(7 downto 0) => byte_register_0_Q(7 downto 0),
      CLK => clk_100MHz,
      C_OUT => carry,
      S(7 downto 0) => S(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Adder_Implementation_Adder_wrapper_0_0_Adder_wrapper is
  port (
    S : out STD_LOGIC_VECTOR ( 7 downto 0 );
    carry : out STD_LOGIC;
    CA : in STD_LOGIC;
    CB : in STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of Adder_Implementation_Adder_wrapper_0_0_Adder_wrapper : entity is "Adder_wrapper";
end Adder_Implementation_Adder_wrapper_0_0_Adder_wrapper;

architecture STRUCTURE of Adder_Implementation_Adder_wrapper_0_0_Adder_wrapper is
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of Adder_i : label is "Adder.hwdef";
begin
Adder_i: entity work.Adder_Implementation_Adder_wrapper_0_0_Adder
     port map (
      CA => CA,
      CB => CB,
      S(7 downto 0) => S(7 downto 0),
      carry => carry,
      clk_100MHz => clk_100MHz,
      data(7 downto 0) => data(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Adder_Implementation_Adder_wrapper_0_0 is
  port (
    CA : in STD_LOGIC;
    CB : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 7 downto 0 );
    carry : out STD_LOGIC;
    clk_100MHz : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Adder_Implementation_Adder_wrapper_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of Adder_Implementation_Adder_wrapper_0_0 : entity is "Adder_Implementation_Adder_wrapper_0_0,Adder_wrapper,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of Adder_Implementation_Adder_wrapper_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of Adder_Implementation_Adder_wrapper_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of Adder_Implementation_Adder_wrapper_0_0 : entity is "Adder_wrapper,Vivado 2024.1";
end Adder_Implementation_Adder_wrapper_0_0;

architecture STRUCTURE of Adder_Implementation_Adder_wrapper_0_0 is
begin
inst: entity work.Adder_Implementation_Adder_wrapper_0_0_Adder_wrapper
     port map (
      CA => CA,
      CB => CB,
      S(7 downto 0) => S(7 downto 0),
      carry => carry,
      clk_100MHz => clk_100MHz,
      data(7 downto 0) => data(7 downto 0)
    );
end STRUCTURE;
