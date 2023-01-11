#include <8051.h>
const unsigned char LED_num[16] = {0x14,0xf6,0x1a,0x92,0xf0,0x91,0x11,0xd4,0x10,0x90,0x3b,0xb3,0xf8,0x9b,0x39,0xff};

void delay (unsigned char time_large,unsigned char time_small){
    unsigned d1,d2 = 0;
    for (d1 = 0; d1 < time_large * 100; d1 ++) {
        for (d2 = 0; d2 < time_small; d2 ++) { }
    }
}
void LED_Display(unsigned char display)
{
        P2 = LED_num[display]; 
        delay(1,10);
}