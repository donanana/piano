eOrgan-108321062.hex : eOrgan-108321062.ihx
	packihx eOrgan-108321062.ihx > eOrgan-108321062.hex

eOrgan-108321062.ihx :eOrgan-108321062.rel
	sdcc -c eOrgan-108321062.rel

LED_Display.rel: LED_Display.c  LED_Display.h
	sdcc -c LED_Display.c

Keypad.rel: Keypad.c Keypad.h
	sdcc -c Keypad.c

myIO.lib: Keypad.rel LED_Display.rel
	sdar -rc myIO.lib Keypad.rel LED_Display.rel

eOrgan-108321062.rel: eOrgan-108321062.c myIO.lib
	sdcc eOrgan-108321062.c myIO.lib

clean:
	rm *.o *.h *.rel