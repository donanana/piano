#include <stdio.h>
#include <8051.h>
#include "Keypad.h"
#include "LED_Display.h"
#define TIMER_TEMPO 55535

unsigned initial;
unsigned char display,num,press_value,fix; // display:led顯示, num:鍵盤掃描結果 , press_value:用來做piano功能, fix:修正秒數用的參數65536
unsigned char okey = 0xff, time = 0, key = 2; // okey:debounce, time:timer_1 interrupt, key = 升降八度, record_start = 允許記錄相關資訊
__bit record_start = 0; 
unsigned char record_counter = 0, time_counter = 0, tempo_counter = 5; // record_counter:數要存在record陣列的位置, time_counter:與fix相呼配合, tempo_counter:數讀的tempo陣列的位置
unsigned char sharp_flat = 0;// shap_flat:0-> none, 1 -> #, 2 -> b 

//音階
unsigned short tone[] =  
{
    0,
	262, // C 
	294, // D 
	330, // E 
	349, // F 
	392, // G 
	440, // A
	494, // B 
};

// unsigned char record_tone[] = {
// 5,6,5,4,3,4,5,2,3,4,3,4,5,5,6,5,4,3,4,5,2,5,3,2,1
// };

//可紀錄30個音的tone.key.sharp_flat
unsigned char record_tone[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
unsigned char record_key[]={2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2};
// RAM 不夠
// unsigned char record_sharp_flat[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

//節奏快慢
const unsigned char tempo[]={
    55535, // 0.01  sec -> 1
    9000, // 0.008 sec -> 0.9
    8000, // 0.008 sec -> 0.8
    7000, // 0.007 sec -> 0.7
    
    60000,  // 0.06 sec  -> 0.6
    50000, // 0.05 sec  -> 0.5
    40000, // 0.04 sec  -> 0.4
    30000, // 0.03 sec  -> 0.3
    20000, // 0.02 sec  -> 0.2
    10000, // 0.01 sec  -> 0.1
};

//鋼琴功能
void timer_0(void) __interrupt (1) __using (1)
{
    if (P1 != 0xf0){ // 1~7 = C~A音階
        if (press_value > 0 && press_value < 8) {
            P0 = ~P0;
            if(sharp_flat == 0){ // 無升降單音
                initial = 65536 -(1000000 / (tone[press_value] * key));
            }
            else if(sharp_flat == 1){ // 升單音
                if(press_value == 3){ // E# = F
                    initial = 65536 -(1000000 / (tone[press_value + 1] * key));
                }
                else if(press_value == 7){ // B# = high C
                    initial = 65536 -(1000000 / (tone[press_value - 6] * 2 * key));
                }
                else{
                    initial = 65536 -(1000000 / ((tone[press_value] + tone[press_value + 1])/2 * key));
                }
            }
            else if(sharp_flat == 2){ // 降單音
                if(press_value == 1){ // Cb = low B 
                    initial = 65536 -(1000000 / (tone[press_value + 1] / 2 * key));
                }
                else if(press_value == 4){ // Fb = E
                    initial = 65536 -(1000000 / (tone[press_value - 1] * key));
                }else{
                    initial = 65536 -(1000000 / ((tone[press_value-1] + tone[press_value])/2 * key));
                }
            }
            TL0 = initial & 0xff; 
            TH0 = initial >> 8; 
            if(record_counter < sizeof(record_tone) / sizeof(unsigned char) && record_start == 1){ // 紀錄談奏相關資訊
                record_tone[record_counter] = press_value;
                record_key[record_counter] = key;
                // record_sharp_flat[record_counter] = sharp_flat;
                record_counter ++;
            }
            record_start = 0;
        }
        else if(press_value == 12){ // C 放音樂
            P0 = ~P0;
            initial = 65536 -(1000000 / (tone[record_tone[time]] * record_key[time]));
            TL0 = initial & 0xff;
            TH0 = initial >> 8;
        }

    }
}

void timer_1(void) __interrupt (3) __using (2){
    if (P1 != 0xf0){
        if(press_value == 12){ // C 放音樂
            time_counter += 1;
            // 修正秒數
            if(tempo_counter > 3){
                fix = 10;
            }else{
                fix = 100;
            }
            if (time_counter >= fix){ // 為下次單音撥放做準備
                time_counter = 0;
                time ++;
                //repeat 音樂
                if (time >= sizeof(record_tone) / sizeof(unsigned char) || record_tone[time] == 0){
                    time = 0;
                }
            }
            TL1 = TIMER_TEMPO & 0xff;
            TH1 = TIMER_TEMPO >> 8;
        }
    }
}

void main() 
{
    P0 = 0xf0;                                                  // speaker and 7-display location 
    P1 = 0xf0;                                                  // 4*4keypad
    P2 = 0xff;                                                  // LED number

    TMOD = 0x11; 
    TCON = 0x50;
    IE = 0x8a;

    while (1) {
        num = Keypad();
        if (num != okey && okey == 0xff) {
            display = num;
            press_value = num;
            record_start = 1;
            
            if(press_value == 0){ // 0 重置
                for(char i; i <= sizeof(record_tone) / sizeof(unsigned char); i++){
                    record_tone[i] = 0;
                }
                    record_counter = 0;
                    tempo_counter = 5;
                    time_counter = 0;
                    time = 0;
                    key = 2;
            }
            else if (press_value == 8 && key > 1){ // 8 降key
                key *= 0.5;
            }
            else if (press_value == 9 && key < 128){ // 9 升key
                key *= 2;
            }
            if(press_value == 10 && tempo_counter > 0){ // A 減速
                tempo_counter --;
                display = tempo_counter;
            }
            if(press_value == 11 && tempo_counter < 9){ // B 加速
                tempo_counter ++;
                display = tempo_counter;
            }
            if(press_value == 13){ // D 升單音
                if(sharp_flat == 0 || sharp_flat == 2){ 
                    sharp_flat = 1;
                }else{
                    sharp_flat = 0; // 在按一次回復無升降音
                }    
            }
            if(press_value == 14){ // E 降單音
                if(sharp_flat == 0 || sharp_flat == 1){
                    sharp_flat = 2;
                }else{
                    sharp_flat = 0; // 在按一次回復無升降音
                }            
            }
        }
        LED_Display(display);
        okey = num;
    }//end_of_while
}

