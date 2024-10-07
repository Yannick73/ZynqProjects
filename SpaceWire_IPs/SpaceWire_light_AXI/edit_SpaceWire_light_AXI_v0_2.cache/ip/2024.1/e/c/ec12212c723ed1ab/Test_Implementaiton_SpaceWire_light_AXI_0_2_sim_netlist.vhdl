-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
-- Date        : Mon Oct  7 16:50:41 2024
-- Host        : DESKTOP-MEH5DGT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Test_Implementaiton_SpaceWire_light_AXI_0_2_sim_netlist.vhdl
-- Design      : Test_Implementaiton_SpaceWire_light_AXI_0_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut is
  port (
    axi_streamout_tvalid : out STD_LOGIC;
    SPW_RXREAD : out STD_LOGIC;
    rxflag_ff_reg_0 : out STD_LOGIC;
    axi_streamout_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_streamout_aclk : in STD_LOGIC;
    RDATA : in STD_LOGIC_VECTOR ( 8 downto 0 );
    SPW_main_clk : in STD_LOGIC;
    RXVALID : in STD_LOGIC;
    axi_streamout_tready : in STD_LOGIC;
    axi_streamout_aresetn : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out_fifo_reg[6]_0\ : in STD_LOGIC;
    out_fifo0 : in STD_LOGIC;
    \out_fifo_reg[7]_0\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut is
  signal \M_AXIS_TDATA[0]__0_i_1_n_0\ : STD_LOGIC;
  signal \M_AXIS_TDATA[1]__0_i_1_n_0\ : STD_LOGIC;
  signal \M_AXIS_TDATA[2]__0_i_1_n_0\ : STD_LOGIC;
  signal \M_AXIS_TDATA[3]__0_i_1_n_0\ : STD_LOGIC;
  signal \M_AXIS_TDATA[4]__0_i_1_n_0\ : STD_LOGIC;
  signal \M_AXIS_TDATA[5]__0_i_1_n_0\ : STD_LOGIC;
  signal \M_AXIS_TDATA[6]__0_i_1_n_0\ : STD_LOGIC;
  signal \M_AXIS_TDATA[7]__0_i_1_n_0\ : STD_LOGIC;
  signal M_AXIS_TDATA_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal M_AXIS_TVALID0 : STD_LOGIC;
  signal \^spw_rxread\ : STD_LOGIC;
  signal \^axi_streamout_tdata\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^axi_streamout_tvalid\ : STD_LOGIC;
  signal escape_fifo : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \escape_fifo[7]_i_3_n_0\ : STD_LOGIC;
  signal fifo_full : STD_LOGIC;
  signal fifo_full_i_1_n_0 : STD_LOGIC;
  signal \out_fifo[0]_i_1_n_0\ : STD_LOGIC;
  signal \out_fifo[1]_i_1_n_0\ : STD_LOGIC;
  signal \out_fifo[2]_i_1_n_0\ : STD_LOGIC;
  signal \out_fifo[3]_i_1_n_0\ : STD_LOGIC;
  signal \out_fifo[4]_i_1_n_0\ : STD_LOGIC;
  signal \out_fifo[5]_i_1_n_0\ : STD_LOGIC;
  signal \out_fifo[6]_i_2_n_0\ : STD_LOGIC;
  signal \out_fifo[7]_i_1_n_0\ : STD_LOGIC;
  signal \out_fifo_reg_n_0_[0]\ : STD_LOGIC;
  signal \out_fifo_reg_n_0_[1]\ : STD_LOGIC;
  signal \out_fifo_reg_n_0_[2]\ : STD_LOGIC;
  signal \out_fifo_reg_n_0_[3]\ : STD_LOGIC;
  signal \out_fifo_reg_n_0_[4]\ : STD_LOGIC;
  signal \out_fifo_reg_n_0_[5]\ : STD_LOGIC;
  signal \out_fifo_reg_n_0_[6]\ : STD_LOGIC;
  signal \out_fifo_reg_n_0_[7]\ : STD_LOGIC;
  signal read_spw_rx_i_1_n_0 : STD_LOGIC;
  signal rxfifo_ff : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \rxfifo_ff[7]_i_1_n_0\ : STD_LOGIC;
  signal \^rxflag_ff_reg_0\ : STD_LOGIC;
  signal rxflag_ff_reg_n_0 : STD_LOGIC;
  signal send_escape : STD_LOGIC;
  signal send_escape_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \M_AXIS_TDATA[7]__0_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of M_AXIS_TVALID_i_1 : label is "soft_lutpair94";
begin
  SPW_RXREAD <= \^spw_rxread\;
  axi_streamout_tdata(7 downto 0) <= \^axi_streamout_tdata\(7 downto 0);
  axi_streamout_tvalid <= \^axi_streamout_tvalid\;
  rxflag_ff_reg_0 <= \^rxflag_ff_reg_0\;
\M_AXIS_TDATA[0]__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => \out_fifo_reg_n_0_[0]\,
      I1 => axi_streamout_tready,
      I2 => fifo_full,
      I3 => M_AXIS_TDATA_reg(0),
      O => \M_AXIS_TDATA[0]__0_i_1_n_0\
    );
\M_AXIS_TDATA[1]__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => \out_fifo_reg_n_0_[1]\,
      I1 => axi_streamout_tready,
      I2 => fifo_full,
      I3 => M_AXIS_TDATA_reg(1),
      O => \M_AXIS_TDATA[1]__0_i_1_n_0\
    );
\M_AXIS_TDATA[2]__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => \out_fifo_reg_n_0_[2]\,
      I1 => axi_streamout_tready,
      I2 => fifo_full,
      I3 => M_AXIS_TDATA_reg(2),
      O => \M_AXIS_TDATA[2]__0_i_1_n_0\
    );
\M_AXIS_TDATA[3]__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => \out_fifo_reg_n_0_[3]\,
      I1 => axi_streamout_tready,
      I2 => fifo_full,
      I3 => M_AXIS_TDATA_reg(3),
      O => \M_AXIS_TDATA[3]__0_i_1_n_0\
    );
\M_AXIS_TDATA[4]__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => \out_fifo_reg_n_0_[4]\,
      I1 => axi_streamout_tready,
      I2 => fifo_full,
      I3 => M_AXIS_TDATA_reg(4),
      O => \M_AXIS_TDATA[4]__0_i_1_n_0\
    );
\M_AXIS_TDATA[5]__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => \out_fifo_reg_n_0_[5]\,
      I1 => axi_streamout_tready,
      I2 => fifo_full,
      I3 => M_AXIS_TDATA_reg(5),
      O => \M_AXIS_TDATA[5]__0_i_1_n_0\
    );
\M_AXIS_TDATA[6]__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => \out_fifo_reg_n_0_[6]\,
      I1 => axi_streamout_tready,
      I2 => fifo_full,
      I3 => M_AXIS_TDATA_reg(6),
      O => \M_AXIS_TDATA[6]__0_i_1_n_0\
    );
\M_AXIS_TDATA[7]__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => \out_fifo_reg_n_0_[7]\,
      I1 => axi_streamout_tready,
      I2 => fifo_full,
      I3 => M_AXIS_TDATA_reg(7),
      O => \M_AXIS_TDATA[7]__0_i_1_n_0\
    );
\M_AXIS_TDATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \^axi_streamout_tdata\(0),
      Q => M_AXIS_TDATA_reg(0),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\M_AXIS_TDATA_reg[0]__0\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \M_AXIS_TDATA[0]__0_i_1_n_0\,
      Q => \^axi_streamout_tdata\(0),
      R => '0'
    );
\M_AXIS_TDATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \^axi_streamout_tdata\(1),
      Q => M_AXIS_TDATA_reg(1),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\M_AXIS_TDATA_reg[1]__0\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \M_AXIS_TDATA[1]__0_i_1_n_0\,
      Q => \^axi_streamout_tdata\(1),
      R => '0'
    );
\M_AXIS_TDATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \^axi_streamout_tdata\(2),
      Q => M_AXIS_TDATA_reg(2),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\M_AXIS_TDATA_reg[2]__0\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \M_AXIS_TDATA[2]__0_i_1_n_0\,
      Q => \^axi_streamout_tdata\(2),
      R => '0'
    );
\M_AXIS_TDATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \^axi_streamout_tdata\(3),
      Q => M_AXIS_TDATA_reg(3),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\M_AXIS_TDATA_reg[3]__0\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \M_AXIS_TDATA[3]__0_i_1_n_0\,
      Q => \^axi_streamout_tdata\(3),
      R => '0'
    );
\M_AXIS_TDATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \^axi_streamout_tdata\(4),
      Q => M_AXIS_TDATA_reg(4),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\M_AXIS_TDATA_reg[4]__0\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \M_AXIS_TDATA[4]__0_i_1_n_0\,
      Q => \^axi_streamout_tdata\(4),
      R => '0'
    );
\M_AXIS_TDATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \^axi_streamout_tdata\(5),
      Q => M_AXIS_TDATA_reg(5),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\M_AXIS_TDATA_reg[5]__0\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \M_AXIS_TDATA[5]__0_i_1_n_0\,
      Q => \^axi_streamout_tdata\(5),
      R => '0'
    );
\M_AXIS_TDATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \^axi_streamout_tdata\(6),
      Q => M_AXIS_TDATA_reg(6),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\M_AXIS_TDATA_reg[6]__0\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \M_AXIS_TDATA[6]__0_i_1_n_0\,
      Q => \^axi_streamout_tdata\(6),
      R => '0'
    );
\M_AXIS_TDATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \^axi_streamout_tdata\(7),
      Q => M_AXIS_TDATA_reg(7),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\M_AXIS_TDATA_reg[7]__0\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => \M_AXIS_TDATA[7]__0_i_1_n_0\,
      Q => \^axi_streamout_tdata\(7),
      R => '0'
    );
M_AXIS_TVALID_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => axi_streamout_tready,
      I1 => fifo_full,
      O => M_AXIS_TVALID0
    );
M_AXIS_TVALID_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => axi_streamout_aclk,
      CE => '1',
      D => M_AXIS_TVALID0,
      Q => \^axi_streamout_tvalid\,
      R => '0'
    );
\escape_fifo[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555545555555"
    )
        port map (
      I0 => rxflag_ff_reg_n_0,
      I1 => \escape_fifo[7]_i_3_n_0\,
      I2 => rxfifo_ff(2),
      I3 => rxfifo_ff(5),
      I4 => rxfifo_ff(0),
      I5 => rxfifo_ff(1),
      O => \^rxflag_ff_reg_0\
    );
\escape_fifo[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => rxfifo_ff(6),
      I1 => rxfifo_ff(7),
      I2 => rxfifo_ff(4),
      I3 => rxfifo_ff(3),
      O => \escape_fifo[7]_i_3_n_0\
    );
\escape_fifo_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => E(0),
      D => rxfifo_ff(0),
      Q => escape_fifo(0),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\escape_fifo_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => E(0),
      D => rxfifo_ff(1),
      Q => escape_fifo(1),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\escape_fifo_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => E(0),
      D => rxfifo_ff(2),
      Q => escape_fifo(2),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\escape_fifo_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => E(0),
      D => rxfifo_ff(3),
      Q => escape_fifo(3),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\escape_fifo_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => E(0),
      D => rxfifo_ff(4),
      Q => escape_fifo(4),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\escape_fifo_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => E(0),
      D => rxfifo_ff(5),
      Q => escape_fifo(5),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\escape_fifo_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => E(0),
      D => rxfifo_ff(6),
      Q => escape_fifo(6),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\escape_fifo_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => E(0),
      D => rxfifo_ff(7),
      Q => escape_fifo(7),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
fifo_full_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55C00000"
    )
        port map (
      I0 => \^axi_streamout_tvalid\,
      I1 => RXVALID,
      I2 => axi_streamout_tready,
      I3 => fifo_full,
      I4 => axi_streamout_aresetn,
      O => fifo_full_i_1_n_0
    );
fifo_full_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => fifo_full_i_1_n_0,
      Q => fifo_full,
      R => '0'
    );
\out_fifo[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF080808FF08"
    )
        port map (
      I0 => RXVALID,
      I1 => axi_streamout_tready,
      I2 => \^rxflag_ff_reg_0\,
      I3 => rxfifo_ff(0),
      I4 => send_escape,
      I5 => escape_fifo(0),
      O => \out_fifo[0]_i_1_n_0\
    );
\out_fifo[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EEE222E2"
    )
        port map (
      I0 => \out_fifo_reg_n_0_[1]\,
      I1 => out_fifo0,
      I2 => rxfifo_ff(1),
      I3 => send_escape,
      I4 => escape_fifo(1),
      I5 => \out_fifo_reg[7]_0\,
      O => \out_fifo[1]_i_1_n_0\
    );
\out_fifo[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF080808FF08"
    )
        port map (
      I0 => RXVALID,
      I1 => axi_streamout_tready,
      I2 => \^rxflag_ff_reg_0\,
      I3 => rxfifo_ff(2),
      I4 => send_escape,
      I5 => escape_fifo(2),
      O => \out_fifo[2]_i_1_n_0\
    );
\out_fifo[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF080808FF08"
    )
        port map (
      I0 => RXVALID,
      I1 => axi_streamout_tready,
      I2 => \^rxflag_ff_reg_0\,
      I3 => rxfifo_ff(3),
      I4 => send_escape,
      I5 => escape_fifo(3),
      O => \out_fifo[3]_i_1_n_0\
    );
\out_fifo[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF080808FF08"
    )
        port map (
      I0 => RXVALID,
      I1 => axi_streamout_tready,
      I2 => \^rxflag_ff_reg_0\,
      I3 => rxfifo_ff(4),
      I4 => send_escape,
      I5 => escape_fifo(4),
      O => \out_fifo[4]_i_1_n_0\
    );
\out_fifo[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF080808FF08"
    )
        port map (
      I0 => RXVALID,
      I1 => axi_streamout_tready,
      I2 => \^rxflag_ff_reg_0\,
      I3 => rxfifo_ff(5),
      I4 => send_escape,
      I5 => escape_fifo(5),
      O => \out_fifo[5]_i_1_n_0\
    );
\out_fifo[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF080808FF08"
    )
        port map (
      I0 => RXVALID,
      I1 => axi_streamout_tready,
      I2 => \^rxflag_ff_reg_0\,
      I3 => rxfifo_ff(6),
      I4 => send_escape,
      I5 => escape_fifo(6),
      O => \out_fifo[6]_i_2_n_0\
    );
\out_fifo[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000EEE222E2"
    )
        port map (
      I0 => \out_fifo_reg_n_0_[7]\,
      I1 => out_fifo0,
      I2 => rxfifo_ff(7),
      I3 => send_escape,
      I4 => escape_fifo(7),
      I5 => \out_fifo_reg[7]_0\,
      O => \out_fifo[7]_i_1_n_0\
    );
\out_fifo_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \out_fifo_reg[6]_0\,
      D => \out_fifo[0]_i_1_n_0\,
      Q => \out_fifo_reg_n_0_[0]\,
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\out_fifo_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => \out_fifo[1]_i_1_n_0\,
      Q => \out_fifo_reg_n_0_[1]\,
      R => '0'
    );
\out_fifo_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \out_fifo_reg[6]_0\,
      D => \out_fifo[2]_i_1_n_0\,
      Q => \out_fifo_reg_n_0_[2]\,
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\out_fifo_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \out_fifo_reg[6]_0\,
      D => \out_fifo[3]_i_1_n_0\,
      Q => \out_fifo_reg_n_0_[3]\,
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\out_fifo_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \out_fifo_reg[6]_0\,
      D => \out_fifo[4]_i_1_n_0\,
      Q => \out_fifo_reg_n_0_[4]\,
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\out_fifo_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \out_fifo_reg[6]_0\,
      D => \out_fifo[5]_i_1_n_0\,
      Q => \out_fifo_reg_n_0_[5]\,
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\out_fifo_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \out_fifo_reg[6]_0\,
      D => \out_fifo[6]_i_2_n_0\,
      Q => \out_fifo_reg_n_0_[6]\,
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\out_fifo_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => \out_fifo[7]_i_1_n_0\,
      Q => \out_fifo_reg_n_0_[7]\,
      R => '0'
    );
read_spw_rx_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF08FF8800000000"
    )
        port map (
      I0 => RXVALID,
      I1 => axi_streamout_tready,
      I2 => \^rxflag_ff_reg_0\,
      I3 => \^spw_rxread\,
      I4 => send_escape,
      I5 => axi_streamout_aresetn,
      O => read_spw_rx_i_1_n_0
    );
read_spw_rx_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => read_spw_rx_i_1_n_0,
      Q => \^spw_rxread\,
      R => '0'
    );
\rxfifo_ff[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => axi_streamout_aresetn,
      O => \rxfifo_ff[7]_i_1_n_0\
    );
\rxfifo_ff_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => RDATA(0),
      Q => rxfifo_ff(0),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\rxfifo_ff_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => RDATA(1),
      Q => rxfifo_ff(1),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\rxfifo_ff_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => RDATA(2),
      Q => rxfifo_ff(2),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\rxfifo_ff_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => RDATA(3),
      Q => rxfifo_ff(3),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\rxfifo_ff_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => RDATA(4),
      Q => rxfifo_ff(4),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\rxfifo_ff_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => RDATA(5),
      Q => rxfifo_ff(5),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\rxfifo_ff_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => RDATA(6),
      Q => rxfifo_ff(6),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
\rxfifo_ff_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => RDATA(7),
      Q => rxfifo_ff(7),
      R => \rxfifo_ff[7]_i_1_n_0\
    );
rxflag_ff_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => RDATA(8),
      Q => rxflag_ff_reg_n_0,
      R => \rxfifo_ff[7]_i_1_n_0\
    );
send_escape_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AEA0000"
    )
        port map (
      I0 => send_escape,
      I1 => RXVALID,
      I2 => axi_streamout_tready,
      I3 => \^rxflag_ff_reg_0\,
      I4 => axi_streamout_aresetn,
      O => send_escape_i_1_n_0
    );
send_escape_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => send_escape_i_1_n_0,
      Q => send_escape,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register is
  port (
    axi_register_bvalid : out STD_LOGIC;
    axi_awready_reg_0 : out STD_LOGIC;
    axi_register_wready : out STD_LOGIC;
    axi_rvalid_reg_0 : out STD_LOGIC;
    axi_arready_reg_0 : out STD_LOGIC;
    axi_register_aclk : in STD_LOGIC;
    axi_register_aresetn : in STD_LOGIC;
    axi_register_wvalid : in STD_LOGIC;
    axi_register_bready : in STD_LOGIC;
    axi_register_awvalid : in STD_LOGIC;
    axi_register_arvalid : in STD_LOGIC;
    axi_register_rready : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register is
  signal \FSM_onehot_state_write[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_write[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_write_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_state_write_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_sequential_state_read[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_read[1]_i_1_n_0\ : STD_LOGIC;
  signal axi_arready_i_1_n_0 : STD_LOGIC;
  signal \^axi_arready_reg_0\ : STD_LOGIC;
  signal axi_awready_i_1_n_0 : STD_LOGIC;
  signal axi_awready_i_2_n_0 : STD_LOGIC;
  signal \^axi_awready_reg_0\ : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_bvalid_i_2_n_0 : STD_LOGIC;
  signal axi_bvalid_i_3_n_0 : STD_LOGIC;
  signal \^axi_register_bvalid\ : STD_LOGIC;
  signal \^axi_register_wready\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \^axi_rvalid_reg_0\ : STD_LOGIC;
  signal axi_wready : STD_LOGIC;
  signal axi_wready_i_1_n_0 : STD_LOGIC;
  signal state_read : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_write_reg[0]\ : label is "idle:001,wdata:100,waddr:010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_write_reg[1]\ : label is "idle:001,wdata:100,waddr:010";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_write_reg[2]\ : label is "idle:001,wdata:100,waddr:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_read_reg[0]\ : label is "idle:00,rdata:10,raddr:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_read_reg[1]\ : label is "idle:00,rdata:10,raddr:01";
begin
  axi_arready_reg_0 <= \^axi_arready_reg_0\;
  axi_awready_reg_0 <= \^axi_awready_reg_0\;
  axi_register_bvalid <= \^axi_register_bvalid\;
  axi_register_wready <= \^axi_register_wready\;
  axi_rvalid_reg_0 <= \^axi_rvalid_reg_0\;
\FSM_onehot_state_write[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFAAFFFFBF00"
    )
        port map (
      I0 => axi_register_wvalid,
      I1 => axi_register_awvalid,
      I2 => \^axi_awready_reg_0\,
      I3 => \FSM_onehot_state_write_reg_n_0_[1]\,
      I4 => axi_wready,
      I5 => \FSM_onehot_state_write_reg_n_0_[2]\,
      O => \FSM_onehot_state_write[1]_i_1_n_0\
    );
\FSM_onehot_state_write[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F0F0800"
    )
        port map (
      I0 => \^axi_awready_reg_0\,
      I1 => axi_register_awvalid,
      I2 => axi_register_wvalid,
      I3 => \FSM_onehot_state_write_reg_n_0_[1]\,
      I4 => \FSM_onehot_state_write_reg_n_0_[2]\,
      O => \FSM_onehot_state_write[2]_i_1_n_0\
    );
\FSM_onehot_state_write_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => axi_register_aclk,
      CE => '1',
      D => '0',
      Q => axi_wready,
      S => axi_awready_i_1_n_0
    );
\FSM_onehot_state_write_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_register_aclk,
      CE => '1',
      D => \FSM_onehot_state_write[1]_i_1_n_0\,
      Q => \FSM_onehot_state_write_reg_n_0_[1]\,
      R => axi_awready_i_1_n_0
    );
\FSM_onehot_state_write_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_register_aclk,
      CE => '1',
      D => \FSM_onehot_state_write[2]_i_1_n_0\,
      Q => \FSM_onehot_state_write_reg_n_0_[2]\,
      R => axi_awready_i_1_n_0
    );
\FSM_sequential_state_read[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0007777FFFF"
    )
        port map (
      I0 => axi_register_arvalid,
      I1 => \^axi_arready_reg_0\,
      I2 => axi_register_rready,
      I3 => \^axi_rvalid_reg_0\,
      I4 => state_read(0),
      I5 => state_read(1),
      O => \FSM_sequential_state_read[0]_i_1_n_0\
    );
\FSM_sequential_state_read[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0FFF88880000"
    )
        port map (
      I0 => \^axi_arready_reg_0\,
      I1 => axi_register_arvalid,
      I2 => axi_register_rready,
      I3 => \^axi_rvalid_reg_0\,
      I4 => state_read(0),
      I5 => state_read(1),
      O => \FSM_sequential_state_read[1]_i_1_n_0\
    );
\FSM_sequential_state_read_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => axi_register_aclk,
      CE => '1',
      D => \FSM_sequential_state_read[0]_i_1_n_0\,
      Q => state_read(0),
      R => axi_awready_i_1_n_0
    );
\FSM_sequential_state_read_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => axi_register_aclk,
      CE => '1',
      D => \FSM_sequential_state_read[1]_i_1_n_0\,
      Q => state_read(1),
      R => axi_awready_i_1_n_0
    );
axi_arready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C4C4C4C4FFCFCFCF"
    )
        port map (
      I0 => axi_register_arvalid,
      I1 => \^axi_arready_reg_0\,
      I2 => state_read(1),
      I3 => axi_register_rready,
      I4 => \^axi_rvalid_reg_0\,
      I5 => state_read(0),
      O => axi_arready_i_1_n_0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => axi_register_aclk,
      CE => '1',
      D => axi_arready_i_1_n_0,
      Q => \^axi_arready_reg_0\,
      R => axi_awready_i_1_n_0
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => axi_register_aresetn,
      O => axi_awready_i_1_n_0
    );
axi_awready_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFFEAEAFFFFEAEA"
    )
        port map (
      I0 => axi_wready,
      I1 => \FSM_onehot_state_write_reg_n_0_[2]\,
      I2 => axi_register_wvalid,
      I3 => \FSM_onehot_state_write_reg_n_0_[1]\,
      I4 => \^axi_awready_reg_0\,
      I5 => axi_register_awvalid,
      O => axi_awready_i_2_n_0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => axi_register_aclk,
      CE => '1',
      D => axi_awready_i_2_n_0,
      Q => \^axi_awready_reg_0\,
      R => axi_awready_i_1_n_0
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA8ABA8BB88BB88"
    )
        port map (
      I0 => axi_bvalid_i_2_n_0,
      I1 => axi_bvalid_i_3_n_0,
      I2 => axi_register_wvalid,
      I3 => \^axi_register_bvalid\,
      I4 => axi_register_bready,
      I5 => \FSM_onehot_state_write_reg_n_0_[2]\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEAEAEAEAEAEAEA"
    )
        port map (
      I0 => axi_wready,
      I1 => \FSM_onehot_state_write_reg_n_0_[2]\,
      I2 => axi_register_wvalid,
      I3 => \FSM_onehot_state_write_reg_n_0_[1]\,
      I4 => axi_register_awvalid,
      I5 => \^axi_awready_reg_0\,
      O => axi_bvalid_i_2_n_0
    );
axi_bvalid_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA80808080808080"
    )
        port map (
      I0 => \FSM_onehot_state_write_reg_n_0_[1]\,
      I1 => \^axi_register_bvalid\,
      I2 => axi_register_bready,
      I3 => \^axi_awready_reg_0\,
      I4 => axi_register_awvalid,
      I5 => axi_register_wvalid,
      O => axi_bvalid_i_3_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => axi_register_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^axi_register_bvalid\,
      R => axi_awready_i_1_n_0
    );
axi_rvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFFFFF00800080"
    )
        port map (
      I0 => \^axi_arready_reg_0\,
      I1 => axi_register_arvalid,
      I2 => state_read(0),
      I3 => state_read(1),
      I4 => axi_register_rready,
      I5 => \^axi_rvalid_reg_0\,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => axi_register_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^axi_rvalid_reg_0\,
      R => axi_awready_i_1_n_0
    );
axi_wready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => axi_wready,
      I1 => \^axi_register_wready\,
      O => axi_wready_i_1_n_0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => axi_register_aclk,
      CE => '1',
      D => axi_wready_i_1_n_0,
      Q => \^axi_register_wready\,
      R => axi_awready_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn is
  port (
    SPW_TXWRITE : out STD_LOGIC;
    WDATA : out STD_LOGIC_VECTOR ( 8 downto 0 );
    fifo_full_clear_reg_0 : out STD_LOGIC;
    axi_streamin_tready : out STD_LOGIC;
    WEN10_out : out STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    axi_streamin_aclk : in STD_LOGIC;
    axi_streamin_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_streamin_aresetn : in STD_LOGIC;
    sel : in STD_LOGIC;
    axi_streamin_tvalid : in STD_LOGIC;
    \res_seq_reg[txfull]__0\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn is
  signal \^spw_txwrite\ : STD_LOGIC;
  signal char_fifo : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \char_fifo[0]_i_1_n_0\ : STD_LOGIC;
  signal \char_fifo[1]_i_1_n_0\ : STD_LOGIC;
  signal \char_fifo[2]_i_1_n_0\ : STD_LOGIC;
  signal \char_fifo[3]_i_1_n_0\ : STD_LOGIC;
  signal \char_fifo[4]_i_1_n_0\ : STD_LOGIC;
  signal \char_fifo[5]_i_1_n_0\ : STD_LOGIC;
  signal \char_fifo[6]_i_1_n_0\ : STD_LOGIC;
  signal \char_fifo[6]_i_2_n_0\ : STD_LOGIC;
  signal \char_fifo[6]_i_3_n_0\ : STD_LOGIC;
  signal \char_fifo[6]_i_4_n_0\ : STD_LOGIC;
  signal \char_fifo[6]_i_6_n_0\ : STD_LOGIC;
  signal \char_fifo[7]_i_1_n_0\ : STD_LOGIC;
  signal \fifo_full_i_1__0_n_0\ : STD_LOGIC;
  signal fifo_full_reg_n_0 : STD_LOGIC;
  signal previous_escape5_out : STD_LOGIC;
  signal previous_escape_i_1_n_0 : STD_LOGIC;
  signal previous_escape_reg_n_0 : STD_LOGIC;
  signal txflag_fifo : STD_LOGIC;
  signal txflag_fifo_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of TXMEM_i_1 : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \char_fifo[2]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \char_fifo[3]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \char_fifo[4]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \char_fifo[6]_i_3\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \res_seq[txdiscard]_i_2\ : label is "soft_lutpair97";
begin
  SPW_TXWRITE <= \^spw_txwrite\;
\SPW_TXFIFO_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => fifo_full_reg_n_0,
      D => char_fifo(0),
      Q => WDATA(0),
      R => '0'
    );
\SPW_TXFIFO_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => fifo_full_reg_n_0,
      D => char_fifo(1),
      Q => WDATA(1),
      R => '0'
    );
\SPW_TXFIFO_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => fifo_full_reg_n_0,
      D => char_fifo(2),
      Q => WDATA(2),
      R => '0'
    );
\SPW_TXFIFO_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => fifo_full_reg_n_0,
      D => char_fifo(3),
      Q => WDATA(3),
      R => '0'
    );
\SPW_TXFIFO_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => fifo_full_reg_n_0,
      D => char_fifo(4),
      Q => WDATA(4),
      R => '0'
    );
\SPW_TXFIFO_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => fifo_full_reg_n_0,
      D => char_fifo(5),
      Q => WDATA(5),
      R => '0'
    );
\SPW_TXFIFO_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => fifo_full_reg_n_0,
      D => char_fifo(6),
      Q => WDATA(6),
      R => '0'
    );
\SPW_TXFIFO_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => fifo_full_reg_n_0,
      D => char_fifo(7),
      Q => WDATA(7),
      R => '0'
    );
SPW_TXFLAG_reg: unisim.vcomponents.FDRE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => fifo_full_reg_n_0,
      D => txflag_fifo,
      Q => WDATA(8),
      R => '0'
    );
TXMEM_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^spw_txwrite\,
      I1 => \res_seq_reg[txfull]__0\,
      O => WEN10_out
    );
axi_streamin_tready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => fifo_full_reg_n_0,
      I1 => \res_seq_reg[txfull]__0\,
      O => axi_streamin_tready
    );
\char_fifo[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0D02000"
    )
        port map (
      I0 => axi_streamin_tvalid,
      I1 => previous_escape5_out,
      I2 => axi_streamin_aresetn,
      I3 => axi_streamin_tdata(0),
      I4 => char_fifo(0),
      O => \char_fifo[0]_i_1_n_0\
    );
\char_fifo[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0D02000"
    )
        port map (
      I0 => axi_streamin_tvalid,
      I1 => previous_escape5_out,
      I2 => axi_streamin_aresetn,
      I3 => axi_streamin_tdata(1),
      I4 => char_fifo(1),
      O => \char_fifo[1]_i_1_n_0\
    );
\char_fifo[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => axi_streamin_tdata(2),
      I1 => axi_streamin_aresetn,
      I2 => previous_escape_reg_n_0,
      O => \char_fifo[2]_i_1_n_0\
    );
\char_fifo[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => axi_streamin_tdata(3),
      I1 => axi_streamin_aresetn,
      I2 => previous_escape_reg_n_0,
      O => \char_fifo[3]_i_1_n_0\
    );
\char_fifo[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => axi_streamin_tdata(4),
      I1 => axi_streamin_aresetn,
      I2 => previous_escape_reg_n_0,
      O => \char_fifo[4]_i_1_n_0\
    );
\char_fifo[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => axi_streamin_tdata(5),
      I1 => axi_streamin_aresetn,
      I2 => previous_escape_reg_n_0,
      O => \char_fifo[5]_i_1_n_0\
    );
\char_fifo[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => axi_streamin_aresetn,
      I1 => axi_streamin_tvalid,
      I2 => \char_fifo[6]_i_4_n_0\,
      I3 => axi_streamin_tdata(6),
      I4 => previous_escape_reg_n_0,
      O => \char_fifo[6]_i_1_n_0\
    );
\char_fifo[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2F"
    )
        port map (
      I0 => axi_streamin_tvalid,
      I1 => previous_escape5_out,
      I2 => axi_streamin_aresetn,
      O => \char_fifo[6]_i_2_n_0\
    );
\char_fifo[6]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => previous_escape_reg_n_0,
      I1 => axi_streamin_tdata(6),
      I2 => axi_streamin_aresetn,
      O => \char_fifo[6]_i_3_n_0\
    );
\char_fifo[6]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => axi_streamin_tdata(4),
      I1 => axi_streamin_tdata(1),
      I2 => axi_streamin_tdata(3),
      I3 => \char_fifo[6]_i_6_n_0\,
      O => \char_fifo[6]_i_4_n_0\
    );
\char_fifo[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000040000000000"
    )
        port map (
      I0 => previous_escape_reg_n_0,
      I1 => axi_streamin_tdata(6),
      I2 => \char_fifo[6]_i_6_n_0\,
      I3 => axi_streamin_tdata(3),
      I4 => axi_streamin_tdata(1),
      I5 => axi_streamin_tdata(4),
      O => previous_escape5_out
    );
\char_fifo[6]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => axi_streamin_tdata(0),
      I1 => axi_streamin_tdata(2),
      I2 => axi_streamin_tdata(5),
      I3 => axi_streamin_tdata(7),
      O => \char_fifo[6]_i_6_n_0\
    );
\char_fifo[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D0D0F0D000002000"
    )
        port map (
      I0 => axi_streamin_tvalid,
      I1 => previous_escape5_out,
      I2 => axi_streamin_aresetn,
      I3 => axi_streamin_tdata(7),
      I4 => previous_escape_reg_n_0,
      I5 => char_fifo(7),
      O => \char_fifo[7]_i_1_n_0\
    );
\char_fifo_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => '1',
      D => \char_fifo[0]_i_1_n_0\,
      Q => char_fifo(0),
      R => '0'
    );
\char_fifo_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => '1',
      D => \char_fifo[1]_i_1_n_0\,
      Q => char_fifo(1),
      R => '0'
    );
\char_fifo_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => \char_fifo[6]_i_2_n_0\,
      D => \char_fifo[2]_i_1_n_0\,
      Q => char_fifo(2),
      S => \char_fifo[6]_i_1_n_0\
    );
\char_fifo_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => \char_fifo[6]_i_2_n_0\,
      D => \char_fifo[3]_i_1_n_0\,
      Q => char_fifo(3),
      S => \char_fifo[6]_i_1_n_0\
    );
\char_fifo_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => \char_fifo[6]_i_2_n_0\,
      D => \char_fifo[4]_i_1_n_0\,
      Q => char_fifo(4),
      S => \char_fifo[6]_i_1_n_0\
    );
\char_fifo_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => \char_fifo[6]_i_2_n_0\,
      D => \char_fifo[5]_i_1_n_0\,
      Q => char_fifo(5),
      S => \char_fifo[6]_i_1_n_0\
    );
\char_fifo_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => \char_fifo[6]_i_2_n_0\,
      D => \char_fifo[6]_i_3_n_0\,
      Q => char_fifo(6),
      S => \char_fifo[6]_i_1_n_0\
    );
\char_fifo_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => '1',
      D => \char_fifo[7]_i_1_n_0\,
      Q => char_fifo(7),
      R => '0'
    );
fifo_full_clear_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      D => fifo_full_reg_n_0,
      Q => \^spw_txwrite\,
      R => '0'
    );
\fifo_full_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2F002200"
    )
        port map (
      I0 => axi_streamin_tvalid,
      I1 => previous_escape5_out,
      I2 => \^spw_txwrite\,
      I3 => axi_streamin_aresetn,
      I4 => fifo_full_reg_n_0,
      O => \fifo_full_i_1__0_n_0\
    );
fifo_full_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => '1',
      D => \fifo_full_i_1__0_n_0\,
      Q => fifo_full_reg_n_0,
      R => '0'
    );
previous_escape_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => axi_streamin_aresetn,
      I1 => previous_escape_reg_n_0,
      I2 => axi_streamin_tvalid,
      I3 => previous_escape5_out,
      O => previous_escape_i_1_n_0
    );
previous_escape_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => '1',
      D => previous_escape_i_1_n_0,
      Q => previous_escape_reg_n_0,
      R => '0'
    );
\res_seq[txdiscard]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^spw_txwrite\,
      I1 => sel,
      O => fifo_full_clear_reg_0
    );
txflag_fifo_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DF758A0000000000"
    )
        port map (
      I0 => axi_streamin_tvalid,
      I1 => \char_fifo[6]_i_4_n_0\,
      I2 => axi_streamin_tdata(6),
      I3 => previous_escape_reg_n_0,
      I4 => txflag_fifo,
      I5 => axi_streamin_aresetn,
      O => txflag_fifo_i_1_n_0
    );
txflag_fifo_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => axi_streamin_aclk,
      CE => '1',
      D => txflag_fifo_i_1_n_0,
      Q => txflag_fifo,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwLink is
  port (
    \state_seq_reg[timerdone]__0\ : out STD_LOGIC;
    \xmiti[fct_in]\ : out STD_LOGIC;
    recv_rxen : out STD_LOGIC;
    \FSM_onehot_state_seq_reg[state][3]_0\ : out STD_LOGIC;
    \FSM_onehot_state_seq_reg[state][5]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_onehot_state_seq_reg[state][1]_0\ : out STD_LOGIC;
    \state_seq_reg[timercnt][6]_0\ : out STD_LOGIC;
    \vres[txdiscard]\ : out STD_LOGIC;
    \vres[txpacket]5_out\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \res_com[txfifo_rvalid]\ : out STD_LOGIC;
    \res_seq_reg[txdiscard]\ : out STD_LOGIC;
    \res_com[txfull]\ : out STD_LOGIC;
    \res_seq_reg[txfiforoom][12]\ : out STD_LOGIC_VECTOR ( 12 downto 0 );
    \state_seq_reg[tx_credit][3]_0\ : out STD_LOGIC;
    \v[allow_char]\ : out STD_LOGIC;
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \vres[inbvalid]0_out\ : out STD_LOGIC;
    load : out STD_LOGIC;
    \state_seq_reg[rxen]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \vres[rxeep]3_out\ : out STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 0 to 0 );
    SPW_main_clk : in STD_LOGIC;
    \state_seq_reg[rxen]_1\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \state_seq_reg[rx_null_fct]_0\ : in STD_LOGIC;
    \recvo[gotfct]\ : in STD_LOGIC;
    \recvo[gotnull]\ : in STD_LOGIC;
    \FSM_onehot_state_seq_reg[state][0]_0\ : in STD_LOGIC;
    \FSM_onehot_state_seq_reg[state][0]_1\ : in STD_LOGIC;
    \FSM_onehot_state_seq_reg[state][0]_2\ : in STD_LOGIC;
    \state_seq_reg[timercnt][0]_0\ : in STD_LOGIC;
    \recvo[rxchar]\ : in STD_LOGIC;
    \recvo[tick_out]\ : in STD_LOGIC;
    \res_seq_reg[allow_fct]__0\ : in STD_LOGIC;
    \res_seq_reg[pend_fct]__0\ : in STD_LOGIC;
    \res_seq_reg[txdiscard]_0\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    \res_seq_reg[txdiscard]_1\ : in STD_LOGIC;
    \res_seq_reg[txdiscard]__0\ : in STD_LOGIC;
    \vres[txfiforoom]0_in\ : in STD_LOGIC_VECTOR ( 12 downto 0 );
    SPW_TXWRITE : in STD_LOGIC;
    O : in STD_LOGIC_VECTOR ( 0 to 0 );
    \res_seq_reg[txfifo_rvalid]\ : in STD_LOGIC_VECTOR ( 12 downto 0 );
    \res_seq_reg[txfiforoom][11]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \res_seq_reg[txfiforoom][7]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \res_seq_reg[txfiforoom][3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \res_seq_reg[pend_char]__0\ : in STD_LOGIC;
    \res_seq_reg[txfifo_rvalid]__0\ : in STD_LOGIC;
    \res_seq_reg[allow_char]__0\ : in STD_LOGIC;
    \res_seq_reg[sent_fct]__0\ : in STD_LOGIC;
    sys_rst_n : in STD_LOGIC;
    \res_seq_reg[inbvalid]\ : in STD_LOGIC;
    \syncsys[rxcnt_ddr_gray]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \res_seq_reg[rxeep]__0\ : in STD_LOGIC;
    \res_seq_reg[rxfull]__0\ : in STD_LOGIC;
    \res_seq_reg[rxeep]\ : in STD_LOGIC;
    \FSM_onehot_state_seq_reg[state][4]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwLink;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwLink is
  signal \FSM_onehot_state_seq[state][0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_seq[state][1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_seq[state][5]_i_10_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_seq[state][5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_seq[state][5]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_seq[state][5]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_seq[state][5]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_seq[state][5]_i_7_n_0\ : STD_LOGIC;
  signal \^fsm_onehot_state_seq_reg[state][1]_0\ : STD_LOGIC;
  signal \^fsm_onehot_state_seq_reg[state][5]_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \FSM_onehot_state_seq_reg[state_n_0_][0]\ : STD_LOGIC;
  signal \i__carry__0_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal p_0_in9_in : STD_LOGIC;
  signal \p_1_out_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \p_1_out_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \p_1_out_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \p_1_out_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \p_1_out_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \p_1_out_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \^recv_rxen\ : STD_LOGIC;
  signal \res_seq[txfull]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[txfull]_i_3_n_0\ : STD_LOGIC;
  signal \^res_seq_reg[txdiscard]\ : STD_LOGIC;
  signal \^res_seq_reg[txfiforoom][12]\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \state_com[timercnt]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \state_seq[errcred]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[errcred]_i_2_n_0\ : STD_LOGIC;
  signal \state_seq[errcred]_i_3_n_0\ : STD_LOGIC;
  signal \state_seq[errcred]_i_4_n_0\ : STD_LOGIC;
  signal \state_seq[errcred]_i_5_n_0\ : STD_LOGIC;
  signal \state_seq[rx_null_fct]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[rxen]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[timercnt][2]_i_2_n_0\ : STD_LOGIC;
  signal \state_seq[timercnt][3]_i_2_n_0\ : STD_LOGIC;
  signal \state_seq[timercnt][4]_i_2_n_0\ : STD_LOGIC;
  signal \state_seq[timercnt][5]_i_2_n_0\ : STD_LOGIC;
  signal \state_seq[timercnt][7]_i_2_n_0\ : STD_LOGIC;
  signal \state_seq[timerdone]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[tx_credit][0]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[tx_credit][1]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[tx_credit][2]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[tx_credit][3]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[tx_credit][3]_i_2_n_0\ : STD_LOGIC;
  signal \state_seq[tx_credit][4]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[tx_credit][5]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[tx_credit][5]_i_2_n_0\ : STD_LOGIC;
  signal \state_seq[tx_credit][5]_i_3_n_0\ : STD_LOGIC;
  signal \state_seq[tx_credit][5]_i_4_n_0\ : STD_LOGIC;
  signal \state_seq[xmit_fct_in]_i_1_n_0\ : STD_LOGIC;
  signal \state_seq[xmit_fct_in]_i_2_n_0\ : STD_LOGIC;
  signal \state_seq_reg[errcred]__0\ : STD_LOGIC;
  signal \state_seq_reg[rx_credit]\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \state_seq_reg[rx_null_fct]__0\ : STD_LOGIC;
  signal \^state_seq_reg[timercnt][6]_0\ : STD_LOGIC;
  signal \state_seq_reg[timercnt_n_0_][0]\ : STD_LOGIC;
  signal \state_seq_reg[timercnt_n_0_][1]\ : STD_LOGIC;
  signal \state_seq_reg[timercnt_n_0_][2]\ : STD_LOGIC;
  signal \state_seq_reg[timercnt_n_0_][3]\ : STD_LOGIC;
  signal \state_seq_reg[timercnt_n_0_][4]\ : STD_LOGIC;
  signal \state_seq_reg[timercnt_n_0_][5]\ : STD_LOGIC;
  signal \state_seq_reg[timercnt_n_0_][6]\ : STD_LOGIC;
  signal \state_seq_reg[timercnt_n_0_][7]\ : STD_LOGIC;
  signal \^state_seq_reg[timerdone]__0\ : STD_LOGIC;
  signal \state_seq_reg[tx_credit]\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^state_seq_reg[tx_credit][3]_0\ : STD_LOGIC;
  signal \vstate[rx_credit]\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \vstate[rx_credit]0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry__0_n_3\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry__0_n_6\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry__0_n_7\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_i_1_n_0\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_i_2_n_0\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_i_3_n_0\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_i_4_n_0\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_n_0\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_n_1\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_n_2\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_n_3\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_n_4\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_n_5\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_n_6\ : STD_LOGIC;
  signal \vstate[rx_credit]0_carry_n_7\ : STD_LOGIC;
  signal \vstate[xmit_fct_in]4\ : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal \^xmiti[fct_in]\ : STD_LOGIC;
  signal \NLW_p_1_out_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_p_1_out_inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_p_1_out_inferred__0/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_vstate[rx_credit]0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_vstate[rx_credit]0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state_seq[state][0]_i_1\ : label is "soft_lutpair5";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_seq_reg[state][0]\ : label is "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_seq_reg[state][1]\ : label is "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_seq_reg[state][2]\ : label is "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_seq_reg[state][3]\ : label is "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_seq_reg[state][4]\ : label is "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_seq_reg[state][5]\ : label is "s_errorwait:100000,s_ready:010000,s_started:001000,s_connecting:000100,s_run:000010,s_errorreset:000001";
  attribute SOFT_HLUTNM of \res_seq[allow_char]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \res_seq[allow_fct]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \res_seq[bitcntp_gray][2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \res_seq[bitcntp_gray][3]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \res_seq[bitshift][8]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \res_seq[inbvalid]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \res_seq[pend_data][8]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \res_seq[token1][fctpiggy]_i_4\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \res_seq[txfifo_rvalid]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \res_seq[txfiforoom][12]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \reset_reg[1]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \state_seq[errcred]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \state_seq[errcred]_i_4\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \state_seq[rx_credit][1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \state_seq[rx_credit][2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \state_seq[rx_credit][3]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \state_seq[rx_credit][4]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \state_seq[rx_credit][5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \state_seq[rxen]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \state_seq[timercnt][2]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \state_seq[timercnt][3]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \state_seq[timercnt][4]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \state_seq[timercnt][5]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \state_seq[tx_credit][0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \state_seq[tx_credit][1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \state_seq[tx_credit][3]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \state_seq[tx_credit][4]_i_1\ : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \vstate[rx_credit]0_carry\ : label is 35;
  attribute ADDER_THRESHOLD of \vstate[rx_credit]0_carry__0\ : label is 35;
begin
  \FSM_onehot_state_seq_reg[state][1]_0\ <= \^fsm_onehot_state_seq_reg[state][1]_0\;
  \FSM_onehot_state_seq_reg[state][5]_0\(3 downto 0) <= \^fsm_onehot_state_seq_reg[state][5]_0\(3 downto 0);
  recv_rxen <= \^recv_rxen\;
  \res_seq_reg[txdiscard]\ <= \^res_seq_reg[txdiscard]\;
  \res_seq_reg[txfiforoom][12]\(12 downto 0) <= \^res_seq_reg[txfiforoom][12]\(12 downto 0);
  \state_seq_reg[timercnt][6]_0\ <= \^state_seq_reg[timercnt][6]_0\;
  \state_seq_reg[timerdone]__0\ <= \^state_seq_reg[timerdone]__0\;
  \state_seq_reg[tx_credit][3]_0\ <= \^state_seq_reg[tx_credit][3]_0\;
  \xmiti[fct_in]\ <= \^xmiti[fct_in]\;
\FSM_onehot_state_seq[state][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      I1 => p_0_in9_in,
      I2 => \state_seq_reg[rx_null_fct]_0\,
      I3 => \^fsm_onehot_state_seq_reg[state][5]_0\(0),
      O => \FSM_onehot_state_seq[state][0]_i_1_n_0\
    );
\FSM_onehot_state_seq[state][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => p_0_in9_in,
      I1 => \state_seq_reg[rx_null_fct]_0\,
      O => \FSM_onehot_state_seq[state][1]_i_1_n_0\
    );
\FSM_onehot_state_seq[state][5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFE0"
    )
        port map (
      I0 => \state_seq_reg[rx_null_fct]__0\,
      I1 => \recvo[gotfct]\,
      I2 => p_0_in9_in,
      I3 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I4 => \FSM_onehot_state_seq[state][5]_i_4_n_0\,
      I5 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      O => \FSM_onehot_state_seq[state][5]_i_1_n_0\
    );
\FSM_onehot_state_seq[state][5]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^fsm_onehot_state_seq_reg[state][5]_0\(2),
      I1 => \^fsm_onehot_state_seq_reg[state][5]_0\(3),
      O => \FSM_onehot_state_seq[state][5]_i_10_n_0\
    );
\FSM_onehot_state_seq[state][5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF8C8C8C8C8"
    )
        port map (
      I0 => \state_seq_reg[errcred]__0\,
      I1 => \^fsm_onehot_state_seq_reg[state][5]_0\(0),
      I2 => \state_seq_reg[timercnt][0]_0\,
      I3 => \recvo[rxchar]\,
      I4 => \FSM_onehot_state_seq[state][5]_i_7_n_0\,
      I5 => p_0_in9_in,
      O => \FSM_onehot_state_seq[state][5]_i_3_n_0\
    );
\FSM_onehot_state_seq[state][5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F000F000FFFFF888"
    )
        port map (
      I0 => \^state_seq_reg[timerdone]__0\,
      I1 => \^fsm_onehot_state_seq_reg[state][5]_0\(3),
      I2 => \recvo[gotnull]\,
      I3 => \^fsm_onehot_state_seq_reg[state][5]_0\(1),
      I4 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I5 => \^state_seq_reg[timercnt][6]_0\,
      O => \FSM_onehot_state_seq[state][5]_i_4_n_0\
    );
\FSM_onehot_state_seq[state][5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA8FFA8AAA8AA"
    )
        port map (
      I0 => \^fsm_onehot_state_seq_reg[state][5]_0\(1),
      I1 => \FSM_onehot_state_seq_reg[state][0]_0\,
      I2 => \FSM_onehot_state_seq[state][5]_i_7_n_0\,
      I3 => \FSM_onehot_state_seq_reg[state][0]_1\,
      I4 => \FSM_onehot_state_seq_reg[state][0]_2\,
      I5 => \FSM_onehot_state_seq[state][5]_i_10_n_0\,
      O => \FSM_onehot_state_seq[state][5]_i_5_n_0\
    );
\FSM_onehot_state_seq[state][5]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AE"
    )
        port map (
      I0 => \recvo[tick_out]\,
      I1 => \^state_seq_reg[timerdone]__0\,
      I2 => \^state_seq_reg[timercnt][6]_0\,
      O => \FSM_onehot_state_seq[state][5]_i_7_n_0\
    );
\FSM_onehot_state_seq_reg[state][0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => \FSM_onehot_state_seq[state][5]_i_1_n_0\,
      D => \FSM_onehot_state_seq[state][0]_i_1_n_0\,
      PRE => \state_seq_reg[rxen]_1\,
      Q => \FSM_onehot_state_seq_reg[state_n_0_][0]\
    );
\FSM_onehot_state_seq_reg[state][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \FSM_onehot_state_seq[state][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \FSM_onehot_state_seq[state][1]_i_1_n_0\,
      Q => \^fsm_onehot_state_seq_reg[state][5]_0\(0)
    );
\FSM_onehot_state_seq_reg[state][2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \FSM_onehot_state_seq[state][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \FSM_onehot_state_seq_reg[state][4]_0\(0),
      Q => p_0_in9_in
    );
\FSM_onehot_state_seq_reg[state][3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \FSM_onehot_state_seq[state][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \FSM_onehot_state_seq_reg[state][4]_0\(1),
      Q => \^fsm_onehot_state_seq_reg[state][5]_0\(1)
    );
\FSM_onehot_state_seq_reg[state][4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \FSM_onehot_state_seq[state][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \FSM_onehot_state_seq_reg[state][4]_0\(2),
      Q => \^fsm_onehot_state_seq_reg[state][5]_0\(2)
    );
\FSM_onehot_state_seq_reg[state][5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => \FSM_onehot_state_seq[state][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      Q => \^fsm_onehot_state_seq_reg[state][5]_0\(3)
    );
\i__carry__0_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry__0_n_7\,
      I1 => \vstate[rx_credit]0_carry_n_4\,
      I2 => \vstate[rx_credit]0_carry__0_n_6\,
      O => \vstate[xmit_fct_in]4\(5)
    );
\i__carry__0_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_4\,
      I1 => \vstate[rx_credit]0_carry__0_n_7\,
      O => \vstate[xmit_fct_in]4\(4)
    );
\i__carry__0_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A95"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry__0_n_6\,
      I1 => \vstate[rx_credit]0_carry_n_4\,
      I2 => \vstate[rx_credit]0_carry__0_n_7\,
      I3 => Q(5),
      O => \i__carry__0_i_3__0_n_0\
    );
\i__carry__0_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry__0_n_7\,
      I1 => \vstate[rx_credit]0_carry_n_4\,
      I2 => Q(4),
      O => \i__carry__0_i_4__0_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_4\,
      O => \vstate[xmit_fct_in]4\(3)
    );
\i__carry_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_4\,
      I1 => Q(3),
      O => \i__carry_i_2__0_n_0\
    );
\i__carry_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_5\,
      I1 => Q(2),
      O => \i__carry_i_3__0_n_0\
    );
\i__carry_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_6\,
      I1 => Q(1),
      O => \i__carry_i_4__0_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_7\,
      I1 => Q(0),
      O => \i__carry_i_5_n_0\
    );
\p_1_out_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \p_1_out_inferred__0/i__carry_n_0\,
      CO(2) => \p_1_out_inferred__0/i__carry_n_1\,
      CO(1) => \p_1_out_inferred__0/i__carry_n_2\,
      CO(0) => \p_1_out_inferred__0/i__carry_n_3\,
      CYINIT => '1',
      DI(3) => \vstate[xmit_fct_in]4\(3),
      DI(2) => \vstate[rx_credit]0_carry_n_5\,
      DI(1) => \vstate[rx_credit]0_carry_n_6\,
      DI(0) => \vstate[rx_credit]0_carry_n_7\,
      O(3 downto 0) => \NLW_p_1_out_inferred__0/i__carry_O_UNCONNECTED\(3 downto 0),
      S(3) => \i__carry_i_2__0_n_0\,
      S(2) => \i__carry_i_3__0_n_0\,
      S(1) => \i__carry_i_4__0_n_0\,
      S(0) => \i__carry_i_5_n_0\
    );
\p_1_out_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \p_1_out_inferred__0/i__carry_n_0\,
      CO(3 downto 2) => \NLW_p_1_out_inferred__0/i__carry__0_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \p_1_out_inferred__0/i__carry__0_n_2\,
      CO(0) => \p_1_out_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1 downto 0) => \vstate[xmit_fct_in]4\(5 downto 4),
      O(3 downto 0) => \NLW_p_1_out_inferred__0/i__carry__0_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \i__carry__0_i_3__0_n_0\,
      S(0) => \i__carry__0_i_4__0_n_0\
    );
\res_seq[allow_char]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \res_seq_reg[sent_fct]__0\,
      I1 => \^fsm_onehot_state_seq_reg[state][5]_0\(0),
      I2 => p_0_in9_in,
      I3 => \^fsm_onehot_state_seq_reg[state][5]_0\(1),
      O => \v[allow_char]\
    );
\res_seq[allow_fct]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => \^fsm_onehot_state_seq_reg[state][5]_0\(1),
      I1 => p_0_in9_in,
      I2 => \^fsm_onehot_state_seq_reg[state][5]_0\(0),
      O => \FSM_onehot_state_seq_reg[state][3]_0\
    );
\res_seq[bitcntp_gray][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^recv_rxen\,
      I1 => \syncsys[rxcnt_ddr_gray]\(0),
      O => \state_seq_reg[rxen]_0\(0)
    );
\res_seq[bitcntp_gray][2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^recv_rxen\,
      I1 => \syncsys[rxcnt_ddr_gray]\(1),
      O => \state_seq_reg[rxen]_0\(1)
    );
\res_seq[bitcntp_gray][3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^recv_rxen\,
      I1 => \syncsys[rxcnt_ddr_gray]\(2),
      O => \state_seq_reg[rxen]_0\(2)
    );
\res_seq[bitshift][8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^recv_rxen\,
      I1 => sys_rst_n,
      O => AR(0)
    );
\res_seq[inbvalid]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^recv_rxen\,
      I1 => \res_seq_reg[inbvalid]\,
      O => \vres[inbvalid]0_out\
    );
\res_seq[pend_data][8]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \state_seq[tx_credit][5]_i_3_n_0\,
      O => E(0)
    );
\res_seq[rxeep]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \res_seq_reg[rxeep]__0\,
      I1 => \res_seq_reg[rxfull]__0\,
      I2 => \^fsm_onehot_state_seq_reg[state][5]_0\(0),
      I3 => \res_seq_reg[rxeep]\,
      O => \vres[rxeep]3_out\
    );
\res_seq[token1][fctpiggy]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^fsm_onehot_state_seq_reg[state][5]_0\(0),
      I1 => p_0_in9_in,
      I2 => \^fsm_onehot_state_seq_reg[state][5]_0\(1),
      O => \^fsm_onehot_state_seq_reg[state][1]_0\
    );
\res_seq[txdiscard]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF08FF080D080D"
    )
        port map (
      I0 => \state_seq[tx_credit][5]_i_3_n_0\,
      I1 => \res_seq_reg[txdiscard]_0\,
      I2 => \^fsm_onehot_state_seq_reg[state][5]_0\(0),
      I3 => D(0),
      I4 => \res_seq_reg[txdiscard]_1\,
      I5 => \res_seq_reg[txdiscard]__0\,
      O => \vres[txdiscard]\
    );
\res_seq[txfifo_raddr][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA00AA00AB00AA00"
    )
        port map (
      I0 => \res_seq_reg[txdiscard]__0\,
      I1 => \^fsm_onehot_state_seq_reg[state][1]_0\,
      I2 => \res_seq_reg[pend_char]__0\,
      I3 => \res_seq_reg[txfifo_rvalid]__0\,
      I4 => \res_seq_reg[allow_char]__0\,
      I5 => \^state_seq_reg[tx_credit][3]_0\,
      O => \^res_seq_reg[txdiscard]\
    );
\res_seq[txfifo_raddr][0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \state_seq_reg[tx_credit]\(3),
      I1 => \state_seq_reg[tx_credit]\(2),
      I2 => \state_seq_reg[tx_credit]\(0),
      I3 => \state_seq_reg[tx_credit]\(1),
      I4 => \state_seq_reg[tx_credit]\(4),
      I5 => \state_seq_reg[tx_credit]\(5),
      O => \^state_seq_reg[tx_credit][3]_0\
    );
\res_seq[txfifo_rvalid]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0434C7F7"
    )
        port map (
      I0 => \vres[txfiforoom]0_in\(12),
      I1 => \^res_seq_reg[txdiscard]\,
      I2 => SPW_TXWRITE,
      I3 => O(0),
      I4 => \res_seq_reg[txfifo_rvalid]\(12),
      O => \res_com[txfifo_rvalid]\
    );
\res_seq[txfiforoom][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(0),
      I1 => \res_seq_reg[txfiforoom][3]\(0),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(0),
      O => \^res_seq_reg[txfiforoom][12]\(0)
    );
\res_seq[txfiforoom][10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(10),
      I1 => \res_seq_reg[txfiforoom][11]\(2),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(10),
      O => \^res_seq_reg[txfiforoom][12]\(10)
    );
\res_seq[txfiforoom][11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CCAAF0"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom][11]\(3),
      I1 => \vres[txfiforoom]0_in\(11),
      I2 => \res_seq_reg[txfifo_rvalid]\(11),
      I3 => SPW_TXWRITE,
      I4 => \^res_seq_reg[txdiscard]\,
      O => \^res_seq_reg[txfiforoom][12]\(11)
    );
\res_seq[txfiforoom][12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(12),
      I1 => O(0),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(12),
      O => \^res_seq_reg[txfiforoom][12]\(12)
    );
\res_seq[txfiforoom][1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(1),
      I1 => \res_seq_reg[txfiforoom][3]\(1),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(1),
      O => \^res_seq_reg[txfiforoom][12]\(1)
    );
\res_seq[txfiforoom][2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(2),
      I1 => \res_seq_reg[txfiforoom][3]\(2),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(2),
      O => \^res_seq_reg[txfiforoom][12]\(2)
    );
\res_seq[txfiforoom][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(3),
      I1 => \res_seq_reg[txfiforoom][3]\(3),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(3),
      O => \^res_seq_reg[txfiforoom][12]\(3)
    );
\res_seq[txfiforoom][4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(4),
      I1 => \res_seq_reg[txfiforoom][7]\(0),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(4),
      O => \^res_seq_reg[txfiforoom][12]\(4)
    );
\res_seq[txfiforoom][5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(5),
      I1 => \res_seq_reg[txfiforoom][7]\(1),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(5),
      O => \^res_seq_reg[txfiforoom][12]\(5)
    );
\res_seq[txfiforoom][6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(6),
      I1 => \res_seq_reg[txfiforoom][7]\(2),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(6),
      O => \^res_seq_reg[txfiforoom][12]\(6)
    );
\res_seq[txfiforoom][7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(7),
      I1 => \res_seq_reg[txfiforoom][7]\(3),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(7),
      O => \^res_seq_reg[txfiforoom][12]\(7)
    );
\res_seq[txfiforoom][8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(8),
      I1 => \res_seq_reg[txfiforoom][11]\(0),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(8),
      O => \^res_seq_reg[txfiforoom][12]\(8)
    );
\res_seq[txfiforoom][9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[txfifo_rvalid]\(9),
      I1 => \res_seq_reg[txfiforoom][11]\(1),
      I2 => SPW_TXWRITE,
      I3 => \^res_seq_reg[txdiscard]\,
      I4 => \vres[txfiforoom]0_in\(9),
      O => \^res_seq_reg[txfiforoom][12]\(9)
    );
\res_seq[txfull]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \res_seq[txfull]_i_2_n_0\,
      I1 => \res_seq[txfull]_i_3_n_0\,
      I2 => \^res_seq_reg[txfiforoom][12]\(9),
      I3 => \^res_seq_reg[txfiforoom][12]\(2),
      I4 => \^res_seq_reg[txfiforoom][12]\(4),
      O => \res_com[txfull]\
    );
\res_seq[txfull]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \^res_seq_reg[txfiforoom][12]\(1),
      I1 => \^res_seq_reg[txfiforoom][12]\(11),
      I2 => \^res_seq_reg[txfiforoom][12]\(12),
      I3 => \^res_seq_reg[txfiforoom][12]\(3),
      I4 => \^res_seq_reg[txfiforoom][12]\(6),
      I5 => \^res_seq_reg[txfiforoom][12]\(5),
      O => \res_seq[txfull]_i_2_n_0\
    );
\res_seq[txfull]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^res_seq_reg[txfiforoom][12]\(7),
      I1 => \^res_seq_reg[txfiforoom][12]\(10),
      I2 => \^res_seq_reg[txfiforoom][12]\(0),
      I3 => \^res_seq_reg[txfiforoom][12]\(8),
      O => \res_seq[txfull]_i_3_n_0\
    );
\res_seq[txpacket]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"808A"
    )
        port map (
      I0 => \^fsm_onehot_state_seq_reg[state][5]_0\(0),
      I1 => \res_seq_reg[txdiscard]_0\,
      I2 => \state_seq[tx_credit][5]_i_3_n_0\,
      I3 => D(0),
      O => \vres[txpacket]5_out\
    );
\reset_reg[1]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^recv_rxen\,
      O => load
    );
\state_seq[errcred]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F7F0"
    )
        port map (
      I0 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I1 => \^state_seq_reg[timercnt][6]_0\,
      I2 => \state_seq[errcred]_i_2_n_0\,
      I3 => \state_seq_reg[errcred]__0\,
      O => \state_seq[errcred]_i_1_n_0\
    );
\state_seq[errcred]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5444444444444444"
    )
        port map (
      I0 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I1 => \state_seq[errcred]_i_3_n_0\,
      I2 => \state_seq[errcred]_i_4_n_0\,
      I3 => \state_seq_reg[tx_credit]\(4),
      I4 => \recvo[gotfct]\,
      I5 => \state_seq_reg[tx_credit]\(5),
      O => \state_seq[errcred]_i_2_n_0\
    );
\state_seq[errcred]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \state_seq[errcred]_i_5_n_0\,
      I1 => \state_seq_reg[rx_credit]\(0),
      I2 => \state_seq_reg[rx_credit]\(4),
      I3 => \state_seq_reg[rx_credit]\(3),
      O => \state_seq[errcred]_i_3_n_0\
    );
\state_seq[errcred]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \state_seq_reg[tx_credit]\(1),
      I1 => \state_seq_reg[tx_credit]\(0),
      I2 => \state_seq_reg[tx_credit]\(2),
      I3 => \state_seq_reg[tx_credit]\(3),
      O => \state_seq[errcred]_i_4_n_0\
    );
\state_seq[errcred]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \state_seq_reg[rx_credit]\(5),
      I1 => \recvo[rxchar]\,
      I2 => \state_seq_reg[rx_credit]\(2),
      I3 => \state_seq_reg[rx_credit]\(1),
      O => \state_seq[errcred]_i_5_n_0\
    );
\state_seq[rx_credit][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_7\,
      I1 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      O => \vstate[rx_credit]\(0)
    );
\state_seq[rx_credit][1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_6\,
      I1 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      O => \vstate[rx_credit]\(1)
    );
\state_seq[rx_credit][2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_5\,
      I1 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      O => \vstate[rx_credit]\(2)
    );
\state_seq[rx_credit][3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_4\,
      I1 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      O => \vstate[rx_credit]\(3)
    );
\state_seq[rx_credit][4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry__0_n_7\,
      I1 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      O => \vstate[rx_credit]\(4)
    );
\state_seq[rx_credit][5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry__0_n_6\,
      I1 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      O => \vstate[rx_credit]\(5)
    );
\state_seq[rx_null_fct]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F555F555E000A000"
    )
        port map (
      I0 => p_0_in9_in,
      I1 => \recvo[gotnull]\,
      I2 => \^fsm_onehot_state_seq_reg[state][5]_0\(1),
      I3 => \recvo[gotfct]\,
      I4 => \state_seq_reg[rx_null_fct]_0\,
      I5 => \state_seq_reg[rx_null_fct]__0\,
      O => \state_seq[rx_null_fct]_i_1_n_0\
    );
\state_seq[rxen]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55035500"
    )
        port map (
      I0 => \^state_seq_reg[timercnt][6]_0\,
      I1 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      I2 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I3 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I4 => \^recv_rxen\,
      O => \state_seq[rxen]_i_1_n_0\
    );
\state_seq[timercnt][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I1 => \FSM_onehot_state_seq[state][5]_i_4_n_0\,
      I2 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      I3 => \^state_seq_reg[timercnt][6]_0\,
      I4 => \state_seq_reg[timercnt_n_0_][0]\,
      O => \state_com[timercnt]\(0)
    );
\state_seq[timercnt][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000100"
    )
        port map (
      I0 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I1 => \FSM_onehot_state_seq[state][5]_i_4_n_0\,
      I2 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      I3 => \^state_seq_reg[timercnt][6]_0\,
      I4 => \state_seq_reg[timercnt_n_0_][0]\,
      I5 => \state_seq_reg[timercnt_n_0_][1]\,
      O => \state_com[timercnt]\(1)
    );
\state_seq[timercnt][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000100"
    )
        port map (
      I0 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I1 => \FSM_onehot_state_seq[state][5]_i_4_n_0\,
      I2 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      I3 => \^state_seq_reg[timercnt][6]_0\,
      I4 => \state_seq_reg[timercnt_n_0_][2]\,
      I5 => \state_seq[timercnt][2]_i_2_n_0\,
      O => \state_com[timercnt]\(2)
    );
\state_seq[timercnt][2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \state_seq_reg[timercnt_n_0_][0]\,
      I1 => \state_seq_reg[timercnt_n_0_][1]\,
      O => \state_seq[timercnt][2]_i_2_n_0\
    );
\state_seq[timercnt][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000100"
    )
        port map (
      I0 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I1 => \FSM_onehot_state_seq[state][5]_i_4_n_0\,
      I2 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      I3 => \^state_seq_reg[timercnt][6]_0\,
      I4 => \state_seq_reg[timercnt_n_0_][3]\,
      I5 => \state_seq[timercnt][3]_i_2_n_0\,
      O => \state_com[timercnt]\(3)
    );
\state_seq[timercnt][3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \state_seq_reg[timercnt_n_0_][2]\,
      I1 => \state_seq_reg[timercnt_n_0_][1]\,
      I2 => \state_seq_reg[timercnt_n_0_][0]\,
      O => \state_seq[timercnt][3]_i_2_n_0\
    );
\state_seq[timercnt][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000100"
    )
        port map (
      I0 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I1 => \FSM_onehot_state_seq[state][5]_i_4_n_0\,
      I2 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      I3 => \^state_seq_reg[timercnt][6]_0\,
      I4 => \state_seq_reg[timercnt_n_0_][4]\,
      I5 => \state_seq[timercnt][4]_i_2_n_0\,
      O => \state_com[timercnt]\(4)
    );
\state_seq[timercnt][4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \state_seq_reg[timercnt_n_0_][3]\,
      I1 => \state_seq_reg[timercnt_n_0_][0]\,
      I2 => \state_seq_reg[timercnt_n_0_][1]\,
      I3 => \state_seq_reg[timercnt_n_0_][2]\,
      O => \state_seq[timercnt][4]_i_2_n_0\
    );
\state_seq[timercnt][5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000100"
    )
        port map (
      I0 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I1 => \FSM_onehot_state_seq[state][5]_i_4_n_0\,
      I2 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      I3 => \^state_seq_reg[timercnt][6]_0\,
      I4 => \state_seq_reg[timercnt_n_0_][5]\,
      I5 => \state_seq[timercnt][5]_i_2_n_0\,
      O => \state_com[timercnt]\(5)
    );
\state_seq[timercnt][5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \state_seq_reg[timercnt_n_0_][4]\,
      I1 => \state_seq_reg[timercnt_n_0_][2]\,
      I2 => \state_seq_reg[timercnt_n_0_][1]\,
      I3 => \state_seq_reg[timercnt_n_0_][0]\,
      I4 => \state_seq_reg[timercnt_n_0_][3]\,
      O => \state_seq[timercnt][5]_i_2_n_0\
    );
\state_seq[timercnt][6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000100000000"
    )
        port map (
      I0 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I1 => \FSM_onehot_state_seq[state][5]_i_4_n_0\,
      I2 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      I3 => \state_seq_reg[timercnt_n_0_][6]\,
      I4 => \state_seq[timercnt][7]_i_2_n_0\,
      I5 => \^state_seq_reg[timercnt][6]_0\,
      O => \state_com[timercnt]\(6)
    );
\state_seq[timercnt][6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \state_seq[timercnt][4]_i_2_n_0\,
      I1 => \state_seq_reg[timercnt_n_0_][6]\,
      I2 => \state_seq_reg[timercnt_n_0_][7]\,
      I3 => \state_seq_reg[timercnt_n_0_][4]\,
      I4 => \state_seq_reg[timercnt_n_0_][5]\,
      O => \^state_seq_reg[timercnt][6]_0\
    );
\state_seq[timercnt][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFE1"
    )
        port map (
      I0 => \state_seq_reg[timercnt_n_0_][6]\,
      I1 => \state_seq[timercnt][7]_i_2_n_0\,
      I2 => \state_seq_reg[timercnt_n_0_][7]\,
      I3 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I4 => \FSM_onehot_state_seq[state][5]_i_4_n_0\,
      I5 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      O => \state_com[timercnt]\(7)
    );
\state_seq[timercnt][7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \state_seq_reg[timercnt_n_0_][5]\,
      I1 => \state_seq_reg[timercnt_n_0_][3]\,
      I2 => \state_seq_reg[timercnt_n_0_][0]\,
      I3 => \state_seq_reg[timercnt_n_0_][1]\,
      I4 => \state_seq_reg[timercnt_n_0_][2]\,
      I5 => \state_seq_reg[timercnt_n_0_][4]\,
      O => \state_seq[timercnt][7]_i_2_n_0\
    );
\state_seq[timerdone]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00030001"
    )
        port map (
      I0 => \^state_seq_reg[timercnt][6]_0\,
      I1 => \FSM_onehot_state_seq[state][5]_i_3_n_0\,
      I2 => \FSM_onehot_state_seq[state][5]_i_4_n_0\,
      I3 => \FSM_onehot_state_seq[state][5]_i_5_n_0\,
      I4 => \^state_seq_reg[timerdone]__0\,
      O => \state_seq[timerdone]_i_1_n_0\
    );
\state_seq[tx_credit][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4015"
    )
        port map (
      I0 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I1 => \recvo[gotfct]\,
      I2 => \state_seq[tx_credit][5]_i_3_n_0\,
      I3 => \state_seq_reg[tx_credit]\(0),
      O => \state_seq[tx_credit][0]_i_1_n_0\
    );
\state_seq[tx_credit][1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54440111"
    )
        port map (
      I0 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I1 => \state_seq_reg[tx_credit]\(0),
      I2 => \state_seq[tx_credit][5]_i_3_n_0\,
      I3 => \recvo[gotfct]\,
      I4 => \state_seq_reg[tx_credit]\(1),
      O => \state_seq[tx_credit][1]_i_1_n_0\
    );
\state_seq[tx_credit][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5554545400010101"
    )
        port map (
      I0 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I1 => \state_seq_reg[tx_credit]\(1),
      I2 => \state_seq_reg[tx_credit]\(0),
      I3 => \state_seq[tx_credit][5]_i_3_n_0\,
      I4 => \recvo[gotfct]\,
      I5 => \state_seq_reg[tx_credit]\(2),
      O => \state_seq[tx_credit][2]_i_1_n_0\
    );
\state_seq[tx_credit][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0154015401541441"
    )
        port map (
      I0 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I1 => \recvo[gotfct]\,
      I2 => \state_seq[tx_credit][5]_i_3_n_0\,
      I3 => \state_seq_reg[tx_credit]\(3),
      I4 => \state_seq_reg[tx_credit]\(2),
      I5 => \state_seq[tx_credit][3]_i_2_n_0\,
      O => \state_seq[tx_credit][3]_i_1_n_0\
    );
\state_seq[tx_credit][3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \state_seq_reg[tx_credit]\(0),
      I1 => \state_seq_reg[tx_credit]\(1),
      O => \state_seq[tx_credit][3]_i_2_n_0\
    );
\state_seq[tx_credit][4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14141441"
    )
        port map (
      I0 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I1 => \state_seq[tx_credit][5]_i_4_n_0\,
      I2 => \state_seq_reg[tx_credit]\(4),
      I3 => \state_seq[tx_credit][5]_i_3_n_0\,
      I4 => \recvo[gotfct]\,
      O => \state_seq[tx_credit][4]_i_1_n_0\
    );
\state_seq[tx_credit][5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I1 => \recvo[gotfct]\,
      I2 => \state_seq[tx_credit][5]_i_3_n_0\,
      O => \state_seq[tx_credit][5]_i_1_n_0\
    );
\state_seq[tx_credit][5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1414144444444441"
    )
        port map (
      I0 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I1 => \state_seq_reg[tx_credit]\(5),
      I2 => \state_seq_reg[tx_credit]\(4),
      I3 => \recvo[gotfct]\,
      I4 => \state_seq[tx_credit][5]_i_3_n_0\,
      I5 => \state_seq[tx_credit][5]_i_4_n_0\,
      O => \state_seq[tx_credit][5]_i_2_n_0\
    );
\state_seq[tx_credit][5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFFFFFF"
    )
        port map (
      I0 => \^fsm_onehot_state_seq_reg[state][1]_0\,
      I1 => \res_seq_reg[txdiscard]__0\,
      I2 => \res_seq_reg[pend_char]__0\,
      I3 => \res_seq_reg[txfifo_rvalid]__0\,
      I4 => \res_seq_reg[allow_char]__0\,
      I5 => \^state_seq_reg[tx_credit][3]_0\,
      O => \state_seq[tx_credit][5]_i_3_n_0\
    );
\state_seq[tx_credit][5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFFAAA8A8FE"
    )
        port map (
      I0 => \state_seq_reg[tx_credit]\(3),
      I1 => \state_seq_reg[tx_credit]\(1),
      I2 => \state_seq_reg[tx_credit]\(0),
      I3 => \state_seq[tx_credit][5]_i_3_n_0\,
      I4 => \recvo[gotfct]\,
      I5 => \state_seq_reg[tx_credit]\(2),
      O => \state_seq[tx_credit][5]_i_4_n_0\
    );
\state_seq[xmit_fct_in]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08083B08"
    )
        port map (
      I0 => \^xmiti[fct_in]\,
      I1 => \FSM_onehot_state_seq_reg[state_n_0_][0]\,
      I2 => \^state_seq_reg[timercnt][6]_0\,
      I3 => \state_seq[xmit_fct_in]_i_2_n_0\,
      I4 => \p_1_out_inferred__0/i__carry__0_n_2\,
      O => \state_seq[xmit_fct_in]_i_1_n_0\
    );
\state_seq[xmit_fct_in]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001FFFFFFFFFFFF"
    )
        port map (
      I0 => \vstate[rx_credit]0_carry_n_5\,
      I1 => \vstate[rx_credit]0_carry_n_6\,
      I2 => \vstate[rx_credit]0_carry_n_4\,
      I3 => \vstate[rx_credit]0_carry_n_7\,
      I4 => \vstate[rx_credit]0_carry__0_n_6\,
      I5 => \vstate[rx_credit]0_carry__0_n_7\,
      O => \state_seq[xmit_fct_in]_i_2_n_0\
    );
\state_seq_reg[errcred]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[errcred]_i_1_n_0\,
      Q => \state_seq_reg[errcred]__0\
    );
\state_seq_reg[rx_credit][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \vstate[rx_credit]\(0),
      Q => \state_seq_reg[rx_credit]\(0)
    );
\state_seq_reg[rx_credit][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \vstate[rx_credit]\(1),
      Q => \state_seq_reg[rx_credit]\(1)
    );
\state_seq_reg[rx_credit][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \vstate[rx_credit]\(2),
      Q => \state_seq_reg[rx_credit]\(2)
    );
\state_seq_reg[rx_credit][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \vstate[rx_credit]\(3),
      Q => \state_seq_reg[rx_credit]\(3)
    );
\state_seq_reg[rx_credit][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \vstate[rx_credit]\(4),
      Q => \state_seq_reg[rx_credit]\(4)
    );
\state_seq_reg[rx_credit][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \vstate[rx_credit]\(5),
      Q => \state_seq_reg[rx_credit]\(5)
    );
\state_seq_reg[rx_null_fct]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[rx_null_fct]_i_1_n_0\,
      Q => \state_seq_reg[rx_null_fct]__0\
    );
\state_seq_reg[rxen]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[rxen]_i_1_n_0\,
      Q => \^recv_rxen\
    );
\state_seq_reg[timercnt][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_com[timercnt]\(0),
      Q => \state_seq_reg[timercnt_n_0_][0]\
    );
\state_seq_reg[timercnt][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_com[timercnt]\(1),
      Q => \state_seq_reg[timercnt_n_0_][1]\
    );
\state_seq_reg[timercnt][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_com[timercnt]\(2),
      Q => \state_seq_reg[timercnt_n_0_][2]\
    );
\state_seq_reg[timercnt][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_com[timercnt]\(3),
      Q => \state_seq_reg[timercnt_n_0_][3]\
    );
\state_seq_reg[timercnt][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_com[timercnt]\(4),
      Q => \state_seq_reg[timercnt_n_0_][4]\
    );
\state_seq_reg[timercnt][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_com[timercnt]\(5),
      Q => \state_seq_reg[timercnt_n_0_][5]\
    );
\state_seq_reg[timercnt][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_com[timercnt]\(6),
      Q => \state_seq_reg[timercnt_n_0_][6]\
    );
\state_seq_reg[timercnt][7]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => '1',
      D => \state_com[timercnt]\(7),
      PRE => \state_seq_reg[rxen]_1\,
      Q => \state_seq_reg[timercnt_n_0_][7]\
    );
\state_seq_reg[timerdone]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[timerdone]_i_1_n_0\,
      Q => \^state_seq_reg[timerdone]__0\
    );
\state_seq_reg[tx_credit][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \state_seq[tx_credit][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[tx_credit][0]_i_1_n_0\,
      Q => \state_seq_reg[tx_credit]\(0)
    );
\state_seq_reg[tx_credit][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \state_seq[tx_credit][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[tx_credit][1]_i_1_n_0\,
      Q => \state_seq_reg[tx_credit]\(1)
    );
\state_seq_reg[tx_credit][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \state_seq[tx_credit][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[tx_credit][2]_i_1_n_0\,
      Q => \state_seq_reg[tx_credit]\(2)
    );
\state_seq_reg[tx_credit][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \state_seq[tx_credit][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[tx_credit][3]_i_1_n_0\,
      Q => \state_seq_reg[tx_credit]\(3)
    );
\state_seq_reg[tx_credit][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \state_seq[tx_credit][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[tx_credit][4]_i_1_n_0\,
      Q => \state_seq_reg[tx_credit]\(4)
    );
\state_seq_reg[tx_credit][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \state_seq[tx_credit][5]_i_1_n_0\,
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[tx_credit][5]_i_2_n_0\,
      Q => \state_seq_reg[tx_credit]\(5)
    );
\state_seq_reg[xmit_fct_in]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \state_seq_reg[rxen]_1\,
      D => \state_seq[xmit_fct_in]_i_1_n_0\,
      Q => \^xmiti[fct_in]\
    );
\vstate[rx_credit]0_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \vstate[rx_credit]0_carry_n_0\,
      CO(2) => \vstate[rx_credit]0_carry_n_1\,
      CO(1) => \vstate[rx_credit]0_carry_n_2\,
      CO(0) => \vstate[rx_credit]0_carry_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => \state_seq_reg[rx_credit]\(3 downto 0),
      O(3) => \vstate[rx_credit]0_carry_n_4\,
      O(2) => \vstate[rx_credit]0_carry_n_5\,
      O(1) => \vstate[rx_credit]0_carry_n_6\,
      O(0) => \vstate[rx_credit]0_carry_n_7\,
      S(3) => \vstate[rx_credit]0_carry_i_1_n_0\,
      S(2) => \vstate[rx_credit]0_carry_i_2_n_0\,
      S(1) => \vstate[rx_credit]0_carry_i_3_n_0\,
      S(0) => \vstate[rx_credit]0_carry_i_4_n_0\
    );
\vstate[rx_credit]0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \vstate[rx_credit]0_carry_n_0\,
      CO(3 downto 1) => \NLW_vstate[rx_credit]0_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \vstate[rx_credit]0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => DI(0),
      O(3 downto 2) => \NLW_vstate[rx_credit]0_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => \vstate[rx_credit]0_carry__0_n_6\,
      O(0) => \vstate[rx_credit]0_carry__0_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \vstate[rx_credit]0_carry__0_i_2_n_0\,
      S(0) => \vstate[rx_credit]0_carry__0_i_3_n_0\
    );
\vstate[rx_credit]0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55556555AAAAAAAA"
    )
        port map (
      I0 => \state_seq_reg[rx_credit]\(5),
      I1 => \^fsm_onehot_state_seq_reg[state][1]_0\,
      I2 => \res_seq_reg[allow_fct]__0\,
      I3 => \^xmiti[fct_in]\,
      I4 => \res_seq_reg[pend_fct]__0\,
      I5 => \recvo[rxchar]\,
      O => \vstate[rx_credit]0_carry__0_i_2_n_0\
    );
\vstate[rx_credit]0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040FFFFFFBF0000"
    )
        port map (
      I0 => \^fsm_onehot_state_seq_reg[state][1]_0\,
      I1 => \res_seq_reg[allow_fct]__0\,
      I2 => \^xmiti[fct_in]\,
      I3 => \res_seq_reg[pend_fct]__0\,
      I4 => \recvo[rxchar]\,
      I5 => \state_seq_reg[rx_credit]\(4),
      O => \vstate[rx_credit]0_carry__0_i_3_n_0\
    );
\vstate[rx_credit]0_carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55556555AAAA9AAA"
    )
        port map (
      I0 => \state_seq_reg[rx_credit]\(3),
      I1 => \^fsm_onehot_state_seq_reg[state][1]_0\,
      I2 => \res_seq_reg[allow_fct]__0\,
      I3 => \^xmiti[fct_in]\,
      I4 => \res_seq_reg[pend_fct]__0\,
      I5 => \recvo[rxchar]\,
      O => \vstate[rx_credit]0_carry_i_1_n_0\
    );
\vstate[rx_credit]0_carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \state_seq_reg[rx_credit]\(2),
      I1 => \recvo[rxchar]\,
      O => \vstate[rx_credit]0_carry_i_2_n_0\
    );
\vstate[rx_credit]0_carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \state_seq_reg[rx_credit]\(1),
      I1 => \recvo[rxchar]\,
      O => \vstate[rx_credit]0_carry_i_3_n_0\
    );
\vstate[rx_credit]0_carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \state_seq_reg[rx_credit]\(0),
      I1 => \recvo[rxchar]\,
      O => \vstate[rx_credit]0_carry_i_4_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRam is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    CLK : out STD_LOGIC;
    recv_rxen : in STD_LOGIC;
    SPW_Sin : in STD_LOGIC;
    SPW_Din : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \s_mem_reg[0][1]_0\ : in STD_LOGIC;
    \resrx_seq_reg[headptr]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \s_mem_reg[0][1]_1\ : in STD_LOGIC;
    \res_seq_reg[tailptr_gray]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    SPW_main_clk : in STD_LOGIC;
    \raddr_buf_reg[2]_0\ : in STD_LOGIC;
    \raddr_buf_reg[1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRam;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRam is
  signal \^clk\ : STD_LOGIC;
  signal raddr_buf : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \res_seq[bufdout][0]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[bufdout][0]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[bufdout][1]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[bufdout][1]_i_3_n_0\ : STD_LOGIC;
  signal \s_mem[0][0]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[0][1]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[1][0]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[1][1]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[2][0]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[2][1]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[3][0]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[3][1]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[4][0]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[4][1]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[5][0]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[5][1]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[6][0]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[6][1]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[7][0]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem[7][1]_i_1_n_0\ : STD_LOGIC;
  signal \s_mem_reg[0]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \s_mem_reg[1]_1\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \s_mem_reg[2]_2\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \s_mem_reg[3]_3\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \s_mem_reg[4]_4\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \s_mem_reg[5]_5\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \s_mem_reg[6]_6\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \s_mem_reg[7]_7\ : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  CLK <= \^clk\;
\raddr_buf_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \raddr_buf_reg[2]_0\,
      D => \raddr_buf_reg[1]_0\(0),
      Q => raddr_buf(0)
    );
\raddr_buf_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \raddr_buf_reg[2]_0\,
      D => \raddr_buf_reg[1]_0\(1),
      Q => raddr_buf(1)
    );
\raddr_buf_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \raddr_buf_reg[2]_0\,
      D => \res_seq_reg[tailptr_gray]\(0),
      Q => raddr_buf(2)
    );
\res_seq[bufdout][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \res_seq[bufdout][0]_i_2_n_0\,
      I1 => raddr_buf(2),
      I2 => \res_seq[bufdout][0]_i_3_n_0\,
      I3 => recv_rxen,
      O => D(0)
    );
\res_seq[bufdout][0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \s_mem_reg[3]_3\(0),
      I1 => \s_mem_reg[2]_2\(0),
      I2 => raddr_buf(1),
      I3 => \s_mem_reg[1]_1\(0),
      I4 => raddr_buf(0),
      I5 => \s_mem_reg[0]_0\(0),
      O => \res_seq[bufdout][0]_i_2_n_0\
    );
\res_seq[bufdout][0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \s_mem_reg[7]_7\(0),
      I1 => \s_mem_reg[6]_6\(0),
      I2 => raddr_buf(1),
      I3 => \s_mem_reg[5]_5\(0),
      I4 => raddr_buf(0),
      I5 => \s_mem_reg[4]_4\(0),
      O => \res_seq[bufdout][0]_i_3_n_0\
    );
\res_seq[bufdout][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => \res_seq[bufdout][1]_i_2_n_0\,
      I1 => raddr_buf(2),
      I2 => \res_seq[bufdout][1]_i_3_n_0\,
      I3 => recv_rxen,
      O => D(1)
    );
\res_seq[bufdout][1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \s_mem_reg[3]_3\(1),
      I1 => \s_mem_reg[2]_2\(1),
      I2 => raddr_buf(1),
      I3 => \s_mem_reg[1]_1\(1),
      I4 => raddr_buf(0),
      I5 => \s_mem_reg[0]_0\(1),
      O => \res_seq[bufdout][1]_i_2_n_0\
    );
\res_seq[bufdout][1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \s_mem_reg[7]_7\(1),
      I1 => \s_mem_reg[6]_6\(1),
      I2 => raddr_buf(1),
      I3 => \s_mem_reg[5]_5\(1),
      I4 => raddr_buf(0),
      I5 => \s_mem_reg[4]_4\(1),
      O => \res_seq[bufdout][1]_i_3_n_0\
    );
\reset_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => SPW_Sin,
      I1 => SPW_Din,
      O => \^clk\
    );
\s_mem[0][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000008"
    )
        port map (
      I0 => Q(0),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(1),
      I3 => \resrx_seq_reg[headptr]\(0),
      I4 => \resrx_seq_reg[headptr]\(2),
      I5 => \s_mem_reg[0]_0\(0),
      O => \s_mem[0][0]_i_1_n_0\
    );
\s_mem[0][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000008"
    )
        port map (
      I0 => Q(1),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(1),
      I3 => \resrx_seq_reg[headptr]\(0),
      I4 => \resrx_seq_reg[headptr]\(2),
      I5 => \s_mem_reg[0]_0\(1),
      O => \s_mem[0][1]_i_1_n_0\
    );
\s_mem[1][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => Q(0),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(1),
      I3 => \resrx_seq_reg[headptr]\(0),
      I4 => \resrx_seq_reg[headptr]\(2),
      I5 => \s_mem_reg[1]_1\(0),
      O => \s_mem[1][0]_i_1_n_0\
    );
\s_mem[1][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => Q(1),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(1),
      I3 => \resrx_seq_reg[headptr]\(0),
      I4 => \resrx_seq_reg[headptr]\(2),
      I5 => \s_mem_reg[1]_1\(1),
      O => \s_mem[1][1]_i_1_n_0\
    );
\s_mem[2][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => Q(0),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(2),
      I3 => \resrx_seq_reg[headptr]\(1),
      I4 => \resrx_seq_reg[headptr]\(0),
      I5 => \s_mem_reg[2]_2\(0),
      O => \s_mem[2][0]_i_1_n_0\
    );
\s_mem[2][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => Q(1),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(2),
      I3 => \resrx_seq_reg[headptr]\(1),
      I4 => \resrx_seq_reg[headptr]\(0),
      I5 => \s_mem_reg[2]_2\(1),
      O => \s_mem[2][1]_i_1_n_0\
    );
\s_mem[3][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => Q(0),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(2),
      I3 => \resrx_seq_reg[headptr]\(0),
      I4 => \resrx_seq_reg[headptr]\(1),
      I5 => \s_mem_reg[3]_3\(0),
      O => \s_mem[3][0]_i_1_n_0\
    );
\s_mem[3][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => Q(1),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(2),
      I3 => \resrx_seq_reg[headptr]\(0),
      I4 => \resrx_seq_reg[headptr]\(1),
      I5 => \s_mem_reg[3]_3\(1),
      O => \s_mem[3][1]_i_1_n_0\
    );
\s_mem[4][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => Q(0),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(1),
      I3 => \resrx_seq_reg[headptr]\(2),
      I4 => \resrx_seq_reg[headptr]\(0),
      I5 => \s_mem_reg[4]_4\(0),
      O => \s_mem[4][0]_i_1_n_0\
    );
\s_mem[4][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => Q(1),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(1),
      I3 => \resrx_seq_reg[headptr]\(2),
      I4 => \resrx_seq_reg[headptr]\(0),
      I5 => \s_mem_reg[4]_4\(1),
      O => \s_mem[4][1]_i_1_n_0\
    );
\s_mem[5][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => Q(0),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(1),
      I3 => \resrx_seq_reg[headptr]\(0),
      I4 => \resrx_seq_reg[headptr]\(2),
      I5 => \s_mem_reg[5]_5\(0),
      O => \s_mem[5][0]_i_1_n_0\
    );
\s_mem[5][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => Q(1),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(1),
      I3 => \resrx_seq_reg[headptr]\(0),
      I4 => \resrx_seq_reg[headptr]\(2),
      I5 => \s_mem_reg[5]_5\(1),
      O => \s_mem[5][1]_i_1_n_0\
    );
\s_mem[6][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => Q(0),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(0),
      I3 => \resrx_seq_reg[headptr]\(2),
      I4 => \resrx_seq_reg[headptr]\(1),
      I5 => \s_mem_reg[6]_6\(0),
      O => \s_mem[6][0]_i_1_n_0\
    );
\s_mem[6][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF08000000"
    )
        port map (
      I0 => Q(1),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(0),
      I3 => \resrx_seq_reg[headptr]\(2),
      I4 => \resrx_seq_reg[headptr]\(1),
      I5 => \s_mem_reg[6]_6\(1),
      O => \s_mem[6][1]_i_1_n_0\
    );
\s_mem[7][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF80000000"
    )
        port map (
      I0 => Q(0),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(0),
      I3 => \resrx_seq_reg[headptr]\(2),
      I4 => \resrx_seq_reg[headptr]\(1),
      I5 => \s_mem_reg[7]_7\(0),
      O => \s_mem[7][0]_i_1_n_0\
    );
\s_mem[7][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF80000000"
    )
        port map (
      I0 => Q(1),
      I1 => \s_mem_reg[0][1]_0\,
      I2 => \resrx_seq_reg[headptr]\(0),
      I3 => \resrx_seq_reg[headptr]\(2),
      I4 => \resrx_seq_reg[headptr]\(1),
      I5 => \s_mem_reg[7]_7\(1),
      O => \s_mem[7][1]_i_1_n_0\
    );
\s_mem_reg[0][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[0][0]_i_1_n_0\,
      Q => \s_mem_reg[0]_0\(0)
    );
\s_mem_reg[0][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[0][1]_i_1_n_0\,
      Q => \s_mem_reg[0]_0\(1)
    );
\s_mem_reg[1][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[1][0]_i_1_n_0\,
      Q => \s_mem_reg[1]_1\(0)
    );
\s_mem_reg[1][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[1][1]_i_1_n_0\,
      Q => \s_mem_reg[1]_1\(1)
    );
\s_mem_reg[2][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[2][0]_i_1_n_0\,
      Q => \s_mem_reg[2]_2\(0)
    );
\s_mem_reg[2][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[2][1]_i_1_n_0\,
      Q => \s_mem_reg[2]_2\(1)
    );
\s_mem_reg[3][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[3][0]_i_1_n_0\,
      Q => \s_mem_reg[3]_3\(0)
    );
\s_mem_reg[3][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[3][1]_i_1_n_0\,
      Q => \s_mem_reg[3]_3\(1)
    );
\s_mem_reg[4][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[4][0]_i_1_n_0\,
      Q => \s_mem_reg[4]_4\(0)
    );
\s_mem_reg[4][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[4][1]_i_1_n_0\,
      Q => \s_mem_reg[4]_4\(1)
    );
\s_mem_reg[5][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[5][0]_i_1_n_0\,
      Q => \s_mem_reg[5]_5\(0)
    );
\s_mem_reg[5][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[5][1]_i_1_n_0\,
      Q => \s_mem_reg[5]_5\(1)
    );
\s_mem_reg[6][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[6][0]_i_1_n_0\,
      Q => \s_mem_reg[6]_6\(0)
    );
\s_mem_reg[6][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[6][1]_i_1_n_0\,
      Q => \s_mem_reg[6]_6\(1)
    );
\s_mem_reg[7][0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[7][0]_i_1_n_0\,
      Q => \s_mem_reg[7]_7\(0)
    );
\s_mem_reg[7][1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^clk\,
      CE => '1',
      CLR => \s_mem_reg[0][1]_1\,
      D => \s_mem[7][1]_i_1_n_0\,
      Q => \s_mem_reg[7]_7\(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecv is
  port (
    \recvo[gotnull]\ : out STD_LOGIC;
    \res_seq_reg[parity]__0\ : out STD_LOGIC;
    \recvo[gotfct]\ : out STD_LOGIC;
    \recvo[tick_out]\ : out STD_LOGIC;
    \recvo[rxchar]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \res_seq_reg[bitcnt][0]_0\ : out STD_LOGIC;
    \res_seq_reg[tick_out]_0\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \res_seq_reg[rxchar]_0\ : out STD_LOGIC;
    \state_seq_reg[timerdone]\ : out STD_LOGIC;
    \res_seq_reg[bit_seen]_0\ : out STD_LOGIC;
    \res_seq_reg[gotfct]_0\ : out STD_LOGIC;
    \res_seq_reg[gotfct]_1\ : out STD_LOGIC;
    \vres[rxpacket]7_out\ : out STD_LOGIC;
    \res_seq_reg[rxfiforoom][4]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \res_seq_reg[rxfiforoom][10]\ : out STD_LOGIC;
    \res_seq_reg[rxfiforoom][8]\ : out STD_LOGIC;
    \res_seq_reg[rxfiforoom][10]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    WEN : out STD_LOGIC;
    \res_com[rxfifo_rvalid]\ : out STD_LOGIC;
    \res_com[rxemptydiscard]\ : out STD_LOGIC;
    WDATA : out STD_LOGIC_VECTOR ( 8 downto 0 );
    recv_inbvalid : in STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    recv_inact : in STD_LOGIC;
    \res_seq_reg[bitshift][8]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_onehot_state_seq_reg[state][4]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \FSM_onehot_state_seq_reg[state][2]\ : in STD_LOGIC;
    \state_seq_reg[timerdone]__0\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    \res_seq_reg[datareg][0]_0\ : in STD_LOGIC;
    \res_seq_reg[rxpacket]\ : in STD_LOGIC;
    \res_seq_reg[rxfifo_rvalid]1\ : in STD_LOGIC;
    \res_seq_reg[rxroom][2]\ : in STD_LOGIC;
    \res_seq_reg[rxroom][2]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \res_seq_reg[rxfifo_rvalid]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \vres[rxfiforoom]0_in\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    SPW_RXREAD : in STD_LOGIC;
    \vres[rxfiforoom]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    \res_seq_reg[rxfull]__0\ : in STD_LOGIC;
    \res_seq_reg[rxeep]__0\ : in STD_LOGIC;
    \res_seq_reg[rxfifo_waddr][11]\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecv;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecv is
  signal \FSM_onehot_state_seq[state][4]_i_3_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal RXMEM_i_23_n_0 : STD_LOGIC;
  signal \^wen\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \recvo[erresc]\ : STD_LOGIC;
  signal \recvo[errpar]\ : STD_LOGIC;
  signal \^recvo[gotfct]\ : STD_LOGIC;
  signal \^recvo[gotnull]\ : STD_LOGIC;
  signal \^recvo[rxchar]\ : STD_LOGIC;
  signal \recvo[rxdata]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \recvo[rxflag]\ : STD_LOGIC;
  signal \^recvo[tick_out]\ : STD_LOGIC;
  signal \res_com[disccnt]\ : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal \res_com[gotfct]\ : STD_LOGIC;
  signal \res_seq[bitcnt][8]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[bitcnt][9]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[bitcnt][9]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[control]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[control]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[datareg][0]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[datareg][7]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[disccnt][1]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[disccnt][2]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[disccnt][3]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[disccnt][6]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[disccnt][6]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[disccnt][7]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[erresc]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[erresc]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[erresc]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[errpar]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[errpar]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[escaped]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[escaped]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[gotfct]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[gotfct]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[null_seen]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[null_seen]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[null_seen]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[null_seen]_i_4_n_0\ : STD_LOGIC;
  signal \res_seq[parity]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[pendfct][0]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[pendfct][1]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[rxchar]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[rxchar]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[rxflag]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[tick_out]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[tick_out]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq_reg[bit_seen]__0\ : STD_LOGIC;
  signal \^res_seq_reg[bitcnt][0]_0\ : STD_LOGIC;
  signal \res_seq_reg[bitcnt_n_0_][0]\ : STD_LOGIC;
  signal \res_seq_reg[bitcnt_n_0_][1]\ : STD_LOGIC;
  signal \res_seq_reg[bitcnt_n_0_][2]\ : STD_LOGIC;
  signal \res_seq_reg[bitcnt_n_0_][3]\ : STD_LOGIC;
  signal \res_seq_reg[bitcnt_n_0_][4]\ : STD_LOGIC;
  signal \res_seq_reg[bitcnt_n_0_][5]\ : STD_LOGIC;
  signal \res_seq_reg[bitcnt_n_0_][6]\ : STD_LOGIC;
  signal \res_seq_reg[bitcnt_n_0_][7]\ : STD_LOGIC;
  signal \res_seq_reg[bitcnt_n_0_][8]\ : STD_LOGIC;
  signal \res_seq_reg[bitcnt_n_0_][9]\ : STD_LOGIC;
  signal \res_seq_reg[bitshift_n_0_][0]\ : STD_LOGIC;
  signal \res_seq_reg[bitshift_n_0_][8]\ : STD_LOGIC;
  signal \res_seq_reg[control]__0\ : STD_LOGIC;
  signal \res_seq_reg[disccnt]\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \res_seq_reg[escaped]__0\ : STD_LOGIC;
  signal \^res_seq_reg[parity]__0\ : STD_LOGIC;
  signal \res_seq_reg[pendfct_n_0_][0]\ : STD_LOGIC;
  signal \res_seq_reg[pendfct_n_0_][1]\ : STD_LOGIC;
  signal \^res_seq_reg[rxchar]_0\ : STD_LOGIC;
  signal \^res_seq_reg[rxfiforoom][10]\ : STD_LOGIC;
  signal \^res_seq_reg[rxfiforoom][10]_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^res_seq_reg[rxfiforoom][8]\ : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^state_seq_reg[timerdone]\ : STD_LOGIC;
  signal \vres[datareg]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \vres[rxchar]9_out\ : STD_LOGIC;
  signal \vres[rxflag]6_out\ : STD_LOGIC;
  signal \vres[tick_out]12_out\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state_seq[state][2]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \FSM_onehot_state_seq[state][2]_i_2\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \FSM_onehot_state_seq[state][3]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \FSM_onehot_state_seq[state][4]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \FSM_onehot_state_seq[state][4]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \FSM_onehot_state_seq[state][5]_i_6\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \FSM_onehot_state_seq[state][5]_i_8\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \FSM_onehot_state_seq[state][5]_i_9\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of RXMEM_i_13 : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of RXMEM_i_14 : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of RXMEM_i_15 : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of RXMEM_i_16 : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of RXMEM_i_17 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of RXMEM_i_18 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of RXMEM_i_19 : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of RXMEM_i_20 : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][0]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][1]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][3]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][4]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][5]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][6]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][7]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][8]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][8]_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][9]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \res_seq[bitcnt][9]_i_3\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \res_seq[control]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \res_seq[datareg][5]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \res_seq[datareg][6]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \res_seq[datareg][7]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \res_seq[datareg][7]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \res_seq[disccnt][1]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \res_seq[disccnt][2]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \res_seq[disccnt][3]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \res_seq[disccnt][5]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \res_seq[disccnt][6]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \res_seq[disccnt][6]_i_3\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \res_seq[erresc]_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \res_seq[errpar]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \res_seq[gotfct]_i_3\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \res_seq[null_seen]_i_3\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \res_seq[pendfct][0]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \res_seq[pendfct][1]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \res_seq[rxchar]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \res_seq[rxemptydiscard]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \res_seq[rxpacket]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \res_seq[tick_out]_i_3\ : label is "soft_lutpair32";
begin
  Q(0) <= \^q\(0);
  WEN <= \^wen\;
  \recvo[gotfct]\ <= \^recvo[gotfct]\;
  \recvo[gotnull]\ <= \^recvo[gotnull]\;
  \recvo[rxchar]\ <= \^recvo[rxchar]\;
  \recvo[tick_out]\ <= \^recvo[tick_out]\;
  \res_seq_reg[bitcnt][0]_0\ <= \^res_seq_reg[bitcnt][0]_0\;
  \res_seq_reg[parity]__0\ <= \^res_seq_reg[parity]__0\;
  \res_seq_reg[rxchar]_0\ <= \^res_seq_reg[rxchar]_0\;
  \res_seq_reg[rxfiforoom][10]\ <= \^res_seq_reg[rxfiforoom][10]\;
  \res_seq_reg[rxfiforoom][10]_0\(3 downto 0) <= \^res_seq_reg[rxfiforoom][10]_0\(3 downto 0);
  \res_seq_reg[rxfiforoom][8]\ <= \^res_seq_reg[rxfiforoom][8]\;
  \state_seq_reg[timerdone]\ <= \^state_seq_reg[timerdone]\;
\FSM_onehot_state_seq[state][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8808"
    )
        port map (
      I0 => \FSM_onehot_state_seq_reg[state][4]\(1),
      I1 => \^state_seq_reg[timerdone]\,
      I2 => \^recvo[gotfct]\,
      I3 => \^recvo[gotnull]\,
      O => \res_seq_reg[tick_out]_0\(0)
    );
\FSM_onehot_state_seq[state][2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"008A"
    )
        port map (
      I0 => \^res_seq_reg[rxchar]_0\,
      I1 => \FSM_onehot_state_seq_reg[state][2]\,
      I2 => \state_seq_reg[timerdone]__0\,
      I3 => \^recvo[tick_out]\,
      O => \^state_seq_reg[timerdone]\
    );
\FSM_onehot_state_seq[state][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \^res_seq_reg[rxchar]_0\,
      I1 => \^recvo[tick_out]\,
      I2 => \^recvo[gotfct]\,
      I3 => \FSM_onehot_state_seq_reg[state][4]\(2),
      O => \res_seq_reg[tick_out]_0\(1)
    );
\FSM_onehot_state_seq[state][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \^res_seq_reg[rxchar]_0\,
      I1 => \^recvo[tick_out]\,
      I2 => \^recvo[gotfct]\,
      I3 => \FSM_onehot_state_seq_reg[state][4]\(3),
      O => \res_seq_reg[tick_out]_0\(2)
    );
\FSM_onehot_state_seq[state][4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01010001"
    )
        port map (
      I0 => \^recvo[rxchar]\,
      I1 => \recvo[errpar]\,
      I2 => \recvo[erresc]\,
      I3 => \res_seq_reg[bit_seen]__0\,
      I4 => \FSM_onehot_state_seq[state][4]_i_3_n_0\,
      O => \^res_seq_reg[rxchar]_0\
    );
\FSM_onehot_state_seq[state][4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \res_seq[disccnt][6]_i_3_n_0\,
      I1 => \res_seq_reg[disccnt]\(6),
      I2 => \res_seq_reg[disccnt]\(7),
      I3 => \res_seq_reg[disccnt]\(4),
      I4 => \res_seq_reg[disccnt]\(5),
      O => \FSM_onehot_state_seq[state][4]_i_3_n_0\
    );
\FSM_onehot_state_seq[state][5]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF4"
    )
        port map (
      I0 => \FSM_onehot_state_seq[state][4]_i_3_n_0\,
      I1 => \res_seq_reg[bit_seen]__0\,
      I2 => \recvo[erresc]\,
      I3 => \recvo[errpar]\,
      O => \res_seq_reg[bit_seen]_0\
    );
\FSM_onehot_state_seq[state][5]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^recvo[gotfct]\,
      I1 => \^recvo[gotnull]\,
      O => \res_seq_reg[gotfct]_1\
    );
\FSM_onehot_state_seq[state][5]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^recvo[gotfct]\,
      I1 => \^recvo[tick_out]\,
      O => \res_seq_reg[gotfct]_0\
    );
RXMEM_i_13: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \recvo[rxflag]\,
      I1 => \res_seq_reg[rxeep]__0\,
      O => WDATA(8)
    );
RXMEM_i_14: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \recvo[rxdata]\(7),
      I1 => \res_seq_reg[rxeep]__0\,
      O => WDATA(7)
    );
RXMEM_i_15: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \recvo[rxdata]\(6),
      I1 => \res_seq_reg[rxeep]__0\,
      O => WDATA(6)
    );
RXMEM_i_16: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \recvo[rxdata]\(5),
      I1 => \res_seq_reg[rxeep]__0\,
      O => WDATA(5)
    );
RXMEM_i_17: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \recvo[rxdata]\(4),
      I1 => \res_seq_reg[rxeep]__0\,
      O => WDATA(4)
    );
RXMEM_i_18: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \recvo[rxdata]\(3),
      I1 => \res_seq_reg[rxeep]__0\,
      O => WDATA(3)
    );
RXMEM_i_19: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \recvo[rxdata]\(2),
      I1 => \res_seq_reg[rxeep]__0\,
      O => WDATA(2)
    );
RXMEM_i_20: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \recvo[rxdata]\(1),
      I1 => \res_seq_reg[rxeep]__0\,
      O => WDATA(1)
    );
RXMEM_i_21: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \res_seq_reg[rxeep]__0\,
      I1 => \recvo[rxdata]\(0),
      O => WDATA(0)
    );
RXMEM_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0504050400045504"
    )
        port map (
      I0 => \res_seq_reg[rxfull]__0\,
      I1 => \res_seq_reg[rxeep]__0\,
      I2 => \res_seq_reg[rxfifo_waddr][11]\,
      I3 => RXMEM_i_23_n_0,
      I4 => \recvo[rxflag]\,
      I5 => \res_seq_reg[rxpacket]\,
      O => \^wen\
    );
RXMEM_i_23: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^recvo[rxchar]\,
      I1 => \FSM_onehot_state_seq_reg[state][4]\(0),
      O => RXMEM_i_23_n_0
    );
\res_seq[bitcnt][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][1]\,
      I1 => \^res_seq_reg[bitcnt][0]_0\,
      I2 => \res_seq_reg[bitcnt_n_0_][2]\,
      I3 => \res_seq[bitcnt][9]_i_2_n_0\,
      O => \p_0_in__0\(0)
    );
\res_seq[bitcnt][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][1]\,
      I1 => \^res_seq_reg[bitcnt][0]_0\,
      I2 => \res_seq_reg[bitcnt_n_0_][3]\,
      I3 => \res_seq[bitcnt][9]_i_2_n_0\,
      O => \p_0_in__0\(1)
    );
\res_seq[bitcnt][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FCF0FCFA"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][4]\,
      I1 => \res_seq_reg[bitshift][8]_0\(0),
      I2 => \res_seq[bitcnt][8]_i_2_n_0\,
      I3 => \res_seq_reg[bitcnt_n_0_][0]\,
      I4 => \res_seq_reg[bitcnt_n_0_][1]\,
      I5 => \res_seq[bitcnt][9]_i_2_n_0\,
      O => \p_0_in__0\(2)
    );
\res_seq[bitcnt][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0FCFA"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][5]\,
      I1 => \res_seq_reg[bitshift][8]_0\(1),
      I2 => \res_seq[bitcnt][9]_i_2_n_0\,
      I3 => \res_seq_reg[bitcnt_n_0_][1]\,
      I4 => \^res_seq_reg[bitcnt][0]_0\,
      O => \p_0_in__0\(3)
    );
\res_seq[bitcnt][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][1]\,
      I1 => \^res_seq_reg[bitcnt][0]_0\,
      I2 => \res_seq_reg[bitcnt_n_0_][6]\,
      I3 => \res_seq[bitcnt][9]_i_2_n_0\,
      O => \p_0_in__0\(4)
    );
\res_seq[bitcnt][5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][1]\,
      I1 => \^res_seq_reg[bitcnt][0]_0\,
      I2 => \res_seq_reg[bitcnt_n_0_][7]\,
      I3 => \res_seq[bitcnt][9]_i_2_n_0\,
      O => \p_0_in__0\(5)
    );
\res_seq[bitcnt][6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][1]\,
      I1 => \^res_seq_reg[bitcnt][0]_0\,
      I2 => \res_seq_reg[bitcnt_n_0_][8]\,
      I3 => \res_seq[bitcnt][9]_i_2_n_0\,
      O => \p_0_in__0\(6)
    );
\res_seq[bitcnt][7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][1]\,
      I1 => \^res_seq_reg[bitcnt][0]_0\,
      I2 => \res_seq_reg[bitcnt_n_0_][9]\,
      I3 => \res_seq[bitcnt][9]_i_2_n_0\,
      O => \p_0_in__0\(7)
    );
\res_seq[bitcnt][7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAABAAAAAA"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][0]\,
      I1 => \^recvo[gotnull]\,
      I2 => \res_seq_reg[bitshift_n_0_][0]\,
      I3 => sel0(4),
      I4 => sel0(0),
      I5 => \res_seq[null_seen]_i_4_n_0\,
      O => \^res_seq_reg[bitcnt][0]_0\
    );
\res_seq[bitcnt][8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \res_seq[bitcnt][8]_i_2_n_0\,
      I1 => \res_seq_reg[bitcnt_n_0_][0]\,
      I2 => \res_seq_reg[bitshift][8]_0\(0),
      I3 => \res_seq[bitcnt][9]_i_2_n_0\,
      O => \p_0_in__0\(8)
    );
\res_seq[bitcnt][8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => \res_seq[null_seen]_i_4_n_0\,
      I1 => sel0(0),
      I2 => sel0(4),
      I3 => \res_seq_reg[bitshift_n_0_][0]\,
      I4 => \^recvo[gotnull]\,
      O => \res_seq[bitcnt][8]_i_2_n_0\
    );
\res_seq[bitcnt][9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \res_seq[bitcnt][9]_i_2_n_0\,
      I1 => \res_seq_reg[bitshift][8]_0\(1),
      I2 => \res_seq[bitcnt][9]_i_3_n_0\,
      O => \p_0_in__0\(9)
    );
\res_seq[bitcnt][9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000001000"
    )
        port map (
      I0 => \res_seq_reg[bitshift_n_0_][8]\,
      I1 => p_0_in(1),
      I2 => sel0(1),
      I3 => sel0(2),
      I4 => \res_seq[null_seen]_i_2_n_0\,
      I5 => \res_seq[null_seen]_i_3_n_0\,
      O => \res_seq[bitcnt][9]_i_2_n_0\
    );
\res_seq[bitcnt][9]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^res_seq_reg[bitcnt][0]_0\,
      I1 => \res_seq_reg[bitcnt_n_0_][1]\,
      O => \res_seq[bitcnt][9]_i_3_n_0\
    );
\res_seq[control]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F4B0"
    )
        port map (
      I0 => \res_seq[bitcnt][9]_i_2_n_0\,
      I1 => \res_seq[bitcnt][9]_i_3_n_0\,
      I2 => \res_seq_reg[bitshift][8]_0\(1),
      I3 => \res_seq[control]_i_2_n_0\,
      O => \res_seq[control]_i_1_n_0\
    );
\res_seq[control]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \res_seq_reg[bitshift][8]_0\(0),
      I1 => \^res_seq_reg[bitcnt][0]_0\,
      I2 => \res_seq_reg[control]__0\,
      O => \res_seq[control]_i_2_n_0\
    );
\res_seq[datareg][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3F307F753F302A20"
    )
        port map (
      I0 => \res_seq[bitcnt][9]_i_3_n_0\,
      I1 => p_0_in(1),
      I2 => \res_seq_reg[control]__0\,
      I3 => \res_seq_reg[bitshift_n_0_][0]\,
      I4 => \res_seq_reg[datareg][0]_0\,
      I5 => \res_seq[datareg][0]_i_3_n_0\,
      O => \vres[datareg]__0\(0)
    );
\res_seq[datareg][0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20FEFFFF20FE0000"
    )
        port map (
      I0 => p_0_in(1),
      I1 => \res_seq_reg[control]__0\,
      I2 => \res_seq_reg[bitshift_n_0_][0]\,
      I3 => \res_seq_reg[bitshift_n_0_][8]\,
      I4 => \res_seq[control]_i_2_n_0\,
      I5 => sel0(0),
      O => \res_seq[datareg][0]_i_3_n_0\
    );
\res_seq[datareg][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => sel0(1),
      I1 => \res_seq[tick_out]_i_2_n_0\,
      I2 => sel0(0),
      I3 => \res_seq_reg[control]__0\,
      O => \vres[datareg]__0\(1)
    );
\res_seq[datareg][2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4040"
    )
        port map (
      I0 => \res_seq_reg[control]__0\,
      I1 => sel0(1),
      I2 => \res_seq[rxchar]_i_2_n_0\,
      I3 => \res_seq[tick_out]_i_2_n_0\,
      I4 => sel0(2),
      O => \vres[datareg]__0\(2)
    );
\res_seq[datareg][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => sel0(3),
      I1 => \res_seq[tick_out]_i_2_n_0\,
      I2 => sel0(2),
      I3 => \res_seq_reg[control]__0\,
      O => \vres[datareg]__0\(3)
    );
\res_seq[datareg][4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4040"
    )
        port map (
      I0 => \res_seq_reg[control]__0\,
      I1 => sel0(3),
      I2 => \res_seq[rxchar]_i_2_n_0\,
      I3 => \res_seq[tick_out]_i_2_n_0\,
      I4 => sel0(4),
      O => \vres[datareg]__0\(4)
    );
\res_seq[datareg][5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => p_0_in(0),
      I1 => \res_seq[tick_out]_i_2_n_0\,
      I2 => sel0(4),
      I3 => \res_seq_reg[control]__0\,
      O => \vres[datareg]__0\(5)
    );
\res_seq[datareg][6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => p_0_in(1),
      I1 => \res_seq[tick_out]_i_2_n_0\,
      I2 => p_0_in(0),
      I3 => \res_seq_reg[control]__0\,
      O => \vres[datareg]__0\(6)
    );
\res_seq[datareg][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08888808AAAAAAAA"
    )
        port map (
      I0 => recv_inbvalid,
      I1 => \res_seq[tick_out]_i_3_n_0\,
      I2 => \res_seq_reg[control]__0\,
      I3 => p_0_in(1),
      I4 => p_0_in(0),
      I5 => \res_seq[rxchar]_i_2_n_0\,
      O => \vres[rxflag]6_out\
    );
\res_seq[datareg][7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4F4F4F00"
    )
        port map (
      I0 => \res_seq_reg[control]__0\,
      I1 => p_0_in(1),
      I2 => \res_seq[tick_out]_i_2_n_0\,
      I3 => \res_seq[datareg][7]_i_3_n_0\,
      I4 => \res_seq_reg[bitshift_n_0_][8]\,
      O => \vres[datareg]__0\(7)
    );
\res_seq[datareg][7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF69FF"
    )
        port map (
      I0 => \res_seq_reg[bitshift][8]_0\(0),
      I1 => \^res_seq_reg[parity]__0\,
      I2 => \res_seq_reg[bitshift][8]_0\(1),
      I3 => \res_seq_reg[bitcnt_n_0_][1]\,
      I4 => \^res_seq_reg[bitcnt][0]_0\,
      O => \res_seq[datareg][7]_i_3_n_0\
    );
\res_seq[disccnt][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => recv_inact,
      I1 => \res_seq_reg[disccnt]\(1),
      I2 => \^q\(0),
      O => \res_seq[disccnt][1]_i_1_n_0\
    );
\res_seq[disccnt][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5401"
    )
        port map (
      I0 => recv_inact,
      I1 => \^q\(0),
      I2 => \res_seq_reg[disccnt]\(1),
      I3 => \res_seq_reg[disccnt]\(2),
      O => \res_seq[disccnt][2]_i_1_n_0\
    );
\res_seq[disccnt][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55540001"
    )
        port map (
      I0 => recv_inact,
      I1 => \res_seq_reg[disccnt]\(2),
      I2 => \res_seq_reg[disccnt]\(1),
      I3 => \^q\(0),
      I4 => \res_seq_reg[disccnt]\(3),
      O => \res_seq[disccnt][3]_i_1_n_0\
    );
\res_seq[disccnt][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEAAAAAAAB"
    )
        port map (
      I0 => recv_inact,
      I1 => \res_seq_reg[disccnt]\(3),
      I2 => \^q\(0),
      I3 => \res_seq_reg[disccnt]\(1),
      I4 => \res_seq_reg[disccnt]\(2),
      I5 => \res_seq_reg[disccnt]\(4),
      O => \res_com[disccnt]\(4)
    );
\res_seq[disccnt][5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E1"
    )
        port map (
      I0 => \res_seq_reg[disccnt]\(4),
      I1 => \res_seq[disccnt][6]_i_3_n_0\,
      I2 => \res_seq_reg[disccnt]\(5),
      I3 => recv_inact,
      O => \res_com[disccnt]\(5)
    );
\res_seq[disccnt][6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => recv_inact,
      I1 => \res_seq_reg[disccnt]\(5),
      I2 => \res_seq_reg[disccnt]\(4),
      I3 => \res_seq_reg[disccnt]\(7),
      I4 => \res_seq_reg[disccnt]\(6),
      I5 => \res_seq[disccnt][6]_i_3_n_0\,
      O => \res_seq[disccnt][6]_i_1_n_0\
    );
\res_seq[disccnt][6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FE01"
    )
        port map (
      I0 => \res_seq[disccnt][6]_i_3_n_0\,
      I1 => \res_seq_reg[disccnt]\(4),
      I2 => \res_seq_reg[disccnt]\(5),
      I3 => \res_seq_reg[disccnt]\(6),
      I4 => recv_inact,
      O => \res_com[disccnt]\(6)
    );
\res_seq[disccnt][6]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \res_seq_reg[disccnt]\(3),
      I1 => \^q\(0),
      I2 => \res_seq_reg[disccnt]\(1),
      I3 => \res_seq_reg[disccnt]\(2),
      O => \res_seq[disccnt][6]_i_3_n_0\
    );
\res_seq[disccnt][7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => \res_seq_reg[disccnt]\(7),
      I1 => \res_com[disccnt]\(7),
      I2 => \res_seq[disccnt][6]_i_1_n_0\,
      O => \res_seq[disccnt][7]_i_1_n_0\
    );
\res_seq[disccnt][7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFE0001"
    )
        port map (
      I0 => \res_seq_reg[disccnt]\(5),
      I1 => \res_seq_reg[disccnt]\(4),
      I2 => \res_seq[disccnt][6]_i_3_n_0\,
      I3 => \res_seq_reg[disccnt]\(6),
      I4 => \res_seq_reg[disccnt]\(7),
      I5 => recv_inact,
      O => \res_com[disccnt]\(7)
    );
\res_seq[erresc]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFBBBB00808888"
    )
        port map (
      I0 => \res_seq_reg[escaped]__0\,
      I1 => recv_inbvalid,
      I2 => \res_seq[control]_i_2_n_0\,
      I3 => \res_seq[erresc]_i_2_n_0\,
      I4 => \res_seq[erresc]_i_3_n_0\,
      I5 => \recvo[erresc]\,
      O => \res_seq[erresc]_i_1_n_0\
    );
\res_seq[erresc]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F1"
    )
        port map (
      I0 => p_0_in(1),
      I1 => \res_seq_reg[bitshift_n_0_][8]\,
      I2 => \res_seq[datareg][7]_i_3_n_0\,
      O => \res_seq[erresc]_i_2_n_0\
    );
\res_seq[erresc]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9F9F9FFFFFFFFFFF"
    )
        port map (
      I0 => \res_seq_reg[bitshift][8]_0\(0),
      I1 => \^res_seq_reg[parity]__0\,
      I2 => \res_seq_reg[bitcnt_n_0_][0]\,
      I3 => p_0_in(1),
      I4 => p_0_in(0),
      I5 => \res_seq_reg[control]__0\,
      O => \res_seq[erresc]_i_3_n_0\
    );
\res_seq[errpar]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFA88A8888"
    )
        port map (
      I0 => recv_inbvalid,
      I1 => \res_seq[errpar]_i_2_n_0\,
      I2 => \res_seq_reg[bitshift][8]_0\(0),
      I3 => \^res_seq_reg[parity]__0\,
      I4 => \res_seq_reg[bitcnt_n_0_][0]\,
      I5 => \recvo[errpar]\,
      O => \res_seq[errpar]_i_1_n_0\
    );
\res_seq[errpar]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00006900"
    )
        port map (
      I0 => \res_seq_reg[bitshift][8]_0\(0),
      I1 => \^res_seq_reg[parity]__0\,
      I2 => \res_seq_reg[bitshift][8]_0\(1),
      I3 => \res_seq_reg[bitcnt_n_0_][1]\,
      I4 => \^res_seq_reg[bitcnt][0]_0\,
      O => \res_seq[errpar]_i_2_n_0\
    );
\res_seq[escaped]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFBB8088"
    )
        port map (
      I0 => \res_seq[escaped]_i_2_n_0\,
      I1 => recv_inbvalid,
      I2 => \res_seq[tick_out]_i_3_n_0\,
      I3 => \res_seq[datareg][7]_i_3_n_0\,
      I4 => \res_seq_reg[escaped]__0\,
      O => \res_seq[escaped]_i_1_n_0\
    );
\res_seq[escaped]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F80000080800000"
    )
        port map (
      I0 => \res_seq_reg[control]__0\,
      I1 => p_0_in(0),
      I2 => \res_seq[datareg][7]_i_3_n_0\,
      I3 => \res_seq[control]_i_2_n_0\,
      I4 => p_0_in(1),
      I5 => \res_seq_reg[bitshift_n_0_][8]\,
      O => \res_seq[escaped]_i_2_n_0\
    );
\res_seq[gotfct]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFE0EFE0E0E"
    )
        port map (
      I0 => \res_seq_reg[pendfct_n_0_][1]\,
      I1 => \res_seq_reg[pendfct_n_0_][0]\,
      I2 => recv_inbvalid,
      I3 => \res_seq[gotfct]_i_2_n_0\,
      I4 => \res_seq_reg[control]__0\,
      I5 => \res_seq[gotfct]_i_3_n_0\,
      O => \res_com[gotfct]\
    );
\res_seq[gotfct]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFD7"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][0]\,
      I1 => \^res_seq_reg[parity]__0\,
      I2 => \res_seq_reg[bitshift][8]_0\(0),
      I3 => p_0_in(1),
      I4 => p_0_in(0),
      I5 => \res_seq_reg[escaped]__0\,
      O => \res_seq[gotfct]_i_2_n_0\
    );
\res_seq[gotfct]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => p_0_in(1),
      I1 => \res_seq_reg[bitshift_n_0_][8]\,
      I2 => \res_seq[control]_i_2_n_0\,
      I3 => \res_seq_reg[escaped]__0\,
      I4 => \res_seq[datareg][7]_i_3_n_0\,
      O => \res_seq[gotfct]_i_3_n_0\
    );
\res_seq[null_seen]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00001000"
    )
        port map (
      I0 => \res_seq_reg[bitshift_n_0_][8]\,
      I1 => p_0_in(1),
      I2 => sel0(1),
      I3 => sel0(2),
      I4 => \res_seq[null_seen]_i_2_n_0\,
      I5 => \res_seq[null_seen]_i_3_n_0\,
      O => \res_seq[null_seen]_i_1_n_0\
    );
\res_seq[null_seen]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFDFFFF"
    )
        port map (
      I0 => p_0_in(0),
      I1 => sel0(4),
      I2 => \res_seq_reg[bitshift][8]_0\(0),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \res_seq[null_seen]_i_2_n_0\
    );
\res_seq[null_seen]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAABAAA"
    )
        port map (
      I0 => \^recvo[gotnull]\,
      I1 => \res_seq[null_seen]_i_4_n_0\,
      I2 => sel0(0),
      I3 => sel0(4),
      I4 => \res_seq_reg[bitshift_n_0_][0]\,
      O => \res_seq[null_seen]_i_3_n_0\
    );
\res_seq[null_seen]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFFFFFFFFFF"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      I2 => \res_seq_reg[bitshift_n_0_][8]\,
      I3 => sel0(3),
      I4 => sel0(1),
      I5 => sel0(2),
      O => \res_seq[null_seen]_i_4_n_0\
    );
\res_seq[parity]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F000F096"
    )
        port map (
      I0 => \res_seq_reg[bitshift][8]_0\(0),
      I1 => \^res_seq_reg[parity]__0\,
      I2 => \res_seq_reg[bitshift][8]_0\(1),
      I3 => \^res_seq_reg[bitcnt][0]_0\,
      I4 => \res_seq_reg[bitcnt_n_0_][1]\,
      I5 => \res_seq[bitcnt][9]_i_2_n_0\,
      O => \res_seq[parity]_i_1_n_0\
    );
\res_seq[pendfct][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"C2"
    )
        port map (
      I0 => \res_seq_reg[pendfct_n_0_][1]\,
      I1 => recv_inbvalid,
      I2 => \res_seq_reg[pendfct_n_0_][0]\,
      O => \res_seq[pendfct][0]_i_1_n_0\
    );
\res_seq[pendfct][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => recv_inbvalid,
      I1 => \res_seq_reg[pendfct_n_0_][0]\,
      I2 => \res_seq_reg[pendfct_n_0_][1]\,
      O => \res_seq[pendfct][1]_i_1_n_0\
    );
\res_seq[rxchar]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00D0"
    )
        port map (
      I0 => \res_seq[rxchar]_i_2_n_0\,
      I1 => \res_seq[rxchar]_i_3_n_0\,
      I2 => recv_inbvalid,
      I3 => \res_seq_reg[escaped]__0\,
      O => \vres[rxchar]9_out\
    );
\res_seq[rxchar]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA82"
    )
        port map (
      I0 => \res_seq[tick_out]_i_2_n_0\,
      I1 => p_0_in(1),
      I2 => \res_seq_reg[bitshift_n_0_][8]\,
      I3 => \res_seq[datareg][7]_i_3_n_0\,
      O => \res_seq[rxchar]_i_2_n_0\
    );
\res_seq[rxchar]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0028282828280028"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][0]\,
      I1 => \^res_seq_reg[parity]__0\,
      I2 => \res_seq_reg[bitshift][8]_0\(0),
      I3 => \res_seq_reg[control]__0\,
      I4 => p_0_in(1),
      I5 => p_0_in(0),
      O => \res_seq[rxchar]_i_3_n_0\
    );
\res_seq[rxemptydiscard]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF4000"
    )
        port map (
      I0 => \res_seq_reg[rxpacket]\,
      I1 => \recvo[rxflag]\,
      I2 => \^recvo[rxchar]\,
      I3 => \FSM_onehot_state_seq_reg[state][4]\(0),
      I4 => \res_seq_reg[rxfifo_waddr][11]\,
      O => \res_com[rxemptydiscard]\
    );
\res_seq[rxfifo_rvalid]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0434C7F7"
    )
        port map (
      I0 => \vres[rxfiforoom]0_in\(5),
      I1 => SPW_RXREAD,
      I2 => \^wen\,
      I3 => \vres[rxfiforoom]\(5),
      I4 => \res_seq_reg[rxfifo_rvalid]\(5),
      O => \res_com[rxfifo_rvalid]\
    );
\res_seq[rxfiforoom][10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfifo_rvalid]\(4),
      I1 => \vres[rxfiforoom]0_in\(4),
      I2 => SPW_RXREAD,
      I3 => \^wen\,
      I4 => \vres[rxfiforoom]\(4),
      O => \^res_seq_reg[rxfiforoom][10]_0\(3)
    );
\res_seq[rxfiforoom][2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfifo_rvalid]\(0),
      I1 => \vres[rxfiforoom]0_in\(0),
      I2 => SPW_RXREAD,
      I3 => \^wen\,
      I4 => \vres[rxfiforoom]\(0),
      O => \^res_seq_reg[rxfiforoom][10]_0\(0)
    );
\res_seq[rxfiforoom][4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfifo_rvalid]\(1),
      I1 => \vres[rxfiforoom]0_in\(1),
      I2 => SPW_RXREAD,
      I3 => \^wen\,
      I4 => \vres[rxfiforoom]\(1),
      O => \^res_seq_reg[rxfiforoom][10]_0\(1)
    );
\res_seq[rxfiforoom][8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfifo_rvalid]\(2),
      I1 => \vres[rxfiforoom]0_in\(2),
      I2 => SPW_RXREAD,
      I3 => \^wen\,
      I4 => \vres[rxfiforoom]\(2),
      O => \^res_seq_reg[rxfiforoom][8]\
    );
\res_seq[rxfiforoom][9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfifo_rvalid]\(3),
      I1 => \vres[rxfiforoom]0_in\(3),
      I2 => SPW_RXREAD,
      I3 => \^wen\,
      I4 => \vres[rxfiforoom]\(3),
      O => \^res_seq_reg[rxfiforoom][10]_0\(2)
    );
\res_seq[rxflag]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFEFEFE000E0E0"
    )
        port map (
      I0 => \res_seq_reg[control]__0\,
      I1 => \res_seq_reg[escaped]__0\,
      I2 => recv_inbvalid,
      I3 => \res_seq[rxchar]_i_3_n_0\,
      I4 => \res_seq[rxchar]_i_2_n_0\,
      I5 => \recvo[rxflag]\,
      O => \res_seq[rxflag]_i_1_n_0\
    );
\res_seq[rxfull]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^res_seq_reg[rxfiforoom][10]_0\(3),
      I1 => \res_seq_reg[rxroom][2]_0\(1),
      I2 => \^res_seq_reg[rxfiforoom][10]_0\(2),
      I3 => \res_seq_reg[rxroom][2]_0\(0),
      O => \^res_seq_reg[rxfiforoom][10]\
    );
\res_seq[rxpacket]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7040"
    )
        port map (
      I0 => \recvo[rxflag]\,
      I1 => \^recvo[rxchar]\,
      I2 => \FSM_onehot_state_seq_reg[state][4]\(0),
      I3 => \res_seq_reg[rxpacket]\,
      O => \vres[rxpacket]7_out\
    );
\res_seq[rxroom][2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^res_seq_reg[rxfiforoom][10]\,
      I1 => \^res_seq_reg[rxfiforoom][8]\,
      I2 => \res_seq_reg[rxfifo_rvalid]1\,
      I3 => \res_seq_reg[rxroom][2]\,
      I4 => \^res_seq_reg[rxfiforoom][10]_0\(0),
      O => \res_seq_reg[rxfiforoom][4]\(0)
    );
\res_seq[rxroom][4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^res_seq_reg[rxfiforoom][10]_0\(1),
      I1 => \^res_seq_reg[rxfiforoom][10]\,
      I2 => \^res_seq_reg[rxfiforoom][8]\,
      I3 => \res_seq_reg[rxfifo_rvalid]1\,
      I4 => \res_seq_reg[rxroom][2]\,
      O => \res_seq_reg[rxfiforoom][4]\(1)
    );
\res_seq[tick_out]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08880808"
    )
        port map (
      I0 => \res_seq_reg[escaped]__0\,
      I1 => recv_inbvalid,
      I2 => \res_seq[tick_out]_i_2_n_0\,
      I3 => \res_seq_reg[control]__0\,
      I4 => \res_seq[tick_out]_i_3_n_0\,
      O => \vres[tick_out]12_out\
    );
\res_seq[tick_out]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF7DFFFFFFD7"
    )
        port map (
      I0 => \res_seq_reg[bitcnt_n_0_][1]\,
      I1 => \res_seq_reg[bitshift][8]_0\(1),
      I2 => \^res_seq_reg[parity]__0\,
      I3 => \res_seq_reg[control]__0\,
      I4 => \^res_seq_reg[bitcnt][0]_0\,
      I5 => \res_seq_reg[bitshift][8]_0\(0),
      O => \res_seq[tick_out]_i_2_n_0\
    );
\res_seq[tick_out]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \res_seq_reg[bitshift][8]_0\(0),
      I1 => \^res_seq_reg[parity]__0\,
      I2 => \res_seq_reg[bitcnt_n_0_][0]\,
      O => \res_seq[tick_out]_i_3_n_0\
    );
\res_seq_reg[bit_seen]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => '1',
      Q => \res_seq_reg[bit_seen]__0\
    );
\res_seq_reg[bitcnt][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \p_0_in__0\(0),
      Q => \res_seq_reg[bitcnt_n_0_][0]\
    );
\res_seq_reg[bitcnt][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \p_0_in__0\(1),
      Q => \res_seq_reg[bitcnt_n_0_][1]\
    );
\res_seq_reg[bitcnt][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \p_0_in__0\(2),
      Q => \res_seq_reg[bitcnt_n_0_][2]\
    );
\res_seq_reg[bitcnt][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \p_0_in__0\(3),
      Q => \res_seq_reg[bitcnt_n_0_][3]\
    );
\res_seq_reg[bitcnt][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \p_0_in__0\(4),
      Q => \res_seq_reg[bitcnt_n_0_][4]\
    );
\res_seq_reg[bitcnt][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \p_0_in__0\(5),
      Q => \res_seq_reg[bitcnt_n_0_][5]\
    );
\res_seq_reg[bitcnt][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \p_0_in__0\(6),
      Q => \res_seq_reg[bitcnt_n_0_][6]\
    );
\res_seq_reg[bitcnt][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \p_0_in__0\(7),
      Q => \res_seq_reg[bitcnt_n_0_][7]\
    );
\res_seq_reg[bitcnt][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \p_0_in__0\(8),
      Q => \res_seq_reg[bitcnt_n_0_][8]\
    );
\res_seq_reg[bitcnt][9]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \p_0_in__0\(9),
      Q => \res_seq_reg[bitcnt_n_0_][9]\
    );
\res_seq_reg[bitshift][0]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      D => sel0(1),
      PRE => AR(0),
      Q => \res_seq_reg[bitshift_n_0_][0]\
    );
\res_seq_reg[bitshift][1]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      D => sel0(2),
      PRE => AR(0),
      Q => sel0(0)
    );
\res_seq_reg[bitshift][2]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      D => sel0(3),
      PRE => AR(0),
      Q => sel0(1)
    );
\res_seq_reg[bitshift][3]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      D => sel0(4),
      PRE => AR(0),
      Q => sel0(2)
    );
\res_seq_reg[bitshift][4]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      D => p_0_in(0),
      PRE => AR(0),
      Q => sel0(3)
    );
\res_seq_reg[bitshift][5]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      D => p_0_in(1),
      PRE => AR(0),
      Q => sel0(4)
    );
\res_seq_reg[bitshift][6]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      D => \res_seq_reg[bitshift_n_0_][8]\,
      PRE => AR(0),
      Q => p_0_in(0)
    );
\res_seq_reg[bitshift][7]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      D => \res_seq_reg[bitshift][8]_0\(0),
      PRE => AR(0),
      Q => p_0_in(1)
    );
\res_seq_reg[bitshift][8]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      D => \res_seq_reg[bitshift][8]_0\(1),
      PRE => AR(0),
      Q => \res_seq_reg[bitshift_n_0_][8]\
    );
\res_seq_reg[control]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \res_seq[control]_i_1_n_0\,
      Q => \res_seq_reg[control]__0\
    );
\res_seq_reg[datareg][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \vres[rxflag]6_out\,
      CLR => AR(0),
      D => \vres[datareg]__0\(0),
      Q => \recvo[rxdata]\(0)
    );
\res_seq_reg[datareg][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \vres[rxflag]6_out\,
      CLR => AR(0),
      D => \vres[datareg]__0\(1),
      Q => \recvo[rxdata]\(1)
    );
\res_seq_reg[datareg][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \vres[rxflag]6_out\,
      CLR => AR(0),
      D => \vres[datareg]__0\(2),
      Q => \recvo[rxdata]\(2)
    );
\res_seq_reg[datareg][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \vres[rxflag]6_out\,
      CLR => AR(0),
      D => \vres[datareg]__0\(3),
      Q => \recvo[rxdata]\(3)
    );
\res_seq_reg[datareg][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \vres[rxflag]6_out\,
      CLR => AR(0),
      D => \vres[datareg]__0\(4),
      Q => \recvo[rxdata]\(4)
    );
\res_seq_reg[datareg][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \vres[rxflag]6_out\,
      CLR => AR(0),
      D => \vres[datareg]__0\(5),
      Q => \recvo[rxdata]\(5)
    );
\res_seq_reg[datareg][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \vres[rxflag]6_out\,
      CLR => AR(0),
      D => \vres[datareg]__0\(6),
      Q => \recvo[rxdata]\(6)
    );
\res_seq_reg[datareg][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \vres[rxflag]6_out\,
      CLR => AR(0),
      D => \vres[datareg]__0\(7),
      Q => \recvo[rxdata]\(7)
    );
\res_seq_reg[disccnt][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \res_seq[disccnt][6]_i_1_n_0\,
      CLR => AR(0),
      D => D(0),
      Q => \^q\(0)
    );
\res_seq_reg[disccnt][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \res_seq[disccnt][6]_i_1_n_0\,
      CLR => AR(0),
      D => \res_seq[disccnt][1]_i_1_n_0\,
      Q => \res_seq_reg[disccnt]\(1)
    );
\res_seq_reg[disccnt][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \res_seq[disccnt][6]_i_1_n_0\,
      CLR => AR(0),
      D => \res_seq[disccnt][2]_i_1_n_0\,
      Q => \res_seq_reg[disccnt]\(2)
    );
\res_seq_reg[disccnt][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \res_seq[disccnt][6]_i_1_n_0\,
      CLR => AR(0),
      D => \res_seq[disccnt][3]_i_1_n_0\,
      Q => \res_seq_reg[disccnt]\(3)
    );
\res_seq_reg[disccnt][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \res_seq[disccnt][6]_i_1_n_0\,
      CLR => AR(0),
      D => \res_com[disccnt]\(4),
      Q => \res_seq_reg[disccnt]\(4)
    );
\res_seq_reg[disccnt][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \res_seq[disccnt][6]_i_1_n_0\,
      CLR => AR(0),
      D => \res_com[disccnt]\(5),
      Q => \res_seq_reg[disccnt]\(5)
    );
\res_seq_reg[disccnt][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \res_seq[disccnt][6]_i_1_n_0\,
      CLR => AR(0),
      D => \res_com[disccnt]\(6),
      Q => \res_seq_reg[disccnt]\(6)
    );
\res_seq_reg[disccnt][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => AR(0),
      D => \res_seq[disccnt][7]_i_1_n_0\,
      Q => \res_seq_reg[disccnt]\(7)
    );
\res_seq_reg[erresc]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => AR(0),
      D => \res_seq[erresc]_i_1_n_0\,
      Q => \recvo[erresc]\
    );
\res_seq_reg[errpar]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => AR(0),
      D => \res_seq[errpar]_i_1_n_0\,
      Q => \recvo[errpar]\
    );
\res_seq_reg[escaped]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => AR(0),
      D => \res_seq[escaped]_i_1_n_0\,
      Q => \res_seq_reg[escaped]__0\
    );
\res_seq_reg[gotfct]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => AR(0),
      D => \res_com[gotfct]\,
      Q => \^recvo[gotfct]\
    );
\res_seq_reg[null_seen]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \res_seq[null_seen]_i_1_n_0\,
      Q => \^recvo[gotnull]\
    );
\res_seq_reg[parity]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => recv_inbvalid,
      CLR => AR(0),
      D => \res_seq[parity]_i_1_n_0\,
      Q => \^res_seq_reg[parity]__0\
    );
\res_seq_reg[pendfct][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => AR(0),
      D => \res_seq[pendfct][0]_i_1_n_0\,
      Q => \res_seq_reg[pendfct_n_0_][0]\
    );
\res_seq_reg[pendfct][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => AR(0),
      D => \res_seq[pendfct][1]_i_1_n_0\,
      Q => \res_seq_reg[pendfct_n_0_][1]\
    );
\res_seq_reg[rxchar]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => AR(0),
      D => \vres[rxchar]9_out\,
      Q => \^recvo[rxchar]\
    );
\res_seq_reg[rxflag]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => AR(0),
      D => \res_seq[rxflag]_i_1_n_0\,
      Q => \recvo[rxflag]\
    );
\res_seq_reg[tick_out]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => AR(0),
      D => \vres[tick_out]12_out\,
      Q => \^recvo[tick_out]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset is
  port (
    \reset_reg_reg[0]_0\ : out STD_LOGIC;
    SPW_rst_0 : out STD_LOGIC;
    SPW_rst : in STD_LOGIC;
    SPW_TX_clk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset is
  signal \^spw_rst_0\ : STD_LOGIC;
  signal \reset_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal tx_rst_n : STD_LOGIC;
begin
  SPW_rst_0 <= \^spw_rst_0\;
\reset_reg[1]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => SPW_rst,
      O => \^spw_rst_0\
    );
\reset_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => \^spw_rst_0\,
      D => \reset_reg_reg_n_0_[1]\,
      Q => tx_rst_n
    );
\reset_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => \^spw_rst_0\,
      D => '1',
      Q => \reset_reg_reg_n_0_[1]\
    );
s_spwdo_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => tx_rst_n,
      O => \reset_reg_reg[0]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset_5 is
  port (
    \reset_reg_reg[0]_0\ : out STD_LOGIC;
    CLK : in STD_LOGIC;
    load : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset_5 : entity is "SpwReset";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset_5;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset_5 is
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \reset_reg_reg_n_0_[0]\ : STD_LOGIC;
begin
\reset_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => load,
      D => \p_0_in__0\(0),
      Q => \reset_reg_reg_n_0_[0]\
    );
\reset_reg_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => CLK,
      CE => '1',
      CLR => load,
      D => '1',
      Q => \p_0_in__0\(0)
    );
\resrx_seq[bufwrite]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \reset_reg_reg_n_0_[0]\,
      O => \reset_reg_reg[0]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset__parameterized2\ is
  port (
    sys_rst_n : out STD_LOGIC;
    \reset_reg_reg[0]_0\ : out STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    \reset_reg_reg[0]_1\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset__parameterized2\ : entity is "SpwReset";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset__parameterized2\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset__parameterized2\ is
  signal \^sys_rst_n\ : STD_LOGIC;
begin
  sys_rst_n <= \^sys_rst_n\;
\FSM_onehot_state_seq[state][5]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^sys_rst_n\,
      O => \reset_reg_reg[0]_0\
    );
\reset_reg_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => \reset_reg_reg[0]_1\,
      D => '1',
      Q => \^sys_rst_n\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \res_seq_reg[allow_fct]\ : out STD_LOGIC;
    \res_seq_reg[allow_char]\ : out STD_LOGIC;
    \res_seq_reg[tokmux]\ : out STD_LOGIC;
    \res_seq_reg[sysflip1]\ : out STD_LOGIC;
    \res_seq_reg[pend_fct]\ : out STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg_1 : in STD_LOGIC;
    \res_seq_reg[sysflip0]\ : in STD_LOGIC;
    vhavetoken0 : in STD_LOGIC;
    \res_seq_reg[tokmux]__0\ : in STD_LOGIC;
    \res_seq_reg[sysflip0]__0\ : in STD_LOGIC;
    \res_seq_reg[token0][char][7]\ : in STD_LOGIC;
    \res_seq_reg[sysflip1]__0\ : in STD_LOGIC;
    \res_seq_reg[tokmux]_0\ : in STD_LOGIC;
    \res_seq_reg[pend_fct]_0\ : in STD_LOGIC;
    \res_seq_reg[pend_fct]_1\ : in STD_LOGIC;
    \xmiti[fct_in]\ : in STD_LOGIC;
    \res_seq_reg[sent_fct]__0\ : in STD_LOGIC;
    \res_seq_reg[pend_char]\ : in STD_LOGIC;
    \res_seq_reg[pend_char]_0\ : in STD_LOGIC;
    \res_seq_reg[pend_char]_1\ : in STD_LOGIC;
    \res_seq_reg[tokmux]_1\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff is
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal \res_seq[sent_fct]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[tokmux]_i_2_n_0\ : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
  signal syncdff_ff2_reg_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \res_seq[sent_fct]_i_2\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \res_seq[tokmux]_i_2\ : label is "soft_lutpair45";
begin
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_1,
      D => buf_ff0_reg_0,
      Q => buf_ff0_reg_n_0
    );
\res_seq[pend_char]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFC4"
    )
        port map (
      I0 => \res_seq_reg[pend_char]\,
      I1 => \res_seq_reg[pend_char]_0\,
      I2 => \res_seq[sent_fct]_i_2_n_0\,
      I3 => \res_seq_reg[pend_char]_1\,
      I4 => \res_seq_reg[token0][char][7]\,
      O => \res_seq_reg[allow_char]\
    );
\res_seq[pend_fct]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AC8C"
    )
        port map (
      I0 => \res_seq[sent_fct]_i_2_n_0\,
      I1 => \res_seq_reg[pend_fct]_1\,
      I2 => \res_seq_reg[pend_fct]_0\,
      I3 => \xmiti[fct_in]\,
      I4 => \res_seq_reg[token0][char][7]\,
      O => \res_seq_reg[pend_fct]\
    );
\res_seq[sent_fct]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555555510101000"
    )
        port map (
      I0 => \res_seq_reg[token0][char][7]\,
      I1 => \res_seq[sent_fct]_i_2_n_0\,
      I2 => \res_seq_reg[pend_fct]_0\,
      I3 => \res_seq_reg[pend_fct]_1\,
      I4 => \xmiti[fct_in]\,
      I5 => \res_seq_reg[sent_fct]__0\,
      O => \res_seq_reg[allow_fct]\
    );
\res_seq[sent_fct]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FF06666"
    )
        port map (
      I0 => \res_seq_reg[sysflip0]__0\,
      I1 => syncdff_ff2_reg_n_0,
      I2 => \res_seq_reg[sysflip1]__0\,
      I3 => \res_seq_reg[tokmux]_0\,
      I4 => \res_seq_reg[tokmux]__0\,
      O => \res_seq[sent_fct]_i_2_n_0\
    );
\res_seq[sysflip0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5504555500000051"
    )
        port map (
      I0 => \res_seq_reg[token0][char][7]\,
      I1 => \res_seq_reg[sysflip0]\,
      I2 => vhavetoken0,
      I3 => \res_seq_reg[tokmux]__0\,
      I4 => syncdff_ff2_reg_n_0,
      I5 => \res_seq_reg[sysflip0]__0\,
      O => \res_seq_reg[tokmux]\
    );
\res_seq[token0][fctpiggy]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000D00000D"
    )
        port map (
      I0 => \res_seq_reg[sysflip0]\,
      I1 => vhavetoken0,
      I2 => \res_seq_reg[tokmux]__0\,
      I3 => syncdff_ff2_reg_n_0,
      I4 => \res_seq_reg[sysflip0]__0\,
      I5 => \res_seq_reg[token0][char][7]\,
      O => E(0)
    );
\res_seq[tokmux]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FF00BEAA"
    )
        port map (
      I0 => \res_seq[tokmux]_i_2_n_0\,
      I1 => \res_seq_reg[sysflip1]__0\,
      I2 => \res_seq_reg[tokmux]_0\,
      I3 => \res_seq_reg[tokmux]__0\,
      I4 => \res_seq_reg[tokmux]_1\,
      I5 => \res_seq_reg[token0][char][7]\,
      O => \res_seq_reg[sysflip1]\
    );
\res_seq[tokmux]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => \res_seq_reg[tokmux]__0\,
      I1 => syncdff_ff2_reg_n_0,
      I2 => \res_seq_reg[sysflip0]__0\,
      O => \res_seq[tokmux]_i_2_n_0\
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_1,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_1,
      D => syncdff_ff1_reg_n_0,
      Q => syncdff_ff2_reg_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_0 is
  port (
    syncdff_ff2_reg_0 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \res_seq_reg[tokmux]\ : out STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg_1 : in STD_LOGIC;
    \res_seq_reg[sysflip1]\ : in STD_LOGIC;
    vhavetoken0 : in STD_LOGIC;
    \res_seq_reg[tokmux]__0\ : in STD_LOGIC;
    \res_seq_reg[sysflip1]__0\ : in STD_LOGIC;
    \res_seq_reg[token1][char][7]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_0 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_0 is
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
  signal \^syncdff_ff2_reg_0\ : STD_LOGIC;
begin
  syncdff_ff2_reg_0 <= \^syncdff_ff2_reg_0\;
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_1,
      D => buf_ff0_reg_0,
      Q => buf_ff0_reg_n_0
    );
\res_seq[sysflip1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0455555500005100"
    )
        port map (
      I0 => \res_seq_reg[token1][char][7]\,
      I1 => \res_seq_reg[sysflip1]\,
      I2 => vhavetoken0,
      I3 => \res_seq_reg[tokmux]__0\,
      I4 => \^syncdff_ff2_reg_0\,
      I5 => \res_seq_reg[sysflip1]__0\,
      O => \res_seq_reg[tokmux]\
    );
\res_seq[token1][fctpiggy]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000D00000D0"
    )
        port map (
      I0 => \res_seq_reg[sysflip1]\,
      I1 => vhavetoken0,
      I2 => \res_seq_reg[tokmux]__0\,
      I3 => \^syncdff_ff2_reg_0\,
      I4 => \res_seq_reg[sysflip1]__0\,
      I5 => \res_seq_reg[token1][char][7]\,
      O => E(0)
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_1,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_1,
      D => syncdff_ff1_reg_n_0,
      Q => \^syncdff_ff2_reg_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_1 is
  port (
    syncdff_ff2_reg_0 : out STD_LOGIC;
    syncdff_ff2_reg_1 : out STD_LOGIC;
    \restx_seq_reg[b_update]\ : out STD_LOGIC;
    \res_seq_reg[sysflip0]__0\ : in STD_LOGIC;
    SPW_TX_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC;
    \restx_seq_reg[b_mux]__0\ : in STD_LOGIC;
    \restx_seq_reg[b_update]__0\ : in STD_LOGIC;
    \synctx[txen]\ : in STD_LOGIC;
    \restx_seq_reg[txflip0]\ : in STD_LOGIC;
    \restx_seq_reg[b_txflip]__0\ : in STD_LOGIC;
    \synctx[sysflip1]\ : in STD_LOGIC;
    \restx_seq_reg[b_valid]__0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_1 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_1;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_1 is
  signal buf_ff0 : STD_LOGIC;
  signal syncdff_ff1 : STD_LOGIC;
  signal \synctx[sysflip0]\ : STD_LOGIC;
  signal \vtx[b_valid]13_out\ : STD_LOGIC;
begin
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \res_seq_reg[sysflip0]__0\,
      Q => buf_ff0
    );
\restx_seq[b_mux]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3FF000066000000"
    )
        port map (
      I0 => \synctx[sysflip0]\,
      I1 => \restx_seq_reg[b_txflip]__0\,
      I2 => \synctx[sysflip1]\,
      I3 => \restx_seq_reg[b_update]__0\,
      I4 => \synctx[txen]\,
      I5 => \restx_seq_reg[b_mux]__0\,
      O => syncdff_ff2_reg_1
    );
\restx_seq[b_valid]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BA8A"
    )
        port map (
      I0 => \vtx[b_valid]13_out\,
      I1 => \restx_seq_reg[b_update]__0\,
      I2 => \synctx[txen]\,
      I3 => \restx_seq_reg[b_valid]__0\,
      O => \restx_seq_reg[b_update]\
    );
\restx_seq[b_valid]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"36C60000"
    )
        port map (
      I0 => \synctx[sysflip0]\,
      I1 => \restx_seq_reg[b_txflip]__0\,
      I2 => \restx_seq_reg[b_mux]__0\,
      I3 => \synctx[sysflip1]\,
      I4 => \synctx[txen]\,
      O => \vtx[b_valid]13_out\
    );
\restx_seq[txflip0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EF002000"
    )
        port map (
      I0 => \synctx[sysflip0]\,
      I1 => \restx_seq_reg[b_mux]__0\,
      I2 => \restx_seq_reg[b_update]__0\,
      I3 => \synctx[txen]\,
      I4 => \restx_seq_reg[txflip0]\,
      O => syncdff_ff2_reg_0
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0,
      Q => syncdff_ff1
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1,
      Q => \synctx[sysflip0]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_10 is
  port (
    \syncsys[headptr_gray]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_10 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_10;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_10 is
  signal buf_ff0 : STD_LOGIC;
  signal syncdff_ff1 : STD_LOGIC;
begin
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => Q(0),
      Q => buf_ff0
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0,
      Q => syncdff_ff1
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1,
      Q => \syncsys[headptr_gray]\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_11 is
  port (
    \syncsys[headptr_gray]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_11 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_11;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_11 is
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
begin
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => Q(0),
      Q => buf_ff0_reg_n_0
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1_reg_n_0,
      Q => \syncsys[headptr_gray]\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_12 is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \res_seq_reg[tailptr_gray]_2_sp_1\ : out STD_LOGIC;
    \state_seq_reg[rxen]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \res_com[tailptr_gray]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \resrx_seq_reg[headptr]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC;
    \res_seq_reg[tailptr_gray][2]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    recv_rxen : in STD_LOGIC;
    \res_seq_reg[tailptr_gray]\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_12 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_12;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_12 is
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal \res_seq_reg[tailptr_gray]_2_sn_1\ : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
  signal \syncsys[headptr_gray]\ : STD_LOGIC_VECTOR ( 2 to 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \res_seq[tailptr][1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \res_seq[tailptr_gray][0]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \res_seq[tailptr_gray][1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \res_seq[tailptr_gray][2]_i_1\ : label is "soft_lutpair15";
begin
  \res_seq_reg[tailptr_gray]_2_sp_1\ <= \res_seq_reg[tailptr_gray]_2_sn_1\;
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \resrx_seq_reg[headptr]\(0),
      Q => buf_ff0_reg_n_0
    );
\res_seq[tailptr][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"82"
    )
        port map (
      I0 => recv_rxen,
      I1 => \res_seq_reg[tailptr_gray]_2_sn_1\,
      I2 => Q(0),
      O => \state_seq_reg[rxen]\(0)
    );
\res_seq[tailptr][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A208"
    )
        port map (
      I0 => recv_rxen,
      I1 => Q(0),
      I2 => \res_seq_reg[tailptr_gray]_2_sn_1\,
      I3 => Q(1),
      O => \state_seq_reg[rxen]\(1)
    );
\res_seq[tailptr_gray][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4B00"
    )
        port map (
      I0 => Q(0),
      I1 => \res_seq_reg[tailptr_gray]_2_sn_1\,
      I2 => Q(1),
      I3 => recv_rxen,
      O => D(0)
    );
\res_seq[tailptr_gray][1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45BA0000"
    )
        port map (
      I0 => Q(1),
      I1 => \res_seq_reg[tailptr_gray]_2_sn_1\,
      I2 => Q(0),
      I3 => \res_seq_reg[tailptr_gray]\(2),
      I4 => recv_rxen,
      O => D(1)
    );
\res_seq[tailptr_gray][1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \res_seq_reg[tailptr_gray]\(2),
      I1 => \syncsys[headptr_gray]\(2),
      I2 => \res_seq_reg[tailptr_gray]\(0),
      I3 => \res_seq_reg[tailptr_gray][2]_0\(0),
      I4 => \res_seq_reg[tailptr_gray][2]_0\(1),
      I5 => \res_seq_reg[tailptr_gray]\(1),
      O => \res_seq_reg[tailptr_gray]_2_sn_1\
    );
\res_seq[tailptr_gray][2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2AA0800"
    )
        port map (
      I0 => recv_rxen,
      I1 => Q(1),
      I2 => \res_seq_reg[tailptr_gray]_2_sn_1\,
      I3 => Q(0),
      I4 => \res_seq_reg[tailptr_gray]\(2),
      O => \res_com[tailptr_gray]\(0)
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1_reg_n_0,
      Q => \syncsys[headptr_gray]\(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_2 is
  port (
    \synctx[sysflip1]\ : out STD_LOGIC;
    syncdff_ff2_reg_0 : out STD_LOGIC;
    \res_seq_reg[sysflip1]__0\ : in STD_LOGIC;
    SPW_TX_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC;
    \restx_seq_reg[b_mux]__0\ : in STD_LOGIC;
    \restx_seq_reg[b_update]__0\ : in STD_LOGIC;
    \synctx[txen]\ : in STD_LOGIC;
    \restx_seq_reg[txflip1]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_2 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_2;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_2 is
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
  signal \^synctx[sysflip1]\ : STD_LOGIC;
begin
  \synctx[sysflip1]\ <= \^synctx[sysflip1]\;
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \res_seq_reg[sysflip1]__0\,
      Q => buf_ff0_reg_n_0
    );
\restx_seq[txflip1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BF008000"
    )
        port map (
      I0 => \^synctx[sysflip1]\,
      I1 => \restx_seq_reg[b_mux]__0\,
      I2 => \restx_seq_reg[b_update]__0\,
      I3 => \synctx[txen]\,
      I4 => \restx_seq_reg[txflip1]\,
      O => syncdff_ff2_reg_0
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1_reg_n_0,
      Q => \^synctx[sysflip1]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_3 is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \res_seq_reg[txdivsafe]__0\ : in STD_LOGIC;
    SPW_TX_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_3 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_3;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_3 is
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
begin
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \res_seq_reg[txdivsafe]__0\,
      Q => buf_ff0_reg_n_0
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1_reg_n_0,
      Q => E(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_4 is
  port (
    \synctx[txen]\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \restx_seq_reg[e_count][0]\ : out STD_LOGIC;
    \restx_seq_reg[b_token][fctpiggy]\ : out STD_LOGIC;
    \restx_seq_reg[b_valid]\ : out STD_LOGIC;
    \restx_seq_reg[b_valid]_0\ : out STD_LOGIC;
    \vtx[b_update]\ : out STD_LOGIC;
    \vtx[e_parity]1_out\ : out STD_LOGIC;
    \restx_com[d_bits]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \res_seq_reg[txenreg]__0\ : in STD_LOGIC;
    SPW_TX_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC;
    \restx_seq_reg[txclken]__0\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \restx_seq_reg[e_valid]__0\ : in STD_LOGIC;
    \restx_seq_reg[b_token][fctpiggy]__0\ : in STD_LOGIC;
    \restx_seq_reg[b_valid]__0\ : in STD_LOGIC;
    \restx_seq_reg[c_busy]\ : in STD_LOGIC;
    \restx_seq_reg[c_busy]__0\ : in STD_LOGIC;
    \restx_seq_reg[b_token][fct]__0\ : in STD_LOGIC;
    \restx_seq_reg[d_bits][0]\ : in STD_LOGIC;
    \restx_seq_reg[d_bits][0]_0\ : in STD_LOGIC;
    \restx_seq_reg[e_parity]__0\ : in STD_LOGIC;
    \restx_seq_reg[e_parity]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \restx_seq_reg[e_parity]_0\ : in STD_LOGIC;
    \restx_seq_reg[d_bits][0]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_4 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_4;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_4 is
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
  signal \^synctx[txen]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \restx_seq[b_update]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \restx_seq[c_esc]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \restx_seq[e_count][9]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \restx_seq[e_valid]_i_1\ : label is "soft_lutpair46";
begin
  \synctx[txen]\ <= \^synctx[txen]\;
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \res_seq_reg[txenreg]__0\,
      Q => buf_ff0_reg_n_0
    );
\restx_seq[b_update]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => Q(0),
      I1 => \restx_seq_reg[txclken]__0\,
      I2 => \restx_seq_reg[c_busy]__0\,
      I3 => \^synctx[txen]\,
      O => \vtx[b_update]\
    );
\restx_seq[c_busy]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FFFB0FF"
    )
        port map (
      I0 => \restx_seq_reg[b_token][fctpiggy]__0\,
      I1 => \restx_seq_reg[b_valid]__0\,
      I2 => \restx_seq_reg[c_busy]\,
      I3 => \^synctx[txen]\,
      I4 => \restx_seq_reg[c_busy]__0\,
      O => \restx_seq_reg[b_token][fctpiggy]\
    );
\restx_seq[c_esc]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3F4F"
    )
        port map (
      I0 => \restx_seq_reg[b_valid]__0\,
      I1 => \restx_seq_reg[c_busy]\,
      I2 => \^synctx[txen]\,
      I3 => \restx_seq_reg[d_bits][0]_0\,
      O => \restx_seq_reg[b_valid]_0\
    );
\restx_seq[c_fct]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5DFFFFFF5D00FFFF"
    )
        port map (
      I0 => \restx_seq_reg[b_valid]__0\,
      I1 => \restx_seq_reg[b_token][fct]__0\,
      I2 => \restx_seq_reg[c_busy]__0\,
      I3 => \restx_seq_reg[c_busy]\,
      I4 => \^synctx[txen]\,
      I5 => \restx_seq_reg[d_bits][0]\,
      O => \restx_seq_reg[b_valid]\
    );
\restx_seq[d_bits][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => \restx_seq_reg[d_bits][0]\,
      I1 => \restx_seq_reg[d_bits][0]_1\(0),
      I2 => \restx_seq_reg[d_bits][0]_0\,
      I3 => \^synctx[txen]\,
      O => \restx_com[d_bits]\(0)
    );
\restx_seq[e_count][9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \restx_seq_reg[txclken]__0\,
      I1 => \^synctx[txen]\,
      O => E(0)
    );
\restx_seq[e_parity]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F6060000"
    )
        port map (
      I0 => \restx_seq_reg[e_parity]__0\,
      I1 => \restx_seq_reg[e_parity]\(0),
      I2 => Q(0),
      I3 => \restx_seq_reg[e_parity]_0\,
      I4 => \^synctx[txen]\,
      O => \vtx[e_parity]1_out\
    );
\restx_seq[e_valid]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => Q(0),
      I1 => \restx_seq_reg[txclken]__0\,
      I2 => \^synctx[txen]\,
      I3 => \restx_seq_reg[e_valid]__0\,
      O => \restx_seq_reg[e_count][0]\
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1_reg_n_0,
      Q => \^synctx[txen]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_6 is
  port (
    \vres[inact]1_out\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    buf_ff0_reg_1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    SPW_Din : in STD_LOGIC;
    SPW_Sin : in STD_LOGIC;
    recv_rxen : in STD_LOGIC;
    \res_seq_reg[inact]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \res_seq_reg[inact]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_6 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_6;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_6 is
  signal \buf_ff0_i_1__1_n_0\ : STD_LOGIC;
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal \res_seq[inact]_i_2_n_0\ : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
  signal \syncsys[rxcnt_ddr_gray]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \res_seq[bitcntp_gray][0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \res_seq[inact]_i_2\ : label is "soft_lutpair14";
begin
\buf_ff0_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5CC5"
    )
        port map (
      I0 => Q(0),
      I1 => buf_ff0_reg_1(0),
      I2 => SPW_Din,
      I3 => SPW_Sin,
      O => \buf_ff0_i_1__1_n_0\
    );
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \buf_ff0_i_1__1_n_0\,
      Q => buf_ff0_reg_n_0
    );
\res_seq[bitcntp_gray][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \syncsys[rxcnt_ddr_gray]\(0),
      I1 => recv_rxen,
      O => D(0)
    );
\res_seq[inact]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8AA8AAAAAAAA8AA8"
    )
        port map (
      I0 => recv_rxen,
      I1 => \res_seq[inact]_i_2_n_0\,
      I2 => \res_seq_reg[inact]\(3),
      I3 => \res_seq_reg[inact]_0\(2),
      I4 => \res_seq_reg[inact]\(1),
      I5 => \res_seq_reg[inact]_0\(0),
      O => \vres[inact]1_out\
    );
\res_seq[inact]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \res_seq_reg[inact]\(0),
      I1 => \syncsys[rxcnt_ddr_gray]\(0),
      I2 => \res_seq_reg[inact]\(2),
      I3 => \res_seq_reg[inact]_0\(1),
      O => \res_seq[inact]_i_2_n_0\
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1_reg_n_0,
      Q => \syncsys[rxcnt_ddr_gray]\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_7 is
  port (
    syncdff_ff2_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    buf_ff0_reg_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SPW_Din : in STD_LOGIC;
    SPW_Sin : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_7 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_7;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_7 is
  signal BinToGray01_out : STD_LOGIC;
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
begin
buf_ff0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5A33335A5ACCCC5A"
    )
        port map (
      I0 => Q(1),
      I1 => buf_ff0_reg_1(1),
      I2 => Q(0),
      I3 => SPW_Din,
      I4 => SPW_Sin,
      I5 => buf_ff0_reg_1(0),
      O => BinToGray01_out
    );
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => BinToGray01_out,
      Q => buf_ff0_reg_n_0
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1_reg_n_0,
      Q => syncdff_ff2_reg_0(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_8 is
  port (
    syncdff_ff2_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    buf_ff0_reg_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SPW_Din : in STD_LOGIC;
    SPW_Sin : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_8 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_8;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_8 is
  signal BinToGray03_out : STD_LOGIC;
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
begin
\buf_ff0_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5A33335A5ACCCC5A"
    )
        port map (
      I0 => Q(1),
      I1 => buf_ff0_reg_1(1),
      I2 => Q(0),
      I3 => SPW_Din,
      I4 => SPW_Sin,
      I5 => buf_ff0_reg_1(0),
      O => BinToGray03_out
    );
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => BinToGray03_out,
      Q => buf_ff0_reg_n_0
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1_reg_n_0,
      Q => syncdff_ff2_reg_0(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_9 is
  port (
    syncdff_ff2_reg_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in2_in : in STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_9 : entity is "SyncDff";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_9;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_9 is
  signal buf_ff0_reg_n_0 : STD_LOGIC;
  signal syncdff_ff1_reg_n_0 : STD_LOGIC;
begin
buf_ff0_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => p_0_in2_in,
      Q => buf_ff0_reg_n_0
    );
syncdff_ff1_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => buf_ff0_reg_n_0,
      Q => syncdff_ff1_reg_n_0
    );
syncdff_ff2_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => syncdff_ff1_reg_n_0,
      Q => syncdff_ff2_reg_0(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecvFront is
  port (
    syncdff_ff2_reg : out STD_LOGIC_VECTOR ( 2 downto 0 );
    recv_inact : out STD_LOGIC;
    recv_inbvalid : out STD_LOGIC;
    \res_seq_reg[tailptr_gray][2]_0\ : out STD_LOGIC;
    \res_seq_reg[bufdout][1]_0\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    SPW_Din : in STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg : in STD_LOGIC;
    \vres[inbvalid]0_out\ : in STD_LOGIC;
    recv_rxen : in STD_LOGIC;
    SPW_Sin : in STD_LOGIC;
    \res_seq_reg[parity]__0\ : in STD_LOGIC;
    \res_seq_reg[datareg][0]\ : in STD_LOGIC;
    \res_seq_reg[disccnt][0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \res_seq_reg[bitcntp_gray][3]_0\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    load : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecvFront;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecvFront is
  signal A : STD_LOGIC;
  signal BinToGray : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal DI : STD_LOGIC;
  signal FIFOMEM_n_0 : STD_LOGIC;
  signal FIFOMEM_n_1 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal RXRSTLOGIC_n_0 : STD_LOGIC;
  signal SYNCSYSHEADPTR2_n_0 : STD_LOGIC;
  signal SYNCSYSHEADPTR2_n_1 : STD_LOGIC;
  signal ff_f_di1 : STD_LOGIC;
  signal ff_pre_f : STD_LOGIC;
  signal ff_pre_r : STD_LOGIC;
  signal ff_r_di1 : STD_LOGIC;
  signal p_0_in2_in : STD_LOGIC;
  signal p_10_in : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \^recv_inact\ : STD_LOGIC;
  signal \res_com[bitcntp_gray]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \res_com[tailptr]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \res_com[tailptr_gray]\ : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \res_seq_reg[bitcntp_gray]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \res_seq_reg[tailptr]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \res_seq_reg[tailptr_gray]\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \resrx_com[bufdata]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \resrx_seq_reg[bufdata]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \resrx_seq_reg[bufwrite_n_0_]\ : STD_LOGIC;
  signal \resrx_seq_reg[headptr]\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \resrx_seq_reg[headptr_gray_n_0_][0]\ : STD_LOGIC;
  signal rxclk : STD_LOGIC;
  signal rxcnt_f_reg : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \rxcnt_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \rxcnt_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \^syncdff_ff2_reg\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \syncsys[headptr_gray]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \vres[inact]1_out\ : STD_LOGIC;
  signal \vresrx[headptr]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \resrx_seq[headptr][1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \resrx_seq[headptr][2]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \resrx_seq[headptr_gray][0]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \resrx_seq[headptr_gray][1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \rxcnt_f[2]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \rxcnt_f[3]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \rxcnt_r[2]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \rxcnt_r[3]_i_1\ : label is "soft_lutpair19";
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
  recv_inact <= \^recv_inact\;
  syncdff_ff2_reg(2 downto 0) <= \^syncdff_ff2_reg\(2 downto 0);
FIFOMEM: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRam
     port map (
      CLK => rxclk,
      D(1) => FIFOMEM_n_0,
      D(0) => FIFOMEM_n_1,
      Q(1 downto 0) => \resrx_seq_reg[bufdata]\(1 downto 0),
      SPW_Din => SPW_Din,
      SPW_Sin => SPW_Sin,
      SPW_main_clk => SPW_main_clk,
      \raddr_buf_reg[1]_0\(1 downto 0) => \res_seq_reg[tailptr]\(1 downto 0),
      \raddr_buf_reg[2]_0\ => buf_ff0_reg,
      recv_rxen => recv_rxen,
      \res_seq_reg[tailptr_gray]\(0) => \res_seq_reg[tailptr_gray]\(2),
      \resrx_seq_reg[headptr]\(2 downto 0) => \resrx_seq_reg[headptr]\(2 downto 0),
      \s_mem_reg[0][1]_0\ => \resrx_seq_reg[bufwrite_n_0_]\,
      \s_mem_reg[0][1]_1\ => RXRSTLOGIC_n_0
    );
RXRSTLOGIC: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset_5
     port map (
      CLK => rxclk,
      load => load,
      \reset_reg_reg[0]_0\ => RXRSTLOGIC_n_0
    );
SYNCSYSBITCNT0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_6
     port map (
      D(0) => \res_com[bitcntp_gray]\(0),
      Q(0) => A,
      SPW_Din => SPW_Din,
      SPW_Sin => SPW_Sin,
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg_0 => buf_ff0_reg,
      buf_ff0_reg_1(0) => rxcnt_f_reg(1),
      recv_rxen => recv_rxen,
      \res_seq_reg[inact]\(3 downto 0) => \res_seq_reg[bitcntp_gray]\(3 downto 0),
      \res_seq_reg[inact]_0\(2 downto 0) => \^syncdff_ff2_reg\(2 downto 0),
      \vres[inact]1_out\ => \vres[inact]1_out\
    );
SYNCSYSBITCNT1: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_7
     port map (
      Q(1) => \rxcnt_r_reg_n_0_[2]\,
      Q(0) => A,
      SPW_Din => SPW_Din,
      SPW_Sin => SPW_Sin,
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg_0 => buf_ff0_reg,
      buf_ff0_reg_1(1 downto 0) => rxcnt_f_reg(2 downto 1),
      syncdff_ff2_reg_0(0) => \^syncdff_ff2_reg\(0)
    );
SYNCSYSBITCNT2: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_8
     port map (
      Q(1) => \rxcnt_r_reg_n_0_[3]\,
      Q(0) => \rxcnt_r_reg_n_0_[2]\,
      SPW_Din => SPW_Din,
      SPW_Sin => SPW_Sin,
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg_0 => buf_ff0_reg,
      buf_ff0_reg_1(1 downto 0) => rxcnt_f_reg(3 downto 2),
      syncdff_ff2_reg_0(0) => \^syncdff_ff2_reg\(1)
    );
SYNCSYSBITCNT3: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_9
     port map (
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg_0 => buf_ff0_reg,
      p_0_in2_in => p_0_in2_in,
      syncdff_ff2_reg_0(0) => \^syncdff_ff2_reg\(2)
    );
SYNCSYSHEADPTR0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_10
     port map (
      Q(0) => \resrx_seq_reg[headptr_gray_n_0_][0]\,
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg_0 => buf_ff0_reg,
      \syncsys[headptr_gray]\(0) => \syncsys[headptr_gray]\(0)
    );
SYNCSYSHEADPTR1: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_11
     port map (
      Q(0) => DI,
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg_0 => buf_ff0_reg,
      \syncsys[headptr_gray]\(0) => \syncsys[headptr_gray]\(1)
    );
SYNCSYSHEADPTR2: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_12
     port map (
      D(1) => SYNCSYSHEADPTR2_n_0,
      D(0) => SYNCSYSHEADPTR2_n_1,
      Q(1 downto 0) => \res_seq_reg[tailptr]\(1 downto 0),
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg_0 => buf_ff0_reg,
      recv_rxen => recv_rxen,
      \res_com[tailptr_gray]\(0) => \res_com[tailptr_gray]\(2),
      \res_seq_reg[tailptr_gray]\(2 downto 0) => \res_seq_reg[tailptr_gray]\(2 downto 0),
      \res_seq_reg[tailptr_gray][2]_0\(1 downto 0) => \syncsys[headptr_gray]\(1 downto 0),
      \res_seq_reg[tailptr_gray]_2_sp_1\ => \res_seq_reg[tailptr_gray][2]_0\,
      \resrx_seq_reg[headptr]\(0) => \resrx_seq_reg[headptr]\(2),
      \state_seq_reg[rxen]\(1 downto 0) => \res_com[tailptr]\(1 downto 0)
    );
ff_f_di1_reg: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => ff_pre_f,
      Q => ff_f_di1
    );
ff_pre_f_reg: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => SPW_Din,
      Q => ff_pre_f
    );
ff_pre_r_reg: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => SPW_Din,
      Q => ff_pre_r
    );
ff_r_di1_reg: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => ff_pre_r,
      Q => ff_r_di1
    );
ff_r_di2f_reg: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => ff_f_di1,
      Q => \resrx_com[bufdata]\(1)
    );
ff_r_di2r_reg: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => ff_r_di1,
      Q => \resrx_com[bufdata]\(0)
    );
\res_seq[datareg][0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5569"
    )
        port map (
      I0 => \^q\(1),
      I1 => \res_seq_reg[parity]__0\,
      I2 => \^q\(0),
      I3 => \res_seq_reg[datareg][0]\,
      O => \res_seq_reg[bufdout][1]_0\
    );
\res_seq[disccnt][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^recv_inact\,
      I1 => \res_seq_reg[disccnt][0]\(0),
      O => D(0)
    );
\res_seq_reg[bitcntp_gray][0]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => '1',
      D => \res_com[bitcntp_gray]\(0),
      PRE => buf_ff0_reg,
      Q => \res_seq_reg[bitcntp_gray]\(0)
    );
\res_seq_reg[bitcntp_gray][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_seq_reg[bitcntp_gray][3]_0\(0),
      Q => \res_seq_reg[bitcntp_gray]\(1)
    );
\res_seq_reg[bitcntp_gray][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_seq_reg[bitcntp_gray][3]_0\(1),
      Q => \res_seq_reg[bitcntp_gray]\(2)
    );
\res_seq_reg[bitcntp_gray][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_seq_reg[bitcntp_gray][3]_0\(2),
      Q => \res_seq_reg[bitcntp_gray]\(3)
    );
\res_seq_reg[bufdout][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => FIFOMEM_n_1,
      Q => \^q\(0)
    );
\res_seq_reg[bufdout][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => FIFOMEM_n_0,
      Q => \^q\(1)
    );
\res_seq_reg[inact]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \vres[inact]1_out\,
      Q => \^recv_inact\
    );
\res_seq_reg[inbvalid]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \vres[inbvalid]0_out\,
      Q => recv_inbvalid
    );
\res_seq_reg[tailptr][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_com[tailptr]\(0),
      Q => \res_seq_reg[tailptr]\(0)
    );
\res_seq_reg[tailptr][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_com[tailptr]\(1),
      Q => \res_seq_reg[tailptr]\(1)
    );
\res_seq_reg[tailptr_gray][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => SYNCSYSHEADPTR2_n_1,
      Q => \res_seq_reg[tailptr_gray]\(0)
    );
\res_seq_reg[tailptr_gray][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => SYNCSYSHEADPTR2_n_0,
      Q => \res_seq_reg[tailptr_gray]\(1)
    );
\res_seq_reg[tailptr_gray][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_com[tailptr_gray]\(2),
      Q => \res_seq_reg[tailptr_gray]\(2)
    );
\resrx_seq[headptr][0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \resrx_seq_reg[headptr]\(0),
      I1 => \resrx_seq_reg[bufwrite_n_0_]\,
      O => \vresrx[headptr]\(0)
    );
\resrx_seq[headptr][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \resrx_seq_reg[headptr]\(0),
      I1 => \resrx_seq_reg[bufwrite_n_0_]\,
      I2 => \resrx_seq_reg[headptr]\(1),
      O => \vresrx[headptr]\(1)
    );
\resrx_seq[headptr][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \resrx_seq_reg[bufwrite_n_0_]\,
      I1 => \resrx_seq_reg[headptr]\(0),
      I2 => \resrx_seq_reg[headptr]\(1),
      I3 => \resrx_seq_reg[headptr]\(2),
      O => p_10_in
    );
\resrx_seq[headptr_gray][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"56"
    )
        port map (
      I0 => \resrx_seq_reg[headptr]\(1),
      I1 => \resrx_seq_reg[bufwrite_n_0_]\,
      I2 => \resrx_seq_reg[headptr]\(0),
      O => BinToGray(0)
    );
\resrx_seq[headptr_gray][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5666"
    )
        port map (
      I0 => \resrx_seq_reg[headptr]\(2),
      I1 => \resrx_seq_reg[headptr]\(1),
      I2 => \resrx_seq_reg[bufwrite_n_0_]\,
      I3 => \resrx_seq_reg[headptr]\(0),
      O => BinToGray(1)
    );
\resrx_seq_reg[bufdata][0]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => \resrx_com[bufdata]\(0),
      Q => \resrx_seq_reg[bufdata]\(0)
    );
\resrx_seq_reg[bufdata][1]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => \resrx_com[bufdata]\(1),
      Q => \resrx_seq_reg[bufdata]\(1)
    );
\resrx_seq_reg[bufwrite]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => '1',
      Q => \resrx_seq_reg[bufwrite_n_0_]\
    );
\resrx_seq_reg[headptr][0]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => \vresrx[headptr]\(0),
      Q => \resrx_seq_reg[headptr]\(0)
    );
\resrx_seq_reg[headptr][1]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => \vresrx[headptr]\(1),
      Q => \resrx_seq_reg[headptr]\(1)
    );
\resrx_seq_reg[headptr][2]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => p_10_in,
      Q => \resrx_seq_reg[headptr]\(2)
    );
\resrx_seq_reg[headptr_gray][0]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => BinToGray(0),
      Q => \resrx_seq_reg[headptr_gray_n_0_][0]\
    );
\resrx_seq_reg[headptr_gray][1]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => BinToGray(1),
      Q => DI
    );
rxcnt_ddr: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EB28"
    )
        port map (
      I0 => rxcnt_f_reg(3),
      I1 => SPW_Sin,
      I2 => SPW_Din,
      I3 => \rxcnt_r_reg_n_0_[3]\,
      O => p_0_in2_in
    );
\rxcnt_f[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rxcnt_f_reg(1),
      O => \plusOp__0\(1)
    );
\rxcnt_f[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rxcnt_f_reg(1),
      I1 => rxcnt_f_reg(2),
      O => \plusOp__0\(2)
    );
\rxcnt_f[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => rxcnt_f_reg(1),
      I1 => rxcnt_f_reg(2),
      I2 => rxcnt_f_reg(3),
      O => \plusOp__0\(3)
    );
\rxcnt_f_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => \plusOp__0\(1),
      Q => rxcnt_f_reg(1)
    );
\rxcnt_f_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => \plusOp__0\(2),
      Q => rxcnt_f_reg(2)
    );
\rxcnt_f_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      IS_C_INVERTED => '1'
    )
        port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => \plusOp__0\(3),
      Q => rxcnt_f_reg(3)
    );
\rxcnt_r[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => A,
      O => plusOp(1)
    );
\rxcnt_r[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => A,
      I1 => \rxcnt_r_reg_n_0_[2]\,
      O => plusOp(2)
    );
\rxcnt_r[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => A,
      I1 => \rxcnt_r_reg_n_0_[2]\,
      I2 => \rxcnt_r_reg_n_0_[3]\,
      O => plusOp(3)
    );
\rxcnt_r_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => plusOp(1),
      Q => A
    );
\rxcnt_r_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => plusOp(2),
      Q => \rxcnt_r_reg_n_0_[2]\
    );
\rxcnt_r_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => rxclk,
      CE => '1',
      CLR => RXRSTLOGIC_n_0,
      D => plusOp(3),
      Q => \rxcnt_r_reg_n_0_[3]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwXmit_fast is
  port (
    \res_seq_reg[allow_fct]__0\ : out STD_LOGIC;
    \res_seq_reg[allow_char]__0\ : out STD_LOGIC;
    SPW_Dout : out STD_LOGIC;
    SPW_Sout : out STD_LOGIC;
    \res_seq_reg[sent_fct]__0\ : out STD_LOGIC;
    \res_seq_reg[pend_char]__0\ : out STD_LOGIC;
    \res_seq_reg[pend_fct]__0\ : out STD_LOGIC;
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    \res_seq_reg[allow_fct]_0\ : in STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    buf_ff0_reg : in STD_LOGIC;
    \v[allow_char]\ : in STD_LOGIC;
    SPW_TX_clk : in STD_LOGIC;
    buf_ff0_reg_0 : in STD_LOGIC;
    \recvo[rxchar]\ : in STD_LOGIC;
    \xmiti[fct_in]\ : in STD_LOGIC;
    \res_seq_reg[token1][char][7]_0\ : in STD_LOGIC;
    \res_seq_reg[pend_char]_0\ : in STD_LOGIC;
    \res_seq_reg[txfifo_rvalid]__0\ : in STD_LOGIC;
    \res_seq_reg[txdiscard]__0\ : in STD_LOGIC;
    \res_seq_reg[txdivreg][3]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwXmit_fast;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwXmit_fast is
  signal SYNCSYSTXFLIP0_n_1 : STD_LOGIC;
  signal SYNCSYSTXFLIP0_n_2 : STD_LOGIC;
  signal SYNCSYSTXFLIP0_n_3 : STD_LOGIC;
  signal SYNCSYSTXFLIP0_n_4 : STD_LOGIC;
  signal SYNCSYSTXFLIP0_n_5 : STD_LOGIC;
  signal SYNCSYSTXFLIP1_n_0 : STD_LOGIC;
  signal SYNCSYSTXFLIP1_n_2 : STD_LOGIC;
  signal SYNCTXSYSFLIP0_n_0 : STD_LOGIC;
  signal SYNCTXSYSFLIP0_n_1 : STD_LOGIC;
  signal SYNCTXSYSFLIP0_n_2 : STD_LOGIC;
  signal SYNCTXSYSFLIP1_n_1 : STD_LOGIC;
  signal SYNCTXTXEN_n_1 : STD_LOGIC;
  signal SYNCTXTXEN_n_2 : STD_LOGIC;
  signal SYNCTXTXEN_n_3 : STD_LOGIC;
  signal SYNCTXTXEN_n_4 : STD_LOGIC;
  signal SYNCTXTXEN_n_5 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in38_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_in2_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_in5_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \res_com[txdivtmp]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \res_seq[pend_char]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[token1][char][0]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[token1][char][1]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[token1][char][2]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[token1][char][3]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[token1][char][4]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[token1][char][5]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[token1][char][6]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[token1][char][7]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[token1][fctpiggy]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[tokmux]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[txdivnorm]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[txdivreg][0]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[txdivreg][1]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[txdivreg][3]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[txdivsafe]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[txenreg]_i_1_n_0\ : STD_LOGIC;
  signal \^res_seq_reg[allow_char]__0\ : STD_LOGIC;
  signal \^res_seq_reg[allow_fct]__0\ : STD_LOGIC;
  signal \^res_seq_reg[pend_char]__0\ : STD_LOGIC;
  signal \res_seq_reg[pend_data_n_0_][0]\ : STD_LOGIC;
  signal \res_seq_reg[pend_data_n_0_][1]\ : STD_LOGIC;
  signal \res_seq_reg[pend_data_n_0_][2]\ : STD_LOGIC;
  signal \res_seq_reg[pend_data_n_0_][3]\ : STD_LOGIC;
  signal \res_seq_reg[pend_data_n_0_][4]\ : STD_LOGIC;
  signal \res_seq_reg[pend_data_n_0_][5]\ : STD_LOGIC;
  signal \res_seq_reg[pend_data_n_0_][6]\ : STD_LOGIC;
  signal \res_seq_reg[pend_data_n_0_][7]\ : STD_LOGIC;
  signal \res_seq_reg[pend_data_n_0_][8]\ : STD_LOGIC;
  signal \^res_seq_reg[pend_fct]__0\ : STD_LOGIC;
  signal \^res_seq_reg[sent_fct]__0\ : STD_LOGIC;
  signal \res_seq_reg[sysflip0]__0\ : STD_LOGIC;
  signal \res_seq_reg[sysflip1]__0\ : STD_LOGIC;
  signal \res_seq_reg[token0][char]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \res_seq_reg[token0][fct_n_0_]\ : STD_LOGIC;
  signal \res_seq_reg[token0][fctpiggy_n_0_]\ : STD_LOGIC;
  signal \res_seq_reg[token0][flag_n_0_]\ : STD_LOGIC;
  signal \res_seq_reg[token1][char]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \res_seq_reg[token1][fct_n_0_]\ : STD_LOGIC;
  signal \res_seq_reg[token1][fctpiggy_n_0_]\ : STD_LOGIC;
  signal \res_seq_reg[token1][flag_n_0_]\ : STD_LOGIC;
  signal \res_seq_reg[tokmux]__0\ : STD_LOGIC;
  signal \res_seq_reg[txdivnorm]__0\ : STD_LOGIC;
  signal \res_seq_reg[txdivreg]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \res_seq_reg[txdivsafe]__0\ : STD_LOGIC;
  signal \res_seq_reg[txdivtmp]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \res_seq_reg[txenreg]__0\ : STD_LOGIC;
  signal \restx_com[b_txflip]\ : STD_LOGIC;
  signal \restx_com[d_bits]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \restx_com[e_count]\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \restx_com[txclkcnt]\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \restx_com[txclken]\ : STD_LOGIC;
  signal \restx_com[txclkpre]__0\ : STD_LOGIC;
  signal \restx_seq[b_token][char][0]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[b_token][char][1]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[b_token][char][2]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[b_token][char][3]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[b_token][char][4]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[b_token][char][5]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[b_token][char][6]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[b_token][char][7]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[b_token][fct]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[b_token][fctpiggy]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[b_token][flag]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[c_bits][2]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[c_bits][3]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[c_bits][4]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[c_bits][5]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[c_bits][6]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[c_bits][7]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[c_bits][8]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[e_shift][0]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[e_shift][1]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[e_shift][2]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[e_shift][3]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[e_shift][4]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[e_shift][5]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[e_shift][6]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[e_shift][7]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[e_shift][8]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[e_shift][9]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[f_spwdo]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[txclkcnt][4]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[txclkcnt][5]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[txclkcnt][6]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[txclkcnt][7]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[txclkcy][0]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[txclkcy][1]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[txclkcy][2]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[txclkdone][0]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq[txclkdone][1]_i_1_n_0\ : STD_LOGIC;
  signal \restx_seq_reg[b_mux]__0\ : STD_LOGIC;
  signal \restx_seq_reg[b_token][char]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \restx_seq_reg[b_token][fct]__0\ : STD_LOGIC;
  signal \restx_seq_reg[b_token][fctpiggy]__0\ : STD_LOGIC;
  signal \restx_seq_reg[b_token][flag]__0\ : STD_LOGIC;
  signal \restx_seq_reg[b_txflip]__0\ : STD_LOGIC;
  signal \restx_seq_reg[b_update]__0\ : STD_LOGIC;
  signal \restx_seq_reg[b_valid]__0\ : STD_LOGIC;
  signal \restx_seq_reg[c_bits_n_0_][0]\ : STD_LOGIC;
  signal \restx_seq_reg[c_bits_n_0_][1]\ : STD_LOGIC;
  signal \restx_seq_reg[c_bits_n_0_][2]\ : STD_LOGIC;
  signal \restx_seq_reg[c_bits_n_0_][3]\ : STD_LOGIC;
  signal \restx_seq_reg[c_bits_n_0_][4]\ : STD_LOGIC;
  signal \restx_seq_reg[c_bits_n_0_][5]\ : STD_LOGIC;
  signal \restx_seq_reg[c_bits_n_0_][6]\ : STD_LOGIC;
  signal \restx_seq_reg[c_bits_n_0_][7]\ : STD_LOGIC;
  signal \restx_seq_reg[c_bits_n_0_][8]\ : STD_LOGIC;
  signal \restx_seq_reg[c_busy]__0\ : STD_LOGIC;
  signal \restx_seq_reg[c_esc_n_0_]\ : STD_LOGIC;
  signal \restx_seq_reg[c_fct_n_0_]\ : STD_LOGIC;
  signal \restx_seq_reg[c_update_n_0_]\ : STD_LOGIC;
  signal \restx_seq_reg[d_bits_n_0_][0]\ : STD_LOGIC;
  signal \restx_seq_reg[d_bits_n_0_][1]\ : STD_LOGIC;
  signal \restx_seq_reg[d_bits_n_0_][2]\ : STD_LOGIC;
  signal \restx_seq_reg[d_bits_n_0_][3]\ : STD_LOGIC;
  signal \restx_seq_reg[d_bits_n_0_][4]\ : STD_LOGIC;
  signal \restx_seq_reg[d_bits_n_0_][5]\ : STD_LOGIC;
  signal \restx_seq_reg[d_bits_n_0_][6]\ : STD_LOGIC;
  signal \restx_seq_reg[d_bits_n_0_][7]\ : STD_LOGIC;
  signal \restx_seq_reg[d_bits_n_0_][8]\ : STD_LOGIC;
  signal \restx_seq_reg[d_cnt10]__0\ : STD_LOGIC;
  signal \restx_seq_reg[e_count_n_0_][0]\ : STD_LOGIC;
  signal \restx_seq_reg[e_count_n_0_][1]\ : STD_LOGIC;
  signal \restx_seq_reg[e_count_n_0_][2]\ : STD_LOGIC;
  signal \restx_seq_reg[e_count_n_0_][4]\ : STD_LOGIC;
  signal \restx_seq_reg[e_count_n_0_][5]\ : STD_LOGIC;
  signal \restx_seq_reg[e_count_n_0_][6]\ : STD_LOGIC;
  signal \restx_seq_reg[e_count_n_0_][7]\ : STD_LOGIC;
  signal \restx_seq_reg[e_count_n_0_][8]\ : STD_LOGIC;
  signal \restx_seq_reg[e_count_n_0_][9]\ : STD_LOGIC;
  signal \restx_seq_reg[e_parity]__0\ : STD_LOGIC;
  signal \restx_seq_reg[e_shift_n_0_][0]\ : STD_LOGIC;
  signal \restx_seq_reg[e_shift_n_0_][1]\ : STD_LOGIC;
  signal \restx_seq_reg[e_shift_n_0_][2]\ : STD_LOGIC;
  signal \restx_seq_reg[e_shift_n_0_][3]\ : STD_LOGIC;
  signal \restx_seq_reg[e_shift_n_0_][4]\ : STD_LOGIC;
  signal \restx_seq_reg[e_shift_n_0_][5]\ : STD_LOGIC;
  signal \restx_seq_reg[e_shift_n_0_][6]\ : STD_LOGIC;
  signal \restx_seq_reg[e_shift_n_0_][7]\ : STD_LOGIC;
  signal \restx_seq_reg[e_shift_n_0_][8]\ : STD_LOGIC;
  signal \restx_seq_reg[e_shift_n_0_][9]\ : STD_LOGIC;
  signal \restx_seq_reg[e_valid]__0\ : STD_LOGIC;
  signal \restx_seq_reg[f_spwdo]__0\ : STD_LOGIC;
  signal \restx_seq_reg[f_spwso]__0\ : STD_LOGIC;
  signal \restx_seq_reg[txclkcnt_n_0_][0]\ : STD_LOGIC;
  signal \restx_seq_reg[txclkcnt_n_0_][1]\ : STD_LOGIC;
  signal \restx_seq_reg[txclkcy_n_0_][0]\ : STD_LOGIC;
  signal \restx_seq_reg[txclkcy_n_0_][2]\ : STD_LOGIC;
  signal \restx_seq_reg[txclkdiv_n_0_][0]\ : STD_LOGIC;
  signal \restx_seq_reg[txclkdiv_n_0_][1]\ : STD_LOGIC;
  signal \restx_seq_reg[txclkdiv_n_0_][3]\ : STD_LOGIC;
  signal \restx_seq_reg[txclkdone_n_0_][0]\ : STD_LOGIC;
  signal \restx_seq_reg[txclkdone_n_0_][1]\ : STD_LOGIC;
  signal \restx_seq_reg[txclken]__0\ : STD_LOGIC;
  signal \restx_seq_reg[txclkpre]__0\ : STD_LOGIC;
  signal \restx_seq_reg[txdivnorm_n_0_]\ : STD_LOGIC;
  signal \restx_seq_reg[txflip_n_0_0]\ : STD_LOGIC;
  signal \restx_seq_reg[txflip_n_0_1]\ : STD_LOGIC;
  signal syncdff_ff2 : STD_LOGIC;
  signal \synctx[sysflip1]\ : STD_LOGIC;
  signal \synctx[txen]\ : STD_LOGIC;
  signal \v[token0][tick]\ : STD_LOGIC;
  signal \v[token1][tick]\ : STD_LOGIC;
  signal vhavetoken0 : STD_LOGIC;
  signal \vtoken[fctpiggy]\ : STD_LOGIC;
  signal \vtoken[flag]\ : STD_LOGIC;
  signal \vtx[b_update]\ : STD_LOGIC;
  signal \vtx[c_update]__0\ : STD_LOGIC;
  signal \vtx[d_cnt10]__0\ : STD_LOGIC;
  signal \vtx[e_parity]1_out\ : STD_LOGIC;
  signal \vtx[f_spwso]__0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \res_seq[pend_char]_i_2\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \res_seq[token1][char][0]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \res_seq[token1][char][1]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \res_seq[token1][char][2]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \res_seq[token1][char][3]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \res_seq[token1][char][4]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \res_seq[token1][char][5]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \res_seq[token1][char][6]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \res_seq[token1][char][7]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \res_seq[token1][fctpiggy]_i_2\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \res_seq[token1][fctpiggy]_i_3\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \res_seq[tokmux]_i_3\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \res_seq[txdivnorm]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \res_seq[txdivreg][0]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \res_seq[txdivreg][1]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \res_seq[txdivreg][3]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \res_seq[txdivsafe]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \res_seq[txdivtmp][0]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \res_seq[txdivtmp][1]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \res_seq[txenreg]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \restx_seq[b_token][char][0]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \restx_seq[b_token][char][1]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \restx_seq[b_token][char][2]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \restx_seq[b_token][char][3]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \restx_seq[b_token][char][4]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \restx_seq[b_token][char][5]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \restx_seq[b_token][char][6]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \restx_seq[b_token][char][7]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \restx_seq[b_token][fct]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \restx_seq[b_token][fctpiggy]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \restx_seq[c_bits][3]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \restx_seq[c_bits][4]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \restx_seq[c_bits][5]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \restx_seq[c_bits][6]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \restx_seq[c_bits][7]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \restx_seq[c_bits][8]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \restx_seq[d_bits][1]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \restx_seq[d_bits][2]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \restx_seq[d_bits][3]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \restx_seq[d_bits][4]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \restx_seq[d_bits][5]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \restx_seq[d_bits][6]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \restx_seq[d_bits][7]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \restx_seq[e_count][1]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \restx_seq[e_count][2]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \restx_seq[e_count][3]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \restx_seq[e_count][4]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \restx_seq[e_count][5]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \restx_seq[e_count][6]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \restx_seq[e_count][7]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \restx_seq[e_count][9]_i_2\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \restx_seq[e_shift][0]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \restx_seq[e_shift][1]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \restx_seq[e_shift][2]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \restx_seq[e_shift][3]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \restx_seq[e_shift][4]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \restx_seq[e_shift][5]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \restx_seq[e_shift][6]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \restx_seq[e_shift][7]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \restx_seq[e_shift][8]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \restx_seq[e_shift][9]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \restx_seq[f_spwdo]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \restx_seq[txclkcnt][0]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \restx_seq[txclkcnt][1]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \restx_seq[txclkcnt][3]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \restx_seq[txclkcnt][4]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \restx_seq[txclkcnt][5]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \restx_seq[txclkcnt][6]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \restx_seq[txclkcnt][7]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \restx_seq[txclkcy][0]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \restx_seq[txclkcy][1]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \restx_seq[txclkcy][2]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \restx_seq[txclkdone][0]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \vtx[c_update]\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \vtx[d_cnt10]\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \vtx[f_spwso]\ : label is "soft_lutpair58";
begin
  \res_seq_reg[allow_char]__0\ <= \^res_seq_reg[allow_char]__0\;
  \res_seq_reg[allow_fct]__0\ <= \^res_seq_reg[allow_fct]__0\;
  \res_seq_reg[pend_char]__0\ <= \^res_seq_reg[pend_char]__0\;
  \res_seq_reg[pend_fct]__0\ <= \^res_seq_reg[pend_fct]__0\;
  \res_seq_reg[sent_fct]__0\ <= \^res_seq_reg[sent_fct]__0\;
SYNCSYSTXFLIP0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff
     port map (
      E(0) => \v[token0][tick]\,
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg_0 => \restx_seq_reg[txflip_n_0_0]\,
      buf_ff0_reg_1 => buf_ff0_reg,
      \res_seq_reg[allow_char]\ => SYNCSYSTXFLIP0_n_2,
      \res_seq_reg[allow_fct]\ => SYNCSYSTXFLIP0_n_1,
      \res_seq_reg[pend_char]\ => \^res_seq_reg[allow_char]__0\,
      \res_seq_reg[pend_char]_0\ => \^res_seq_reg[pend_char]__0\,
      \res_seq_reg[pend_char]_1\ => \res_seq[pend_char]_i_2_n_0\,
      \res_seq_reg[pend_fct]\ => SYNCSYSTXFLIP0_n_5,
      \res_seq_reg[pend_fct]_0\ => \^res_seq_reg[allow_fct]__0\,
      \res_seq_reg[pend_fct]_1\ => \^res_seq_reg[pend_fct]__0\,
      \res_seq_reg[sent_fct]__0\ => \^res_seq_reg[sent_fct]__0\,
      \res_seq_reg[sysflip0]\ => \res_seq[token1][fctpiggy]_i_3_n_0\,
      \res_seq_reg[sysflip0]__0\ => \res_seq_reg[sysflip0]__0\,
      \res_seq_reg[sysflip1]\ => SYNCSYSTXFLIP0_n_4,
      \res_seq_reg[sysflip1]__0\ => \res_seq_reg[sysflip1]__0\,
      \res_seq_reg[token0][char][7]\ => \res_seq_reg[token1][char][7]_0\,
      \res_seq_reg[tokmux]\ => SYNCSYSTXFLIP0_n_3,
      \res_seq_reg[tokmux]_0\ => SYNCSYSTXFLIP1_n_0,
      \res_seq_reg[tokmux]_1\ => \res_seq[tokmux]_i_3_n_0\,
      \res_seq_reg[tokmux]__0\ => \res_seq_reg[tokmux]__0\,
      vhavetoken0 => vhavetoken0,
      \xmiti[fct_in]\ => \xmiti[fct_in]\
    );
SYNCSYSTXFLIP1: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_0
     port map (
      E(0) => \v[token1][tick]\,
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg_0 => \restx_seq_reg[txflip_n_0_1]\,
      buf_ff0_reg_1 => buf_ff0_reg,
      \res_seq_reg[sysflip1]\ => \res_seq[token1][fctpiggy]_i_3_n_0\,
      \res_seq_reg[sysflip1]__0\ => \res_seq_reg[sysflip1]__0\,
      \res_seq_reg[token1][char][7]\ => \res_seq_reg[token1][char][7]_0\,
      \res_seq_reg[tokmux]\ => SYNCSYSTXFLIP1_n_2,
      \res_seq_reg[tokmux]__0\ => \res_seq_reg[tokmux]__0\,
      syncdff_ff2_reg_0 => SYNCSYSTXFLIP1_n_0,
      vhavetoken0 => vhavetoken0
    );
SYNCTXSYSFLIP0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_1
     port map (
      SPW_TX_clk => SPW_TX_clk,
      buf_ff0_reg_0 => buf_ff0_reg_0,
      \res_seq_reg[sysflip0]__0\ => \res_seq_reg[sysflip0]__0\,
      \restx_seq_reg[b_mux]__0\ => \restx_seq_reg[b_mux]__0\,
      \restx_seq_reg[b_txflip]__0\ => \restx_seq_reg[b_txflip]__0\,
      \restx_seq_reg[b_update]\ => SYNCTXSYSFLIP0_n_2,
      \restx_seq_reg[b_update]__0\ => \restx_seq_reg[b_update]__0\,
      \restx_seq_reg[b_valid]__0\ => \restx_seq_reg[b_valid]__0\,
      \restx_seq_reg[txflip0]\ => \restx_seq_reg[txflip_n_0_0]\,
      syncdff_ff2_reg_0 => SYNCTXSYSFLIP0_n_0,
      syncdff_ff2_reg_1 => SYNCTXSYSFLIP0_n_1,
      \synctx[sysflip1]\ => \synctx[sysflip1]\,
      \synctx[txen]\ => \synctx[txen]\
    );
SYNCTXSYSFLIP1: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_2
     port map (
      SPW_TX_clk => SPW_TX_clk,
      buf_ff0_reg_0 => buf_ff0_reg_0,
      \res_seq_reg[sysflip1]__0\ => \res_seq_reg[sysflip1]__0\,
      \restx_seq_reg[b_mux]__0\ => \restx_seq_reg[b_mux]__0\,
      \restx_seq_reg[b_update]__0\ => \restx_seq_reg[b_update]__0\,
      \restx_seq_reg[txflip1]\ => \restx_seq_reg[txflip_n_0_1]\,
      syncdff_ff2_reg_0 => SYNCTXSYSFLIP1_n_1,
      \synctx[sysflip1]\ => \synctx[sysflip1]\,
      \synctx[txen]\ => \synctx[txen]\
    );
SYNCTXTXDIVSAFE: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_3
     port map (
      E(0) => syncdff_ff2,
      SPW_TX_clk => SPW_TX_clk,
      buf_ff0_reg_0 => buf_ff0_reg_0,
      \res_seq_reg[txdivsafe]__0\ => \res_seq_reg[txdivsafe]__0\
    );
SYNCTXTXEN: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SyncDff_4
     port map (
      E(0) => SYNCTXTXEN_n_1,
      Q(0) => \restx_seq_reg[e_count_n_0_][0]\,
      SPW_TX_clk => SPW_TX_clk,
      buf_ff0_reg_0 => buf_ff0_reg_0,
      \res_seq_reg[txenreg]__0\ => \res_seq_reg[txenreg]__0\,
      \restx_com[d_bits]\(0) => \restx_com[d_bits]\(0),
      \restx_seq_reg[b_token][fct]__0\ => \restx_seq_reg[b_token][fct]__0\,
      \restx_seq_reg[b_token][fctpiggy]\ => SYNCTXTXEN_n_3,
      \restx_seq_reg[b_token][fctpiggy]__0\ => \restx_seq_reg[b_token][fctpiggy]__0\,
      \restx_seq_reg[b_valid]\ => SYNCTXTXEN_n_4,
      \restx_seq_reg[b_valid]_0\ => SYNCTXTXEN_n_5,
      \restx_seq_reg[b_valid]__0\ => \restx_seq_reg[b_valid]__0\,
      \restx_seq_reg[c_busy]\ => \restx_seq_reg[c_update_n_0_]\,
      \restx_seq_reg[c_busy]__0\ => \restx_seq_reg[c_busy]__0\,
      \restx_seq_reg[d_bits][0]\ => \restx_seq_reg[c_fct_n_0_]\,
      \restx_seq_reg[d_bits][0]_0\ => \restx_seq_reg[c_esc_n_0_]\,
      \restx_seq_reg[d_bits][0]_1\(0) => \restx_seq_reg[c_bits_n_0_][0]\,
      \restx_seq_reg[e_count][0]\ => SYNCTXTXEN_n_2,
      \restx_seq_reg[e_parity]\(0) => \restx_seq_reg[e_shift_n_0_][1]\,
      \restx_seq_reg[e_parity]_0\ => \restx_seq_reg[d_bits_n_0_][0]\,
      \restx_seq_reg[e_parity]__0\ => \restx_seq_reg[e_parity]__0\,
      \restx_seq_reg[e_valid]__0\ => \restx_seq_reg[e_valid]__0\,
      \restx_seq_reg[txclken]__0\ => \restx_seq_reg[txclken]__0\,
      \synctx[txen]\ => \synctx[txen]\,
      \vtx[b_update]\ => \vtx[b_update]\,
      \vtx[e_parity]1_out\ => \vtx[e_parity]1_out\
    );
\res_seq[pend_char]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => \res_seq_reg[pend_char]_0\,
      I1 => \^res_seq_reg[allow_char]__0\,
      I2 => \res_seq_reg[txfifo_rvalid]__0\,
      I3 => \^res_seq_reg[pend_char]__0\,
      I4 => \res_seq_reg[txdiscard]__0\,
      O => \res_seq[pend_char]_i_2_n_0\
    );
\res_seq[token1][char][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_seq_reg[pend_data_n_0_][0]\,
      I1 => \^res_seq_reg[pend_char]__0\,
      I2 => \^res_seq_reg[allow_char]__0\,
      O => \res_seq[token1][char][0]_i_1_n_0\
    );
\res_seq[token1][char][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_seq_reg[pend_data_n_0_][1]\,
      I1 => \^res_seq_reg[pend_char]__0\,
      I2 => \^res_seq_reg[allow_char]__0\,
      O => \res_seq[token1][char][1]_i_1_n_0\
    );
\res_seq[token1][char][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_seq_reg[pend_data_n_0_][2]\,
      I1 => \^res_seq_reg[pend_char]__0\,
      I2 => \^res_seq_reg[allow_char]__0\,
      O => \res_seq[token1][char][2]_i_1_n_0\
    );
\res_seq[token1][char][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_seq_reg[pend_data_n_0_][3]\,
      I1 => \^res_seq_reg[pend_char]__0\,
      I2 => \^res_seq_reg[allow_char]__0\,
      O => \res_seq[token1][char][3]_i_1_n_0\
    );
\res_seq[token1][char][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_seq_reg[pend_data_n_0_][4]\,
      I1 => \^res_seq_reg[pend_char]__0\,
      I2 => \^res_seq_reg[allow_char]__0\,
      O => \res_seq[token1][char][4]_i_1_n_0\
    );
\res_seq[token1][char][5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_seq_reg[pend_data_n_0_][5]\,
      I1 => \^res_seq_reg[pend_char]__0\,
      I2 => \^res_seq_reg[allow_char]__0\,
      O => \res_seq[token1][char][5]_i_1_n_0\
    );
\res_seq[token1][char][6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_seq_reg[pend_data_n_0_][6]\,
      I1 => \^res_seq_reg[pend_char]__0\,
      I2 => \^res_seq_reg[allow_char]__0\,
      O => \res_seq[token1][char][6]_i_1_n_0\
    );
\res_seq[token1][char][7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_seq_reg[pend_data_n_0_][7]\,
      I1 => \^res_seq_reg[pend_char]__0\,
      I2 => \^res_seq_reg[allow_char]__0\,
      O => \res_seq[token1][char][7]_i_1_n_0\
    );
\res_seq[token1][fct]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \^res_seq_reg[allow_fct]__0\,
      I1 => \^res_seq_reg[pend_fct]__0\,
      I2 => \xmiti[fct_in]\,
      O => vhavetoken0
    );
\res_seq[token1][fctpiggy]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E0000000"
    )
        port map (
      I0 => \xmiti[fct_in]\,
      I1 => \^res_seq_reg[pend_fct]__0\,
      I2 => \^res_seq_reg[allow_fct]__0\,
      I3 => \^res_seq_reg[pend_char]__0\,
      I4 => \^res_seq_reg[allow_char]__0\,
      O => \vtoken[fctpiggy]\
    );
\res_seq[token1][fctpiggy]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^res_seq_reg[allow_char]__0\,
      I1 => \^res_seq_reg[pend_char]__0\,
      O => \res_seq[token1][fctpiggy]_i_3_n_0\
    );
\res_seq[token1][flag]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \res_seq_reg[pend_data_n_0_][8]\,
      I1 => \^res_seq_reg[pend_char]__0\,
      I2 => \^res_seq_reg[allow_char]__0\,
      O => \vtoken[flag]\
    );
\res_seq[tokmux]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00077777"
    )
        port map (
      I0 => \^res_seq_reg[pend_char]__0\,
      I1 => \^res_seq_reg[allow_char]__0\,
      I2 => \xmiti[fct_in]\,
      I3 => \^res_seq_reg[pend_fct]__0\,
      I4 => \^res_seq_reg[allow_fct]__0\,
      O => \res_seq[tokmux]_i_3_n_0\
    );
\res_seq[txdivnorm]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF01"
    )
        port map (
      I0 => \res_seq_reg[txdivsafe]__0\,
      I1 => \res_seq_reg[txdivtmp]\(0),
      I2 => \res_seq_reg[txdivtmp]\(1),
      I3 => \res_seq_reg[txdivnorm]__0\,
      O => \res_seq[txdivnorm]_i_1_n_0\
    );
\res_seq[txdivreg][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF01"
    )
        port map (
      I0 => \res_seq_reg[txdivsafe]__0\,
      I1 => \res_seq_reg[txdivtmp]\(0),
      I2 => \res_seq_reg[txdivtmp]\(1),
      I3 => \res_seq_reg[txdivreg]\(0),
      O => \res_seq[txdivreg][0]_i_1_n_0\
    );
\res_seq[txdivreg][1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0001"
    )
        port map (
      I0 => \res_seq_reg[txdivreg][3]_0\(0),
      I1 => \res_seq_reg[txdivtmp]\(1),
      I2 => \res_seq_reg[txdivtmp]\(0),
      I3 => \res_seq_reg[txdivsafe]__0\,
      I4 => \res_seq_reg[txdivreg]\(1),
      O => \res_seq[txdivreg][1]_i_1_n_0\
    );
\res_seq[txdivreg][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0002"
    )
        port map (
      I0 => \res_seq_reg[txdivreg][3]_0\(0),
      I1 => \res_seq_reg[txdivtmp]\(1),
      I2 => \res_seq_reg[txdivtmp]\(0),
      I3 => \res_seq_reg[txdivsafe]__0\,
      I4 => \res_seq_reg[txdivreg]\(3),
      O => \res_seq[txdivreg][3]_i_1_n_0\
    );
\res_seq[txdivsafe]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => \res_seq_reg[txdivtmp]\(1),
      I1 => \res_seq_reg[txdivtmp]\(0),
      I2 => \res_seq_reg[txdivsafe]__0\,
      O => \res_seq[txdivsafe]_i_1_n_0\
    );
\res_seq[txdivtmp][0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txdivtmp]\(0),
      O => \res_com[txdivtmp]\(0)
    );
\res_seq[txdivtmp][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"98"
    )
        port map (
      I0 => \res_seq_reg[txdivtmp]\(0),
      I1 => \res_seq_reg[txdivtmp]\(1),
      I2 => \res_seq_reg[txdivsafe]__0\,
      O => \res_com[txdivtmp]\(1)
    );
\res_seq[txenreg]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55550001"
    )
        port map (
      I0 => \res_seq_reg[token1][char][7]_0\,
      I1 => \res_seq_reg[txdivsafe]__0\,
      I2 => \res_seq_reg[txdivtmp]\(0),
      I3 => \res_seq_reg[txdivtmp]\(1),
      I4 => \res_seq_reg[txenreg]__0\,
      O => \res_seq[txenreg]_i_1_n_0\
    );
\res_seq_reg[allow_char]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \v[allow_char]\,
      Q => \^res_seq_reg[allow_char]__0\
    );
\res_seq_reg[allow_fct]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_seq_reg[allow_fct]_0\,
      Q => \^res_seq_reg[allow_fct]__0\
    );
\res_seq_reg[pend_char]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => SYNCSYSTXFLIP0_n_2,
      Q => \^res_seq_reg[pend_char]__0\
    );
\res_seq_reg[pend_data][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => E(0),
      CLR => buf_ff0_reg,
      D => D(0),
      Q => \res_seq_reg[pend_data_n_0_][0]\
    );
\res_seq_reg[pend_data][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => E(0),
      CLR => buf_ff0_reg,
      D => D(1),
      Q => \res_seq_reg[pend_data_n_0_][1]\
    );
\res_seq_reg[pend_data][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => E(0),
      CLR => buf_ff0_reg,
      D => D(2),
      Q => \res_seq_reg[pend_data_n_0_][2]\
    );
\res_seq_reg[pend_data][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => E(0),
      CLR => buf_ff0_reg,
      D => D(3),
      Q => \res_seq_reg[pend_data_n_0_][3]\
    );
\res_seq_reg[pend_data][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => E(0),
      CLR => buf_ff0_reg,
      D => D(4),
      Q => \res_seq_reg[pend_data_n_0_][4]\
    );
\res_seq_reg[pend_data][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => E(0),
      CLR => buf_ff0_reg,
      D => D(5),
      Q => \res_seq_reg[pend_data_n_0_][5]\
    );
\res_seq_reg[pend_data][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => E(0),
      CLR => buf_ff0_reg,
      D => D(6),
      Q => \res_seq_reg[pend_data_n_0_][6]\
    );
\res_seq_reg[pend_data][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => E(0),
      CLR => buf_ff0_reg,
      D => D(7),
      Q => \res_seq_reg[pend_data_n_0_][7]\
    );
\res_seq_reg[pend_data][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => E(0),
      CLR => buf_ff0_reg,
      D => D(8),
      Q => \res_seq_reg[pend_data_n_0_][8]\
    );
\res_seq_reg[pend_fct]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => SYNCSYSTXFLIP0_n_5,
      Q => \^res_seq_reg[pend_fct]__0\
    );
\res_seq_reg[sent_fct]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => SYNCSYSTXFLIP0_n_1,
      Q => \^res_seq_reg[sent_fct]__0\
    );
\res_seq_reg[sysflip0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => SYNCSYSTXFLIP0_n_3,
      Q => \res_seq_reg[sysflip0]__0\
    );
\res_seq_reg[sysflip1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => SYNCSYSTXFLIP1_n_2,
      Q => \res_seq_reg[sysflip1]__0\
    );
\res_seq_reg[token0][char][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][0]_i_1_n_0\,
      Q => \res_seq_reg[token0][char]\(0)
    );
\res_seq_reg[token0][char][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][1]_i_1_n_0\,
      Q => \res_seq_reg[token0][char]\(1)
    );
\res_seq_reg[token0][char][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][2]_i_1_n_0\,
      Q => \res_seq_reg[token0][char]\(2)
    );
\res_seq_reg[token0][char][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][3]_i_1_n_0\,
      Q => \res_seq_reg[token0][char]\(3)
    );
\res_seq_reg[token0][char][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][4]_i_1_n_0\,
      Q => \res_seq_reg[token0][char]\(4)
    );
\res_seq_reg[token0][char][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][5]_i_1_n_0\,
      Q => \res_seq_reg[token0][char]\(5)
    );
\res_seq_reg[token0][char][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][6]_i_1_n_0\,
      Q => \res_seq_reg[token0][char]\(6)
    );
\res_seq_reg[token0][char][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][7]_i_1_n_0\,
      Q => \res_seq_reg[token0][char]\(7)
    );
\res_seq_reg[token0][fct]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => vhavetoken0,
      Q => \res_seq_reg[token0][fct_n_0_]\
    );
\res_seq_reg[token0][fctpiggy]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => \vtoken[fctpiggy]\,
      Q => \res_seq_reg[token0][fctpiggy_n_0_]\
    );
\res_seq_reg[token0][flag]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token0][tick]\,
      CLR => buf_ff0_reg,
      D => \vtoken[flag]\,
      Q => \res_seq_reg[token0][flag_n_0_]\
    );
\res_seq_reg[token1][char][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][0]_i_1_n_0\,
      Q => \res_seq_reg[token1][char]\(0)
    );
\res_seq_reg[token1][char][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][1]_i_1_n_0\,
      Q => \res_seq_reg[token1][char]\(1)
    );
\res_seq_reg[token1][char][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][2]_i_1_n_0\,
      Q => \res_seq_reg[token1][char]\(2)
    );
\res_seq_reg[token1][char][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][3]_i_1_n_0\,
      Q => \res_seq_reg[token1][char]\(3)
    );
\res_seq_reg[token1][char][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][4]_i_1_n_0\,
      Q => \res_seq_reg[token1][char]\(4)
    );
\res_seq_reg[token1][char][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][5]_i_1_n_0\,
      Q => \res_seq_reg[token1][char]\(5)
    );
\res_seq_reg[token1][char][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][6]_i_1_n_0\,
      Q => \res_seq_reg[token1][char]\(6)
    );
\res_seq_reg[token1][char][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => \res_seq[token1][char][7]_i_1_n_0\,
      Q => \res_seq_reg[token1][char]\(7)
    );
\res_seq_reg[token1][fct]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => vhavetoken0,
      Q => \res_seq_reg[token1][fct_n_0_]\
    );
\res_seq_reg[token1][fctpiggy]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => \vtoken[fctpiggy]\,
      Q => \res_seq_reg[token1][fctpiggy_n_0_]\
    );
\res_seq_reg[token1][flag]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \v[token1][tick]\,
      CLR => buf_ff0_reg,
      D => \vtoken[flag]\,
      Q => \res_seq_reg[token1][flag_n_0_]\
    );
\res_seq_reg[tokmux]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => SYNCSYSTXFLIP0_n_4,
      Q => \res_seq_reg[tokmux]__0\
    );
\res_seq_reg[txdivnorm]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_seq[txdivnorm]_i_1_n_0\,
      Q => \res_seq_reg[txdivnorm]__0\
    );
\res_seq_reg[txdivreg][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_seq[txdivreg][0]_i_1_n_0\,
      Q => \res_seq_reg[txdivreg]\(0)
    );
\res_seq_reg[txdivreg][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_seq[txdivreg][1]_i_1_n_0\,
      Q => \res_seq_reg[txdivreg]\(1)
    );
\res_seq_reg[txdivreg][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_seq[txdivreg][3]_i_1_n_0\,
      Q => \res_seq_reg[txdivreg]\(3)
    );
\res_seq_reg[txdivsafe]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_seq[txdivsafe]_i_1_n_0\,
      Q => \res_seq_reg[txdivsafe]__0\
    );
\res_seq_reg[txdivtmp][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_com[txdivtmp]\(0),
      Q => \res_seq_reg[txdivtmp]\(0)
    );
\res_seq_reg[txdivtmp][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_com[txdivtmp]\(1),
      Q => \res_seq_reg[txdivtmp]\(1)
    );
\res_seq_reg[txenreg]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => buf_ff0_reg,
      D => \res_seq[txenreg]_i_1_n_0\,
      Q => \res_seq_reg[txenreg]__0\
    );
\restx_com[txclkpre]\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => \restx_seq_reg[txclkdiv_n_0_][0]\,
      I1 => \restx_seq_reg[txclkpre]__0\,
      I2 => \restx_seq_reg[txdivnorm_n_0_]\,
      O => \restx_com[txclkpre]__0\
    );
\restx_seq[b_token][char][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => \res_seq_reg[token1][char]\(0),
      I1 => \res_seq_reg[token0][char]\(0),
      I2 => \restx_seq_reg[b_mux]__0\,
      O => \restx_seq[b_token][char][0]_i_1_n_0\
    );
\restx_seq[b_token][char][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => \res_seq_reg[token1][char]\(1),
      I1 => \res_seq_reg[token0][char]\(1),
      I2 => \restx_seq_reg[b_mux]__0\,
      O => \restx_seq[b_token][char][1]_i_1_n_0\
    );
\restx_seq[b_token][char][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => \res_seq_reg[token1][char]\(2),
      I1 => \res_seq_reg[token0][char]\(2),
      I2 => \restx_seq_reg[b_mux]__0\,
      O => \restx_seq[b_token][char][2]_i_1_n_0\
    );
\restx_seq[b_token][char][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => \res_seq_reg[token1][char]\(3),
      I1 => \res_seq_reg[token0][char]\(3),
      I2 => \restx_seq_reg[b_mux]__0\,
      O => \restx_seq[b_token][char][3]_i_1_n_0\
    );
\restx_seq[b_token][char][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => \res_seq_reg[token1][char]\(4),
      I1 => \res_seq_reg[token0][char]\(4),
      I2 => \restx_seq_reg[b_mux]__0\,
      O => \restx_seq[b_token][char][4]_i_1_n_0\
    );
\restx_seq[b_token][char][5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => \res_seq_reg[token1][char]\(5),
      I1 => \res_seq_reg[token0][char]\(5),
      I2 => \restx_seq_reg[b_mux]__0\,
      O => \restx_seq[b_token][char][5]_i_1_n_0\
    );
\restx_seq[b_token][char][6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => \res_seq_reg[token1][char]\(6),
      I1 => \res_seq_reg[token0][char]\(6),
      I2 => \restx_seq_reg[b_mux]__0\,
      O => \restx_seq[b_token][char][6]_i_1_n_0\
    );
\restx_seq[b_token][char][7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => \res_seq_reg[token1][char]\(7),
      I1 => \res_seq_reg[token0][char]\(7),
      I2 => \restx_seq_reg[b_mux]__0\,
      O => \restx_seq[b_token][char][7]_i_1_n_0\
    );
\restx_seq[b_token][fct]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \res_seq_reg[token1][fct_n_0_]\,
      I1 => \restx_seq_reg[b_mux]__0\,
      I2 => \res_seq_reg[token0][fct_n_0_]\,
      O => \restx_seq[b_token][fct]_i_1_n_0\
    );
\restx_seq[b_token][fctpiggy]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \res_seq_reg[token1][fctpiggy_n_0_]\,
      I1 => \restx_seq_reg[b_mux]__0\,
      I2 => \res_seq_reg[token0][fctpiggy_n_0_]\,
      O => \restx_seq[b_token][fctpiggy]_i_1_n_0\
    );
\restx_seq[b_token][flag]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \res_seq_reg[token1][flag_n_0_]\,
      I1 => \restx_seq_reg[b_mux]__0\,
      I2 => \res_seq_reg[token0][flag_n_0_]\,
      O => \restx_seq[b_token][flag]_i_1_n_0\
    );
\restx_seq[b_txflip]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \restx_seq_reg[txflip_n_0_1]\,
      I1 => \restx_seq_reg[b_mux]__0\,
      I2 => \restx_seq_reg[txflip_n_0_0]\,
      O => \restx_com[b_txflip]\
    );
\restx_seq[c_bits][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
        port map (
      I0 => \restx_seq_reg[b_token][char]\(0),
      I1 => \restx_seq_reg[b_token][flag]__0\,
      I2 => \restx_seq_reg[b_token][char]\(1),
      O => \restx_seq[c_bits][2]_i_1_n_0\
    );
\restx_seq[c_bits][3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \restx_seq_reg[b_token][char]\(2),
      I1 => \restx_seq_reg[b_token][flag]__0\,
      O => \restx_seq[c_bits][3]_i_1_n_0\
    );
\restx_seq[c_bits][4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \restx_seq_reg[b_token][char]\(3),
      I1 => \restx_seq_reg[b_token][flag]__0\,
      O => \restx_seq[c_bits][4]_i_1_n_0\
    );
\restx_seq[c_bits][5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \restx_seq_reg[b_token][char]\(4),
      I1 => \restx_seq_reg[b_token][flag]__0\,
      O => \restx_seq[c_bits][5]_i_1_n_0\
    );
\restx_seq[c_bits][6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \restx_seq_reg[b_token][char]\(5),
      I1 => \restx_seq_reg[b_token][flag]__0\,
      O => \restx_seq[c_bits][6]_i_1_n_0\
    );
\restx_seq[c_bits][7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \restx_seq_reg[b_token][char]\(6),
      I1 => \restx_seq_reg[b_token][flag]__0\,
      O => \restx_seq[c_bits][7]_i_1_n_0\
    );
\restx_seq[c_bits][8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \restx_seq_reg[b_token][char]\(7),
      I1 => \restx_seq_reg[b_token][flag]__0\,
      O => \restx_seq[c_bits][8]_i_1_n_0\
    );
\restx_seq[d_bits][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F2FF"
    )
        port map (
      I0 => \restx_seq_reg[c_bits_n_0_][1]\,
      I1 => \restx_seq_reg[c_fct_n_0_]\,
      I2 => \restx_seq_reg[c_esc_n_0_]\,
      I3 => \synctx[txen]\,
      O => \restx_com[d_bits]\(1)
    );
\restx_seq[d_bits][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F2FF"
    )
        port map (
      I0 => \restx_seq_reg[c_bits_n_0_][2]\,
      I1 => \restx_seq_reg[c_fct_n_0_]\,
      I2 => \restx_seq_reg[c_esc_n_0_]\,
      I3 => \synctx[txen]\,
      O => \restx_com[d_bits]\(2)
    );
\restx_seq[d_bits][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[c_esc_n_0_]\,
      I2 => \restx_seq_reg[c_bits_n_0_][3]\,
      I3 => \restx_seq_reg[c_fct_n_0_]\,
      O => \restx_com[d_bits]\(3)
    );
\restx_seq[d_bits][4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[c_esc_n_0_]\,
      I2 => \restx_seq_reg[c_bits_n_0_][4]\,
      I3 => \restx_seq_reg[c_fct_n_0_]\,
      O => \restx_com[d_bits]\(4)
    );
\restx_seq[d_bits][5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[c_esc_n_0_]\,
      I2 => \restx_seq_reg[c_bits_n_0_][5]\,
      I3 => \restx_seq_reg[c_fct_n_0_]\,
      O => \restx_com[d_bits]\(5)
    );
\restx_seq[d_bits][6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[c_esc_n_0_]\,
      I2 => \restx_seq_reg[c_bits_n_0_][6]\,
      I3 => \restx_seq_reg[c_fct_n_0_]\,
      O => \restx_com[d_bits]\(6)
    );
\restx_seq[d_bits][7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[c_esc_n_0_]\,
      I2 => \restx_seq_reg[c_bits_n_0_][7]\,
      I3 => \restx_seq_reg[c_fct_n_0_]\,
      O => \restx_com[d_bits]\(7)
    );
\restx_seq[d_bits][8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[c_esc_n_0_]\,
      I2 => \restx_seq_reg[c_bits_n_0_][8]\,
      I3 => \restx_seq_reg[c_fct_n_0_]\,
      O => \restx_com[d_bits]\(8)
    );
\restx_seq[e_count][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4F"
    )
        port map (
      I0 => \restx_seq_reg[e_count_n_0_][0]\,
      I1 => \restx_seq_reg[e_count_n_0_][1]\,
      I2 => \synctx[txen]\,
      O => \restx_com[e_count]\(0)
    );
\restx_seq[e_count][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_count_n_0_][2]\,
      O => \restx_com[e_count]\(1)
    );
\restx_seq[e_count][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => p_0_in,
      O => \restx_com[e_count]\(2)
    );
\restx_seq[e_count][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[e_count_n_0_][4]\,
      I2 => \restx_seq_reg[e_count_n_0_][0]\,
      I3 => \restx_seq_reg[d_bits_n_0_][0]\,
      O => \restx_com[e_count]\(3)
    );
\restx_seq[e_count][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_count_n_0_][5]\,
      O => \restx_com[e_count]\(4)
    );
\restx_seq[e_count][5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_count_n_0_][6]\,
      O => \restx_com[e_count]\(5)
    );
\restx_seq[e_count][6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_count_n_0_][7]\,
      O => \restx_com[e_count]\(6)
    );
\restx_seq[e_count][7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_count_n_0_][8]\,
      O => \restx_com[e_count]\(7)
    );
\restx_seq[e_count][8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_count_n_0_][9]\,
      O => \restx_com[e_count]\(8)
    );
\restx_seq[e_count][9]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \synctx[txen]\,
      I1 => \restx_seq_reg[d_cnt10]__0\,
      I2 => \restx_seq_reg[e_count_n_0_][0]\,
      O => \restx_com[e_count]\(9)
    );
\restx_seq[e_shift][0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9F90"
    )
        port map (
      I0 => \restx_seq_reg[d_bits_n_0_][0]\,
      I1 => \restx_seq_reg[e_parity]__0\,
      I2 => \restx_seq_reg[e_count_n_0_][0]\,
      I3 => \restx_seq_reg[e_shift_n_0_][1]\,
      O => \restx_seq[e_shift][0]_i_1_n_0\
    );
\restx_seq[e_shift][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \restx_seq_reg[d_bits_n_0_][0]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_shift_n_0_][2]\,
      O => \restx_seq[e_shift][1]_i_1_n_0\
    );
\restx_seq[e_shift][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \restx_seq_reg[d_bits_n_0_][1]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_shift_n_0_][3]\,
      O => \restx_seq[e_shift][2]_i_1_n_0\
    );
\restx_seq[e_shift][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \restx_seq_reg[d_bits_n_0_][2]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_shift_n_0_][4]\,
      O => \restx_seq[e_shift][3]_i_1_n_0\
    );
\restx_seq[e_shift][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \restx_seq_reg[d_bits_n_0_][3]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_shift_n_0_][5]\,
      O => \restx_seq[e_shift][4]_i_1_n_0\
    );
\restx_seq[e_shift][5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \restx_seq_reg[d_bits_n_0_][4]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_shift_n_0_][6]\,
      O => \restx_seq[e_shift][5]_i_1_n_0\
    );
\restx_seq[e_shift][6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \restx_seq_reg[d_bits_n_0_][5]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_shift_n_0_][7]\,
      O => \restx_seq[e_shift][6]_i_1_n_0\
    );
\restx_seq[e_shift][7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \restx_seq_reg[d_bits_n_0_][6]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_shift_n_0_][8]\,
      O => \restx_seq[e_shift][7]_i_1_n_0\
    );
\restx_seq[e_shift][8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \restx_seq_reg[d_bits_n_0_][7]\,
      I1 => \restx_seq_reg[e_count_n_0_][0]\,
      I2 => \restx_seq_reg[e_shift_n_0_][9]\,
      O => \restx_seq[e_shift][8]_i_1_n_0\
    );
\restx_seq[e_shift][9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \restx_seq_reg[e_count_n_0_][0]\,
      I1 => \restx_seq_reg[d_bits_n_0_][8]\,
      O => \restx_seq[e_shift][9]_i_1_n_0\
    );
\restx_seq[f_spwdo]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B888"
    )
        port map (
      I0 => \restx_seq_reg[e_shift_n_0_][0]\,
      I1 => \restx_seq_reg[e_valid]__0\,
      I2 => \restx_seq_reg[f_spwdo]__0\,
      I3 => \restx_seq_reg[f_spwso]__0\,
      O => \restx_seq[f_spwdo]_i_1_n_0\
    );
\restx_seq[txclkcnt][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => \restx_seq_reg[txclkdiv_n_0_][0]\,
      I1 => \restx_seq_reg[txclken]__0\,
      I2 => \restx_seq_reg[txclkcnt_n_0_][0]\,
      O => \restx_com[txclkcnt]\(0)
    );
\restx_seq[txclkcnt][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B88B"
    )
        port map (
      I0 => \restx_seq_reg[txclkdiv_n_0_][1]\,
      I1 => \restx_seq_reg[txclken]__0\,
      I2 => \restx_seq_reg[txclkcnt_n_0_][0]\,
      I3 => \restx_seq_reg[txclkcnt_n_0_][1]\,
      O => \restx_com[txclkcnt]\(1)
    );
\restx_seq[txclkcnt][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8BB8"
    )
        port map (
      I0 => \restx_seq_reg[txclkdiv_n_0_][1]\,
      I1 => \restx_seq_reg[txclken]__0\,
      I2 => p_1_in(0),
      I3 => \restx_seq_reg[txclkcy_n_0_][0]\,
      O => \restx_com[txclkcnt]\(2)
    );
\restx_seq[txclkcnt][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BB8B88B8"
    )
        port map (
      I0 => \restx_seq_reg[txclkdiv_n_0_][3]\,
      I1 => \restx_seq_reg[txclken]__0\,
      I2 => \restx_seq_reg[txclkcy_n_0_][0]\,
      I3 => p_1_in(0),
      I4 => p_1_in(1),
      O => \restx_com[txclkcnt]\(3)
    );
\restx_seq[txclkcnt][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"14"
    )
        port map (
      I0 => \restx_seq_reg[txclken]__0\,
      I1 => p_0_in38_in,
      I2 => p_1_in2_in(0),
      O => \restx_seq[txclkcnt][4]_i_1_n_0\
    );
\restx_seq[txclkcnt][5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4144"
    )
        port map (
      I0 => \restx_seq_reg[txclken]__0\,
      I1 => p_1_in2_in(1),
      I2 => p_1_in2_in(0),
      I3 => p_0_in38_in,
      O => \restx_seq[txclkcnt][5]_i_1_n_0\
    );
\restx_seq[txclkcnt][6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"14"
    )
        port map (
      I0 => \restx_seq_reg[txclken]__0\,
      I1 => \restx_seq_reg[txclkcy_n_0_][2]\,
      I2 => p_1_in5_in(0),
      O => \restx_seq[txclkcnt][6]_i_1_n_0\
    );
\restx_seq[txclkcnt][7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4144"
    )
        port map (
      I0 => \restx_seq_reg[txclken]__0\,
      I1 => p_1_in5_in(1),
      I2 => p_1_in5_in(0),
      I3 => \restx_seq_reg[txclkcy_n_0_][2]\,
      O => \restx_seq[txclkcnt][7]_i_1_n_0\
    );
\restx_seq[txclkcy][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \restx_seq_reg[txclken]__0\,
      I1 => \restx_seq_reg[txclkcnt_n_0_][1]\,
      I2 => \restx_seq_reg[txclkcnt_n_0_][0]\,
      O => \restx_seq[txclkcy][0]_i_1_n_0\
    );
\restx_seq[txclkcy][1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => p_1_in(0),
      I1 => p_1_in(1),
      I2 => \restx_seq_reg[txclkcy_n_0_][0]\,
      I3 => \restx_seq_reg[txclken]__0\,
      O => \restx_seq[txclkcy][1]_i_1_n_0\
    );
\restx_seq[txclkcy][2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => p_1_in2_in(0),
      I1 => p_1_in2_in(1),
      I2 => p_0_in38_in,
      I3 => \restx_seq_reg[txclken]__0\,
      O => \restx_seq[txclkcy][2]_i_1_n_0\
    );
\restx_seq[txclkdone][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => \restx_seq_reg[txclken]__0\,
      I1 => \restx_seq_reg[txclkcnt_n_0_][0]\,
      I2 => p_1_in(1),
      I3 => p_1_in(0),
      I4 => \restx_seq_reg[txclkcnt_n_0_][1]\,
      O => \restx_seq[txclkdone][0]_i_1_n_0\
    );
\restx_seq[txclkdone][1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \restx_seq_reg[txclken]__0\,
      I1 => p_1_in2_in(1),
      I2 => p_1_in2_in(0),
      I3 => p_1_in5_in(0),
      I4 => p_1_in5_in(1),
      O => \restx_seq[txclkdone][1]_i_1_n_0\
    );
\restx_seq_reg[b_mux]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => SYNCTXSYSFLIP0_n_1,
      Q => \restx_seq_reg[b_mux]__0\
    );
\restx_seq_reg[b_token][char][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][char][0]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][char]\(0)
    );
\restx_seq_reg[b_token][char][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][char][1]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][char]\(1)
    );
\restx_seq_reg[b_token][char][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][char][2]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][char]\(2)
    );
\restx_seq_reg[b_token][char][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][char][3]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][char]\(3)
    );
\restx_seq_reg[b_token][char][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][char][4]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][char]\(4)
    );
\restx_seq_reg[b_token][char][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][char][5]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][char]\(5)
    );
\restx_seq_reg[b_token][char][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][char][6]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][char]\(6)
    );
\restx_seq_reg[b_token][char][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][char][7]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][char]\(7)
    );
\restx_seq_reg[b_token][fct]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][fct]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][fct]__0\
    );
\restx_seq_reg[b_token][fctpiggy]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][fctpiggy]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][fctpiggy]__0\
    );
\restx_seq_reg[b_token][flag]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[b_update]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[b_token][flag]_i_1_n_0\,
      Q => \restx_seq_reg[b_token][flag]__0\
    );
\restx_seq_reg[b_txflip]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[b_txflip]\,
      Q => \restx_seq_reg[b_txflip]__0\
    );
\restx_seq_reg[b_update]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \vtx[b_update]\,
      Q => \restx_seq_reg[b_update]__0\
    );
\restx_seq_reg[b_valid]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => SYNCTXSYSFLIP0_n_2,
      Q => \restx_seq_reg[b_valid]__0\
    );
\restx_seq_reg[c_bits][0]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[c_update_n_0_]\,
      D => \restx_seq_reg[b_token][flag]__0\,
      PRE => buf_ff0_reg_0,
      Q => \restx_seq_reg[c_bits_n_0_][0]\
    );
\restx_seq_reg[c_bits][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[c_update_n_0_]\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq_reg[b_token][char]\(0),
      Q => \restx_seq_reg[c_bits_n_0_][1]\
    );
\restx_seq_reg[c_bits][2]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[c_update_n_0_]\,
      D => \restx_seq[c_bits][2]_i_1_n_0\,
      PRE => buf_ff0_reg_0,
      Q => \restx_seq_reg[c_bits_n_0_][2]\
    );
\restx_seq_reg[c_bits][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[c_update_n_0_]\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[c_bits][3]_i_1_n_0\,
      Q => \restx_seq_reg[c_bits_n_0_][3]\
    );
\restx_seq_reg[c_bits][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[c_update_n_0_]\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[c_bits][4]_i_1_n_0\,
      Q => \restx_seq_reg[c_bits_n_0_][4]\
    );
\restx_seq_reg[c_bits][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[c_update_n_0_]\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[c_bits][5]_i_1_n_0\,
      Q => \restx_seq_reg[c_bits_n_0_][5]\
    );
\restx_seq_reg[c_bits][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[c_update_n_0_]\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[c_bits][6]_i_1_n_0\,
      Q => \restx_seq_reg[c_bits_n_0_][6]\
    );
\restx_seq_reg[c_bits][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[c_update_n_0_]\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[c_bits][7]_i_1_n_0\,
      Q => \restx_seq_reg[c_bits_n_0_][7]\
    );
\restx_seq_reg[c_bits][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[c_update_n_0_]\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[c_bits][8]_i_1_n_0\,
      Q => \restx_seq_reg[c_bits_n_0_][8]\
    );
\restx_seq_reg[c_busy]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      D => SYNCTXTXEN_n_3,
      PRE => buf_ff0_reg_0,
      Q => \restx_seq_reg[c_busy]__0\
    );
\restx_seq_reg[c_esc]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      D => SYNCTXTXEN_n_5,
      PRE => buf_ff0_reg_0,
      Q => \restx_seq_reg[c_esc_n_0_]\
    );
\restx_seq_reg[c_fct]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      D => SYNCTXTXEN_n_4,
      PRE => buf_ff0_reg_0,
      Q => \restx_seq_reg[c_fct_n_0_]\
    );
\restx_seq_reg[c_update]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \vtx[c_update]__0\,
      Q => \restx_seq_reg[c_update_n_0_]\
    );
\restx_seq_reg[d_bits][0]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      D => \restx_com[d_bits]\(0),
      PRE => buf_ff0_reg_0,
      Q => \restx_seq_reg[d_bits_n_0_][0]\
    );
\restx_seq_reg[d_bits][1]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      D => \restx_com[d_bits]\(1),
      PRE => buf_ff0_reg_0,
      Q => \restx_seq_reg[d_bits_n_0_][1]\
    );
\restx_seq_reg[d_bits][2]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      D => \restx_com[d_bits]\(2),
      PRE => buf_ff0_reg_0,
      Q => \restx_seq_reg[d_bits_n_0_][2]\
    );
\restx_seq_reg[d_bits][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[d_bits]\(3),
      Q => \restx_seq_reg[d_bits_n_0_][3]\
    );
\restx_seq_reg[d_bits][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[d_bits]\(4),
      Q => \restx_seq_reg[d_bits_n_0_][4]\
    );
\restx_seq_reg[d_bits][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[d_bits]\(5),
      Q => \restx_seq_reg[d_bits_n_0_][5]\
    );
\restx_seq_reg[d_bits][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[d_bits]\(6),
      Q => \restx_seq_reg[d_bits_n_0_][6]\
    );
\restx_seq_reg[d_bits][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[d_bits]\(7),
      Q => \restx_seq_reg[d_bits_n_0_][7]\
    );
\restx_seq_reg[d_bits][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[d_bits]\(8),
      Q => \restx_seq_reg[d_bits_n_0_][8]\
    );
\restx_seq_reg[d_cnt10]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \vtx[d_cnt10]__0\,
      Q => \restx_seq_reg[d_cnt10]__0\
    );
\restx_seq_reg[e_count][0]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      D => \restx_com[e_count]\(0),
      PRE => buf_ff0_reg_0,
      Q => \restx_seq_reg[e_count_n_0_][0]\
    );
\restx_seq_reg[e_count][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      CLR => buf_ff0_reg_0,
      D => \restx_com[e_count]\(1),
      Q => \restx_seq_reg[e_count_n_0_][1]\
    );
\restx_seq_reg[e_count][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      CLR => buf_ff0_reg_0,
      D => \restx_com[e_count]\(2),
      Q => \restx_seq_reg[e_count_n_0_][2]\
    );
\restx_seq_reg[e_count][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      CLR => buf_ff0_reg_0,
      D => \restx_com[e_count]\(3),
      Q => p_0_in
    );
\restx_seq_reg[e_count][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      CLR => buf_ff0_reg_0,
      D => \restx_com[e_count]\(4),
      Q => \restx_seq_reg[e_count_n_0_][4]\
    );
\restx_seq_reg[e_count][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      CLR => buf_ff0_reg_0,
      D => \restx_com[e_count]\(5),
      Q => \restx_seq_reg[e_count_n_0_][5]\
    );
\restx_seq_reg[e_count][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      CLR => buf_ff0_reg_0,
      D => \restx_com[e_count]\(6),
      Q => \restx_seq_reg[e_count_n_0_][6]\
    );
\restx_seq_reg[e_count][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      CLR => buf_ff0_reg_0,
      D => \restx_com[e_count]\(7),
      Q => \restx_seq_reg[e_count_n_0_][7]\
    );
\restx_seq_reg[e_count][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      CLR => buf_ff0_reg_0,
      D => \restx_com[e_count]\(8),
      Q => \restx_seq_reg[e_count_n_0_][8]\
    );
\restx_seq_reg[e_count][9]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      CLR => buf_ff0_reg_0,
      D => \restx_com[e_count]\(9),
      Q => \restx_seq_reg[e_count_n_0_][9]\
    );
\restx_seq_reg[e_parity]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => SYNCTXTXEN_n_1,
      CLR => buf_ff0_reg_0,
      D => \vtx[e_parity]1_out\,
      Q => \restx_seq_reg[e_parity]__0\
    );
\restx_seq_reg[e_shift][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[e_shift][0]_i_1_n_0\,
      Q => \restx_seq_reg[e_shift_n_0_][0]\
    );
\restx_seq_reg[e_shift][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[e_shift][1]_i_1_n_0\,
      Q => \restx_seq_reg[e_shift_n_0_][1]\
    );
\restx_seq_reg[e_shift][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[e_shift][2]_i_1_n_0\,
      Q => \restx_seq_reg[e_shift_n_0_][2]\
    );
\restx_seq_reg[e_shift][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[e_shift][3]_i_1_n_0\,
      Q => \restx_seq_reg[e_shift_n_0_][3]\
    );
\restx_seq_reg[e_shift][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[e_shift][4]_i_1_n_0\,
      Q => \restx_seq_reg[e_shift_n_0_][4]\
    );
\restx_seq_reg[e_shift][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[e_shift][5]_i_1_n_0\,
      Q => \restx_seq_reg[e_shift_n_0_][5]\
    );
\restx_seq_reg[e_shift][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[e_shift][6]_i_1_n_0\,
      Q => \restx_seq_reg[e_shift_n_0_][6]\
    );
\restx_seq_reg[e_shift][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[e_shift][7]_i_1_n_0\,
      Q => \restx_seq_reg[e_shift_n_0_][7]\
    );
\restx_seq_reg[e_shift][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[e_shift][8]_i_1_n_0\,
      Q => \restx_seq_reg[e_shift_n_0_][8]\
    );
\restx_seq_reg[e_shift][9]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[e_shift][9]_i_1_n_0\,
      Q => \restx_seq_reg[e_shift_n_0_][9]\
    );
\restx_seq_reg[e_valid]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => SYNCTXTXEN_n_2,
      Q => \restx_seq_reg[e_valid]__0\
    );
\restx_seq_reg[f_spwdo]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \restx_seq[f_spwdo]_i_1_n_0\,
      Q => \restx_seq_reg[f_spwdo]__0\
    );
\restx_seq_reg[f_spwso]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => \restx_seq_reg[txclken]__0\,
      CLR => buf_ff0_reg_0,
      D => \vtx[f_spwso]__0\,
      Q => \restx_seq_reg[f_spwso]__0\
    );
\restx_seq_reg[txclkcnt][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[txclkcnt]\(0),
      Q => \restx_seq_reg[txclkcnt_n_0_][0]\
    );
\restx_seq_reg[txclkcnt][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[txclkcnt]\(1),
      Q => \restx_seq_reg[txclkcnt_n_0_][1]\
    );
\restx_seq_reg[txclkcnt][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[txclkcnt]\(2),
      Q => p_1_in(0)
    );
\restx_seq_reg[txclkcnt][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[txclkcnt]\(3),
      Q => p_1_in(1)
    );
\restx_seq_reg[txclkcnt][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq[txclkcnt][4]_i_1_n_0\,
      Q => p_1_in2_in(0)
    );
\restx_seq_reg[txclkcnt][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq[txclkcnt][5]_i_1_n_0\,
      Q => p_1_in2_in(1)
    );
\restx_seq_reg[txclkcnt][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq[txclkcnt][6]_i_1_n_0\,
      Q => p_1_in5_in(0)
    );
\restx_seq_reg[txclkcnt][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq[txclkcnt][7]_i_1_n_0\,
      Q => p_1_in5_in(1)
    );
\restx_seq_reg[txclkcy][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq[txclkcy][0]_i_1_n_0\,
      Q => \restx_seq_reg[txclkcy_n_0_][0]\
    );
\restx_seq_reg[txclkcy][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq[txclkcy][1]_i_1_n_0\,
      Q => p_0_in38_in
    );
\restx_seq_reg[txclkcy][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq[txclkcy][2]_i_1_n_0\,
      Q => \restx_seq_reg[txclkcy_n_0_][2]\
    );
\restx_seq_reg[txclkdiv][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => syncdff_ff2,
      CLR => buf_ff0_reg_0,
      D => \res_seq_reg[txdivreg]\(0),
      Q => \restx_seq_reg[txclkdiv_n_0_][0]\
    );
\restx_seq_reg[txclkdiv][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => syncdff_ff2,
      CLR => buf_ff0_reg_0,
      D => \res_seq_reg[txdivreg]\(1),
      Q => \restx_seq_reg[txclkdiv_n_0_][1]\
    );
\restx_seq_reg[txclkdiv][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => syncdff_ff2,
      CLR => buf_ff0_reg_0,
      D => \res_seq_reg[txdivreg]\(3),
      Q => \restx_seq_reg[txclkdiv_n_0_][3]\
    );
\restx_seq_reg[txclkdone][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq[txclkdone][0]_i_1_n_0\,
      Q => \restx_seq_reg[txclkdone_n_0_][0]\
    );
\restx_seq_reg[txclkdone][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq[txclkdone][1]_i_1_n_0\,
      Q => \restx_seq_reg[txclkdone_n_0_][1]\
    );
\restx_seq_reg[txclken]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_com[txclken]\,
      Q => \restx_seq_reg[txclken]__0\
    );
\restx_seq_reg[txclken]0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => \restx_seq_reg[txclkdone_n_0_][1]\,
      I1 => \restx_seq_reg[txclkdone_n_0_][0]\,
      I2 => \restx_seq_reg[txclkpre]__0\,
      O => \restx_com[txclken]\
    );
\restx_seq_reg[txclkpre]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      D => \restx_com[txclkpre]__0\,
      PRE => buf_ff0_reg_0,
      Q => \restx_seq_reg[txclkpre]__0\
    );
\restx_seq_reg[txdivnorm]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => syncdff_ff2,
      CLR => buf_ff0_reg_0,
      D => \res_seq_reg[txdivnorm]__0\,
      Q => \restx_seq_reg[txdivnorm_n_0_]\
    );
\restx_seq_reg[txflip0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => SYNCTXSYSFLIP0_n_0,
      Q => \restx_seq_reg[txflip_n_0_0]\
    );
\restx_seq_reg[txflip1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => SYNCTXSYSFLIP1_n_1,
      Q => \restx_seq_reg[txflip_n_0_1]\
    );
s_spwdo_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq_reg[f_spwdo]__0\,
      Q => SPW_Dout
    );
s_spwso_reg: unisim.vcomponents.FDCE
     port map (
      C => SPW_TX_clk,
      CE => '1',
      CLR => buf_ff0_reg_0,
      D => \restx_seq_reg[f_spwso]__0\,
      Q => SPW_Sout
    );
\vstate[rx_credit]0_carry__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA8AAA"
    )
        port map (
      I0 => \recvo[rxchar]\,
      I1 => \^res_seq_reg[pend_fct]__0\,
      I2 => \xmiti[fct_in]\,
      I3 => \^res_seq_reg[allow_fct]__0\,
      I4 => \res_seq_reg[token1][char][7]_0\,
      O => DI(0)
    );
\vtx[c_update]\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \restx_seq_reg[txclken]__0\,
      I1 => \synctx[txen]\,
      I2 => p_0_in,
      O => \vtx[c_update]__0\
    );
\vtx[d_cnt10]\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \restx_seq_reg[c_esc_n_0_]\,
      I1 => \restx_seq_reg[c_bits_n_0_][0]\,
      I2 => \synctx[txen]\,
      I3 => \restx_seq_reg[c_fct_n_0_]\,
      O => \vtx[d_cnt10]__0\
    );
\vtx[f_spwso]\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2882"
    )
        port map (
      I0 => \restx_seq_reg[e_valid]__0\,
      I1 => \restx_seq_reg[f_spwso]__0\,
      I2 => \restx_seq_reg[e_shift_n_0_][0]\,
      I3 => \restx_seq_reg[f_spwdo]__0\,
      O => \vtx[f_spwso]__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwStream is
  port (
    SPW_Dout : out STD_LOGIC;
    SPW_Sout : out STD_LOGIC;
    RDATA : out STD_LOGIC_VECTOR ( 8 downto 0 );
    \res_seq_reg[txfull]__0\ : out STD_LOGIC;
    RXVALID : out STD_LOGIC;
    sel : out STD_LOGIC;
    \res_seq_reg[rxfifo_rvalid]_0\ : out STD_LOGIC;
    \res_seq_reg[rxfifo_rvalid]_1\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_fifo0 : out STD_LOGIC;
    axi_streamout_tlast : out STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    SPW_TX_clk : in STD_LOGIC;
    SPW_Din : in STD_LOGIC;
    WDATA : in STD_LOGIC_VECTOR ( 8 downto 0 );
    WEN10_out : in STD_LOGIC;
    SPW_Sin : in STD_LOGIC;
    axi_streamout_tready : in STD_LOGIC;
    \escape_fifo_reg[0]\ : in STD_LOGIC;
    axi_streamout_aresetn : in STD_LOGIC;
    \res_seq_reg[txdiscard]_0\ : in STD_LOGIC;
    SPW_TXWRITE : in STD_LOGIC;
    SPW_RXREAD : in STD_LOGIC;
    SPW_rst : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwStream;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwStream is
  component decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwBlockRam is
  port (
    RADDR : in STD_LOGIC_VECTOR ( 11 downto 0 );
    WADDR : in STD_LOGIC_VECTOR ( 11 downto 0 );
    WDATA : in STD_LOGIC_VECTOR ( 8 downto 0 );
    WEN : in STD_LOGIC;
    CLK : in STD_LOGIC;
    RDATA : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  end component decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwBlockRam;
  signal LINK_INST_n_29 : STD_LOGIC;
  signal LINK_INST_n_3 : STD_LOGIC;
  signal LINK_INST_n_4 : STD_LOGIC;
  signal LINK_INST_n_5 : STD_LOGIC;
  signal LINK_INST_n_6 : STD_LOGIC;
  signal LINK_INST_n_8 : STD_LOGIC;
  signal LINK_INST_n_9 : STD_LOGIC;
  signal RADDR : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal RECVFRONT_INST_n_5 : STD_LOGIC;
  signal RECVFRONT_INST_n_6 : STD_LOGIC;
  signal RECV_INST_n_10 : STD_LOGIC;
  signal RECV_INST_n_11 : STD_LOGIC;
  signal RECV_INST_n_12 : STD_LOGIC;
  signal RECV_INST_n_13 : STD_LOGIC;
  signal RECV_INST_n_14 : STD_LOGIC;
  signal RECV_INST_n_18 : STD_LOGIC;
  signal RECV_INST_n_19 : STD_LOGIC;
  signal RECV_INST_n_20 : STD_LOGIC;
  signal RECV_INST_n_21 : STD_LOGIC;
  signal RECV_INST_n_22 : STD_LOGIC;
  signal RECV_INST_n_23 : STD_LOGIC;
  signal RECV_INST_n_6 : STD_LOGIC;
  signal RECV_INST_n_7 : STD_LOGIC;
  signal RECV_INST_n_8 : STD_LOGIC;
  signal RECV_INST_n_9 : STD_LOGIC;
  signal \^rxvalid\ : STD_LOGIC;
  signal SYSRSTLOGIC_n_1 : STD_LOGIC;
  signal TXRSTLOGIC_n_0 : STD_LOGIC;
  signal TXRSTLOGIC_n_1 : STD_LOGIC;
  signal WADDR : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal WDATA_0 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal WEN : STD_LOGIC;
  signal XMIT_FAST_INST_n_7 : STD_LOGIC;
  signal \i_/i_/i___22_carry__0_n_0\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__0_n_1\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__0_n_2\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__0_n_3\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__0_n_4\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__0_n_5\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__0_n_6\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__0_n_7\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__1_n_1\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__1_n_2\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__1_n_3\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__1_n_4\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__1_n_5\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__1_n_6\ : STD_LOGIC;
  signal \i_/i_/i___22_carry__1_n_7\ : STD_LOGIC;
  signal \i_/i_/i___22_carry_n_0\ : STD_LOGIC;
  signal \i_/i_/i___22_carry_n_1\ : STD_LOGIC;
  signal \i_/i_/i___22_carry_n_2\ : STD_LOGIC;
  signal \i_/i_/i___22_carry_n_3\ : STD_LOGIC;
  signal \i_/i_/i___22_carry_n_4\ : STD_LOGIC;
  signal \i_/i_/i___22_carry_n_5\ : STD_LOGIC;
  signal \i_/i_/i___22_carry_n_6\ : STD_LOGIC;
  signal \i_/i_/i___22_carry_n_7\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__0_n_0\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__0_n_1\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__0_n_2\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__0_n_3\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__0_n_4\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__0_n_5\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__0_n_6\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__0_n_7\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__1_n_1\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__1_n_2\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__1_n_3\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__1_n_4\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__1_n_5\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__1_n_6\ : STD_LOGIC;
  signal \i_/i_/i___45_carry__1_n_7\ : STD_LOGIC;
  signal \i_/i_/i___45_carry_n_0\ : STD_LOGIC;
  signal \i_/i_/i___45_carry_n_1\ : STD_LOGIC;
  signal \i_/i_/i___45_carry_n_2\ : STD_LOGIC;
  signal \i_/i_/i___45_carry_n_3\ : STD_LOGIC;
  signal \i_/i_/i___45_carry_n_4\ : STD_LOGIC;
  signal \i_/i_/i___45_carry_n_5\ : STD_LOGIC;
  signal \i_/i_/i___45_carry_n_6\ : STD_LOGIC;
  signal \i_/i_/i___45_carry_n_7\ : STD_LOGIC;
  signal \i_/i_/i__carry__0_n_0\ : STD_LOGIC;
  signal \i_/i_/i__carry__0_n_1\ : STD_LOGIC;
  signal \i_/i_/i__carry__0_n_2\ : STD_LOGIC;
  signal \i_/i_/i__carry__0_n_3\ : STD_LOGIC;
  signal \i_/i_/i__carry__0_n_4\ : STD_LOGIC;
  signal \i_/i_/i__carry__0_n_5\ : STD_LOGIC;
  signal \i_/i_/i__carry__0_n_6\ : STD_LOGIC;
  signal \i_/i_/i__carry__0_n_7\ : STD_LOGIC;
  signal \i_/i_/i__carry__1_n_1\ : STD_LOGIC;
  signal \i_/i_/i__carry__1_n_2\ : STD_LOGIC;
  signal \i_/i_/i__carry__1_n_3\ : STD_LOGIC;
  signal \i_/i_/i__carry__1_n_4\ : STD_LOGIC;
  signal \i_/i_/i__carry__1_n_5\ : STD_LOGIC;
  signal \i_/i_/i__carry__1_n_6\ : STD_LOGIC;
  signal \i_/i_/i__carry__1_n_7\ : STD_LOGIC;
  signal \i_/i_/i__carry_n_0\ : STD_LOGIC;
  signal \i_/i_/i__carry_n_1\ : STD_LOGIC;
  signal \i_/i_/i__carry_n_2\ : STD_LOGIC;
  signal \i_/i_/i__carry_n_3\ : STD_LOGIC;
  signal \i_/i_/i__carry_n_4\ : STD_LOGIC;
  signal \i_/i_/i__carry_n_5\ : STD_LOGIC;
  signal \i_/i_/i__carry_n_6\ : STD_LOGIC;
  signal \i_/i_/i__carry_n_7\ : STD_LOGIC;
  signal \i___22_carry_i_1_n_0\ : STD_LOGIC;
  signal \i___45_carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__1_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__2_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal load : STD_LOGIC;
  signal \minusOp_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_n_0\ : STD_LOGIC;
  signal \minusOp_carry__0_n_1\ : STD_LOGIC;
  signal \minusOp_carry__0_n_2\ : STD_LOGIC;
  signal \minusOp_carry__0_n_3\ : STD_LOGIC;
  signal \minusOp_carry__0_n_4\ : STD_LOGIC;
  signal \minusOp_carry__0_n_5\ : STD_LOGIC;
  signal \minusOp_carry__0_n_6\ : STD_LOGIC;
  signal \minusOp_carry__0_n_7\ : STD_LOGIC;
  signal \minusOp_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__1_n_1\ : STD_LOGIC;
  signal \minusOp_carry__1_n_2\ : STD_LOGIC;
  signal \minusOp_carry__1_n_3\ : STD_LOGIC;
  signal \minusOp_carry__1_n_4\ : STD_LOGIC;
  signal \minusOp_carry__1_n_5\ : STD_LOGIC;
  signal \minusOp_carry__1_n_6\ : STD_LOGIC;
  signal \minusOp_carry__1_n_7\ : STD_LOGIC;
  signal \minusOp_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \minusOp_carry__2_n_7\ : STD_LOGIC;
  signal minusOp_carry_i_1_n_0 : STD_LOGIC;
  signal minusOp_carry_i_2_n_0 : STD_LOGIC;
  signal minusOp_carry_i_3_n_0 : STD_LOGIC;
  signal minusOp_carry_i_4_n_0 : STD_LOGIC;
  signal minusOp_carry_n_0 : STD_LOGIC;
  signal minusOp_carry_n_1 : STD_LOGIC;
  signal minusOp_carry_n_2 : STD_LOGIC;
  signal minusOp_carry_n_3 : STD_LOGIC;
  signal minusOp_carry_n_4 : STD_LOGIC;
  signal minusOp_carry_n_5 : STD_LOGIC;
  signal minusOp_carry_n_6 : STD_LOGIC;
  signal minusOp_carry_n_7 : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \minusOp_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal p_0_in10_in : STD_LOGIC;
  signal recv_inact : STD_LOGIC;
  signal recv_inbits : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal recv_inbvalid : STD_LOGIC;
  signal recv_rxen : STD_LOGIC;
  signal \recvo[gotfct]\ : STD_LOGIC;
  signal \recvo[gotnull]\ : STD_LOGIC;
  signal \recvo[rxchar]\ : STD_LOGIC;
  signal \recvo[tick_out]\ : STD_LOGIC;
  signal \res_com[bitcntp_gray]\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \res_com[disccnt]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \res_com[rxemptydiscard]\ : STD_LOGIC;
  signal \res_com[rxfifo_rvalid]\ : STD_LOGIC;
  signal \res_com[rxfull]\ : STD_LOGIC;
  signal \res_com[rxroom]\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \res_com[txfifo_rvalid]\ : STD_LOGIC;
  signal \res_com[txfull]\ : STD_LOGIC;
  signal \res_seq[rxfifo_raddr][3]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[rxfiforoom][0]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[rxfiforoom][11]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[rxfiforoom][1]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[rxfiforoom][3]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[rxfiforoom][3]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq[rxfiforoom][5]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[rxfiforoom][6]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[rxfiforoom][7]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq[rxfull]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq[txfiforoom][3]_i_3_n_0\ : STD_LOGIC;
  signal \res_seq_reg[allow_char]__0\ : STD_LOGIC;
  signal \res_seq_reg[allow_fct]__0\ : STD_LOGIC;
  signal \res_seq_reg[bit_seen]0\ : STD_LOGIC;
  signal \res_seq_reg[disccnt]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \res_seq_reg[parity]__0\ : STD_LOGIC;
  signal \res_seq_reg[pend_char]__0\ : STD_LOGIC;
  signal \res_seq_reg[pend_fct]__0\ : STD_LOGIC;
  signal \res_seq_reg[rxeep]__0\ : STD_LOGIC;
  signal \res_seq_reg[rxemptydiscard_n_0_]\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr]\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \res_seq_reg[rxfifo_raddr][11]_i_1_n_1\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr][11]_i_1_n_2\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr][11]_i_1_n_3\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr][3]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr][3]_i_1_n_1\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr][3]_i_1_n_2\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr][3]_i_1_n_3\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr][7]_i_1_n_0\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr][7]_i_1_n_1\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr][7]_i_1_n_2\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_raddr][7]_i_1_n_3\ : STD_LOGIC;
  signal \res_seq_reg[rxfifo_rvalid]1\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][11]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][11]_i_2_n_1\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][11]_i_2_n_2\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][11]_i_2_n_3\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][3]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][3]_i_2_n_1\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][3]_i_2_n_2\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][3]_i_2_n_3\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][7]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][7]_i_2_n_1\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][7]_i_2_n_2\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom][7]_i_2_n_3\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][0]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][10]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][11]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][12]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][1]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][2]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][3]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][4]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][5]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][6]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][7]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][8]\ : STD_LOGIC;
  signal \res_seq_reg[rxfiforoom_n_0_][9]\ : STD_LOGIC;
  signal \res_seq_reg[rxfull]__0\ : STD_LOGIC;
  signal \res_seq_reg[rxpacket_n_0_]\ : STD_LOGIC;
  signal \res_seq_reg[rxroom_n_0_][0]\ : STD_LOGIC;
  signal \res_seq_reg[rxroom_n_0_][1]\ : STD_LOGIC;
  signal \res_seq_reg[rxroom_n_0_][2]\ : STD_LOGIC;
  signal \res_seq_reg[rxroom_n_0_][3]\ : STD_LOGIC;
  signal \res_seq_reg[rxroom_n_0_][4]\ : STD_LOGIC;
  signal \res_seq_reg[rxroom_n_0_][5]\ : STD_LOGIC;
  signal \res_seq_reg[sent_fct]__0\ : STD_LOGIC;
  signal \res_seq_reg[txdiscard]__0\ : STD_LOGIC;
  signal \res_seq_reg[txfifo_raddr]\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \res_seq_reg[txfifo_rvalid]__0\ : STD_LOGIC;
  signal \res_seq_reg[txfifo_waddr]\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \res_seq_reg[txfiforoom][11]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][11]_i_2_n_1\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][11]_i_2_n_2\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][11]_i_2_n_3\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][3]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][3]_i_2_n_1\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][3]_i_2_n_2\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][3]_i_2_n_3\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][7]_i_2_n_0\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][7]_i_2_n_1\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][7]_i_2_n_2\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom][7]_i_2_n_3\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][0]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][10]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][11]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][12]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][1]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][2]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][3]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][4]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][5]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][6]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][7]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][8]\ : STD_LOGIC;
  signal \res_seq_reg[txfiforoom_n_0_][9]\ : STD_LOGIC;
  signal \^res_seq_reg[txfull]__0\ : STD_LOGIC;
  signal \res_seq_reg[txpacket_n_0_]\ : STD_LOGIC;
  signal s_txfifo_rdata : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^sel\ : STD_LOGIC;
  signal \state_seq_reg[timerdone]__0\ : STD_LOGIC;
  signal \syncsys[rxcnt_ddr_gray]\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal sys_rst_n : STD_LOGIC;
  signal \v[allow_char]\ : STD_LOGIC;
  signal \v[pend_char]\ : STD_LOGIC;
  signal \vres[inbvalid]0_out\ : STD_LOGIC;
  signal \vres[rxeep]3_out\ : STD_LOGIC;
  signal \vres[rxfifo_raddr]\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \vres[rxfiforoom]\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \vres[rxfiforoom]0_in\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \vres[rxpacket]7_out\ : STD_LOGIC;
  signal \vres[txdiscard]\ : STD_LOGIC;
  signal \vres[txfiforoom]\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \vres[txfiforoom]0_in\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \vres[txpacket]5_out\ : STD_LOGIC;
  signal \xmiti[fct_in]\ : STD_LOGIC;
  signal \NLW_i_/i_/i___22_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_i_/i_/i___45_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_i_/i_/i__carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_minusOp_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_minusOp_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_minusOp_inferred__0/i__carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_minusOp_inferred__0/i__carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_res_seq_reg[rxfifo_raddr][11]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_res_seq_reg[rxfifo_rvalid]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_res_seq_reg[rxfifo_rvalid]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_res_seq_reg[txfifo_rvalid]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_res_seq_reg[txfifo_rvalid]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute ABITS : integer;
  attribute ABITS of RXMEM : label is 12;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of RXMEM_i_1 : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of RXMEM_i_10 : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of RXMEM_i_11 : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of RXMEM_i_12 : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of RXMEM_i_2 : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of RXMEM_i_3 : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of RXMEM_i_4 : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of RXMEM_i_5 : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of RXMEM_i_6 : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of RXMEM_i_7 : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of RXMEM_i_8 : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of RXMEM_i_9 : label is "soft_lutpair91";
  attribute ABITS of TXMEM : label is 12;
  attribute SOFT_HLUTNM of \escape_fifo[7]_i_1\ : label is "soft_lutpair86";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \i_/i_/i___22_carry\ : label is 11;
  attribute ADDER_THRESHOLD of \i_/i_/i___22_carry__0\ : label is 11;
  attribute ADDER_THRESHOLD of \i_/i_/i___22_carry__1\ : label is 11;
  attribute ADDER_THRESHOLD of \i_/i_/i___45_carry\ : label is 11;
  attribute ADDER_THRESHOLD of \i_/i_/i___45_carry__0\ : label is 11;
  attribute ADDER_THRESHOLD of \i_/i_/i___45_carry__1\ : label is 11;
  attribute ADDER_THRESHOLD of \i_/i_/i__carry\ : label is 11;
  attribute ADDER_THRESHOLD of \i_/i_/i__carry__0\ : label is 11;
  attribute ADDER_THRESHOLD of \i_/i_/i__carry__1\ : label is 11;
  attribute ADDER_THRESHOLD of minusOp_carry : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_inferred__0/i__carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_inferred__0/i__carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \minusOp_inferred__0/i__carry__2\ : label is 35;
  attribute SOFT_HLUTNM of \out_fifo[6]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \out_fifo[7]_i_2\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \out_fifo[7]_i_3\ : label is "soft_lutpair86";
  attribute ADDER_THRESHOLD of \res_seq_reg[rxfifo_raddr][11]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \res_seq_reg[rxfifo_raddr][3]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \res_seq_reg[rxfifo_raddr][7]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \res_seq_reg[rxfifo_rvalid]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \res_seq_reg[rxfiforoom][11]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \res_seq_reg[rxfiforoom][3]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \res_seq_reg[rxfiforoom][7]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \res_seq_reg[txfifo_rvalid]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \res_seq_reg[txfiforoom][11]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \res_seq_reg[txfiforoom][3]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \res_seq_reg[txfiforoom][7]_i_2\ : label is 35;
begin
  RXVALID <= \^rxvalid\;
  \res_seq_reg[txfull]__0\ <= \^res_seq_reg[txfull]__0\;
  sel <= \^sel\;
LINK_INST: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwLink
     port map (
      AR(0) => \res_seq_reg[bit_seen]0\,
      D(0) => s_txfifo_rdata(8),
      DI(0) => XMIT_FAST_INST_n_7,
      E(0) => \v[pend_char]\,
      \FSM_onehot_state_seq_reg[state][0]_0\ => RECV_INST_n_14,
      \FSM_onehot_state_seq_reg[state][0]_1\ => RECV_INST_n_10,
      \FSM_onehot_state_seq_reg[state][0]_2\ => RECV_INST_n_13,
      \FSM_onehot_state_seq_reg[state][1]_0\ => LINK_INST_n_8,
      \FSM_onehot_state_seq_reg[state][3]_0\ => LINK_INST_n_3,
      \FSM_onehot_state_seq_reg[state][4]_0\(2) => RECV_INST_n_7,
      \FSM_onehot_state_seq_reg[state][4]_0\(1) => RECV_INST_n_8,
      \FSM_onehot_state_seq_reg[state][4]_0\(0) => RECV_INST_n_9,
      \FSM_onehot_state_seq_reg[state][5]_0\(3) => LINK_INST_n_4,
      \FSM_onehot_state_seq_reg[state][5]_0\(2) => LINK_INST_n_5,
      \FSM_onehot_state_seq_reg[state][5]_0\(1) => LINK_INST_n_6,
      \FSM_onehot_state_seq_reg[state][5]_0\(0) => p_0_in10_in,
      O(0) => \minusOp_carry__2_n_7\,
      Q(5) => \res_seq_reg[rxroom_n_0_][5]\,
      Q(4) => \res_seq_reg[rxroom_n_0_][4]\,
      Q(3) => \res_seq_reg[rxroom_n_0_][3]\,
      Q(2) => \res_seq_reg[rxroom_n_0_][2]\,
      Q(1) => \res_seq_reg[rxroom_n_0_][1]\,
      Q(0) => \res_seq_reg[rxroom_n_0_][0]\,
      SPW_TXWRITE => SPW_TXWRITE,
      SPW_main_clk => SPW_main_clk,
      load => load,
      recv_rxen => recv_rxen,
      \recvo[gotfct]\ => \recvo[gotfct]\,
      \recvo[gotnull]\ => \recvo[gotnull]\,
      \recvo[rxchar]\ => \recvo[rxchar]\,
      \recvo[tick_out]\ => \recvo[tick_out]\,
      \res_com[txfifo_rvalid]\ => \res_com[txfifo_rvalid]\,
      \res_com[txfull]\ => \res_com[txfull]\,
      \res_seq_reg[allow_char]__0\ => \res_seq_reg[allow_char]__0\,
      \res_seq_reg[allow_fct]__0\ => \res_seq_reg[allow_fct]__0\,
      \res_seq_reg[inbvalid]\ => RECVFRONT_INST_n_5,
      \res_seq_reg[pend_char]__0\ => \res_seq_reg[pend_char]__0\,
      \res_seq_reg[pend_fct]__0\ => \res_seq_reg[pend_fct]__0\,
      \res_seq_reg[rxeep]\ => \res_seq_reg[rxpacket_n_0_]\,
      \res_seq_reg[rxeep]__0\ => \res_seq_reg[rxeep]__0\,
      \res_seq_reg[rxfull]__0\ => \res_seq_reg[rxfull]__0\,
      \res_seq_reg[sent_fct]__0\ => \res_seq_reg[sent_fct]__0\,
      \res_seq_reg[txdiscard]\ => \^sel\,
      \res_seq_reg[txdiscard]_0\ => \res_seq_reg[txpacket_n_0_]\,
      \res_seq_reg[txdiscard]_1\ => \res_seq_reg[txdiscard]_0\,
      \res_seq_reg[txdiscard]__0\ => \res_seq_reg[txdiscard]__0\,
      \res_seq_reg[txfifo_rvalid]\(12) => \res_seq_reg[txfiforoom_n_0_][12]\,
      \res_seq_reg[txfifo_rvalid]\(11) => \res_seq_reg[txfiforoom_n_0_][11]\,
      \res_seq_reg[txfifo_rvalid]\(10) => \res_seq_reg[txfiforoom_n_0_][10]\,
      \res_seq_reg[txfifo_rvalid]\(9) => \res_seq_reg[txfiforoom_n_0_][9]\,
      \res_seq_reg[txfifo_rvalid]\(8) => \res_seq_reg[txfiforoom_n_0_][8]\,
      \res_seq_reg[txfifo_rvalid]\(7) => \res_seq_reg[txfiforoom_n_0_][7]\,
      \res_seq_reg[txfifo_rvalid]\(6) => \res_seq_reg[txfiforoom_n_0_][6]\,
      \res_seq_reg[txfifo_rvalid]\(5) => \res_seq_reg[txfiforoom_n_0_][5]\,
      \res_seq_reg[txfifo_rvalid]\(4) => \res_seq_reg[txfiforoom_n_0_][4]\,
      \res_seq_reg[txfifo_rvalid]\(3) => \res_seq_reg[txfiforoom_n_0_][3]\,
      \res_seq_reg[txfifo_rvalid]\(2) => \res_seq_reg[txfiforoom_n_0_][2]\,
      \res_seq_reg[txfifo_rvalid]\(1) => \res_seq_reg[txfiforoom_n_0_][1]\,
      \res_seq_reg[txfifo_rvalid]\(0) => \res_seq_reg[txfiforoom_n_0_][0]\,
      \res_seq_reg[txfifo_rvalid]__0\ => \res_seq_reg[txfifo_rvalid]__0\,
      \res_seq_reg[txfiforoom][11]\(3) => \minusOp_carry__1_n_4\,
      \res_seq_reg[txfiforoom][11]\(2) => \minusOp_carry__1_n_5\,
      \res_seq_reg[txfiforoom][11]\(1) => \minusOp_carry__1_n_6\,
      \res_seq_reg[txfiforoom][11]\(0) => \minusOp_carry__1_n_7\,
      \res_seq_reg[txfiforoom][12]\(12 downto 0) => \vres[txfiforoom]\(12 downto 0),
      \res_seq_reg[txfiforoom][3]\(3) => minusOp_carry_n_4,
      \res_seq_reg[txfiforoom][3]\(2) => minusOp_carry_n_5,
      \res_seq_reg[txfiforoom][3]\(1) => minusOp_carry_n_6,
      \res_seq_reg[txfiforoom][3]\(0) => minusOp_carry_n_7,
      \res_seq_reg[txfiforoom][7]\(3) => \minusOp_carry__0_n_4\,
      \res_seq_reg[txfiforoom][7]\(2) => \minusOp_carry__0_n_5\,
      \res_seq_reg[txfiforoom][7]\(1) => \minusOp_carry__0_n_6\,
      \res_seq_reg[txfiforoom][7]\(0) => \minusOp_carry__0_n_7\,
      \state_seq_reg[rx_null_fct]_0\ => RECV_INST_n_11,
      \state_seq_reg[rxen]_0\(2 downto 0) => \res_com[bitcntp_gray]\(3 downto 1),
      \state_seq_reg[rxen]_1\ => SYSRSTLOGIC_n_1,
      \state_seq_reg[timercnt][0]_0\ => RECV_INST_n_12,
      \state_seq_reg[timercnt][6]_0\ => LINK_INST_n_9,
      \state_seq_reg[timerdone]__0\ => \state_seq_reg[timerdone]__0\,
      \state_seq_reg[tx_credit][3]_0\ => LINK_INST_n_29,
      \syncsys[rxcnt_ddr_gray]\(2 downto 0) => \syncsys[rxcnt_ddr_gray]\(3 downto 1),
      sys_rst_n => sys_rst_n,
      \v[allow_char]\ => \v[allow_char]\,
      \vres[inbvalid]0_out\ => \vres[inbvalid]0_out\,
      \vres[rxeep]3_out\ => \vres[rxeep]3_out\,
      \vres[txdiscard]\ => \vres[txdiscard]\,
      \vres[txfiforoom]0_in\(12 downto 0) => \vres[txfiforoom]0_in\(12 downto 0),
      \vres[txpacket]5_out\ => \vres[txpacket]5_out\,
      \xmiti[fct_in]\ => \xmiti[fct_in]\
    );
RECVFRONT_INST: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecvFront
     port map (
      D(0) => \res_com[disccnt]\(0),
      Q(1 downto 0) => recv_inbits(1 downto 0),
      SPW_Din => SPW_Din,
      SPW_Sin => SPW_Sin,
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg => SYSRSTLOGIC_n_1,
      load => load,
      recv_inact => recv_inact,
      recv_inbvalid => recv_inbvalid,
      recv_rxen => recv_rxen,
      \res_seq_reg[bitcntp_gray][3]_0\(2 downto 0) => \res_com[bitcntp_gray]\(3 downto 1),
      \res_seq_reg[bufdout][1]_0\ => RECVFRONT_INST_n_6,
      \res_seq_reg[datareg][0]\ => RECV_INST_n_6,
      \res_seq_reg[disccnt][0]\(0) => \res_seq_reg[disccnt]\(0),
      \res_seq_reg[parity]__0\ => \res_seq_reg[parity]__0\,
      \res_seq_reg[tailptr_gray][2]_0\ => RECVFRONT_INST_n_5,
      syncdff_ff2_reg(2 downto 0) => \syncsys[rxcnt_ddr_gray]\(3 downto 1),
      \vres[inbvalid]0_out\ => \vres[inbvalid]0_out\
    );
RECV_INST: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwRecv
     port map (
      AR(0) => \res_seq_reg[bit_seen]0\,
      D(0) => \res_com[disccnt]\(0),
      \FSM_onehot_state_seq_reg[state][2]\ => LINK_INST_n_9,
      \FSM_onehot_state_seq_reg[state][4]\(3) => LINK_INST_n_4,
      \FSM_onehot_state_seq_reg[state][4]\(2) => LINK_INST_n_5,
      \FSM_onehot_state_seq_reg[state][4]\(1) => LINK_INST_n_6,
      \FSM_onehot_state_seq_reg[state][4]\(0) => p_0_in10_in,
      Q(0) => \res_seq_reg[disccnt]\(0),
      SPW_RXREAD => SPW_RXREAD,
      SPW_main_clk => SPW_main_clk,
      WDATA(8 downto 0) => WDATA_0(8 downto 0),
      WEN => WEN,
      recv_inact => recv_inact,
      recv_inbvalid => recv_inbvalid,
      \recvo[gotfct]\ => \recvo[gotfct]\,
      \recvo[gotnull]\ => \recvo[gotnull]\,
      \recvo[rxchar]\ => \recvo[rxchar]\,
      \recvo[tick_out]\ => \recvo[tick_out]\,
      \res_com[rxemptydiscard]\ => \res_com[rxemptydiscard]\,
      \res_com[rxfifo_rvalid]\ => \res_com[rxfifo_rvalid]\,
      \res_seq_reg[bit_seen]_0\ => RECV_INST_n_12,
      \res_seq_reg[bitcnt][0]_0\ => RECV_INST_n_6,
      \res_seq_reg[bitshift][8]_0\(1 downto 0) => recv_inbits(1 downto 0),
      \res_seq_reg[datareg][0]_0\ => RECVFRONT_INST_n_6,
      \res_seq_reg[gotfct]_0\ => RECV_INST_n_13,
      \res_seq_reg[gotfct]_1\ => RECV_INST_n_14,
      \res_seq_reg[parity]__0\ => \res_seq_reg[parity]__0\,
      \res_seq_reg[rxchar]_0\ => RECV_INST_n_10,
      \res_seq_reg[rxeep]__0\ => \res_seq_reg[rxeep]__0\,
      \res_seq_reg[rxfifo_rvalid]\(5) => \res_seq_reg[rxfiforoom_n_0_][12]\,
      \res_seq_reg[rxfifo_rvalid]\(4) => \res_seq_reg[rxfiforoom_n_0_][10]\,
      \res_seq_reg[rxfifo_rvalid]\(3) => \res_seq_reg[rxfiforoom_n_0_][9]\,
      \res_seq_reg[rxfifo_rvalid]\(2) => \res_seq_reg[rxfiforoom_n_0_][8]\,
      \res_seq_reg[rxfifo_rvalid]\(1) => \res_seq_reg[rxfiforoom_n_0_][4]\,
      \res_seq_reg[rxfifo_rvalid]\(0) => \res_seq_reg[rxfiforoom_n_0_][2]\,
      \res_seq_reg[rxfifo_rvalid]1\ => \res_seq_reg[rxfifo_rvalid]1\,
      \res_seq_reg[rxfifo_waddr][11]\ => \res_seq_reg[rxemptydiscard_n_0_]\,
      \res_seq_reg[rxfiforoom][10]\ => RECV_INST_n_18,
      \res_seq_reg[rxfiforoom][10]_0\(3) => RECV_INST_n_20,
      \res_seq_reg[rxfiforoom][10]_0\(2) => RECV_INST_n_21,
      \res_seq_reg[rxfiforoom][10]_0\(1) => RECV_INST_n_22,
      \res_seq_reg[rxfiforoom][10]_0\(0) => RECV_INST_n_23,
      \res_seq_reg[rxfiforoom][4]\(1) => \res_com[rxroom]\(4),
      \res_seq_reg[rxfiforoom][4]\(0) => \res_com[rxroom]\(2),
      \res_seq_reg[rxfiforoom][8]\ => RECV_INST_n_19,
      \res_seq_reg[rxfull]__0\ => \res_seq_reg[rxfull]__0\,
      \res_seq_reg[rxpacket]\ => \res_seq_reg[rxpacket_n_0_]\,
      \res_seq_reg[rxroom][2]\ => \res_seq[rxfiforoom][7]_i_1_n_0\,
      \res_seq_reg[rxroom][2]_0\(1) => \res_seq[rxfiforoom][11]_i_1_n_0\,
      \res_seq_reg[rxroom][2]_0\(0) => \res_seq[rxfiforoom][6]_i_1_n_0\,
      \res_seq_reg[tick_out]_0\(2) => RECV_INST_n_7,
      \res_seq_reg[tick_out]_0\(1) => RECV_INST_n_8,
      \res_seq_reg[tick_out]_0\(0) => RECV_INST_n_9,
      \state_seq_reg[timerdone]\ => RECV_INST_n_11,
      \state_seq_reg[timerdone]__0\ => \state_seq_reg[timerdone]__0\,
      \vres[rxfiforoom]\(5) => \vres[rxfiforoom]\(12),
      \vres[rxfiforoom]\(4 downto 2) => \vres[rxfiforoom]\(10 downto 8),
      \vres[rxfiforoom]\(1) => \vres[rxfiforoom]\(4),
      \vres[rxfiforoom]\(0) => \vres[rxfiforoom]\(2),
      \vres[rxfiforoom]0_in\(5) => \vres[rxfiforoom]0_in\(12),
      \vres[rxfiforoom]0_in\(4 downto 2) => \vres[rxfiforoom]0_in\(10 downto 8),
      \vres[rxfiforoom]0_in\(1) => \vres[rxfiforoom]0_in\(4),
      \vres[rxfiforoom]0_in\(0) => \vres[rxfiforoom]0_in\(2),
      \vres[rxpacket]7_out\ => \vres[rxpacket]7_out\
    );
RXMEM: component decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwBlockRam
     port map (
      CLK => SPW_main_clk,
      RADDR(11 downto 0) => RADDR(11 downto 0),
      RDATA(8 downto 0) => RDATA(8 downto 0),
      WADDR(11 downto 0) => WADDR(11 downto 0),
      WDATA(8 downto 0) => WDATA_0(8 downto 0),
      WEN => WEN
    );
RXMEM_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(11),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(11),
      O => RADDR(11)
    );
RXMEM_i_10: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(2),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(2),
      O => RADDR(2)
    );
RXMEM_i_11: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(1),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(1),
      O => RADDR(1)
    );
RXMEM_i_12: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(0),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(0),
      O => RADDR(0)
    );
RXMEM_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(10),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(10),
      O => RADDR(10)
    );
RXMEM_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(9),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(9),
      O => RADDR(9)
    );
RXMEM_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(8),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(8),
      O => RADDR(8)
    );
RXMEM_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(7),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(7),
      O => RADDR(7)
    );
RXMEM_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(6),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(6),
      O => RADDR(6)
    );
RXMEM_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(5),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(5),
      O => RADDR(5)
    );
RXMEM_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(4),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(4),
      O => RADDR(4)
    );
RXMEM_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \vres[rxfifo_raddr]\(3),
      I1 => SPW_RXREAD,
      I2 => \res_seq_reg[rxfifo_raddr]\(3),
      O => RADDR(3)
    );
SYSRSTLOGIC: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset__parameterized2\
     port map (
      SPW_main_clk => SPW_main_clk,
      \reset_reg_reg[0]_0\ => SYSRSTLOGIC_n_1,
      \reset_reg_reg[0]_1\ => TXRSTLOGIC_n_1,
      sys_rst_n => sys_rst_n
    );
TXMEM: component decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwBlockRam
     port map (
      CLK => SPW_main_clk,
      RADDR(11 downto 0) => \res_seq_reg[txfifo_raddr]\(11 downto 0),
      RDATA(8 downto 0) => s_txfifo_rdata(8 downto 0),
      WADDR(11 downto 0) => \res_seq_reg[txfifo_waddr]\(11 downto 0),
      WDATA(8 downto 0) => WDATA(8 downto 0),
      WEN => WEN10_out
    );
TXRSTLOGIC: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwReset
     port map (
      SPW_TX_clk => SPW_TX_clk,
      SPW_rst => SPW_rst,
      SPW_rst_0 => TXRSTLOGIC_n_1,
      \reset_reg_reg[0]_0\ => TXRSTLOGIC_n_0
    );
XMIT_FAST_INST: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwXmit_fast
     port map (
      D(8 downto 0) => s_txfifo_rdata(8 downto 0),
      DI(0) => XMIT_FAST_INST_n_7,
      E(0) => \v[pend_char]\,
      SPW_Dout => SPW_Dout,
      SPW_Sout => SPW_Sout,
      SPW_TX_clk => SPW_TX_clk,
      SPW_main_clk => SPW_main_clk,
      buf_ff0_reg => SYSRSTLOGIC_n_1,
      buf_ff0_reg_0 => TXRSTLOGIC_n_0,
      \recvo[rxchar]\ => \recvo[rxchar]\,
      \res_seq_reg[allow_char]__0\ => \res_seq_reg[allow_char]__0\,
      \res_seq_reg[allow_fct]_0\ => LINK_INST_n_3,
      \res_seq_reg[allow_fct]__0\ => \res_seq_reg[allow_fct]__0\,
      \res_seq_reg[pend_char]_0\ => LINK_INST_n_29,
      \res_seq_reg[pend_char]__0\ => \res_seq_reg[pend_char]__0\,
      \res_seq_reg[pend_fct]__0\ => \res_seq_reg[pend_fct]__0\,
      \res_seq_reg[sent_fct]__0\ => \res_seq_reg[sent_fct]__0\,
      \res_seq_reg[token1][char][7]_0\ => LINK_INST_n_8,
      \res_seq_reg[txdiscard]__0\ => \res_seq_reg[txdiscard]__0\,
      \res_seq_reg[txdivreg][3]_0\(0) => p_0_in10_in,
      \res_seq_reg[txfifo_rvalid]__0\ => \res_seq_reg[txfifo_rvalid]__0\,
      \v[allow_char]\ => \v[allow_char]\,
      \xmiti[fct_in]\ => \xmiti[fct_in]\
    );
axi_streamout_tlast_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^rxvalid\,
      O => axi_streamout_tlast
    );
\escape_fifo[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^rxvalid\,
      I1 => axi_streamout_tready,
      I2 => \escape_fifo_reg[0]\,
      O => E(0)
    );
\i_/i_/i___22_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \i_/i_/i___22_carry_n_0\,
      CO(2) => \i_/i_/i___22_carry_n_1\,
      CO(1) => \i_/i_/i___22_carry_n_2\,
      CO(0) => \i_/i_/i___22_carry_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \i_/i_/i___22_carry_n_4\,
      O(2) => \i_/i_/i___22_carry_n_5\,
      O(1) => \i_/i_/i___22_carry_n_6\,
      O(0) => \i_/i_/i___22_carry_n_7\,
      S(3 downto 1) => \res_seq_reg[txfifo_waddr]\(3 downto 1),
      S(0) => \i___22_carry_i_1_n_0\
    );
\i_/i_/i___22_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \i_/i_/i___22_carry_n_0\,
      CO(3) => \i_/i_/i___22_carry__0_n_0\,
      CO(2) => \i_/i_/i___22_carry__0_n_1\,
      CO(1) => \i_/i_/i___22_carry__0_n_2\,
      CO(0) => \i_/i_/i___22_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \i_/i_/i___22_carry__0_n_4\,
      O(2) => \i_/i_/i___22_carry__0_n_5\,
      O(1) => \i_/i_/i___22_carry__0_n_6\,
      O(0) => \i_/i_/i___22_carry__0_n_7\,
      S(3 downto 0) => \res_seq_reg[txfifo_waddr]\(7 downto 4)
    );
\i_/i_/i___22_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \i_/i_/i___22_carry__0_n_0\,
      CO(3) => \NLW_i_/i_/i___22_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \i_/i_/i___22_carry__1_n_1\,
      CO(1) => \i_/i_/i___22_carry__1_n_2\,
      CO(0) => \i_/i_/i___22_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \i_/i_/i___22_carry__1_n_4\,
      O(2) => \i_/i_/i___22_carry__1_n_5\,
      O(1) => \i_/i_/i___22_carry__1_n_6\,
      O(0) => \i_/i_/i___22_carry__1_n_7\,
      S(3 downto 0) => \res_seq_reg[txfifo_waddr]\(11 downto 8)
    );
\i_/i_/i___45_carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \i_/i_/i___45_carry_n_0\,
      CO(2) => \i_/i_/i___45_carry_n_1\,
      CO(1) => \i_/i_/i___45_carry_n_2\,
      CO(0) => \i_/i_/i___45_carry_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \i_/i_/i___45_carry_n_4\,
      O(2) => \i_/i_/i___45_carry_n_5\,
      O(1) => \i_/i_/i___45_carry_n_6\,
      O(0) => \i_/i_/i___45_carry_n_7\,
      S(3 downto 1) => WADDR(3 downto 1),
      S(0) => \i___45_carry_i_1_n_0\
    );
\i_/i_/i___45_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \i_/i_/i___45_carry_n_0\,
      CO(3) => \i_/i_/i___45_carry__0_n_0\,
      CO(2) => \i_/i_/i___45_carry__0_n_1\,
      CO(1) => \i_/i_/i___45_carry__0_n_2\,
      CO(0) => \i_/i_/i___45_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \i_/i_/i___45_carry__0_n_4\,
      O(2) => \i_/i_/i___45_carry__0_n_5\,
      O(1) => \i_/i_/i___45_carry__0_n_6\,
      O(0) => \i_/i_/i___45_carry__0_n_7\,
      S(3 downto 0) => WADDR(7 downto 4)
    );
\i_/i_/i___45_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \i_/i_/i___45_carry__0_n_0\,
      CO(3) => \NLW_i_/i_/i___45_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \i_/i_/i___45_carry__1_n_1\,
      CO(1) => \i_/i_/i___45_carry__1_n_2\,
      CO(0) => \i_/i_/i___45_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \i_/i_/i___45_carry__1_n_4\,
      O(2) => \i_/i_/i___45_carry__1_n_5\,
      O(1) => \i_/i_/i___45_carry__1_n_6\,
      O(0) => \i_/i_/i___45_carry__1_n_7\,
      S(3 downto 0) => WADDR(11 downto 8)
    );
\i_/i_/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \i_/i_/i__carry_n_0\,
      CO(2) => \i_/i_/i__carry_n_1\,
      CO(1) => \i_/i_/i__carry_n_2\,
      CO(0) => \i_/i_/i__carry_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \i_/i_/i__carry_n_4\,
      O(2) => \i_/i_/i__carry_n_5\,
      O(1) => \i_/i_/i__carry_n_6\,
      O(0) => \i_/i_/i__carry_n_7\,
      S(3 downto 1) => \res_seq_reg[txfifo_raddr]\(3 downto 1),
      S(0) => \i__carry_i_1__1_n_0\
    );
\i_/i_/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \i_/i_/i__carry_n_0\,
      CO(3) => \i_/i_/i__carry__0_n_0\,
      CO(2) => \i_/i_/i__carry__0_n_1\,
      CO(1) => \i_/i_/i__carry__0_n_2\,
      CO(0) => \i_/i_/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \i_/i_/i__carry__0_n_4\,
      O(2) => \i_/i_/i__carry__0_n_5\,
      O(1) => \i_/i_/i__carry__0_n_6\,
      O(0) => \i_/i_/i__carry__0_n_7\,
      S(3 downto 0) => \res_seq_reg[txfifo_raddr]\(7 downto 4)
    );
\i_/i_/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \i_/i_/i__carry__0_n_0\,
      CO(3) => \NLW_i_/i_/i__carry__1_CO_UNCONNECTED\(3),
      CO(2) => \i_/i_/i__carry__1_n_1\,
      CO(1) => \i_/i_/i__carry__1_n_2\,
      CO(0) => \i_/i_/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \i_/i_/i__carry__1_n_4\,
      O(2) => \i_/i_/i__carry__1_n_5\,
      O(1) => \i_/i_/i__carry__1_n_6\,
      O(0) => \i_/i_/i__carry__1_n_7\,
      S(3 downto 0) => \res_seq_reg[txfifo_raddr]\(11 downto 8)
    );
\i___22_carry_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfifo_waddr]\(0),
      O => \i___22_carry_i_1_n_0\
    );
\i___45_carry_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => WADDR(0),
      O => \i___45_carry_i_1_n_0\
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][7]\,
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][6]\,
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][5]\,
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][4]\,
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][11]\,
      O => \i__carry__1_i_1_n_0\
    );
\i__carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][10]\,
      O => \i__carry__1_i_2_n_0\
    );
\i__carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][9]\,
      O => \i__carry__1_i_3_n_0\
    );
\i__carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][8]\,
      O => \i__carry__1_i_4_n_0\
    );
\i__carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][12]\,
      O => \i__carry__2_i_1_n_0\
    );
\i__carry_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][3]\,
      O => \i__carry_i_1__0_n_0\
    );
\i__carry_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfifo_raddr]\(0),
      O => \i__carry_i_1__1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][2]\,
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][1]\,
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][0]\,
      I1 => \res_seq_reg[rxfull]__0\,
      O => \i__carry_i_4_n_0\
    );
minusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => minusOp_carry_n_0,
      CO(2) => minusOp_carry_n_1,
      CO(1) => minusOp_carry_n_2,
      CO(0) => minusOp_carry_n_3,
      CYINIT => '1',
      DI(3) => \res_seq_reg[txfiforoom_n_0_][3]\,
      DI(2) => \res_seq_reg[txfiforoom_n_0_][2]\,
      DI(1) => \res_seq_reg[txfiforoom_n_0_][1]\,
      DI(0) => \res_seq_reg[txfiforoom_n_0_][0]\,
      O(3) => minusOp_carry_n_4,
      O(2) => minusOp_carry_n_5,
      O(1) => minusOp_carry_n_6,
      O(0) => minusOp_carry_n_7,
      S(3) => minusOp_carry_i_1_n_0,
      S(2) => minusOp_carry_i_2_n_0,
      S(1) => minusOp_carry_i_3_n_0,
      S(0) => minusOp_carry_i_4_n_0
    );
\minusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => minusOp_carry_n_0,
      CO(3) => \minusOp_carry__0_n_0\,
      CO(2) => \minusOp_carry__0_n_1\,
      CO(1) => \minusOp_carry__0_n_2\,
      CO(0) => \minusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \res_seq_reg[txfiforoom_n_0_][7]\,
      DI(2) => \res_seq_reg[txfiforoom_n_0_][6]\,
      DI(1) => \res_seq_reg[txfiforoom_n_0_][5]\,
      DI(0) => \res_seq_reg[txfiforoom_n_0_][4]\,
      O(3) => \minusOp_carry__0_n_4\,
      O(2) => \minusOp_carry__0_n_5\,
      O(1) => \minusOp_carry__0_n_6\,
      O(0) => \minusOp_carry__0_n_7\,
      S(3) => \minusOp_carry__0_i_1_n_0\,
      S(2) => \minusOp_carry__0_i_2_n_0\,
      S(1) => \minusOp_carry__0_i_3_n_0\,
      S(0) => \minusOp_carry__0_i_4_n_0\
    );
\minusOp_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][7]\,
      O => \minusOp_carry__0_i_1_n_0\
    );
\minusOp_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][6]\,
      O => \minusOp_carry__0_i_2_n_0\
    );
\minusOp_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][5]\,
      O => \minusOp_carry__0_i_3_n_0\
    );
\minusOp_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][4]\,
      O => \minusOp_carry__0_i_4_n_0\
    );
\minusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__0_n_0\,
      CO(3) => \minusOp_carry__1_n_0\,
      CO(2) => \minusOp_carry__1_n_1\,
      CO(1) => \minusOp_carry__1_n_2\,
      CO(0) => \minusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \res_seq_reg[txfiforoom_n_0_][11]\,
      DI(2) => \res_seq_reg[txfiforoom_n_0_][10]\,
      DI(1) => \res_seq_reg[txfiforoom_n_0_][9]\,
      DI(0) => \res_seq_reg[txfiforoom_n_0_][8]\,
      O(3) => \minusOp_carry__1_n_4\,
      O(2) => \minusOp_carry__1_n_5\,
      O(1) => \minusOp_carry__1_n_6\,
      O(0) => \minusOp_carry__1_n_7\,
      S(3) => \minusOp_carry__1_i_1_n_0\,
      S(2) => \minusOp_carry__1_i_2_n_0\,
      S(1) => \minusOp_carry__1_i_3_n_0\,
      S(0) => \minusOp_carry__1_i_4_n_0\
    );
\minusOp_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][11]\,
      O => \minusOp_carry__1_i_1_n_0\
    );
\minusOp_carry__1_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][10]\,
      O => \minusOp_carry__1_i_2_n_0\
    );
\minusOp_carry__1_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][9]\,
      O => \minusOp_carry__1_i_3_n_0\
    );
\minusOp_carry__1_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][8]\,
      O => \minusOp_carry__1_i_4_n_0\
    );
\minusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_carry__1_n_0\,
      CO(3 downto 0) => \NLW_minusOp_carry__2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_minusOp_carry__2_O_UNCONNECTED\(3 downto 1),
      O(0) => \minusOp_carry__2_n_7\,
      S(3 downto 1) => B"000",
      S(0) => \minusOp_carry__2_i_1_n_0\
    );
\minusOp_carry__2_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][12]\,
      O => \minusOp_carry__2_i_1_n_0\
    );
minusOp_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][3]\,
      O => minusOp_carry_i_1_n_0
    );
minusOp_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][2]\,
      O => minusOp_carry_i_2_n_0
    );
minusOp_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][1]\,
      O => minusOp_carry_i_3_n_0
    );
minusOp_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][0]\,
      I1 => \^res_seq_reg[txfull]__0\,
      O => minusOp_carry_i_4_n_0
    );
\minusOp_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \minusOp_inferred__0/i__carry_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry_n_3\,
      CYINIT => '1',
      DI(3) => \res_seq_reg[rxfiforoom_n_0_][3]\,
      DI(2) => \res_seq_reg[rxfiforoom_n_0_][2]\,
      DI(1) => \res_seq_reg[rxfiforoom_n_0_][1]\,
      DI(0) => \res_seq_reg[rxfiforoom_n_0_][0]\,
      O(3 downto 0) => \vres[rxfiforoom]\(3 downto 0),
      S(3) => \i__carry_i_1__0_n_0\,
      S(2) => \i__carry_i_2_n_0\,
      S(1) => \i__carry_i_3_n_0\,
      S(0) => \i__carry_i_4_n_0\
    );
\minusOp_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__0_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__0_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__0_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \res_seq_reg[rxfiforoom_n_0_][7]\,
      DI(2) => \res_seq_reg[rxfiforoom_n_0_][6]\,
      DI(1) => \res_seq_reg[rxfiforoom_n_0_][5]\,
      DI(0) => \res_seq_reg[rxfiforoom_n_0_][4]\,
      O(3 downto 0) => \vres[rxfiforoom]\(7 downto 4),
      S(3) => \i__carry__0_i_1_n_0\,
      S(2) => \i__carry__0_i_2_n_0\,
      S(1) => \i__carry__0_i_3_n_0\,
      S(0) => \i__carry__0_i_4_n_0\
    );
\minusOp_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__0_n_0\,
      CO(3) => \minusOp_inferred__0/i__carry__1_n_0\,
      CO(2) => \minusOp_inferred__0/i__carry__1_n_1\,
      CO(1) => \minusOp_inferred__0/i__carry__1_n_2\,
      CO(0) => \minusOp_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3) => \res_seq_reg[rxfiforoom_n_0_][11]\,
      DI(2) => \res_seq_reg[rxfiforoom_n_0_][10]\,
      DI(1) => \res_seq_reg[rxfiforoom_n_0_][9]\,
      DI(0) => \res_seq_reg[rxfiforoom_n_0_][8]\,
      O(3 downto 0) => \vres[rxfiforoom]\(11 downto 8),
      S(3) => \i__carry__1_i_1_n_0\,
      S(2) => \i__carry__1_i_2_n_0\,
      S(1) => \i__carry__1_i_3_n_0\,
      S(0) => \i__carry__1_i_4_n_0\
    );
\minusOp_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \minusOp_inferred__0/i__carry__1_n_0\,
      CO(3 downto 0) => \NLW_minusOp_inferred__0/i__carry__2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_minusOp_inferred__0/i__carry__2_O_UNCONNECTED\(3 downto 1),
      O(0) => \vres[rxfiforoom]\(12),
      S(3 downto 1) => B"000",
      S(0) => \i__carry__2_i_1_n_0\
    );
\out_fifo[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^rxvalid\,
      I1 => axi_streamout_tready,
      O => \res_seq_reg[rxfifo_rvalid]_1\
    );
\out_fifo[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => axi_streamout_tready,
      I1 => \^rxvalid\,
      O => out_fifo0
    );
\out_fifo[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08FF"
    )
        port map (
      I0 => \^rxvalid\,
      I1 => axi_streamout_tready,
      I2 => \escape_fifo_reg[0]\,
      I3 => axi_streamout_aresetn,
      O => \res_seq_reg[rxfifo_rvalid]_0\
    );
\res_seq[rxfifo_raddr][3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_seq_reg[rxfifo_raddr]\(0),
      I1 => \^rxvalid\,
      O => \res_seq[rxfifo_raddr][3]_i_2_n_0\
    );
\res_seq[rxfiforoom][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][0]\,
      I1 => \vres[rxfiforoom]\(0),
      I2 => WEN,
      I3 => SPW_RXREAD,
      I4 => \vres[rxfiforoom]0_in\(0),
      O => \res_seq[rxfiforoom][0]_i_1_n_0\
    );
\res_seq[rxfiforoom][11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][11]\,
      I1 => \vres[rxfiforoom]\(11),
      I2 => WEN,
      I3 => SPW_RXREAD,
      I4 => \vres[rxfiforoom]0_in\(11),
      O => \res_seq[rxfiforoom][11]_i_1_n_0\
    );
\res_seq[rxfiforoom][12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][12]\,
      I1 => \vres[rxfiforoom]\(12),
      I2 => WEN,
      I3 => SPW_RXREAD,
      I4 => \vres[rxfiforoom]0_in\(12),
      O => \res_seq_reg[rxfifo_rvalid]1\
    );
\res_seq[rxfiforoom][1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][1]\,
      I1 => \vres[rxfiforoom]\(1),
      I2 => WEN,
      I3 => SPW_RXREAD,
      I4 => \vres[rxfiforoom]0_in\(1),
      O => \res_seq[rxfiforoom][1]_i_1_n_0\
    );
\res_seq[rxfiforoom][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][3]\,
      I1 => \vres[rxfiforoom]\(3),
      I2 => WEN,
      I3 => SPW_RXREAD,
      I4 => \vres[rxfiforoom]0_in\(3),
      O => \res_seq[rxfiforoom][3]_i_1_n_0\
    );
\res_seq[rxfiforoom][3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][0]\,
      I1 => \^rxvalid\,
      O => \res_seq[rxfiforoom][3]_i_3_n_0\
    );
\res_seq[rxfiforoom][5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][5]\,
      I1 => \vres[rxfiforoom]\(5),
      I2 => WEN,
      I3 => SPW_RXREAD,
      I4 => \vres[rxfiforoom]0_in\(5),
      O => \res_seq[rxfiforoom][5]_i_1_n_0\
    );
\res_seq[rxfiforoom][6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][6]\,
      I1 => \vres[rxfiforoom]\(6),
      I2 => WEN,
      I3 => SPW_RXREAD,
      I4 => \vres[rxfiforoom]0_in\(6),
      O => \res_seq[rxfiforoom][6]_i_1_n_0\
    );
\res_seq[rxfiforoom][7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFCAA0CA"
    )
        port map (
      I0 => \res_seq_reg[rxfiforoom_n_0_][7]\,
      I1 => \vres[rxfiforoom]\(7),
      I2 => WEN,
      I3 => SPW_RXREAD,
      I4 => \vres[rxfiforoom]0_in\(7),
      O => \res_seq[rxfiforoom][7]_i_1_n_0\
    );
\res_seq[rxfull]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => \res_seq[rxfull]_i_2_n_0\,
      I1 => \res_seq[rxfiforoom][7]_i_1_n_0\,
      I2 => \res_seq_reg[rxfifo_rvalid]1\,
      I3 => RECV_INST_n_19,
      I4 => RECV_INST_n_18,
      I5 => RECV_INST_n_22,
      O => \res_com[rxfull]\
    );
\res_seq[rxfull]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => \res_seq[rxfiforoom][1]_i_1_n_0\,
      I1 => \res_seq[rxfiforoom][5]_i_1_n_0\,
      I2 => \res_seq[rxfiforoom][0]_i_1_n_0\,
      I3 => RECV_INST_n_23,
      I4 => \res_seq[rxfiforoom][3]_i_1_n_0\,
      O => \res_seq[rxfull]_i_2_n_0\
    );
\res_seq[rxroom][0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => RECV_INST_n_18,
      I1 => RECV_INST_n_19,
      I2 => \res_seq_reg[rxfifo_rvalid]1\,
      I3 => \res_seq[rxfiforoom][7]_i_1_n_0\,
      I4 => \res_seq[rxfiforoom][0]_i_1_n_0\,
      O => \res_com[rxroom]\(0)
    );
\res_seq[rxroom][1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => RECV_INST_n_18,
      I1 => RECV_INST_n_19,
      I2 => \res_seq_reg[rxfifo_rvalid]1\,
      I3 => \res_seq[rxfiforoom][7]_i_1_n_0\,
      I4 => \res_seq[rxfiforoom][1]_i_1_n_0\,
      O => \res_com[rxroom]\(1)
    );
\res_seq[rxroom][3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => RECV_INST_n_18,
      I1 => RECV_INST_n_19,
      I2 => \res_seq_reg[rxfifo_rvalid]1\,
      I3 => \res_seq[rxfiforoom][7]_i_1_n_0\,
      I4 => \res_seq[rxfiforoom][3]_i_1_n_0\,
      O => \res_com[rxroom]\(3)
    );
\res_seq[rxroom][5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => RECV_INST_n_18,
      I1 => RECV_INST_n_19,
      I2 => \res_seq_reg[rxfifo_rvalid]1\,
      I3 => \res_seq[rxfiforoom][7]_i_1_n_0\,
      I4 => \res_seq[rxfiforoom][5]_i_1_n_0\,
      O => \res_com[rxroom]\(5)
    );
\res_seq[txfiforoom][3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \res_seq_reg[txfiforoom_n_0_][0]\,
      I1 => \res_seq_reg[txfifo_rvalid]__0\,
      O => \res_seq[txfiforoom][3]_i_3_n_0\
    );
\res_seq_reg[rxeep]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxeep]3_out\,
      Q => \res_seq_reg[rxeep]__0\
    );
\res_seq_reg[rxemptydiscard]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[rxemptydiscard]\,
      Q => \res_seq_reg[rxemptydiscard_n_0_]\
    );
\res_seq_reg[rxfifo_raddr][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(0),
      Q => \res_seq_reg[rxfifo_raddr]\(0)
    );
\res_seq_reg[rxfifo_raddr][10]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(10),
      Q => \res_seq_reg[rxfifo_raddr]\(10)
    );
\res_seq_reg[rxfifo_raddr][11]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(11),
      Q => \res_seq_reg[rxfifo_raddr]\(11)
    );
\res_seq_reg[rxfifo_raddr][11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \res_seq_reg[rxfifo_raddr][7]_i_1_n_0\,
      CO(3) => \NLW_res_seq_reg[rxfifo_raddr][11]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \res_seq_reg[rxfifo_raddr][11]_i_1_n_1\,
      CO(1) => \res_seq_reg[rxfifo_raddr][11]_i_1_n_2\,
      CO(0) => \res_seq_reg[rxfifo_raddr][11]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \vres[rxfifo_raddr]\(11 downto 8),
      S(3 downto 0) => \res_seq_reg[rxfifo_raddr]\(11 downto 8)
    );
\res_seq_reg[rxfifo_raddr][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(1),
      Q => \res_seq_reg[rxfifo_raddr]\(1)
    );
\res_seq_reg[rxfifo_raddr][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(2),
      Q => \res_seq_reg[rxfifo_raddr]\(2)
    );
\res_seq_reg[rxfifo_raddr][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(3),
      Q => \res_seq_reg[rxfifo_raddr]\(3)
    );
\res_seq_reg[rxfifo_raddr][3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \res_seq_reg[rxfifo_raddr][3]_i_1_n_0\,
      CO(2) => \res_seq_reg[rxfifo_raddr][3]_i_1_n_1\,
      CO(1) => \res_seq_reg[rxfifo_raddr][3]_i_1_n_2\,
      CO(0) => \res_seq_reg[rxfifo_raddr][3]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \res_seq_reg[rxfifo_raddr]\(0),
      O(3 downto 0) => \vres[rxfifo_raddr]\(3 downto 0),
      S(3 downto 1) => \res_seq_reg[rxfifo_raddr]\(3 downto 1),
      S(0) => \res_seq[rxfifo_raddr][3]_i_2_n_0\
    );
\res_seq_reg[rxfifo_raddr][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(4),
      Q => \res_seq_reg[rxfifo_raddr]\(4)
    );
\res_seq_reg[rxfifo_raddr][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(5),
      Q => \res_seq_reg[rxfifo_raddr]\(5)
    );
\res_seq_reg[rxfifo_raddr][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(6),
      Q => \res_seq_reg[rxfifo_raddr]\(6)
    );
\res_seq_reg[rxfifo_raddr][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(7),
      Q => \res_seq_reg[rxfifo_raddr]\(7)
    );
\res_seq_reg[rxfifo_raddr][7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \res_seq_reg[rxfifo_raddr][3]_i_1_n_0\,
      CO(3) => \res_seq_reg[rxfifo_raddr][7]_i_1_n_0\,
      CO(2) => \res_seq_reg[rxfifo_raddr][7]_i_1_n_1\,
      CO(1) => \res_seq_reg[rxfifo_raddr][7]_i_1_n_2\,
      CO(0) => \res_seq_reg[rxfifo_raddr][7]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \vres[rxfifo_raddr]\(7 downto 4),
      S(3 downto 0) => \res_seq_reg[rxfifo_raddr]\(7 downto 4)
    );
\res_seq_reg[rxfifo_raddr][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(8),
      Q => \res_seq_reg[rxfifo_raddr]\(8)
    );
\res_seq_reg[rxfifo_raddr][9]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => SPW_RXREAD,
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxfifo_raddr]\(9),
      Q => \res_seq_reg[rxfifo_raddr]\(9)
    );
\res_seq_reg[rxfifo_rvalid]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[rxfifo_rvalid]\,
      Q => \^rxvalid\
    );
\res_seq_reg[rxfifo_rvalid]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \res_seq_reg[rxfiforoom][11]_i_2_n_0\,
      CO(3 downto 0) => \NLW_res_seq_reg[rxfifo_rvalid]_i_2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_res_seq_reg[rxfifo_rvalid]_i_2_O_UNCONNECTED\(3 downto 1),
      O(0) => \vres[rxfiforoom]0_in\(12),
      S(3 downto 1) => B"000",
      S(0) => \res_seq_reg[rxfiforoom_n_0_][12]\
    );
\res_seq_reg[rxfifo_waddr][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry_n_7\,
      Q => WADDR(0)
    );
\res_seq_reg[rxfifo_waddr][10]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry__1_n_5\,
      Q => WADDR(10)
    );
\res_seq_reg[rxfifo_waddr][11]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry__1_n_4\,
      Q => WADDR(11)
    );
\res_seq_reg[rxfifo_waddr][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry_n_6\,
      Q => WADDR(1)
    );
\res_seq_reg[rxfifo_waddr][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry_n_5\,
      Q => WADDR(2)
    );
\res_seq_reg[rxfifo_waddr][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry_n_4\,
      Q => WADDR(3)
    );
\res_seq_reg[rxfifo_waddr][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry__0_n_7\,
      Q => WADDR(4)
    );
\res_seq_reg[rxfifo_waddr][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry__0_n_6\,
      Q => WADDR(5)
    );
\res_seq_reg[rxfifo_waddr][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry__0_n_5\,
      Q => WADDR(6)
    );
\res_seq_reg[rxfifo_waddr][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry__0_n_4\,
      Q => WADDR(7)
    );
\res_seq_reg[rxfifo_waddr][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry__1_n_7\,
      Q => WADDR(8)
    );
\res_seq_reg[rxfifo_waddr][9]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___45_carry__1_n_6\,
      Q => WADDR(9)
    );
\res_seq_reg[rxfiforoom][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_seq[rxfiforoom][0]_i_1_n_0\,
      Q => \res_seq_reg[rxfiforoom_n_0_][0]\
    );
\res_seq_reg[rxfiforoom][10]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => RECV_INST_n_20,
      Q => \res_seq_reg[rxfiforoom_n_0_][10]\
    );
\res_seq_reg[rxfiforoom][11]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_seq[rxfiforoom][11]_i_1_n_0\,
      Q => \res_seq_reg[rxfiforoom_n_0_][11]\
    );
\res_seq_reg[rxfiforoom][11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \res_seq_reg[rxfiforoom][7]_i_2_n_0\,
      CO(3) => \res_seq_reg[rxfiforoom][11]_i_2_n_0\,
      CO(2) => \res_seq_reg[rxfiforoom][11]_i_2_n_1\,
      CO(1) => \res_seq_reg[rxfiforoom][11]_i_2_n_2\,
      CO(0) => \res_seq_reg[rxfiforoom][11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \vres[rxfiforoom]0_in\(11 downto 8),
      S(3) => \res_seq_reg[rxfiforoom_n_0_][11]\,
      S(2) => \res_seq_reg[rxfiforoom_n_0_][10]\,
      S(1) => \res_seq_reg[rxfiforoom_n_0_][9]\,
      S(0) => \res_seq_reg[rxfiforoom_n_0_][8]\
    );
\res_seq_reg[rxfiforoom][12]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => '1',
      D => \res_seq_reg[rxfifo_rvalid]1\,
      PRE => SYSRSTLOGIC_n_1,
      Q => \res_seq_reg[rxfiforoom_n_0_][12]\
    );
\res_seq_reg[rxfiforoom][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_seq[rxfiforoom][1]_i_1_n_0\,
      Q => \res_seq_reg[rxfiforoom_n_0_][1]\
    );
\res_seq_reg[rxfiforoom][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => RECV_INST_n_23,
      Q => \res_seq_reg[rxfiforoom_n_0_][2]\
    );
\res_seq_reg[rxfiforoom][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_seq[rxfiforoom][3]_i_1_n_0\,
      Q => \res_seq_reg[rxfiforoom_n_0_][3]\
    );
\res_seq_reg[rxfiforoom][3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \res_seq_reg[rxfiforoom][3]_i_2_n_0\,
      CO(2) => \res_seq_reg[rxfiforoom][3]_i_2_n_1\,
      CO(1) => \res_seq_reg[rxfiforoom][3]_i_2_n_2\,
      CO(0) => \res_seq_reg[rxfiforoom][3]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \res_seq_reg[rxfiforoom_n_0_][0]\,
      O(3 downto 0) => \vres[rxfiforoom]0_in\(3 downto 0),
      S(3) => \res_seq_reg[rxfiforoom_n_0_][3]\,
      S(2) => \res_seq_reg[rxfiforoom_n_0_][2]\,
      S(1) => \res_seq_reg[rxfiforoom_n_0_][1]\,
      S(0) => \res_seq[rxfiforoom][3]_i_3_n_0\
    );
\res_seq_reg[rxfiforoom][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => RECV_INST_n_22,
      Q => \res_seq_reg[rxfiforoom_n_0_][4]\
    );
\res_seq_reg[rxfiforoom][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_seq[rxfiforoom][5]_i_1_n_0\,
      Q => \res_seq_reg[rxfiforoom_n_0_][5]\
    );
\res_seq_reg[rxfiforoom][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_seq[rxfiforoom][6]_i_1_n_0\,
      Q => \res_seq_reg[rxfiforoom_n_0_][6]\
    );
\res_seq_reg[rxfiforoom][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_seq[rxfiforoom][7]_i_1_n_0\,
      Q => \res_seq_reg[rxfiforoom_n_0_][7]\
    );
\res_seq_reg[rxfiforoom][7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \res_seq_reg[rxfiforoom][3]_i_2_n_0\,
      CO(3) => \res_seq_reg[rxfiforoom][7]_i_2_n_0\,
      CO(2) => \res_seq_reg[rxfiforoom][7]_i_2_n_1\,
      CO(1) => \res_seq_reg[rxfiforoom][7]_i_2_n_2\,
      CO(0) => \res_seq_reg[rxfiforoom][7]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \vres[rxfiforoom]0_in\(7 downto 4),
      S(3) => \res_seq_reg[rxfiforoom_n_0_][7]\,
      S(2) => \res_seq_reg[rxfiforoom_n_0_][6]\,
      S(1) => \res_seq_reg[rxfiforoom_n_0_][5]\,
      S(0) => \res_seq_reg[rxfiforoom_n_0_][4]\
    );
\res_seq_reg[rxfiforoom][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => RECV_INST_n_19,
      Q => \res_seq_reg[rxfiforoom_n_0_][8]\
    );
\res_seq_reg[rxfiforoom][9]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => RECV_INST_n_21,
      Q => \res_seq_reg[rxfiforoom_n_0_][9]\
    );
\res_seq_reg[rxfull]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[rxfull]\,
      Q => \res_seq_reg[rxfull]__0\
    );
\res_seq_reg[rxpacket]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[rxpacket]7_out\,
      Q => \res_seq_reg[rxpacket_n_0_]\
    );
\res_seq_reg[rxroom][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[rxroom]\(0),
      Q => \res_seq_reg[rxroom_n_0_][0]\
    );
\res_seq_reg[rxroom][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[rxroom]\(1),
      Q => \res_seq_reg[rxroom_n_0_][1]\
    );
\res_seq_reg[rxroom][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[rxroom]\(2),
      Q => \res_seq_reg[rxroom_n_0_][2]\
    );
\res_seq_reg[rxroom][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[rxroom]\(3),
      Q => \res_seq_reg[rxroom_n_0_][3]\
    );
\res_seq_reg[rxroom][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[rxroom]\(4),
      Q => \res_seq_reg[rxroom_n_0_][4]\
    );
\res_seq_reg[rxroom][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[rxroom]\(5),
      Q => \res_seq_reg[rxroom_n_0_][5]\
    );
\res_seq_reg[txdiscard]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txdiscard]\,
      Q => \res_seq_reg[txdiscard]__0\
    );
\res_seq_reg[txfifo_raddr][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry_n_7\,
      Q => \res_seq_reg[txfifo_raddr]\(0)
    );
\res_seq_reg[txfifo_raddr][10]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry__1_n_5\,
      Q => \res_seq_reg[txfifo_raddr]\(10)
    );
\res_seq_reg[txfifo_raddr][11]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry__1_n_4\,
      Q => \res_seq_reg[txfifo_raddr]\(11)
    );
\res_seq_reg[txfifo_raddr][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry_n_6\,
      Q => \res_seq_reg[txfifo_raddr]\(1)
    );
\res_seq_reg[txfifo_raddr][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry_n_5\,
      Q => \res_seq_reg[txfifo_raddr]\(2)
    );
\res_seq_reg[txfifo_raddr][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry_n_4\,
      Q => \res_seq_reg[txfifo_raddr]\(3)
    );
\res_seq_reg[txfifo_raddr][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry__0_n_7\,
      Q => \res_seq_reg[txfifo_raddr]\(4)
    );
\res_seq_reg[txfifo_raddr][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry__0_n_6\,
      Q => \res_seq_reg[txfifo_raddr]\(5)
    );
\res_seq_reg[txfifo_raddr][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry__0_n_5\,
      Q => \res_seq_reg[txfifo_raddr]\(6)
    );
\res_seq_reg[txfifo_raddr][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry__0_n_4\,
      Q => \res_seq_reg[txfifo_raddr]\(7)
    );
\res_seq_reg[txfifo_raddr][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry__1_n_7\,
      Q => \res_seq_reg[txfifo_raddr]\(8)
    );
\res_seq_reg[txfifo_raddr][9]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => \^sel\,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i__carry__1_n_6\,
      Q => \res_seq_reg[txfifo_raddr]\(9)
    );
\res_seq_reg[txfifo_rvalid]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[txfifo_rvalid]\,
      Q => \res_seq_reg[txfifo_rvalid]__0\
    );
\res_seq_reg[txfifo_rvalid]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \res_seq_reg[txfiforoom][11]_i_2_n_0\,
      CO(3 downto 0) => \NLW_res_seq_reg[txfifo_rvalid]_i_2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_res_seq_reg[txfifo_rvalid]_i_2_O_UNCONNECTED\(3 downto 1),
      O(0) => \vres[txfiforoom]0_in\(12),
      S(3 downto 1) => B"000",
      S(0) => \res_seq_reg[txfiforoom_n_0_][12]\
    );
\res_seq_reg[txfifo_waddr][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry_n_7\,
      Q => \res_seq_reg[txfifo_waddr]\(0)
    );
\res_seq_reg[txfifo_waddr][10]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry__1_n_5\,
      Q => \res_seq_reg[txfifo_waddr]\(10)
    );
\res_seq_reg[txfifo_waddr][11]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry__1_n_4\,
      Q => \res_seq_reg[txfifo_waddr]\(11)
    );
\res_seq_reg[txfifo_waddr][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry_n_6\,
      Q => \res_seq_reg[txfifo_waddr]\(1)
    );
\res_seq_reg[txfifo_waddr][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry_n_5\,
      Q => \res_seq_reg[txfifo_waddr]\(2)
    );
\res_seq_reg[txfifo_waddr][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry_n_4\,
      Q => \res_seq_reg[txfifo_waddr]\(3)
    );
\res_seq_reg[txfifo_waddr][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry__0_n_7\,
      Q => \res_seq_reg[txfifo_waddr]\(4)
    );
\res_seq_reg[txfifo_waddr][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry__0_n_6\,
      Q => \res_seq_reg[txfifo_waddr]\(5)
    );
\res_seq_reg[txfifo_waddr][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry__0_n_5\,
      Q => \res_seq_reg[txfifo_waddr]\(6)
    );
\res_seq_reg[txfifo_waddr][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry__0_n_4\,
      Q => \res_seq_reg[txfifo_waddr]\(7)
    );
\res_seq_reg[txfifo_waddr][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry__1_n_7\,
      Q => \res_seq_reg[txfifo_waddr]\(8)
    );
\res_seq_reg[txfifo_waddr][9]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => WEN10_out,
      CLR => SYSRSTLOGIC_n_1,
      D => \i_/i_/i___22_carry__1_n_6\,
      Q => \res_seq_reg[txfifo_waddr]\(9)
    );
\res_seq_reg[txfiforoom][0]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(0),
      Q => \res_seq_reg[txfiforoom_n_0_][0]\
    );
\res_seq_reg[txfiforoom][10]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(10),
      Q => \res_seq_reg[txfiforoom_n_0_][10]\
    );
\res_seq_reg[txfiforoom][11]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(11),
      Q => \res_seq_reg[txfiforoom_n_0_][11]\
    );
\res_seq_reg[txfiforoom][11]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \res_seq_reg[txfiforoom][7]_i_2_n_0\,
      CO(3) => \res_seq_reg[txfiforoom][11]_i_2_n_0\,
      CO(2) => \res_seq_reg[txfiforoom][11]_i_2_n_1\,
      CO(1) => \res_seq_reg[txfiforoom][11]_i_2_n_2\,
      CO(0) => \res_seq_reg[txfiforoom][11]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \vres[txfiforoom]0_in\(11 downto 8),
      S(3) => \res_seq_reg[txfiforoom_n_0_][11]\,
      S(2) => \res_seq_reg[txfiforoom_n_0_][10]\,
      S(1) => \res_seq_reg[txfiforoom_n_0_][9]\,
      S(0) => \res_seq_reg[txfiforoom_n_0_][8]\
    );
\res_seq_reg[txfiforoom][12]\: unisim.vcomponents.FDPE
     port map (
      C => SPW_main_clk,
      CE => '1',
      D => \vres[txfiforoom]\(12),
      PRE => SYSRSTLOGIC_n_1,
      Q => \res_seq_reg[txfiforoom_n_0_][12]\
    );
\res_seq_reg[txfiforoom][1]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(1),
      Q => \res_seq_reg[txfiforoom_n_0_][1]\
    );
\res_seq_reg[txfiforoom][2]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(2),
      Q => \res_seq_reg[txfiforoom_n_0_][2]\
    );
\res_seq_reg[txfiforoom][3]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(3),
      Q => \res_seq_reg[txfiforoom_n_0_][3]\
    );
\res_seq_reg[txfiforoom][3]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \res_seq_reg[txfiforoom][3]_i_2_n_0\,
      CO(2) => \res_seq_reg[txfiforoom][3]_i_2_n_1\,
      CO(1) => \res_seq_reg[txfiforoom][3]_i_2_n_2\,
      CO(0) => \res_seq_reg[txfiforoom][3]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \res_seq_reg[txfiforoom_n_0_][0]\,
      O(3 downto 0) => \vres[txfiforoom]0_in\(3 downto 0),
      S(3) => \res_seq_reg[txfiforoom_n_0_][3]\,
      S(2) => \res_seq_reg[txfiforoom_n_0_][2]\,
      S(1) => \res_seq_reg[txfiforoom_n_0_][1]\,
      S(0) => \res_seq[txfiforoom][3]_i_3_n_0\
    );
\res_seq_reg[txfiforoom][4]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(4),
      Q => \res_seq_reg[txfiforoom_n_0_][4]\
    );
\res_seq_reg[txfiforoom][5]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(5),
      Q => \res_seq_reg[txfiforoom_n_0_][5]\
    );
\res_seq_reg[txfiforoom][6]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(6),
      Q => \res_seq_reg[txfiforoom_n_0_][6]\
    );
\res_seq_reg[txfiforoom][7]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(7),
      Q => \res_seq_reg[txfiforoom_n_0_][7]\
    );
\res_seq_reg[txfiforoom][7]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \res_seq_reg[txfiforoom][3]_i_2_n_0\,
      CO(3) => \res_seq_reg[txfiforoom][7]_i_2_n_0\,
      CO(2) => \res_seq_reg[txfiforoom][7]_i_2_n_1\,
      CO(1) => \res_seq_reg[txfiforoom][7]_i_2_n_2\,
      CO(0) => \res_seq_reg[txfiforoom][7]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \vres[txfiforoom]0_in\(7 downto 4),
      S(3) => \res_seq_reg[txfiforoom_n_0_][7]\,
      S(2) => \res_seq_reg[txfiforoom_n_0_][6]\,
      S(1) => \res_seq_reg[txfiforoom_n_0_][5]\,
      S(0) => \res_seq_reg[txfiforoom_n_0_][4]\
    );
\res_seq_reg[txfiforoom][8]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(8),
      Q => \res_seq_reg[txfiforoom_n_0_][8]\
    );
\res_seq_reg[txfiforoom][9]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txfiforoom]\(9),
      Q => \res_seq_reg[txfiforoom_n_0_][9]\
    );
\res_seq_reg[txfull]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \res_com[txfull]\,
      Q => \^res_seq_reg[txfull]__0\
    );
\res_seq_reg[txpacket]\: unisim.vcomponents.FDCE
     port map (
      C => SPW_main_clk,
      CE => '1',
      CLR => SYSRSTLOGIC_n_1,
      D => \vres[txpacket]5_out\,
      Q => \res_seq_reg[txpacket_n_0_]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI is
  port (
    axi_awready_reg : out STD_LOGIC;
    axi_arready_reg : out STD_LOGIC;
    axi_rvalid_reg : out STD_LOGIC;
    SPW_Dout : out STD_LOGIC;
    SPW_Sout : out STD_LOGIC;
    axi_streamout_tvalid : out STD_LOGIC;
    axi_streamout_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_register_bvalid : out STD_LOGIC;
    axi_streamin_tready : out STD_LOGIC;
    axi_streamout_tlast : out STD_LOGIC;
    axi_register_wready : out STD_LOGIC;
    axi_streamin_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_streamin_aresetn : in STD_LOGIC;
    SPW_Din : in STD_LOGIC;
    SPW_Sin : in STD_LOGIC;
    axi_streamin_tvalid : in STD_LOGIC;
    axi_streamout_tready : in STD_LOGIC;
    axi_streamout_aresetn : in STD_LOGIC;
    axi_register_wvalid : in STD_LOGIC;
    axi_register_awvalid : in STD_LOGIC;
    axi_register_aclk : in STD_LOGIC;
    axi_register_arvalid : in STD_LOGIC;
    axi_register_rready : in STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    SPW_TX_clk : in STD_LOGIC;
    axi_streamin_aclk : in STD_LOGIC;
    axi_streamout_aclk : in STD_LOGIC;
    axi_register_bready : in STD_LOGIC;
    SPW_rst : in STD_LOGIC;
    axi_register_aresetn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI is
  signal RXDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal RXFLAG : STD_LOGIC;
  signal RXVALID : STD_LOGIC;
  signal SPW_IF_n_14 : STD_LOGIC;
  signal SPW_IF_n_15 : STD_LOGIC;
  signal SPW_RXREAD : STD_LOGIC;
  signal SPW_TXFIFO : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal SPW_TXFLAG : STD_LOGIC;
  signal SPW_TXWRITE : STD_LOGIC;
  signal SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut_inst_n_2 : STD_LOGIC;
  signal SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn_inst_n_10 : STD_LOGIC;
  signal WEN10_out : STD_LOGIC;
  signal out_fifo : STD_LOGIC_VECTOR ( 6 to 6 );
  signal out_fifo0 : STD_LOGIC;
  signal \res_seq_reg[txfull]__0\ : STD_LOGIC;
  signal sel : STD_LOGIC;
begin
SPW_IF: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpwStream
     port map (
      E(0) => out_fifo(6),
      RDATA(8) => RXFLAG,
      RDATA(7 downto 0) => RXDATA(7 downto 0),
      RXVALID => RXVALID,
      SPW_Din => SPW_Din,
      SPW_Dout => SPW_Dout,
      SPW_RXREAD => SPW_RXREAD,
      SPW_Sin => SPW_Sin,
      SPW_Sout => SPW_Sout,
      SPW_TXWRITE => SPW_TXWRITE,
      SPW_TX_clk => SPW_TX_clk,
      SPW_main_clk => SPW_main_clk,
      SPW_rst => SPW_rst,
      WDATA(8) => SPW_TXFLAG,
      WDATA(7 downto 0) => SPW_TXFIFO(7 downto 0),
      WEN10_out => WEN10_out,
      axi_streamout_aresetn => axi_streamout_aresetn,
      axi_streamout_tlast => axi_streamout_tlast,
      axi_streamout_tready => axi_streamout_tready,
      \escape_fifo_reg[0]\ => SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut_inst_n_2,
      out_fifo0 => out_fifo0,
      \res_seq_reg[rxfifo_rvalid]_0\ => SPW_IF_n_14,
      \res_seq_reg[rxfifo_rvalid]_1\ => SPW_IF_n_15,
      \res_seq_reg[txdiscard]_0\ => SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn_inst_n_10,
      \res_seq_reg[txfull]__0\ => \res_seq_reg[txfull]__0\,
      sel => sel
    );
SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut
     port map (
      E(0) => out_fifo(6),
      RDATA(8) => RXFLAG,
      RDATA(7 downto 0) => RXDATA(7 downto 0),
      RXVALID => RXVALID,
      SPW_RXREAD => SPW_RXREAD,
      SPW_main_clk => SPW_main_clk,
      axi_streamout_aclk => axi_streamout_aclk,
      axi_streamout_aresetn => axi_streamout_aresetn,
      axi_streamout_tdata(7 downto 0) => axi_streamout_tdata(7 downto 0),
      axi_streamout_tready => axi_streamout_tready,
      axi_streamout_tvalid => axi_streamout_tvalid,
      out_fifo0 => out_fifo0,
      \out_fifo_reg[6]_0\ => SPW_IF_n_15,
      \out_fifo_reg[7]_0\ => SPW_IF_n_14,
      rxflag_ff_reg_0 => SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut_inst_n_2
    );
SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register
     port map (
      axi_arready_reg_0 => axi_arready_reg,
      axi_awready_reg_0 => axi_awready_reg,
      axi_register_aclk => axi_register_aclk,
      axi_register_aresetn => axi_register_aresetn,
      axi_register_arvalid => axi_register_arvalid,
      axi_register_awvalid => axi_register_awvalid,
      axi_register_bready => axi_register_bready,
      axi_register_bvalid => axi_register_bvalid,
      axi_register_rready => axi_register_rready,
      axi_register_wready => axi_register_wready,
      axi_register_wvalid => axi_register_wvalid,
      axi_rvalid_reg_0 => axi_rvalid_reg
    );
SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn
     port map (
      SPW_TXWRITE => SPW_TXWRITE,
      SPW_main_clk => SPW_main_clk,
      WDATA(8) => SPW_TXFLAG,
      WDATA(7 downto 0) => SPW_TXFIFO(7 downto 0),
      WEN10_out => WEN10_out,
      axi_streamin_aclk => axi_streamin_aclk,
      axi_streamin_aresetn => axi_streamin_aresetn,
      axi_streamin_tdata(7 downto 0) => axi_streamin_tdata(7 downto 0),
      axi_streamin_tready => axi_streamin_tready,
      axi_streamin_tvalid => axi_streamin_tvalid,
      fifo_full_clear_reg_0 => SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn_inst_n_10,
      \res_seq_reg[txfull]__0\ => \res_seq_reg[txfull]__0\,
      sel => sel
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    IRQ : out STD_LOGIC;
    SPW_Dout : out STD_LOGIC;
    SPW_Sout : out STD_LOGIC;
    SPW_Din : in STD_LOGIC;
    SPW_Sin : in STD_LOGIC;
    SPW_TX_clk : in STD_LOGIC;
    SPW_main_clk : in STD_LOGIC;
    SPW_rst : in STD_LOGIC;
    axi_register_aclk : in STD_LOGIC;
    axi_register_aresetn : in STD_LOGIC;
    axi_register_awaddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_register_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_register_awvalid : in STD_LOGIC;
    axi_register_awready : out STD_LOGIC;
    axi_register_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_register_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_register_wvalid : in STD_LOGIC;
    axi_register_wready : out STD_LOGIC;
    axi_register_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_register_bvalid : out STD_LOGIC;
    axi_register_bready : in STD_LOGIC;
    axi_register_araddr : in STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_register_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_register_arvalid : in STD_LOGIC;
    axi_register_arready : out STD_LOGIC;
    axi_register_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_register_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_register_rvalid : out STD_LOGIC;
    axi_register_rready : in STD_LOGIC;
    axi_streamin_aclk : in STD_LOGIC;
    axi_streamin_aresetn : in STD_LOGIC;
    axi_streamin_tready : out STD_LOGIC;
    axi_streamin_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_streamin_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    axi_streamin_tlast : in STD_LOGIC;
    axi_streamin_tvalid : in STD_LOGIC;
    axi_streamout_aclk : in STD_LOGIC;
    axi_streamout_aresetn : in STD_LOGIC;
    axi_streamout_tvalid : out STD_LOGIC;
    axi_streamout_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_streamout_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    axi_streamout_tlast : out STD_LOGIC;
    axi_streamout_tready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "Test_Implementaiton_SpaceWire_light_AXI_0_2,SpaceWire_light_AXI,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "SpaceWire_light_AXI,Vivado 2024.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \<const0>\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of IRQ : signal is "xilinx.com:signal:interrupt:1.0 IRQ INTERRUPT";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of IRQ : signal is "XIL_INTERFACENAME IRQ, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute x_interface_info of SPW_TX_clk : signal is "xilinx.com:signal:clock:1.0 SPW_TX_clk CLK";
  attribute x_interface_parameter of SPW_TX_clk : signal is "XIL_INTERFACENAME SPW_TX_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of SPW_main_clk : signal is "xilinx.com:signal:clock:1.0 SPW_main_clk CLK";
  attribute x_interface_parameter of SPW_main_clk : signal is "XIL_INTERFACENAME SPW_main_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of SPW_rst : signal is "xilinx.com:signal:reset:1.0 SPW_rst RST";
  attribute x_interface_parameter of SPW_rst : signal is "XIL_INTERFACENAME SPW_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of axi_register_aclk : signal is "xilinx.com:signal:clock:1.0 AXI_Register_CLK CLK";
  attribute x_interface_parameter of axi_register_aclk : signal is "XIL_INTERFACENAME AXI_Register_CLK, ASSOCIATED_BUSIF AXI_Register, ASSOCIATED_RESET axi_register_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of axi_register_aresetn : signal is "xilinx.com:signal:reset:1.0 AXI_Register_RST RST";
  attribute x_interface_parameter of axi_register_aresetn : signal is "XIL_INTERFACENAME AXI_Register_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of axi_register_arready : signal is "xilinx.com:interface:aximm:1.0 AXI_Register ARREADY";
  attribute x_interface_info of axi_register_arvalid : signal is "xilinx.com:interface:aximm:1.0 AXI_Register ARVALID";
  attribute x_interface_info of axi_register_awready : signal is "xilinx.com:interface:aximm:1.0 AXI_Register AWREADY";
  attribute x_interface_info of axi_register_awvalid : signal is "xilinx.com:interface:aximm:1.0 AXI_Register AWVALID";
  attribute x_interface_info of axi_register_bready : signal is "xilinx.com:interface:aximm:1.0 AXI_Register BREADY";
  attribute x_interface_info of axi_register_bvalid : signal is "xilinx.com:interface:aximm:1.0 AXI_Register BVALID";
  attribute x_interface_info of axi_register_rready : signal is "xilinx.com:interface:aximm:1.0 AXI_Register RREADY";
  attribute x_interface_info of axi_register_rvalid : signal is "xilinx.com:interface:aximm:1.0 AXI_Register RVALID";
  attribute x_interface_info of axi_register_wready : signal is "xilinx.com:interface:aximm:1.0 AXI_Register WREADY";
  attribute x_interface_info of axi_register_wvalid : signal is "xilinx.com:interface:aximm:1.0 AXI_Register WVALID";
  attribute x_interface_info of axi_streamin_aclk : signal is "xilinx.com:signal:clock:1.0 AXI_StreamIn_CLK CLK";
  attribute x_interface_parameter of axi_streamin_aclk : signal is "XIL_INTERFACENAME AXI_StreamIn_CLK, ASSOCIATED_BUSIF AXI_StreamIn, ASSOCIATED_RESET axi_streamin_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of axi_streamin_aresetn : signal is "xilinx.com:signal:reset:1.0 AXI_StreamIn_RST RST";
  attribute x_interface_parameter of axi_streamin_aresetn : signal is "XIL_INTERFACENAME AXI_StreamIn_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of axi_streamin_tlast : signal is "xilinx.com:interface:axis:1.0 AXI_StreamIn TLAST";
  attribute x_interface_info of axi_streamin_tready : signal is "xilinx.com:interface:axis:1.0 AXI_StreamIn TREADY";
  attribute x_interface_parameter of axi_streamin_tready : signal is "XIL_INTERFACENAME AXI_StreamIn, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute x_interface_info of axi_streamin_tvalid : signal is "xilinx.com:interface:axis:1.0 AXI_StreamIn TVALID";
  attribute x_interface_info of axi_streamout_aclk : signal is "xilinx.com:signal:clock:1.0 AXI_StreamOut_CLK CLK";
  attribute x_interface_parameter of axi_streamout_aclk : signal is "XIL_INTERFACENAME AXI_StreamOut_CLK, ASSOCIATED_BUSIF AXI_StreamOut, ASSOCIATED_RESET axi_streamout_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of axi_streamout_aresetn : signal is "xilinx.com:signal:reset:1.0 AXI_StreamOut_RST RST";
  attribute x_interface_parameter of axi_streamout_aresetn : signal is "XIL_INTERFACENAME AXI_StreamOut_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of axi_streamout_tlast : signal is "xilinx.com:interface:axis:1.0 AXI_StreamOut TLAST";
  attribute x_interface_info of axi_streamout_tready : signal is "xilinx.com:interface:axis:1.0 AXI_StreamOut TREADY";
  attribute x_interface_info of axi_streamout_tvalid : signal is "xilinx.com:interface:axis:1.0 AXI_StreamOut TVALID";
  attribute x_interface_parameter of axi_streamout_tvalid : signal is "XIL_INTERFACENAME AXI_StreamOut, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute x_interface_info of axi_register_araddr : signal is "xilinx.com:interface:aximm:1.0 AXI_Register ARADDR";
  attribute x_interface_info of axi_register_arprot : signal is "xilinx.com:interface:aximm:1.0 AXI_Register ARPROT";
  attribute x_interface_info of axi_register_awaddr : signal is "xilinx.com:interface:aximm:1.0 AXI_Register AWADDR";
  attribute x_interface_parameter of axi_register_awaddr : signal is "XIL_INTERFACENAME AXI_Register, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 8, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of axi_register_awprot : signal is "xilinx.com:interface:aximm:1.0 AXI_Register AWPROT";
  attribute x_interface_info of axi_register_bresp : signal is "xilinx.com:interface:aximm:1.0 AXI_Register BRESP";
  attribute x_interface_info of axi_register_rdata : signal is "xilinx.com:interface:aximm:1.0 AXI_Register RDATA";
  attribute x_interface_info of axi_register_rresp : signal is "xilinx.com:interface:aximm:1.0 AXI_Register RRESP";
  attribute x_interface_info of axi_register_wdata : signal is "xilinx.com:interface:aximm:1.0 AXI_Register WDATA";
  attribute x_interface_info of axi_register_wstrb : signal is "xilinx.com:interface:aximm:1.0 AXI_Register WSTRB";
  attribute x_interface_info of axi_streamin_tdata : signal is "xilinx.com:interface:axis:1.0 AXI_StreamIn TDATA";
  attribute x_interface_info of axi_streamin_tstrb : signal is "xilinx.com:interface:axis:1.0 AXI_StreamIn TSTRB";
  attribute x_interface_info of axi_streamout_tdata : signal is "xilinx.com:interface:axis:1.0 AXI_StreamOut TDATA";
  attribute x_interface_info of axi_streamout_tstrb : signal is "xilinx.com:interface:axis:1.0 AXI_StreamOut TSTRB";
begin
  IRQ <= \<const0>\;
  axi_register_bresp(1) <= \<const0>\;
  axi_register_bresp(0) <= \<const0>\;
  axi_register_rdata(31) <= \<const0>\;
  axi_register_rdata(30) <= \<const0>\;
  axi_register_rdata(29) <= \<const0>\;
  axi_register_rdata(28) <= \<const0>\;
  axi_register_rdata(27) <= \<const0>\;
  axi_register_rdata(26) <= \<const0>\;
  axi_register_rdata(25) <= \<const0>\;
  axi_register_rdata(24) <= \<const0>\;
  axi_register_rdata(23) <= \<const0>\;
  axi_register_rdata(22) <= \<const0>\;
  axi_register_rdata(21) <= \<const0>\;
  axi_register_rdata(20) <= \<const0>\;
  axi_register_rdata(19) <= \<const0>\;
  axi_register_rdata(18) <= \<const0>\;
  axi_register_rdata(17) <= \<const0>\;
  axi_register_rdata(16) <= \<const0>\;
  axi_register_rdata(15) <= \<const0>\;
  axi_register_rdata(14) <= \<const0>\;
  axi_register_rdata(13) <= \<const0>\;
  axi_register_rdata(12) <= \<const0>\;
  axi_register_rdata(11) <= \<const0>\;
  axi_register_rdata(10) <= \<const0>\;
  axi_register_rdata(9) <= \<const0>\;
  axi_register_rdata(8) <= \<const0>\;
  axi_register_rdata(7) <= \<const0>\;
  axi_register_rdata(6) <= \<const0>\;
  axi_register_rdata(5) <= \<const0>\;
  axi_register_rdata(4) <= \<const0>\;
  axi_register_rdata(3) <= \<const0>\;
  axi_register_rdata(2) <= \<const0>\;
  axi_register_rdata(1) <= \<const0>\;
  axi_register_rdata(0) <= \<const0>\;
  axi_register_rresp(1) <= \<const0>\;
  axi_register_rresp(0) <= \<const0>\;
  axi_streamout_tstrb(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_SpaceWire_light_AXI
     port map (
      SPW_Din => SPW_Din,
      SPW_Dout => SPW_Dout,
      SPW_Sin => SPW_Sin,
      SPW_Sout => SPW_Sout,
      SPW_TX_clk => SPW_TX_clk,
      SPW_main_clk => SPW_main_clk,
      SPW_rst => SPW_rst,
      axi_arready_reg => axi_register_arready,
      axi_awready_reg => axi_register_awready,
      axi_register_aclk => axi_register_aclk,
      axi_register_aresetn => axi_register_aresetn,
      axi_register_arvalid => axi_register_arvalid,
      axi_register_awvalid => axi_register_awvalid,
      axi_register_bready => axi_register_bready,
      axi_register_bvalid => axi_register_bvalid,
      axi_register_rready => axi_register_rready,
      axi_register_wready => axi_register_wready,
      axi_register_wvalid => axi_register_wvalid,
      axi_rvalid_reg => axi_register_rvalid,
      axi_streamin_aclk => axi_streamin_aclk,
      axi_streamin_aresetn => axi_streamin_aresetn,
      axi_streamin_tdata(7 downto 0) => axi_streamin_tdata(7 downto 0),
      axi_streamin_tready => axi_streamin_tready,
      axi_streamin_tvalid => axi_streamin_tvalid,
      axi_streamout_aclk => axi_streamout_aclk,
      axi_streamout_aresetn => axi_streamout_aresetn,
      axi_streamout_tdata(7 downto 0) => axi_streamout_tdata(7 downto 0),
      axi_streamout_tlast => axi_streamout_tlast,
      axi_streamout_tready => axi_streamout_tready,
      axi_streamout_tvalid => axi_streamout_tvalid
    );
end STRUCTURE;
