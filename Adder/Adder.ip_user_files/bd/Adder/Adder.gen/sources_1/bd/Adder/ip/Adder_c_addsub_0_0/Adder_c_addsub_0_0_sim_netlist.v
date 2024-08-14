// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Tue Jul  2 22:43:54 2024
// Host        : yannick-AB350-Gaming-3 running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top Adder_c_addsub_0_0 -prefix
//               Adder_c_addsub_0_0_ Adder_c_addsub_0_0_sim_netlist.v
// Design      : Adder_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Adder_c_addsub_0_0,c_addsub_v12_0_18,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_18,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module Adder_c_addsub_0_0
   (A,
    B,
    CLK,
    C_OUT,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [7:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [7:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN Adder_clk_100MHz, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_out_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_out_intf, LAYERED_METADATA undef" *) output C_OUT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value FALSE}}}} DATA_WIDTH 8}" *) output [7:0]S;

  wire [7:0]A;
  wire [7:0]B;
  wire CLK;
  wire C_OUT;
  wire [7:0]S;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "1" *) 
  (* c_a_width = "8" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "00000000" *) 
  (* c_b_width = "8" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "1" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "8" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  Adder_c_addsub_0_0_c_addsub_v12_0_18 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
j+cisgNr51kboBzSEDMqVtItc+GjGUiMNF0E04YxNeYXTtpqczXoHl7p3pBX3lPxGHPUBdZ6oYbA
uFzQSoAOvv3ANxN24NJ35g39Gushnh3bAhkIaggJwqirNk8uvbFei0Q37GZcy7DTONZHx9iSsnwg
43qcv84+v1Oqg1QlkK0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LvmfIuwVQiUSvu/SWE90Ii3gBrSlLLUK62Pe9Uo5lexkMeDgQfulU0pV4/6bexfxf29XSUIZb3c9
av2fcRcp1ZeyqEnW0ei/HP4UoYfgCSzAUmuehTopxqUP3M4kX2/ETc0gdNuIi6qDHquW7YY9QQGa
g5MTm81zI19+yvQdowrY7g+W1mLrHRcb8Ho+qe0uZMYO9K9DLpwNlhtSf0qufVmJGM+5COEyqb1U
lL+nfwveqOc0IWRRpPS42kC7OR6BTARi5c6dKCQl/a9fojTU0hW9itdcCGK5DL1CuzhnLB3Cw1Lc
UIHvmiN+LslcbwXadjp0wvd8yuh6HziY0Vfxsw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sxpYAYC9AO3d/Qq5Dz0dcOejYw99+MiH0W395D6tyIroWG9T14T6E7ryw+s/by4tx97NytW6qUN3
NXZVsmgnxSKTeXfcn+ZXRsWNPcQGtCaIdh8TbBiHtUeZecWXJ0/iGORapfLQxNbHmGtiSkN1eYCn
C7QZMw6qZPNfuNyivRg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E/GNyTiOpevKZa3+bbpJb0kDvoBk/eMnN/JT+ul7JFDogMwn8CpOobzq4ORZE40PqtaeX8shZ2Io
cJi8jjFyYeWd2nZtLZo0heKqX3v/pdf8QoQbxat3X7qE+EWjBbCn/ZFGg9zTrFFxwaHk42COVzlL
0j+PRabCWynZ5ILjyTP47frcmCN/iRKt0d+pvi/GA4UjFDtb6+9p1niifgkhCn1MkMBg8U/Y5knN
CVQ7z+g5SrUo/3bEiUXLkpBhMSliuE96gVp/dhIEh9H7jm8yTGyk0JzdtVTLaZLa+Lip0djJZLpb
UppZLdmVomSIk5FAqXrXZx6cyoWBJHtDlyJZkA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hg0hZUmrq09eMOjEntvd+gf7Zd2U4BwDY1Jz7gQri0LZtchGB8Z8SRY7YjUyWlUFux+gzbhxtgxE
uXob+ZiD1GlC8r4A2zRmOzuSIMz5UnEhy5TMjR+8A23FUgB5H14Nk+8/ui0Zs/CqU3Odf3BBWOAg
zxnOh70mcUhtPTAIZ+EcN+1Ujtdp78bNTd2IQJcFIhDRt35kHTIgOpo8oDPU8cUgKH6HYVq0sF+B
1yu+k9PCMZikA3k51SJhEW/Qc39FpYPT9CKN0WwelzSM6CD2GrcLMAt1oh2PsLi9Pfz1zzfj+mED
XS3V2CvLYBAA5I2Zn5G1DKrCLW1s3QCGdjLFcQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZihOD8xT0OXV+vYQgVKC2OgNYw1KaLnWHAc+JKheEAvf+yg1M7C7urUi93p572HyJs7Y4xmmO7jH
ND7Tv3yag5/ovBwWsoZpyr5RiGqozyxd59WCmh1IY/4VIOP7O8XrKDP4OGGR4Yrc69eGX7icFD/q
q1Yri9lFsLwghmgnG5/5LI0ZMQuooogdTmG+J2E0ZDBWfT/UmG0W92Ul8I3gfcKlKOiouwG5y4Jp
nBDOfD0ITqlCH9MMIsDa+elFeLXvv2KVvemlQ6QmFkF7trsIsF7QEhsAEKVsCYQTNVAGTL0GQsfh
sg3wRbAMH9DIJaQxk+17Z2Yacz0Veyzzwk9ehw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HY3h60x+HFg/eOgHTI4UVm9DtPW6wqUKca7u8NGVkEwgcMgpHEWwLglcdrxdQNjcwm8OHot4ETKF
WKbgVoX+iDWvtyepO4qxoxeWXH2F1fmkO5TcCS5lfsbj510UC680iv6lj8Cyu8iiRTaXR/o4FoM0
fC0fK1I3vPhOTQ5CR3OgRKAFDdX+d/qZ444LSpBM+tvjaaKR1BRRMkaGxO58SlkZRhBySU0nhAQy
dLhrkimMDrmmj/sej98ps6eMFspr8+5pUYJg+vWp++Sm0zHT5N6L1+n+oCGTjgEAgNvxvIgPv6O6
O614qs4bb0unrlrWFTLtb8eoiQe9RHpwGopwlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
UwlS0UvncccxxkW4NnEPYSb0LG5K+diX5o0hrXyga8q/gD9ab0W8hccMe2HgIOrJ0coq4cXubRll
ZpfwAORkvZtLjLAkjJkvmwum68290Kk65/t/Zns9LY543if5KVhDzDg632T/2/g+S4iACupycWXY
cZ6s39/F2p//kX1YHKh6qPf3qkoP25aHoXQhlWkBAIGe3uIyPYPXstbeMaMeWMmKTh0rnBbtpr8y
0Qg1S5j9DIzW9sNl57338zbHnQbUbJzw5eAHPIYReJLbGLoFizMzbCeVUf9qQcME/zhozlHMqIYN
Mafo4cDvvsMIs8ppl+EWkfmPwMyBiDor8XdnJwhL6PXvmC52OK25D9SarDCqe+sqUKRPLYOzZm9s
mRp4pTSLWqKlA4Kmt9Om1GAjesqP6fBmfP1NGnjIrnslWz4gi45DlpUHMRKmIlfMjMLoDcxkJyie
bdt0EiJv3tUHW+hzM1osET2y5r7UP2tXX1I0KcbPrsM8mAjAbCi8yC8b

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
X0dvE3L7dLQCMLonwloQgw5itpWmwVthmLjXvNCwkkUnrWRnIFGWcVV+7J059QS+MH4TlngLY35K
jozGLlOeR74+bBTejoxLYWg2EOfziRkOnWV2uSeOTEyEL+LD9sSATD6G+de3w3tolkltsugp6Asm
4+ouB1syLSHEJDe3i6xdrhgn2gjStQgaIBrGx67K6P9M/ZpIE3tJpGwQpXAQW6mcrqXnyP8s9OOR
lKGNPgaQFWDxxHZY806A4MaHpWk9o7ni2o+CNUO1IEpPDpNcX5kMGjPY2d5U2F21JssOrE9gdyeA
WYmROE1TZ0h61Y5QNSuC42zh2bxl5RnU9Yw9kA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oIVzpSluI7daBxkOk2gHCozBGlbxG53WoEhOzUaurQiUeJP9/arWOJWk+fvz3PNZhGKqhMT34Elf
4CE16vrKhBto+aiBjmbTGqgpcZuAov0ThKrdb5D2RErj9L03MzOMQdBEb2OGyWHIaVcOR12TL/Pc
ppZorRLXpXsMO6OiQvQgS6gBpPLmoJ/4mFQU2y7Gq4fQ1w0mBb5WD4aOFS27kco9sWZg134eJyHh
g3WophY4AK3S6VNrjwfZ8V2EHcWlysmTyQhS/i6nISRdlQIyBBenPXI1qC3X2elRwJJ1rDBw4tSk
FPpZVv+Pg6wD1lxgePFMJlGymPGte/sHafK1og==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
flfR64NYycLIyauxCLn1wC38i1K4/yOEiIIS/pzPw5b4T8AQasCEhfXccXWd7XYD8tVTgjkiZlil
BY/FskgSGdAPW60ru4A65EEa7ULY+aPS1CSMAW6nANPgjVXgGu5AsFKiDjSfY+ibvvFHUmJ8Zmez
wEdjdaf1uPn8gwW70f2+rXV6O5zQnCdBG+tQ5cUZMYqSxcdKZEcd7uFDN1+GqykP0vqNVRZMAmZE
umrRSJg1a1YyLdwwKiD+UbAJWJ0KQNS+4RQTCOHtz8/EK1t1YnoCf5KBTTe57whtj0S+rfOK5HaB
upEqngWyR+h+SKSvfYHRQkIHJPKSCB9buGG6MQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2432)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
j+cisgNr51kboBzSEDMqVtItc+GjGUiMNF0E04YxNeYXTtpqczXoHl7p3pBX3lPxGHPUBdZ6oYbA
uFzQSoAOvv3ANxN24NJ35g39Gushnh3bAhkIaggJwqirNk8uvbFei0Q37GZcy7DTONZHx9iSsnwg
43qcv84+v1Oqg1QlkK0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LvmfIuwVQiUSvu/SWE90Ii3gBrSlLLUK62Pe9Uo5lexkMeDgQfulU0pV4/6bexfxf29XSUIZb3c9
av2fcRcp1ZeyqEnW0ei/HP4UoYfgCSzAUmuehTopxqUP3M4kX2/ETc0gdNuIi6qDHquW7YY9QQGa
g5MTm81zI19+yvQdowrY7g+W1mLrHRcb8Ho+qe0uZMYO9K9DLpwNlhtSf0qufVmJGM+5COEyqb1U
lL+nfwveqOc0IWRRpPS42kC7OR6BTARi5c6dKCQl/a9fojTU0hW9itdcCGK5DL1CuzhnLB3Cw1Lc
UIHvmiN+LslcbwXadjp0wvd8yuh6HziY0Vfxsw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sxpYAYC9AO3d/Qq5Dz0dcOejYw99+MiH0W395D6tyIroWG9T14T6E7ryw+s/by4tx97NytW6qUN3
NXZVsmgnxSKTeXfcn+ZXRsWNPcQGtCaIdh8TbBiHtUeZecWXJ0/iGORapfLQxNbHmGtiSkN1eYCn
C7QZMw6qZPNfuNyivRg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E/GNyTiOpevKZa3+bbpJb0kDvoBk/eMnN/JT+ul7JFDogMwn8CpOobzq4ORZE40PqtaeX8shZ2Io
cJi8jjFyYeWd2nZtLZo0heKqX3v/pdf8QoQbxat3X7qE+EWjBbCn/ZFGg9zTrFFxwaHk42COVzlL
0j+PRabCWynZ5ILjyTP47frcmCN/iRKt0d+pvi/GA4UjFDtb6+9p1niifgkhCn1MkMBg8U/Y5knN
CVQ7z+g5SrUo/3bEiUXLkpBhMSliuE96gVp/dhIEh9H7jm8yTGyk0JzdtVTLaZLa+Lip0djJZLpb
UppZLdmVomSIk5FAqXrXZx6cyoWBJHtDlyJZkA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hg0hZUmrq09eMOjEntvd+gf7Zd2U4BwDY1Jz7gQri0LZtchGB8Z8SRY7YjUyWlUFux+gzbhxtgxE
uXob+ZiD1GlC8r4A2zRmOzuSIMz5UnEhy5TMjR+8A23FUgB5H14Nk+8/ui0Zs/CqU3Odf3BBWOAg
zxnOh70mcUhtPTAIZ+EcN+1Ujtdp78bNTd2IQJcFIhDRt35kHTIgOpo8oDPU8cUgKH6HYVq0sF+B
1yu+k9PCMZikA3k51SJhEW/Qc39FpYPT9CKN0WwelzSM6CD2GrcLMAt1oh2PsLi9Pfz1zzfj+mED
XS3V2CvLYBAA5I2Zn5G1DKrCLW1s3QCGdjLFcQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZihOD8xT0OXV+vYQgVKC2OgNYw1KaLnWHAc+JKheEAvf+yg1M7C7urUi93p572HyJs7Y4xmmO7jH
ND7Tv3yag5/ovBwWsoZpyr5RiGqozyxd59WCmh1IY/4VIOP7O8XrKDP4OGGR4Yrc69eGX7icFD/q
q1Yri9lFsLwghmgnG5/5LI0ZMQuooogdTmG+J2E0ZDBWfT/UmG0W92Ul8I3gfcKlKOiouwG5y4Jp
nBDOfD0ITqlCH9MMIsDa+elFeLXvv2KVvemlQ6QmFkF7trsIsF7QEhsAEKVsCYQTNVAGTL0GQsfh
sg3wRbAMH9DIJaQxk+17Z2Yacz0Veyzzwk9ehw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HY3h60x+HFg/eOgHTI4UVm9DtPW6wqUKca7u8NGVkEwgcMgpHEWwLglcdrxdQNjcwm8OHot4ETKF
WKbgVoX+iDWvtyepO4qxoxeWXH2F1fmkO5TcCS5lfsbj510UC680iv6lj8Cyu8iiRTaXR/o4FoM0
fC0fK1I3vPhOTQ5CR3OgRKAFDdX+d/qZ444LSpBM+tvjaaKR1BRRMkaGxO58SlkZRhBySU0nhAQy
dLhrkimMDrmmj/sej98ps6eMFspr8+5pUYJg+vWp++Sm0zHT5N6L1+n+oCGTjgEAgNvxvIgPv6O6
O614qs4bb0unrlrWFTLtb8eoiQe9RHpwGopwlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
UwlS0UvncccxxkW4NnEPYSb0LG5K+diX5o0hrXyga8q/gD9ab0W8hccMe2HgIOrJ0coq4cXubRll
ZpfwAORkvZtLjLAkjJkvmwum68290Kk65/t/Zns9LY543if5KVhDzDg632T/2/g+S4iACupycWXY
cZ6s39/F2p//kX1YHKh6qPf3qkoP25aHoXQhlWkBAIGe3uIyPYPXstbeMaMeWMmKTh0rnBbtpr8y
0Qg1S5j9DIzW9sNl57338zbHnQbUbJzw5eAHPIYReJLbGLoFizMzbCeVUf9qQcME/zhozlHMqIYN
Mafo4cDvvsMIs8ppl+EWkfmPwMyBiDor8XdnJwhL6PXvmC52OK25D9SarDCqe+sqUKRPLYOzZm9s
mRp4pTSLWqKlA4Kmt9Om1GAjesqP6fBmfP1NGnjIrnslWz4gi45DlpUHMRKmIlfMjMLoDcxkJyie
bdt0EiJv3tUHW+hzM1osET2y5r7UP2tXX1I0KcbPrsM8mAjAbCi8yC8b

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
X0dvE3L7dLQCMLonwloQgw5itpWmwVthmLjXvNCwkkUnrWRnIFGWcVV+7J059QS+MH4TlngLY35K
jozGLlOeR74+bBTejoxLYWg2EOfziRkOnWV2uSeOTEyEL+LD9sSATD6G+de3w3tolkltsugp6Asm
4+ouB1syLSHEJDe3i6xdrhgn2gjStQgaIBrGx67K6P9M/ZpIE3tJpGwQpXAQW6mcrqXnyP8s9OOR
lKGNPgaQFWDxxHZY806A4MaHpWk9o7ni2o+CNUO1IEpPDpNcX5kMGjPY2d5U2F21JssOrE9gdyeA
WYmROE1TZ0h61Y5QNSuC42zh2bxl5RnU9Yw9kA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oIVzpSluI7daBxkOk2gHCozBGlbxG53WoEhOzUaurQiUeJP9/arWOJWk+fvz3PNZhGKqhMT34Elf
4CE16vrKhBto+aiBjmbTGqgpcZuAov0ThKrdb5D2RErj9L03MzOMQdBEb2OGyWHIaVcOR12TL/Pc
ppZorRLXpXsMO6OiQvQgS6gBpPLmoJ/4mFQU2y7Gq4fQ1w0mBb5WD4aOFS27kco9sWZg134eJyHh
g3WophY4AK3S6VNrjwfZ8V2EHcWlysmTyQhS/i6nISRdlQIyBBenPXI1qC3X2elRwJJ1rDBw4tSk
FPpZVv+Pg6wD1lxgePFMJlGymPGte/sHafK1og==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
flfR64NYycLIyauxCLn1wC38i1K4/yOEiIIS/pzPw5b4T8AQasCEhfXccXWd7XYD8tVTgjkiZlil
BY/FskgSGdAPW60ru4A65EEa7ULY+aPS1CSMAW6nANPgjVXgGu5AsFKiDjSfY+ibvvFHUmJ8Zmez
wEdjdaf1uPn8gwW70f2+rXV6O5zQnCdBG+tQ5cUZMYqSxcdKZEcd7uFDN1+GqykP0vqNVRZMAmZE
umrRSJg1a1YyLdwwKiD+UbAJWJ0KQNS+4RQTCOHtz8/EK1t1YnoCf5KBTTe57whtj0S+rfOK5HaB
upEqngWyR+h+SKSvfYHRQkIHJPKSCB9buGG6MQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8240)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
