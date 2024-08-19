@echo off
REM ****************************************************************************
REM Vivado (TM) v2024.1 (64-bit)
REM
REM Filename    : compile.bat
REM Simulator   : AMD Vivado Simulator
REM Description : Script for compiling the simulation design source files
REM
REM Generated by Vivado on Mon Aug 19 13:31:31 +0200 2024
REM SW Build 5076996 on Wed May 22 18:37:14 MDT 2024
REM
REM Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
REM Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
REM
REM usage: compile.bat
REM
REM ****************************************************************************
REM compile VHDL design sources
echo "xvhdl --incr --relax -prj default_link_vhdl.prj"
call xvhdl  --incr --relax -prj default_link_vhdl.prj -log xvhdl.log
call type xvhdl.log > compile.log
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
