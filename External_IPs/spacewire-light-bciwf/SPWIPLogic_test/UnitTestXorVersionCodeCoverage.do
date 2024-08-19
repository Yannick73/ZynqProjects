##------------------------------------------------------------------------------
## Institut für Weltraumforschung (IWF)
## Schmiedelstr. 6, 8042 Graz  Austria
## www.iwf.oeaw.ac.at
##------------------------------------------------------------------------------
##
## Unit test bench for the SpaceWire IP core (XOR version) with code coverage 
##
## Author: Jorge Tonfat (JTO)          jorge.tonfat@oeaw.ac.at
## Active HDL version : 10.5
##------------------------------------------------------------------------------

@quiet on
# run unit test
@setactivelib -work

# clear console log
@clear -log
@clear -con

# convert xml verification plan to acdb
xml2acdb -verbose -i "$dsn\src\UnitTestXorVersion\coverage_report\spwip_test_plan.xml"  -o "$dsn\src\UnitTestXorVersion\coverage_report\spwip_test_plan.acdb"

# set to collect coverage of only UUT or Testbench+UUT
# cov_collect_mode = 0 : only UUT
# cov_collect_mode = 1 : Testbench+UUT  
@set cov_collect_mode 1 

asim -advdataflow -asdb "$dsn\src\UnitTestXorVersion\unittest.asdb" \
     -acdb -cc_all -acdb_file "$dsn\src\UnitTestXorVersion\unittest.acdb" -exc control \
	 -ieee_nowarn unittest

@acdb disable
@if $cov_collect_mode = 0
   # collect coverage of only UUT
   @acdb enable -instance -rec /unittest/TSLNK/TC1LNK/UUT
   @acdb enable -instance -rec /unittest/TSRAM/TC1RAM/UUT
   @acdb enable -instance -rec /unittest/TSRAM/TC2RAM/UUT
   @acdb enable -instance -rec /unittest/TSRCV/TC1RECV/UUT
   @acdb enable -instance -rec /unittest/TSRCVFT/TC1RECVFT/UUT
   @acdb enable -instance -rec /unittest/TSRCVFT/TC1RECVFT/UUT2
   @acdb enable -instance -rec /unittest/TSRCVFT/TC2RECVFT/UUT
   @acdb enable -instance -rec /unittest/TSRCVFT/TC2RECVFT/UUT2
   @acdb enable -instance -rec /unittest/TSRCVFT/TC3RECVFT/UUT
   @acdb enable -instance -rec /unittest/TSRCVFT/TC3RECVFT/UUT2
   @acdb enable -instance -rec /unittest/TSRCVFT/TC4RECVFT/UUT
   @acdb enable -instance -rec /unittest/TSRCVFT/TC4RECVFT/UUT2
   @acdb enable -instance -rec /unittest/TSRST/TC1RST/UUT
   @acdb enable -instance -rec /unittest/TSXMTFS/TC1XMITFS/UUT
   #
   @acdb enable -instance -rec /unittest/TSSPWSTR/TC1Reset/UUT
   @acdb enable -instance -rec /unittest/TSSPWSTR/TC2LinkInit/UUT
   @acdb enable -instance -rec /unittest/TSSPWSTR/TC3RecvErr/UUT
   @acdb enable -instance -rec /unittest/TSSPWSTR/TC4Epkts/UUT
   @acdb enable -instance -rec /unittest/TSSPWSTR/TC5ExchgSilence/UUT
   @acdb enable -instance -rec /unittest/TSSPWSTR/TC6ExceptCond/UUT
   @acdb enable -instance -rec /unittest/TSSPWSTR/TC7NormalOp/UUT1
   @acdb enable -instance -rec /unittest/TSSPWSTR/TC7NormalOp/UUT2
@else
   # collect coverage of UUT and testbench testcases (for testbench debug)
   @acdb enable -instance -rec /unittest/TSLNK/TC1LNK
   @acdb enable -instance -rec /unittest/TSRAM/TC1RAM
   @acdb enable -instance -rec /unittest/TSRAM/TC2RAM
   @acdb enable -instance -rec /unittest/TSRCV/TC1RECV
   @acdb enable -instance -rec /unittest/TSRCVFT/TC1RECVFT
   @acdb enable -instance -rec /unittest/TSRCVFT/TC2RECVFT
   @acdb enable -instance -rec /unittest/TSRCVFT/TC3RECVFT
   @acdb enable -instance -rec /unittest/TSRCVFT/TC4RECVFT
   @acdb enable -instance -rec /unittest/TSRST/TC1RST
   @acdb enable -instance -rec /unittest/TSXMTFS/TC1XMITFS

   @acdb enable -instance -rec /unittest/TSSPWSTR -verbose
   #@acdb enable -instance -rec /unittest/TSSPWSTR/TC1Reset
   #@acdb enable -instance -rec /unittest/TSSPWSTR/TC2LinkInit
   #@acdb enable -instance -rec /unittest/TSSPWSTR/TC3RecvErr
   #@acdb enable -instance -rec /unittest/TSSPWSTR/TC4Epkts
   #@acdb enable -instance -rec /unittest/TSSPWSTR/TC5ExchgSilence
   #@acdb enable -instance -rec /unittest/TSSPWSTR/TC6ExceptCond
   #@acdb enable -instance -rec /unittest/TSSPWSTR/TC7NormalOp
@endif



# add signals to the database

# TSSpWCodec
trace -rec /unittest/TSLNK/TC1LNK/*
trace -rec /unittest/TSRAM/TC1RAM/*
trace -rec /unittest/TSRAM/TC2RAM/*
trace -rec /unittest/TSRCV/TC1RECV/*
trace -rec /unittest/TSRCVFT/TC1RECVFT/*
trace -rec /unittest/TSRCVFT/TC2RECVFT/*
trace -rec /unittest/TSRCVFT/TC3RECVFT/*
trace -rec /unittest/TSRCVFT/TC4RECVFT/*
trace -rec /unittest/TSRST/TC1RST/*
trace -rec /unittest/TSXMTFS/TC1XMITFS/*
trace -rec -var /unittest/TSSPWSTR/TC1Reset/*
trace -rec -var /unittest/TSSPWSTR/TC2LinkInit/*
trace -rec -var /unittest/TSSPWSTR/TC3RecvErr/*
trace -rec -var /unittest/TSSPWSTR/TC4Epkts/*
trace -rec -var /unittest/TSSPWSTR/TC5ExchgSilence/*
trace -rec -var /unittest/TSSPWSTR/TC6ExceptCond/*
trace -rec -var /unittest/TSSPWSTR/TC7NormalOp/*


# ---- Run Unit Test ----
@echo " Start simulation at |" [gettime]
@run -all
@endsim
@echo " Stop simulation at |" [gettime]

## Merge functional coverage from TSSPWSTR
acdb edit -i "$dsn\src\UnitTestXorVersion\unittest.acdb" -move -merge instance /unittest/TSSPWSTR/TC* /unittest/TSSPWSTR -verbose

## Merge verification plan with simulation results
acdb merge -i "$dsn\src\UnitTestXorVersion\coverage_report\spwip_test_plan.acdb" -i "$dsn\src\UnitTestXorVersion\unittest.acdb" -o "$dsn\src\UnitTestXorVersion\test_results.acdb" -verbose


@if $cov_collect_mode = 0		
   @acdb report -shownodata -html -i "$dsn\src\UnitTestXorVersion\unittest.acdb" \
   @-o "$dsn\src\UnitTestXorVersion\coverage_report\acdb_coverage.html" \
   @-instance -rec /unittest/TSLNK/TC1LNK/UUT \
   @-instance -rec /unittest/TSRAM/TC1RAM/UUT \
   @-instance -rec /unittest/TSRAM/TC2RAM/UUT \
   @-instance -rec /unittest/TSRCV/TC1RECV/UUT \
   @-instance -rec /unittest/TSRCVFT/TC1RECVFT/UUT \
   @-instance -rec /unittest/TSRCVFT/TC1RECVFT/UUT2 \
   @-instance -rec /unittest/TSRCVFT/TC2RECVFT/UUT \
   @-instance -rec /unittest/TSRCVFT/TC2RECVFT/UUT2 \
   @-instance -rec /unittest/TSRCVFT/TC3RECVFT/UUT \
   @-instance -rec /unittest/TSRCVFT/TC3RECVFT/UUT2 \
   @-instance -rec /unittest/TSRCVFT/TC4RECVFT/UUT \
   @-instance -rec /unittest/TSRCVFT/TC4RECVFT/UUT2 \
   @-instance -rec /unittest/TSRST/TC1RST/UUT \
   @-instance -rec /unittest/TSXMTFS/TC1XMITFS/UUT \
   ##
   @-instance -rec /unittest/TSSPWSTR/TC1Reset/UUT \
   @-instance -rec /unittest/TSSPWSTR/TC2LinkInit/UUT \
   @-instance -rec /unittest/TSSPWSTR/TC3RecvErr/UUT \
   @-instance -rec /unittest/TSSPWSTR/TC4Epkts/UUT \
   @-instance -rec /unittest/TSSPWSTR/TC5ExchgSilence/UUT \
   @-instance -rec /unittest/TSSPWSTR/TC6ExceptCond/UUT \
   @-instance -rec /unittest/TSSPWSTR/TC7NormalOp/UUT1 \
   @-instance -rec /unittest/TSSPWSTR/TC7NormalOp/UUT2 \
   @-du spwip.SpwStream \
   @-du spwip.SpwReset \
   @-du spwip.SpwLink \
   @-du spwip.SpwRam \
   @-du spwip.SpwRecovClk \
   @-du spwip.SpwRecv \
   @-du spwip.SpwRecvFront \
   @-du spwip.SpwXmit_fast \
   @-du spwip.SyncDff
@else
   @acdb report -shownodata -html -i "$dsn\src\UnitTestXorVersion\unittest.acdb" \
   @-o "$dsn\src\UnitTestXorVersion\coverage_report\acdb_coverage.html" \
   @-instance -rec /unittest/TSLNK/TC1LNK \
   @-instance -rec /unittest/TSRAM/TC1RAM \
   @-instance -rec /unittest/TSRAM/TC2RAM \
   @-instance -rec /unittest/TSRCV/TC1RECV \
   @-instance -rec /unittest/TSRCVFT/TC1RECVFT \
   @-instance -rec /unittest/TSRCVFT/TC2RECVFT \
   @-instance -rec /unittest/TSRCVFT/TC3RECVFT \
   @-instance -rec /unittest/TSRCVFT/TC4RECVFT \
   @-instance -rec /unittest/TSRST/TC1RST \
   @-instance -rec /unittest/TSXMTFS/TC1XMITFS \
   @-instance -rec /unittest/TSSPWSTR \
   #@-instance -rec /unittest/TSSPWSTR/TC1Reset \
   #@-instance -rec /unittest/TSSPWSTR/TC2LinkInit \
   #@-instance -rec /unittest/TSSPWSTR/TC3RecvErr \
   #@-instance -rec /unittest/TSSPWSTR/TC4Epkts \
   #@-instance -rec /unittest/TSSPWSTR/TC5ExchgSilence \
   #@-instance -rec /unittest/TSSPWSTR/TC6ExceptCond \
   #@-instance -rec /unittest/TSSPWSTR/TC7NormalOp \
   @-du spwip.SpwStream \
   @-du spwip.SpwReset \
   @-du spwip.SpwLink \
   @-du spwip.SpwRam \
   @-du spwip.SpwRecovClk \
   @-du spwip.SpwRecv \
   @-du spwip.SpwRecvFront \
   @-du spwip.SpwXmit_fast \
   @-du spwip.SyncDff
@endif

# generate report for verification plan
acdb report -shownodata -html -i "$dsn\src\UnitTestXorVersion\test_results.acdb" \
-o "$dsn\src\UnitTestXorVersion\coverage_report\test_results.html"

### commands for code coverage report generation
@acdb report -txt -i "$dsn\src\UnitTestXorVersion\test_results.acdb" \
@-o "$dsn\src\UnitTestXorVersion\coverage_report\unittest_coverage_du.txt" \
@-du spwip.SpwStream \
@-du spwip.SpwReset \
@-du spwip.SpwLink \
@-du spwip.SpwRam \
@-du spwip.SpwRecovClk \
@-du spwip.SpwRecv \
@-du spwip.SpwRecvFront \
@-du spwip.SpwXmit_fast \
@-du spwip.SyncDff \
@-nodetails -noinfo