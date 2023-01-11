#include <8051.h>
const unsigned char keypad_num[16] = {7,4,1,0,8,5,2,10,9,6,3,11,12,13,14,15};
char column;

char Keypad()
{    
    for (char c = 0; c < 4; c ++) {
        if (!(P1 & (0x10 << c))){
            column = c;
            P1 = 0x0f;
            for (char r = 0; r < 4; r ++) {
                if (!(P1 & (1 << r)))
                    return keypad_num[r * 4 + column];
            }
            P1 = 0xf0;
        }
    }
    return 0xff;
}
