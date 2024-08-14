#include <iostream>
#include <sys/_stdint.h>
#include "xparameters.h"
#include "xstatus.h"
#include "xuartlite.h"
#include "xil_printf.h"
#include "xuartlite_l.h"

XUartLite UartLite;		/* Instance of the UartLite Device */

int main(void)
{
    std::cout << "Start of XUartLite test\n";

    int status = XUartLite_Initialize(&UartLite, XPAR_XUARTLITE_0_BASEADDR);
    if(status != XST_SUCCESS)
    {
        std::cout << "XUartLite could not be initialized\n";
    }
    status = XUartLite_SelfTest(&UartLite);
    if(status != XST_SUCCESS)
    {
        std::cout << "XUartLite self-test failed\n";
    }

    std::cout << "XUartLite hardware started\nThe last two bytes received are added and sent back\n";

    uint16_t d0 = 0;
    uint16_t d1 = 0;
    while(1)
    {
        // blocking read
        d1 = XUartLite_RecvByte(XPAR_XUARTLITE_0_BASEADDR);
        uint16_t sum = d0 + d1;
        // interpretes the sum as a buffer by using a 8 bit ptr of the adress
        XUartLite_Send(&UartLite, (uint8_t*)(&sum), 2);
        // debug output
        std::cout << "d0:" << d0 << " d1:" << d1 << " s:" << sum << "\n";
        d0 = d1;        
    }

    return 0;
}