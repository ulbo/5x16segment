Linkable 5x16-Segment LED Display Module
========================================

Hardware
--------

The module uses an Atmel ATmega32 MCU to control all LED segments. Input is done via RS232 interface with a voltage level of 5V.

Supply voltage: 5VDC, max. 200mA per module

Board layout is designed using KiCAD. It is tested for LDS8103-AX 16-segment displays (see /board/lds-8103.jpg), but should work with any common-cathode 16-segment display with same mechanical dimensions and pinout, e.g. Kingbright PSC08-11GWA. Because all pins, except the cathode at pin 11, are directly controlled by the MCU, LEDs with other pinouts can be used with adapted firmware.

Please note: The LED displays are soldered on the opposite board site than the ATmega.



Firmware
--------

Communication to modules is unidirectional with _9600 bps, 8N1_. Modules are daisy-chained, the RS232 output of the leftmost module is connected to the input of its right neighbour. Every module displays all incoming ASCII characters. If its 5-character memory is full, it passes all further incoming chars to its output, where it is received by the next display.

There are a few control characters, which are always passed immediately:

 * 0x01..0x06 : set display brightness, 1 is lowest
 * 0x10, 0x13 : <CR> or <LF> character reset the "cursor" to leftmost position
 

Compilation under Windows by Atmel Studio 7, Project file: /firmware/16segment.atsln
For Linux, /firmware/makefile is provided, see instructions there.

Firmware is flashed using the standard 6-pin ISP connector. File is /firmware/Release/16segment.hex

Fuse settings:

 * BODLEVEL = 2.7 V,
 * CLKSEL = Ext. Crystal, 8.0-16.0 MHz, 16K CK, 65ms start up time
 * BOOTSZ = 256 words
 * SPIEN enabled
 * TAGEN disabled
 * others: disabled



Character Set
-------------

 * 0x20 .. 0x7F : normal ASCII characters, small caps are currently rendered uppercase (may be changed in future release)
 * 0x80 .. 0x9F : a few "graphic" characters, arrows, etc.
 * 0xA0 .. 0xff : same as 0x20..0x7f, but with decimal point on

