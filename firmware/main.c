/**********************  P r o g r a m  -  M o d u l e ***********************/
/*!
 *        \file  main.c
 *
 *      \author  Ulrich Bogensperger
 *        $Date: $
 *    $Revision: $
 *
 *        \brief
 *
 *          Firmware for 5x16 segment display board
 *
 *          Chip type           : ATmega16 or ATmega32
 *          Clock frequency     : 16.000 MHz
 *
 *          Fuse settings: BODLEVEL = 2.7 V,
 *                         CLKSEL = Ext. Crystal, 8.0-16.0 MHz, 16K CK, 65ms start up time
 *                         BOOTSZ = 256 words
 *                         SPIEN enabled
 *                         JTAGEN disabled
 *                         others: disabled
 *
 *          Compiler (Atmel Studio 7):
 *              avr-gcc (AVR_8_bit_GNU_Toolchain_3.5.0_1662) 4.9.2
 *
 *          Compiler options:
 *              -Wall -funsigned-char -funsigned-bitfields -ffunction-sections 
 *              -fdata-sections -fpack-struct -fshort-enums -mmcu=atmega32 -Os 
 *
 *          Include Path:
 *              - C:\Program Files (x86)\Atmel\Studio\7.0\Packs\atmel\ATmega_DFP\1.0.90\include
 *
 *          Library Path:
 *              - C:\Program Files (x86)\Atmel\Studio\7.0\
 *
 *-------------------------------[ History ]---------------------------------
 *
 * $Log: $
 *
 *
 *---------------------------------------------------------------------------
 * (c) Copyright 2016, 2017 by Ulrich Bogensperger, Nuernberg, Germany
 ****************************************************************************/

#include "16seg.h"


/*--------------------------------------+
|   DEFINES                             |
+--------------------------------------*/
#define BRIGHT_STEPS        6                   /**< number of brightness steps */
#define BRIGHT_CT_MAX       (1 << BRIGHT_STEPS) /**< brightness counter max */

/*--------------------------------------+
|   TYPEDEFS                            |
+--------------------------------------*/
/* none */

/*--------------------------------------+
|   PROTOTYPES                          |
+--------------------------------------*/
/* none */

/*--------------------------------------+
|   GLOBALS                             |
+--------------------------------------*/
volatile uint16_t G_tick;               /**< system tick, incremented every 10ms */

uint8_t G_led_buffer[NLED][3];          /**< Buffer for LED segments to light. 
                                             Contains the values to be written to GPIOs. */

volatile uint8_t G_brightness = 5;      /**< display brightness 0..5 */
volatile uint8_t G_write_pos;           /**< current write position in G_led_buffer */

/** character table for 16 segment LED display */

/* 
 Port A:   7  6  5  4  3  2  1  0   Port C:  7  6  5  4  3  2  1  0   Port D:  7
 Segment:  A2 K  B G2  L  C DP D2            A1 J  H  F G1  M  N  E            D1
*/

const uint8_t G_chartable[0x80][3] PROGMEM = {
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x20  <space> */
    { 0b11000000, 0b10100100, 0b00000000 },     /* 0x21  ! */
    { 0b00000000, 0b01010000, 0b00000000 },     /* 0x22  " */
    { 0b00110101, 0b01001100, 0b10000000 },     /* 0x23  # */
    { 0b10010101, 0b11011100, 0b10000000 },     /* 0x24  $ */
    { 0b01011100, 0b00111010, 0b00000000 },     /* 0x25  % */
    { 0b11001101, 0b10101001, 0b10000000 },     /* 0x26  & */
    { 0b00000000, 0b01000000, 0b00000000 },     /* 0x27  ' */
    { 0b01001000, 0b00000000, 0b00000000 },     /* 0x28  ( */
    { 0b00000000, 0b00100010, 0b00000000 },     /* 0x29  ) */
    { 0b01011000, 0b01101110, 0b00000000 },     /* 0x2a  * */
    { 0b00010000, 0b01001100, 0b00000000 },     /* 0x2b  + */
    { 0b00000000, 0b00000010, 0b00000000 },     /* 0x2c  , */
    { 0b00010000, 0b00001000, 0b00000000 },     /* 0x2d  - */
    { 0b00000000, 0b00000100, 0b00000000 },     /* 0x2e  . */
    { 0b01000000, 0b00000010, 0b00000000 },     /* 0x2f  / */

    { 0b11100101, 0b10010011, 0b10000000 },     /* 0x30  0 */
    { 0b00100100, 0b00000000, 0b00000000 },     /* 0x31  1 */
    { 0b10110001, 0b10001001, 0b10000000 },     /* 0x32  2 */
    { 0b10110101, 0b10001000, 0b10000000 },     /* 0x33  3 */
    { 0b00110100, 0b00011000, 0b00000000 },     /* 0x34  4 */
    { 0b10010101, 0b10011000, 0b10000000 },     /* 0x35  5 */
    { 0b10010101, 0b10011001, 0b10000000 },     /* 0x36  6 */
    { 0b10100100, 0b10010000, 0b00000000 },     /* 0x37  7 */
    { 0b10110101, 0b10011001, 0b10000000 },     /* 0x38  8 */
    { 0b10110101, 0b10011000, 0b10000000 },     /* 0x39  9 */
    { 0b00000000, 0b01000100, 0b00000000 },     /* 0x3a  : */
    { 0b00000000, 0b01000010, 0b00000000 },     /* 0x3b  ; */
    { 0b01000001, 0b00000010, 0b10000000 },     /* 0x3c  < */
    { 0b00010001, 0b00001000, 0b10000000 },     /* 0x3d  = */
    { 0b00001001, 0b00100000, 0b10000000 },     /* 0x3e  > */
    { 0b10110000, 0b10000100, 0b00000000 },     /* 0x3f  ? */

    { 0b00100101, 0b10010101, 0b00000000 },     /* 0x40  @ */
    { 0b10110100, 0b10011001, 0b00000000 },     /* 0x41  A */
    { 0b11010101, 0b10011001, 0b10000000 },     /* 0x42  B */
    { 0b10000001, 0b10010001, 0b10000000 },     /* 0x43  C */
    { 0b10100101, 0b11000100, 0b10000000 },     /* 0x44  D */
    { 0b10010001, 0b10011001, 0b10000000 },     /* 0x45  E */
    { 0b10010000, 0b10011001, 0b00000000 },     /* 0x46  F */
    { 0b10010101, 0b10010001, 0b10000000 },     /* 0x47  G */
    { 0b00110100, 0b00011001, 0b00000000 },     /* 0x48  H */
    { 0b10000001, 0b11000100, 0b10000000 },     /* 0x49  I */
    { 0b00100101, 0b00000001, 0b10000000 },     /* 0x4a  J */
    { 0b01001000, 0b00011001, 0b00000000 },     /* 0x4b  K */
    { 0b00000001, 0b00010001, 0b10000000 },     /* 0x4c  L */
    { 0b01100100, 0b00110001, 0b00000000 },     /* 0x4d  M */
    { 0b00101100, 0b00110001, 0b00000000 },     /* 0x4e  N */
    { 0b10100101, 0b10010001, 0b10000000 },     /* 0x4f  O */

    { 0b10110000, 0b10011001, 0b00000000 },     /* 0x50  P */
    { 0b10101101, 0b10010001, 0b10000000 },     /* 0x51  Q */
    { 0b10111000, 0b10011001, 0b00000000 },     /* 0x52  R */
    { 0b10010101, 0b10100000, 0b10000000 },     /* 0x53  S */
    { 0b10000000, 0b11000100, 0b00000000 },     /* 0x54  T */
    { 0b00100101, 0b00010001, 0b10000000 },     /* 0x55  U */
    { 0b01000000, 0b00010011, 0b00000000 },     /* 0x56  V */
    { 0b00101100, 0b00010011, 0b00000000 },     /* 0x57  W */
    { 0b01001000, 0b00100010, 0b00000000 },     /* 0x58  X */
    { 0b01000000, 0b00100100, 0b00000000 },     /* 0x59  Y */
    { 0b11000001, 0b10000010, 0b10000000 },     /* 0x5a  Z */
    { 0b10000001, 0b01000100, 0b00000000 },     /* 0x5b  [ */
    { 0b00001000, 0b00100000, 0b00000000 },     /* 0x5c  \ */
    { 0b00000000, 0b11000100, 0b10000000 },     /* 0x5d  ] */
    { 0b00000000, 0b00110000, 0b00000000 },     /* 0x5e  ^ */
    { 0b00000001, 0b00000000, 0b10000000 },     /* 0x5f  _ */

    { 0b01000000, 0b00000000, 0b00000000 },     /* 0x60  <backtick> */
    { 0b10110100, 0b10011001, 0b00000000 },     /* 0x61  a */ /* small caps have same glyphs as large caps */
    { 0b11010101, 0b10011001, 0b10000000 },     /* 0x62  b */
    { 0b10000001, 0b10010001, 0b10000000 },     /* 0x63  c */
    { 0b10100101, 0b11000100, 0b10000000 },     /* 0x64  d */
    { 0b10010001, 0b10011001, 0b10000000 },     /* 0x65  e */
    { 0b10010000, 0b10011001, 0b00000000 },     /* 0x66  f */
    { 0b10010101, 0b10010001, 0b10000000 },     /* 0x67  g */
    { 0b00110100, 0b00011001, 0b00000000 },     /* 0x68  h */
    { 0b10000001, 0b11000100, 0b10000000 },     /* 0x69  i */
    { 0b00100101, 0b00000001, 0b10000000 },     /* 0x6a  j */
    { 0b01001000, 0b00011001, 0b00000000 },     /* 0x6b  k */
    { 0b00000001, 0b00010001, 0b10000000 },     /* 0x6c  l */
    { 0b01100100, 0b00110001, 0b00000000 },     /* 0x6d  m */
    { 0b00101100, 0b00110001, 0b00000000 },     /* 0x6e  n */
    { 0b10100101, 0b10010001, 0b10000000 },     /* 0x6f  o */

    { 0b10110000, 0b10011001, 0b00000000 },     /* 0x70  p */
    { 0b10101101, 0b10010001, 0b10000000 },     /* 0x71  q */
    { 0b10111000, 0b10011001, 0b00000000 },     /* 0x72  r */
    { 0b10010101, 0b10100000, 0b10000000 },     /* 0x73  s */
    { 0b10000000, 0b11000100, 0b00000000 },     /* 0x74  t */
    { 0b00100101, 0b00010001, 0b10000000 },     /* 0x75  u */
    { 0b01000000, 0b00010011, 0b00000000 },     /* 0x76  v */
    { 0b00101100, 0b00010011, 0b00000000 },     /* 0x77  w */
    { 0b01001000, 0b00100010, 0b00000000 },     /* 0x78  x */
    { 0b01000000, 0b00100100, 0b00000000 },     /* 0x79  y */
    { 0b11000001, 0b10000010, 0b10000000 },     /* 0x7a  z */
    { 0b10000001, 0b01001100, 0b00000000 },     /* 0x7b  { */
    { 0b00000000, 0b00010001, 0b00000000 },     /* 0x7c  | */
    { 0b00010000, 0b11000100, 0b10000000 },     /* 0x7d  } */
    { 0b00110000, 0b00110000, 0b00000000 },     /* 0x7e  ~ */
    { 0b11111111, 0b11111111, 0b00000000 },     /* 0x7f  <all segments> */
        
    /* 0x80..0x9f graphic characters */
    { 0b00000000, 0b01000000, 0b00000000 },     /* 0x80  <North> */
    { 0b01000000, 0b00000000, 0b00000000 },     /* 0x81  <NE> */
    { 0b00010000, 0b00000000, 0b00000000 },     /* 0x82  <East> */
    { 0b00001000, 0b00000000, 0b00000000 },     /* 0x83  <SE> */
    { 0b00000000, 0b00000100, 0b00000000 },     /* 0x84  <South> */
    { 0b00000000, 0b00000010, 0b00000000 },     /* 0x85  <SW> */
    { 0b00000000, 0b00001000, 0b00000000 },     /* 0x86  <West> */
    { 0b00000000, 0b00100000, 0b00000000 },     /* 0x87  <NW> */

    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x88  <> */  // TODO
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x89  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x8a  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x8b  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x8c  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x8d  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x8e  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x8f  <> */

    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x90  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x91  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x92  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x93  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x94  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x95  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x96  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x97  <> */
    
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x98  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x99  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x9a  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x9b  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x9c  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x9d  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x9e  <> */
    { 0b00000000, 0b00000000, 0b00000000 },     /* 0x9f  <> */

};
   

/**********************************************************************/
ISR( TIMER0_COMP_vect )
{
    static uint16_t tick = 0;
    static uint8_t led_ix, bright_ct;
    
    /* G_tick is incremented every 10ms */
    if( tick >= TICKS_PER_SEC_0 / 100 ) {
        ++G_tick;
        tick = 0;
    }        

    /* do LED multiplexing */
    
    if( bright_ct < (1 << G_brightness) ) {
        led_on( led_ix );
    
        LED_PORT_1 = G_led_buffer[led_ix][0];
        LED_PORT_2 = G_led_buffer[led_ix][1];
        LED_PORT_3 &= ~LED_D1_M;
        LED_PORT_3 |= G_led_buffer[led_ix][2] & LED_D1_M;
    }
    else {
        leds_off();
    }
    
    if( ++bright_ct >= BRIGHT_CT_MAX ) {
        bright_ct = 0;
        
        if( ++led_ix >= NLED ) {
            led_ix = 0;
        }
    }
}


/**********************************************************************/
/** Calculate LED segments from ASCII char.
 *
 */
void
ascii2segments( uint8_t c, uint8_t *port1, uint8_t *port2, uint8_t *port3 )
{
    if( c < 0x20 ) {
        /* 
         * The first 32 ASCII characters are control characters.
         * These are rendered as blanks.
         */
        *port1 = *port2 = *port3 = 0;
    }
    else if( c < 0xa0 ) {
        /*
         * 0x20..0x7F: Normal ASCII characters. Taken from character table.
         * 0x80..0x9F: A few "graphic" characters here. Also taken from table.
         */
        c -= 0x20;
        *port1 = pgm_read_byte( &G_chartable[c][0] );
        *port2 = pgm_read_byte( &G_chartable[c][1] );
        *port3 = pgm_read_byte( &G_chartable[c][2] );
    }
    else {
        /*
         * Remaining characters are ASCII characters again, 
         * but with decimal point on.
         */
        c -= 0xa0;
        *port1 = pgm_read_byte( &G_chartable[c][0] ) | LED_DP_M;
        *port2 = pgm_read_byte( &G_chartable[c][1] );
        *port3 = pgm_read_byte( &G_chartable[c][2] );
    }
}


/**********************************************************************/
/** Initialize IO ports
 *
 */
void
io_init( void )
{
    /* Port A initialization */
	PORTA = 0;
	DDRA = 0xff;
    
    /* Port B initialization */
    PORTB = 0;
    DDRB = LED_1_M | LED_2_M | LED_3_M | LED_4_M | LED_5_M | PB_UNUSED_M;
    
    /* Port C initialization */
    PORTC = 0;
    DDRC = 0xff;
    
    /* Port D initialization */
	PORTD = TxD_M | RxD_M | AUX_1_M | AUX_2_M | AUX_3_M | AUX_4_M | AUX_5_M | LED_D1_M;
	DDRD = TxD_M | LED_D1_M;
}


/**********************************************************************/
/** Timer 0 initialization
 *
 *  Timer controls the refresh of the 16-segment LEDs.
 *  Brightness is done by PWM. Because its perception is exponential,
 *  we need for e.g. 6 levels a time slot of 1/64 of maximum brightness.
 *
 *  Timing:
 *   - complete refresh (all 5 LEDs): 100Hz = 10ms
 *   - refresh per LED              : 10ms / 5 = 2ms
 *   - 6 brightness levels          : 2ms / 64 = 31.25us
 */
void
timer0_init( void )
{
    /* CTC mode, prescaler 8 */
    TCCR0 = 0x0a;
    TCNT0 = 0x00;
    OCR0 = (F_CPU / 8L / TICKS_PER_SEC_0 ) - 1;

    /* Compare A Match IRQ enable */
    TIMSK = _BV( OCF0 );
}


/**********************************************************************/
/** Initialization of UART for host communication
 *
 *  Simple implementation without using interrupts.
 */
void
uart_init( void )
{
    /*
     * USART initialization ;
     * Communication Parameters: 8 Data, 1 Stop, No Parity ;
     * USART Receiver: On ;
     * USART Transmitter: On ;
     * USART Mode: Asynchronous ;
     * USART Baud Rate: BAUDRATE
     */
    UCSRA = 0x00;
    UCSRB = 0x18;   /* no interrupts */
    UCSRC = 0x06;

    /* 
     * Calculate values for UBRR, see formula in chap. 
     * "USART, Clock Generation" in ATmega32 datasheet 
     */
    UBRRH = (((F_CPU / 16) / BAUDRATE) - 1) >> 8;
    UBRRL = (((F_CPU / 16) / BAUDRATE) - 1) % 0xff;
}


/**********************************************************************/
static inline void
uart_putc( char c )
{
    loop_until_bit_is_set( UCSRA, UDRE );
    UDR = c;
}


/**********************************************************************/
void
handle_uart( void )
{
    uint8_t c;
    
    /* something received ? */
    if( UCSRA & _BV(RXC) ) {
        c = UDR;
        
        /* handle control characters */
        if( IN_RANGE( c, 1, BRIGHT_STEPS) ) {
            /* set display brightness, valid: 1..BRIGHT_STEPS */
            G_brightness = c - 1;
            
            /* forward control character to next display in chain */
            uart_putc( c );
        }
        else if( c == '\n' || c == '\r' ) {
            /* reset write position of display buffer */
            G_write_pos = 0;
            
            /* forward control character */
            uart_putc( c );
            
            /* possible improvement: re-init UART, if no '\n' char was received for 60 seconds */
        }
        else if( c >= 0x20 ) {
            /* printable --> display incoming char */
            
            if( G_write_pos < NLED ) {
                ascii2segments( c,  &G_led_buffer[G_write_pos][0],
                                    &G_led_buffer[G_write_pos][1],
                                    &G_led_buffer[G_write_pos][2] );
                ++G_write_pos;                                    
            }
            else {
                /* forward char to next display in chain */
                uart_putc( c );
            }
        }
    }
}


/**********************************************************************/
int
main(void)
{
    #if ENABLE_WATCHDOG != 0
    wdt_enable( WDTO_250MS );
    #endif

    /* initialize hardware */
    io_init();
    timer0_init();
    uart_init();

    /* interrupts go! */
    sei();

    /* Main Loop */
    for(;;) {
        wdt_reset();
        handle_uart();
    }
    
    return 0;
}
