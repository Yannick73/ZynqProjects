#include <iostream>
#include "xparameters.h"
#include <sys/_stdint.h>
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

    while(1)
    {
        // blocking read
        uint8_t data = XUartLite_RecvByte(XPAR_XUARTLITE_0_BASEADDR);
        uint8_t lower = data & 0x0f;
        uint8_t upper = (data >> 4) & 0x0f;
        // Add the lower and upper 4 bit together
        uint8_t sum = lower + upper;
        // interpretes the sum as a buffer by using a 8 bit ptr of the adress
        // XUartLite_Send(&UartLite, (uint8_t*)(&sum), 2);
        XUartLite_Send(&UartLite, &sum, 1);
        // debug output
        std::cout << "lower: " << lower << " upper: " << upper << " sum:" << sum << "\n";
    }

    return 0;
}