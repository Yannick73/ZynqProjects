##------------------------------------------------------------------------------
## Institut für Weltraumforschung (IWF)
## Schmiedelstr. 6, 8042 Graz  Austria
## www.iwf.oeaw.ac.at
##------------------------------------------------------------------------------
##
## Unit test bench for the SpaceWire IP core (XOR version)
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

asim -advdataflow -asdb "$dsn\src\UnitTestXorVersion\unittest.asdb" -ieee_nowarn unittest

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
# @endsim
@echo " Stop simulation at |" [gettime]
