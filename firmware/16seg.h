/*************************  I n c l u d e  -  F i l e ***********************/
/*!
 *        \file  16seg.h
 *
 *      \author  ulrich.bogensperger@
 *        $Date: $
 *    $Revision: $
 *
 *        \brief
 *
 *          General includes for 5x16 segment display board.
 *
 *-------------------------------[ History ]---------------------------------
 *
 * $Log: $
 *
 *---------------------------------------------------------------------------
 * (c) Copyright 2016 by Ulrich Bogensperger, Nuernberg, Germany
 ****************************************************************************/

#ifndef __16SEG_H
#define __16SEG_H

#ifndef F_CPU
#define F_CPU         16000000
#endif  /* F_CPU */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdbool.h>
#include <avr/io.h>
#include <util/delay.h>
#include <util/crc16.h>
#include <util/atomic.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr/power.h>
#include <avr/pgmspace.h>
#include <avr/wdt.h>

#include "16seg_hw.h"


/*--------------------------------------+
|   DEFINES                             |
+--------------------------------------*/

/*** Application definitions ****/

#define DEVICE_NAME     "16SEG"     /**< device name */
#define VERSION         0x00        /**< firmware version (increment at release !!!) */
#define ENABLE_WATCHDOG 0		    /**< use watchdog (enable at release !!!) */

#define BAUDRATE        9600        /**< baudrate for serial communication (bits/sec) */

#define TICKS_PER_SEC_0     32000   /**< number of timer0 ticks per second */
#define MSEC_PER_TICK_0     (1000 / TICKS_PER_SEC_1)  /**< milliseconds per timer0 tick */
#define NLED                5       /**< number of 16-segment LED displays to handle */

/* misc */
#define MIN( a, b )         ((a)<(b) ? (a) : (b))
#define MAX( a, b )         ((a)>(b) ? (a) : (b))
#define IN_RANGE( n, a, b ) (((n)>=(a)) && ((n)<=(b)))


/*--------------------------------------+
|   TYPEDEFS                            |
+--------------------------------------*/


/*--------------------------------------+
|   PROTOTYPES                          |
+--------------------------------------*/


#endif /* __16SEG_H */
