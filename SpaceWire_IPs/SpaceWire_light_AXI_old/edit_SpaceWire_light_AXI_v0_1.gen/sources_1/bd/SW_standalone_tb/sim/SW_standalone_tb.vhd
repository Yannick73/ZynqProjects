--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Sun Aug 18 23:06:19 2024
--Host        : DESKTOP-MEH5DGT running 64-bit major release  (build 9200)
--Command     : generate_target SW_standalone_tb.bd
--Design      : SW_standalone_tb
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SW_standalone_tb is
  port (
    reset_rtl : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of SW_standalone_tb : entity is "SW_standalone_tb,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=SW_standalone_tb,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_board_cnt=2,da_clkrst_cnt=3,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of SW_standalone_tb : entity is "SW_standalone_tb.hwdef";
end SW_standalone_tb;

architecture STRUCTURE of SW_standalone_tb is
  component SW_standalone_tb_SpwStream_0_0 is
  port (
    AUTOSTART : in STD_LOGIC;
    LINKSTART : in STD_LOGIC;
    LINKDIS : in STD_LOGIC;
    TXDIVCNT : in STD_LOGIC_VECTOR ( 7 downto 0 );
    TICK_IN : in STD_LOGIC;
    CTRL_IN : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TIME_IN : in STD_LOGIC_VECTOR ( 5 downto 0 );
    TXWRITE : in STD_LOGIC;
    TXFLAG : in STD_LOGIC;
    TXDATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    RXREAD : in STD_LOGIC;
    SPW_DI : in STD_LOGIC;
    SPW_SI : in STD_LOGIC;
    CLK : in STD_LOGIC;
    TXCLK : in STD_LOGIC;
    ARST_N : in STD_LOGIC;
    CNT_RST : in STD_LOGIC;
    TXRDY : out STD_LOGIC;
    TXHALFF : out STD_LOGIC;
    TICK_OUT : out STD_LOGIC;
    CTRL_OUT : out STD_LOGIC_VECTOR ( 1 downto 0 );
    TIME_OUT : out STD_LOGIC_VECTOR ( 5 downto 0 );
    RXVALID : out STD_LOGIC;
    RXHALFF : out STD_LOGIC;
    RXFLAG : out STD_LOGIC;
    RXDATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    STARTED : out STD_LOGIC;
    CONNECTING : out STD_LOGIC;
    RUNNING : out STD_LOGIC;
    ERRDISC_CNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ERRPAR_CNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ERRESC_CNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ERRCRED_CNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    EMPTY_CNT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SPW_DO : out STD_LOGIC;
    SPW_SO : out STD_LOGIC
  );
  end component SW_standalone_tb_SpwStream_0_0;
  component SW_standalone_tb_clk_wiz_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component SW_standalone_tb_clk_wiz_0;
  signal clk_wiz_clk_out1 : STD_LOGIC;
  signal reset_rtl_1 : STD_LOGIC;
  signal sys_clock_1 : STD_LOGIC;
  signal NLW_SpwStream_0_CONNECTING_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_RUNNING_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_RXFLAG_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_RXHALFF_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_RXVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_SPW_DO_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_SPW_SO_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_STARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_TICK_OUT_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_TXHALFF_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_TXRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_SpwStream_0_CTRL_OUT_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_SpwStream_0_EMPTY_CNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_SpwStream_0_ERRCRED_CNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_SpwStream_0_ERRDISC_CNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_SpwStream_0_ERRESC_CNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_SpwStream_0_ERRPAR_CNT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_SpwStream_0_RXDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_SpwStream_0_TIME_OUT_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_clk_wiz_locked_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset_rtl : signal is "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset_rtl : signal is "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
  attribute X_INTERFACE_INFO of sys_clock : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clock : signal is "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN SW_standalone_tb_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  reset_rtl_1 <= reset_rtl;
  sys_clock_1 <= sys_clock;
SpwStream_0: component SW_standalone_tb_SpwStream_0_0
     port map (
      ARST_N => '0',
      AUTOSTART => '0',
      CLK => clk_wiz_clk_out1,
      CNT_RST => '0',
      CONNECTING => NLW_SpwStream_0_CONNECTING_UNCONNECTED,
      CTRL_IN(1 downto 0) => B"00",
      CTRL_OUT(1 downto 0) => NLW_SpwStream_0_CTRL_OUT_UNCONNECTED(1 downto 0),
      EMPTY_CNT(7 downto 0) => NLW_SpwStream_0_EMPTY_CNT_UNCONNECTED(7 downto 0),
      ERRCRED_CNT(7 downto 0) => NLW_SpwStream_0_ERRCRED_CNT_UNCONNECTED(7 downto 0),
      ERRDISC_CNT(7 downto 0) => NLW_SpwStream_0_ERRDISC_CNT_UNCONNECTED(7 downto 0),
      ERRESC_CNT(7 downto 0) => NLW_SpwStream_0_ERRESC_CNT_UNCONNECTED(7 downto 0),
      ERRPAR_CNT(7 downto 0) => NLW_SpwStream_0_ERRPAR_CNT_UNCONNECTED(7 downto 0),
      LINKDIS => '0',
      LINKSTART => '0',
      RUNNING => NLW_SpwStream_0_RUNNING_UNCONNECTED,
      RXDATA(7 downto 0) => NLW_SpwStream_0_RXDATA_UNCONNECTED(7 downto 0),
      RXFLAG => NLW_SpwStream_0_RXFLAG_UNCONNECTED,
      RXHALFF => NLW_SpwStream_0_RXHALFF_UNCONNECTED,
      RXREAD => '0',
      RXVALID => NLW_SpwStream_0_RXVALID_UNCONNECTED,
      SPW_DI => '0',
      SPW_DO => NLW_SpwStream_0_SPW_DO_UNCONNECTED,
      SPW_SI => '0',
      SPW_SO => NLW_SpwStream_0_SPW_SO_UNCONNECTED,
      STARTED => NLW_SpwStream_0_STARTED_UNCONNECTED,
      TICK_IN => '0',
      TICK_OUT => NLW_SpwStream_0_TICK_OUT_UNCONNECTED,
      TIME_IN(5 downto 0) => B"000000",
      TIME_OUT(5 downto 0) => NLW_SpwStream_0_TIME_OUT_UNCONNECTED(5 downto 0),
      TXCLK => '0',
      TXDATA(7 downto 0) => B"00000000",
      TXDIVCNT(7 downto 0) => B"00000000",
      TXFLAG => '0',
      TXHALFF => NLW_SpwStream_0_TXHALFF_UNCONNECTED,
      TXRDY => NLW_SpwStream_0_TXRDY_UNCONNECTED,
      TXWRITE => '0'
    );
clk_wiz: component SW_standalone_tb_clk_wiz_0
     port map (
      clk_in1 => sys_clock_1,
      clk_out1 => clk_wiz_clk_out1,
      locked => NLW_clk_wiz_locked_UNCONNECTED,
      reset => reset_rtl_1
    );
end STRUCTURE;
