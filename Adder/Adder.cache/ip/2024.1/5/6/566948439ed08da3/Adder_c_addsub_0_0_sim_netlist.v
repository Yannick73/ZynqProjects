// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Tue Jul  2 22:43:54 2024
// Host        : yannick-AB350-Gaming-3 running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Adder_c_addsub_0_0_sim_netlist.v
// Design      : Adder_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Adder_c_addsub_0_0,c_addsub_v12_0_18,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_18,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_18 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2480)
`pragma protect data_block
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
/pHBSFJeTt+pyuGhGW5RDqKzg3u9QWh2jdqvMTg=
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8496)
`pragma protect data_block
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
KZ//
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
