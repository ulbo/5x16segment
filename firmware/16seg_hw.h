/*************************  I n c l u d e  -  F i l e ***********************/
/*!
 *        \file  16seg_hw.h
 *
 *      \author  ulrich.bogensperger@
 *        $Date: $
 *    $Revision: $
 *
 *        \brief
 *
 *          Hardware settings for 5x15 segment display board.
 *
 *-------------------------------[ History ]---------------------------------
 *
 * $Log: $
 *
 *---------------------------------------------------------------------------
 * (c) Copyright 2016 by Ulrich Bogensperger, Nuernberg, Germany
 ****************************************************************************/

#ifndef __16SEG_HW_H
#define __16SEG_HW_H

/*--------------------------------------+
|   DEFINES                             |
+--------------------------------------*/

/* Port A */
#define LED_PORT_1          PORTA           /* LED segments */

#define LED_DP_M            0b00000010      /**< bit for decimal point segment */


/* Port B */
#define LED_1_M             0b00000001      /**< select display 1 */
#define LED_2_M             0b00000010      /**< select display 2 */
#define LED_3_M             0b00000100      /**< select display 3 */
#define LED_4_M             0b00001000      /**< select display 4 */
#define LED_5_M             0b00010000      /**< select display 5 */
#define PB_UNUSED_M         0b11100000      /**< unused pins on port B */

#define led_on( n )         do{ PORTB = 1 << (n); }while(0) /* simplification because other pins of PORTB are not used */
#define leds_off()          do{ PORTB = 0; }while(0)


/* Port C */
#define LED_PORT_2          PORTC           /* LED segments */

/* Port D */
#define LED_PORT_3          PORTD           /* used for LED segment D1 only */

#define RxD_M               0b00000001      /**< serial port RxD line */
#define TxD_M               0b00000010      /**< serial port TxD line */
#define AUX_1_M             0b00000100      /**< pin 1 on connector P1 */
#define AUX_2_M             0b00001000      /**< pin 2 on connector P1 */
#define AUX_3_M             0b00010000      /**< pin 3 on connector P1 */
#define AUX_4_M             0b00100000      /**< pin 4 on connector P1 */
#define AUX_5_M             0b01000000      /**< pin 5 on connector P1 */
#define LED_D1_M            0b10000000      /**< LED segment D1 */


/*--------------------------------------+
|   TYPEDEFS                            |
+--------------------------------------*/


/*--------------------------------------+
|   PROTOTYPES                          |
+--------------------------------------*/


#endif /* __16SEG_HW_H */
