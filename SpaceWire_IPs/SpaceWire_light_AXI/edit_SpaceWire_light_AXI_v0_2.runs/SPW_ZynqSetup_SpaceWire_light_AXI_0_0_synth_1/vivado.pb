
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:082

00:00:072	
579.4452	
175.418Z17-268h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
�
 Loaded user IP repository '%s'.
1135*coregen2R
Pf:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/SpaceWire_light_AXI_0_2Z19-1700h px� 
j
"Loaded Vivado IP repository '%s'.
1332*coregen2!
F:/Xilinx/Vivado/2024.1/data/ipZ19-2313h px� 
�
�The host OS only allows 260 characters in a normal path. The IP cache path is more than 80 characters. If you experience issues with IP caching, please consider changing the IP cache to a location with a shorter path. Alternately consider using the OS subst command to map part of the path to a drive letter. 
Current IP cache path is %s 2293*coregen2a
_f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.cache/ipZ19-4995h px� 
{
-IPCACHE: Running cache check for IP inst: %s
2546*coregen2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z19-6924h px� 
�
Command: %s
53*	vivadotcl2z
xsynth_design -top SPW_ZynqSetup_SpaceWire_light_AXI_0_0 -part xc7z020clg484-1 -incremental_mode off -mode out_of_contextZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7z020Z17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7z020Z17-349h px� 
D
Loading part %s157*device2
xc7z020clg484-1Z21-403h px� 
Z
$Part: %s does not have CEAM library.966*device2
xc7z020clg484-1Z21-9227h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
M
#Helper process launched with PID %s4824*oasys2
5276Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1467.902 ; gain = 448.637
h px� 
�
$'%s' is not compiled in library '%s'5201*oasys2
spacewire_light_axi2
spwip2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_SpaceWire_light_AXI_0_0/synth/SPW_ZynqSetup_SpaceWire_light_AXI_0_0.vhd2
578@Z8-8943h px� 
�
synthesizing module '%s'638*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_SpaceWire_light_AXI_0_0/synth/SPW_ZynqSetup_SpaceWire_light_AXI_0_0.vhd2
1078@Z8-638h px� 
^
%s
*synth2F
D	Parameter C_AXI_StreamOut_TDATA_WIDTH bound to: 8 - type: integer 
h p
x
� 
_
%s
*synth2G
E	Parameter C_AXI_StreamOut_START_COUNT bound to: 32 - type: integer 
h p
x
� 
]
%s
*synth2E
C	Parameter C_AXI_Register_DATA_WIDTH bound to: 32 - type: integer 
h p
x
� 
\
%s
*synth2D
B	Parameter C_AXI_Register_ADDR_WIDTH bound to: 5 - type: integer 
h p
x
� 
]
%s
*synth2E
C	Parameter C_AXI_StreamIn_TDATA_WIDTH bound to: 8 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SpaceWire_light_AXI2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI.vhd2
82
U02
SpaceWire_light_AXI2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_SpaceWire_light_AXI_0_0/synth/SPW_ZynqSetup_SpaceWire_light_AXI_0_0.vhd2
2248@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
SpaceWire_light_AXI2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI.vhd2
938@Z8-638h px� 
V
%s
*synth2>
<	Parameter C_S_AXI_DATA_WIDTH bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter C_S_AXI_ADDR_WIDTH bound to: 5 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
527
5SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register_inst22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI.vhd2
1988@Z8-3491h px� 
�
synthesizing module '%s'638*oasys22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
868@Z8-638h px� 
�
default block is never used226*oasys2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
2268@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
868@Z8-256h px� 
H
%s
*synth20
.	Parameter ESCAPE_CHAR bound to: 8'b01111101 
h p
x
� 
W
%s
*synth2?
=	Parameter C_S_AXIS_TDATA_WIDTH bound to: 8 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys24
2SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn.vhd2
529
7SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn_inst24
2SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI.vhd2
2288@Z8-3491h px� 
�
synthesizing module '%s'638*oasys24
2SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn.vhd2
508@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
S_AXIS_ARESETN2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn.vhd2
1138@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys24
2SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn.vhd2
508@Z8-256h px� 
H
%s
*synth20
.	Parameter ESCAPE_CHAR bound to: 8'b01111101 
h p
x
� 
W
%s
*synth2?
=	Parameter C_M_AXIS_TDATA_WIDTH bound to: 8 - type: integer 
h p
x
� 
S
%s
*synth2;
9	Parameter C_M_START_COUNT bound to: 32 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys26
4SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut.vhd2
52;
9SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut_inst26
4SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI.vhd2
2518@Z8-3491h px� 
�
synthesizing module '%s'638*oasys26
4SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut.vhd2
458@Z8-638h px� 
�
?Generic '%s' not present in instantiated entity will be ignored3418*oasys2
c_m_start_count2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI.vhd2
2518@Z8-3819h px� 
�
<shared variable will be implemented as local to architecture613*oasys2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut.vhd2
498@Z8-613h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
M_AXIS_ARESETN2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut.vhd2
558@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys26
4SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut.vhd2
458@Z8-256h px� 
W
%s
*synth2?
=	Parameter SYSFREQ bound to: 40000000.000000 - type: double 
h p
x
� 
Y
%s
*synth2A
?	Parameter TXCLKFREQ bound to: 40000000.000000 - type: double 
h p
x
� 
J
%s
*synth22
0	Parameter RXCHUNK bound to: 2 - type: integer 
h p
x
� 
S
%s
*synth2;
9	Parameter RXFIFOSIZE_BITS bound to: 12 - type: integer 
h p
x
� 
S
%s
*synth2;
9	Parameter TXFIFOSIZE_BITS bound to: 12 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SpwStream2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
1072
SPW_IF2
	SpwStream2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI.vhd2
2758@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	SpwStream2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
1698@Z8-638h px� 
O
%s
*synth27
5	Parameter RESET_TIME bound to: 256 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SpwLink2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwLink.vhd2
782
	LINK_INST2	
SpwLink2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
3788@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
SpwLink2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwLink.vhd2
988@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
SpwLink2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwLink.vhd2
988@Z8-256h px� 
S
%s
*synth2;
9	Parameter DISCONNECT_TIME bound to: 33 - type: integer 
h p
x
� 
J
%s
*synth22
0	Parameter RXCHUNK bound to: 2 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SpwRecv2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRecv.vhd2
852
	RECV_INST2	
SpwRecv2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
3828@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
SpwRecv2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRecv.vhd2
1058@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
SpwRecv2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRecv.vhd2
1058@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SpwXmit_fast2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast.vhd2
2172
XMIT_FAST_INST2
SpwXmit_fast2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
3868@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
SpwXmit_fast2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast.vhd2
2508@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCTXSYSFLIP02	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast.vhd2
3078@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
898@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2	
SyncDff2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
898@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCTXSYSFLIP12	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast.vhd2
3108@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732

SYNCTXTXEN2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast.vhd2
3138@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCTXTXDIVSAFE2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast.vhd2
3168@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCSYSTXFLIP02	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast.vhd2
3198@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCSYSTXFLIP12	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast.vhd2
3228@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SpwXmit_fast2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SpwXmit_fast.vhd2
2508@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SpwRecovClk2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRecovClk.vhd2
652
RECOV_CLK_INST2
SpwRecovClk2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
3898@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
SpwRecovClk2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRecovClk.vhd2
778@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	CLKDriver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1022

RXCLKBUF2
	CLKDriver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRecovClk.vhd2
858@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	CLKDriver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1128@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	CLKDriver2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1128@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SpwRecovClk2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRecovClk.vhd2
778@Z8-256h px� 
I
%s
*synth21
/	Parameter ABITS bound to: 12 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SpwBlockRam2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRam.vhd2
1532
RXMEM2
SpwBlockRam2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
3938@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
SpwBlockRam2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRam.vhd2
1718@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SpwBlockRam2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRam.vhd2
1718@Z8-256h px� 
I
%s
*synth21
/	Parameter ABITS bound to: 12 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SpwBlockRam2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRam.vhd2
1532
TXMEM2
SpwBlockRam2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
3978@Z8-3491h px� 
J
%s
*synth22
0	Parameter RXCHUNK bound to: 2 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SpwRecvFront2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
922
RECVFRONT_INST2
SpwRecvFront2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
4018@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
SpwRecvFront2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
1178@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1302	
DriverR2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2358@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1408@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Driver2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1408@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1302	
DriverF2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2368@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1302	
DriverR2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2358@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1302	
DriverF2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2368@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1302	
DriverR2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2358@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1302	
DriverF2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2368@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1302	
DriverR2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2358@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a5ad/ModuleMap_pkg.vhd2
1302	
DriverF2
Driver2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2368@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCSYSHEADPTR02	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2468@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCSYSHEADPTR12	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2498@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCSYSHEADPTR22	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2528@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCSYSBITCNT02	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2558@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCSYSBITCNT12	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2588@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCSYSBITCNT22	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2618@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/eda7/SyncDff.vhd2
732
SYNCSYSBITCNT32	
SyncDff2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2648@Z8-3491h px� 
P
%s
*synth28
6	Parameter RESET_LATENCY bound to: 2 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

SpwReset2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwReset.vhd2
642

RXRSTLOGIC2

SpwReset2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2678@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

SpwReset2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwReset.vhd2
798@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

SpwReset2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwReset.vhd2
798@Z8-256h px� 
H
%s
*synth20
.	Parameter ABITS bound to: 3 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter DBITS bound to: 2 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
SpwRam2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRam.vhd2
692	
FIFOMEM2
SpwRam2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
2718@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
SpwRam2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRam.vhd2
928@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
WEN2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRam.vhd2
1178@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SpwRam2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRam.vhd2
928@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SpwRecvFront2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
1178@Z8-256h px� 
P
%s
*synth28
6	Parameter RESET_LATENCY bound to: 2 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

SpwReset2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwReset.vhd2
642

TXRSTLOGIC2

SpwReset2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
4068@Z8-3491h px� 
P
%s
*synth28
6	Parameter RESET_LATENCY bound to: 1 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

SpwReset2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwReset.vhd2
642
SYSRSTLOGIC2

SpwReset2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
4108@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
SpwReset__parameterized22�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwReset.vhd2
798@Z8-638h px� 
�
null range expression ignored10404*oasys2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwReset.vhd2
1058@Z8-11358h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SpwReset__parameterized22
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwReset.vhd2
798@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	SpwStream2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwStream.vhd2
1698@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
SpaceWire_light_AXI2
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI.vhd2
938@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
02
12�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ip/SPW_ZynqSetup_SpaceWire_light_AXI_0_0/synth/SPW_ZynqSetup_SpaceWire_light_AXI_0_0.vhd2
1078@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
axi_awaddr_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
1668@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
slv_reg0_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
2168@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
slv_reg1_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
2178@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
slv_reg2_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
2188@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
slv_reg3_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
2198@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
slv_reg4_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
2208@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
slv_reg5_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
2218@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
slv_reg6_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
2228@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
slv_reg7_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
2238@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
axi_araddr_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_lite_v0_2_AXI_Register.vhd2
3298@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
fifo_full_clear_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn.vhd2
718@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
SPW_TXWRITE_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamIn.vhd2
1268@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
M_AXIS_TVALID_reg2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut.vhd2
608@Z8-6014h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
M_AXIS_TSTRB26
4SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOut.vhd2
378@Z8-3848h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
res_seq_reg[penderresc]2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/b243/SpwRecv.vhd2
3238@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
resrx_seq_reg[wr_cnt]2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
4728@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
res_seq_reg[splitbit]2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
4918@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
res_seq_reg[splitinx]2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
4918@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
res_seq_reg[splitvalid]2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/a803/SpwRecvFrontXor.vhd2
4918@Z8-6014h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
IRQ2
SpaceWire_light_AXI2�
�f:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.gen/sources_1/bd/SPW_ZynqSetup/ipshared/9657/hdl/SpaceWire_light_AXI.vhd2
358@Z8-3848h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
SPW_SI2
SpwRecvFrontZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
M_AXIS_TSTRB[0]26
4SpaceWire_light_AXI_master_stream_v0_2_AXI_StreamOutZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXIS_TSTRB[0]24
2SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamInZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXIS_TLAST24
2SpaceWire_light_AXI_slave_stream_v0_2_AXI_StreamInZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[4]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[3]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[2]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[1]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWADDR[0]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWPROT[2]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWPROT[1]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_AWPROT[0]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[31]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[30]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[29]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[28]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[27]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[26]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[25]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[24]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[23]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[22]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[21]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[20]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[19]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[18]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[17]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[16]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[15]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[14]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[13]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[12]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[11]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[10]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[9]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[8]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[7]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[6]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[5]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[4]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[3]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[2]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[1]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WDATA[0]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WSTRB[3]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WSTRB[2]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WSTRB[1]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_WSTRB[0]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[4]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[3]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[2]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[1]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARADDR[0]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARPROT[2]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARPROT[1]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
S_AXI_ARPROT[0]22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-7129h px� 
y
9Port %s in module %s is either unconnected or has no load4866*oasys2
IRQ2
SpaceWire_light_AXIZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:08 . Memory (MB): peak = 1607.332 ; gain = 588.066
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1607.332 ; gain = 588.066
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1607.332 ; gain = 588.066
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0242

1607.3322
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1703.3952
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0342

1703.6452
0.250Z17-268h px� 
Q
!Incremental synthesis strategy %s2274*designutils2
offZ20-5008h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7z020clg484-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
state_write_reg22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-802h px� 
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
state_read_reg22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-802h px� 
v
3inferred FSM for state register '%s' in module '%s'802*oasys2
state_seq_reg[state]2	
SpwLinkZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    idle |                              001 |                               00
h p
x
� 
y
%s
*synth2a
_                   waddr |                              010 |                               10
h p
x
� 
y
%s
*synth2a
_                   wdata |                              100 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
state_write_reg2	
one-hot22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    idle |                               00 |                               00
h p
x
� 
y
%s
*synth2a
_                   raddr |                               01 |                               10
h p
x
� 
y
%s
*synth2a
_                   rdata |                               10 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
state_read_reg2

sequential22
0SpaceWire_light_AXI_slave_lite_v0_2_AXI_RegisterZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_            s_errorreset |                           000001 |                              000
h p
x
� 
y
%s
*synth2a
_             s_errorwait |                           100000 |                              001
h p
x
� 
y
%s
*synth2a
_                 s_ready |                           010000 |                              010
h p
x
� 
y
%s
*synth2a
_               s_started |                           001000 |                              011
h p
x
� 
y
%s
*synth2a
_            s_connecting |                           000100 |                              100
h p
x
� 
y
%s
*synth2a
_                   s_run |                           000010 |                              101
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
state_seq_reg[state]2	
one-hot2	
SpwLinkZ8-3354h px� 
�
�The Block RAM %s may get memory collision error if read and write address collide. Use attribute (* rw_addr_collision= "yes" *) to avoid collision 
4524*oasys2
"SpwBlockRam:/s_mem_reg"Z8-6430h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:17 ; elapsed = 00:00:17 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   13 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   11 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 6     
h p
x
� 
F
%s
*synth2.
,	   3 Input    7 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit       Adders := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit       Adders := 3     
h p
x
� 
F
%s
*synth2.
,	   3 Input    2 Bit       Adders := 3     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 14    
h p
x
� 
H
%s
*synth20
.	   3 Input      1 Bit         XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               13 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	               11 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 22    
h p
x
� 
H
%s
*synth20
.	                6 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 6     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 16    
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 137   
h p
x
� 
&
%s
*synth2
+---RAMs : 
h p
x
� 
X
%s
*synth2@
>	              36K Bit	(4096 X 9 bit)          RAMs := 2     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   4 Input   13 Bit        Muxes := 10    
h p
x
� 
F
%s
*synth2.
,	   4 Input   12 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   11 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input   10 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 23    
h p
x
� 
F
%s
*synth2.
,	   4 Input    8 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   5 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    7 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   6 Input    6 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   3 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   3 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 9     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 149   
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 10    
h p
x
� 
F
%s
*synth2.
,	   6 Input    1 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 16    
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 220 (col length:60)
BRAMs: 280 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[31]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[30]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[29]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[28]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[27]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[26]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[25]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[24]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[23]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[22]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[21]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[20]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[19]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[18]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[17]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[16]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[15]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[14]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[13]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[12]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[11]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[10]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[9]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[8]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[7]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[6]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[5]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[4]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[3]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[2]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[1]2
0Z8-3917h px�
�
+design %s has port %s driven by constant %s3447*oasys2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
axi_register_rdata[0]2
0Z8-3917h px�
u
9Port %s in module %s is either unconnected or has no load4866*oasys2
SPW_SI2
SpwRecvFrontZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
IRQ2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_streamout_tstrb[0]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_awaddr[4]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_awaddr[3]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_awaddr[2]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_awaddr[1]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_awaddr[0]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_awprot[2]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_awprot[1]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_awprot[0]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[31]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[30]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[29]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[28]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[27]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[26]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[25]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[24]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[23]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[22]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[21]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[20]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[19]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[18]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[17]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[16]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[15]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[14]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[13]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[12]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[11]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[10]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[9]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[8]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[7]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[6]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[5]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[4]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[3]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[2]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[1]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
axi_register_wdata[0]2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_0Z8-7129h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-71292
100Z17-14h px� 
�
%s
*synth2�
�RAM Pipeline Warning: Read Address Register Found For RAM U0/SPW_IF/RXMEM/s_mem_reg. We will not be able to pipeline it. This may degrade performance. 
h p
x
� 
�
%s
*synth2�
�RAM Pipeline Warning: Read Address Register Found For RAM U0/SPW_IF/RXMEM/s_mem_reg. We will not be able to pipeline it. This may degrade performance. 
h p
x
� 
�
%s
*synth2�
�RAM Pipeline Warning: Read Address Register Found For RAM U0/SPW_IF/RXMEM/s_mem_reg. We will not be able to pipeline it. This may degrade performance. 
h p
x
� 
�
�The Block RAM %s may get memory collision error if read and write address collide. Use attribute (* rw_addr_collision= "yes" *) to avoid collision 
4524*oasys2C
A"SPW_ZynqSetup_SpaceWire_light_AXI_0_0/U0/SPW_IF/RXMEM/s_mem_reg"Z8-6430h px� 
�
%s
*synth2�
�RAM Pipeline Warning: Read Address Register Found For RAM U0/SPW_IF/TXMEM/s_mem_reg. We will not be able to pipeline it. This may degrade performance. 
h p
x
� 
�
%s
*synth2�
�RAM Pipeline Warning: Read Address Register Found For RAM U0/SPW_IF/TXMEM/s_mem_reg. We will not be able to pipeline it. This may degrade performance. 
h p
x
� 
�
%s
*synth2�
�RAM Pipeline Warning: Read Address Register Found For RAM U0/SPW_IF/TXMEM/s_mem_reg. We will not be able to pipeline it. This may degrade performance. 
h p
x
� 
�
�The Block RAM %s may get memory collision error if read and write address collide. Use attribute (* rw_addr_collision= "yes" *) to avoid collision 
4524*oasys2C
A"SPW_ZynqSetup_SpaceWire_light_AXI_0_0/U0/SPW_IF/TXMEM/s_mem_reg"Z8-6430h px� 
�
%s
*synth2�
�RAM Pipeline Warning: Read Address Register Found For RAM U0/SPW_IF/RXMEM/s_mem_reg. We will not be able to pipeline it. This may degrade performance. 
h p
x
� 
�
%s
*synth2�
�RAM Pipeline Warning: Read Address Register Found For RAM U0/SPW_IF/TXMEM/s_mem_reg. We will not be able to pipeline it. This may degrade performance. 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:21 ; elapsed = 00:00:22 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
R
%s*synth2:
8
Block RAM: Preliminary Mapping Report (see note below)
h px� 
�
%s*synth2�
�+--------------------------------------+---------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h px� 
�
%s*synth2�
�|Module Name                           | RTL Object                | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
h px� 
�
%s*synth2�
�+--------------------------------------+---------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h px� 
�
%s*synth2�
�|SPW_ZynqSetup_SpaceWire_light_AXI_0_0 | U0/SPW_IF/RXMEM/s_mem_reg | 4 K x 9(READ_FIRST)    | W |   | 4 K x 9(WRITE_FIRST)   |   | R | Port A and B     | 0      | 1      | 
h px� 
�
%s*synth2�
�|SPW_ZynqSetup_SpaceWire_light_AXI_0_0 | U0/SPW_IF/TXMEM/s_mem_reg | 4 K x 9(READ_FIRST)    | W |   | 4 K x 9(WRITE_FIRST)   |   | R | Port A and B     | 0      | 1      | 
h px� 
�
%s*synth2�
�+--------------------------------------+---------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

h px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the Block RAMs at the current stage of the synthesis flow. Some Block RAMs may be reimplemented as non Block RAM primitives later in the synthesis flow. Multiple instantiated Block RAMs are reported only once. 
h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!
Block RAM: Final Mapping Report
h p
x
� 
�
%s
*synth2�
�+--------------------------------------+---------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h p
x
� 
�
%s
*synth2�
�|Module Name                           | RTL Object                | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 | 
h p
x
� 
�
%s
*synth2�
�+--------------------------------------+---------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
h p
x
� 
�
%s
*synth2�
�|SPW_ZynqSetup_SpaceWire_light_AXI_0_0 | U0/SPW_IF/RXMEM/s_mem_reg | 4 K x 9(READ_FIRST)    | W |   | 4 K x 9(WRITE_FIRST)   |   | R | Port A and B     | 0      | 1      | 
h p
x
� 
�
%s
*synth2�
�|SPW_ZynqSetup_SpaceWire_light_AXI_0_0 | U0/SPW_IF/TXMEM/s_mem_reg | 4 K x 9(READ_FIRST)    | W |   | 4 K x 9(WRITE_FIRST)   |   | R | Port A and B     | 0      | 1      | 
h p
x
� 
�
%s
*synth2�
�+--------------------------------------+---------------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2
U0/SPW_IF/RXMEM/s_mem_reg2
BlockZ8-7052h px� 
�
�The timing for the instance %s (implemented as a %s RAM) might be sub-optimal as no optional output register could be merged into the ram block. Providing additional output register may help in improving timing.
4799*oasys2
U0/SPW_IF/TXMEM/s_mem_reg2
BlockZ8-7052h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
4
%s*synth2
+------+---------+------+
h px� 
4
%s*synth2
|      |Cell     |Count |
h px� 
4
%s*synth2
+------+---------+------+
h px� 
4
%s*synth2
|1     |CARRY4   |    32|
h px� 
4
%s*synth2
|2     |LUT1     |    40|
h px� 
4
%s*synth2
|3     |LUT2     |    62|
h px� 
4
%s*synth2
|4     |LUT3     |    90|
h px� 
4
%s*synth2
|5     |LUT4     |    84|
h px� 
4
%s*synth2
|6     |LUT5     |    90|
h px� 
4
%s*synth2
|7     |LUT6     |   104|
h px� 
4
%s*synth2
|8     |RAMB36E1 |     2|
h px� 
4
%s*synth2
|9     |FDCE     |   373|
h px� 
4
%s*synth2
|10    |FDPE     |    24|
h px� 
4
%s*synth2
|11    |FDRE     |    70|
h px� 
4
%s*synth2
|12    |FDSE     |     6|
h px� 
4
%s*synth2
+------+---------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1703.645 ; gain = 684.379
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
%s
*synth2I
GSynthesis finished with 0 errors, 0 critical warnings and 61 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:22 ; elapsed = 00:00:31 . Memory (MB): peak = 1703.645 ; gain = 588.066
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:32 ; elapsed = 00:00:33 . Memory (MB): peak = 1703.645 ; gain = 684.379
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0152

1703.6452
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
34Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1703.6452
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

90b232a5Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1362
1322
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:382

00:00:392

1703.6452

1110.961Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

1703.6452
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2�
�F:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.runs/SPW_ZynqSetup_SpaceWire_light_AXI_0_0_synth_1/SPW_ZynqSetup_SpaceWire_light_AXI_0_0.dcpZ17-1381h px� 
�
<Added synthesis output to IP cache for IP %s, cache-ID = %s
485*coretcl2'
%SPW_ZynqSetup_SpaceWire_light_AXI_0_02
e951e5fad1ad4f06Z2-1648h px� 
?
Renamed %s cell refs.
330*coretcl2
28Z2-1174h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0022

1703.6452
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2�
�F:/Xilinx/ZynqProjects/SpaceWire_IPs/SpaceWire_light_AXI/edit_SpaceWire_light_AXI_v0_2.runs/SPW_ZynqSetup_SpaceWire_light_AXI_0_0_synth_1/SPW_ZynqSetup_SpaceWire_light_AXI_0_0.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2�
�report_utilization -file SPW_ZynqSetup_SpaceWire_light_AXI_0_0_utilization_synth.rpt -pb SPW_ZynqSetup_SpaceWire_light_AXI_0_0_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Tue Oct  8 19:52:14 2024Z17-206h px� 


End Record