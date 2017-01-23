EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:16segment-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "16-Segment LED Display"
Date "2016-09-01"
Rev "0.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA16-A IC1
U 1 1 58091D5B
P 2400 3000
F 0 "IC1" H 1450 4880 50  0000 L BNN
F 1 "ATMEGA16-A" H 2900 1050 50  0000 L BNN
F 2 "Housings_QFP:TQFP-44_10x10mm_Pitch0.8mm" H 2400 3000 50  0000 C CIN
F 3 "" H 2400 3000 50  0000 C CNN
	1    2400 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 58091D5C
P 2100 5200
F 0 "#PWR01" H 2100 4950 50  0001 C CNN
F 1 "GND" H 2100 5050 50  0000 C CNN
F 2 "" H 2100 5200 50  0000 C CNN
F 3 "" H 2100 5200 50  0000 C CNN
	1    2100 5200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 58091D5D
P 4750 3300
F 0 "#PWR02" H 4750 3050 50  0001 C CNN
F 1 "GND" H 4750 3150 50  0000 C CNN
F 2 "" H 4750 3300 50  0000 C CNN
F 3 "" H 4750 3300 50  0000 C CNN
	1    4750 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 58091D5E
P 5000 4950
F 0 "#PWR03" H 5000 4700 50  0001 C CNN
F 1 "GND" H 5000 4800 50  0000 C CNN
F 2 "" H 5000 4950 50  0000 C CNN
F 3 "" H 5000 4950 50  0000 C CNN
	1    5000 4950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR04
U 1 1 58091D5F
P 2100 900
F 0 "#PWR04" H 2100 750 50  0001 C CNN
F 1 "VCC" H 2100 1050 50  0000 C CNN
F 2 "" H 2100 900 50  0000 C CNN
F 3 "" H 2100 900 50  0000 C CNN
	1    2100 900 
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 58091D60
P 5000 3800
F 0 "#PWR05" H 5000 3650 50  0001 C CNN
F 1 "VCC" H 5000 3950 50  0000 C CNN
F 2 "" H 5000 3800 50  0000 C CNN
F 3 "" H 5000 3800 50  0000 C CNN
	1    5000 3800
	1    0    0    -1  
$EndComp
$Comp
L Crystal_Small X1
U 1 1 58091D61
P 1150 1900
F 0 "X1" H 1150 2000 50  0000 C CNN
F 1 "16 MHz" V 850 1750 50  0000 L CNN
F 2 "Crystals:Q_49U3HMS" H 1150 1900 50  0001 C CNN
F 3 "" H 1150 1900 50  0000 C CNN
	1    1150 1900
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 58091D62
P 850 1700
F 0 "C1" H 875 1800 50  0000 L CNN
F 1 "15pF" H 875 1600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 888 1550 50  0001 C CNN
F 3 "" H 850 1700 50  0000 C CNN
	1    850  1700
	0    1    1    0   
$EndComp
$Comp
L C C2
U 1 1 58091D63
P 850 2100
F 0 "C2" H 875 2200 50  0000 L CNN
F 1 "15pF" H 875 2000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 888 1950 50  0001 C CNN
F 3 "" H 850 2100 50  0000 C CNN
	1    850  2100
	0    1    1    0   
$EndComp
$Comp
L CONN_02X03 P2
U 1 1 58091D64
P 4500 2700
F 0 "P2" H 4500 2900 50  0000 C CNN
F 1 "AVR ISP" H 4500 3000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03" H 4500 1500 50  0001 C CNN
F 3 "" H 4500 1500 50  0000 C CNN
	1    4500 2700
	1    0    0    1   
$EndComp
$Comp
L BC817-40 Q2
U 1 1 58091D65
P 8200 2450
F 0 "Q2" H 8400 2525 50  0000 L CNN
F 1 "BC817-40" H 8400 2450 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 7350 2000 50  0000 L CIN
F 3 "" H 8200 2450 50  0000 L CNN
	1    8200 2450
	1    0    0    -1  
$EndComp
$Comp
L BC817-40 Q3
U 1 1 58091D66
P 8200 4800
F 0 "Q3" H 8400 4875 50  0000 L CNN
F 1 "BC817-40" H 8400 4800 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 7350 4350 50  0000 L CIN
F 3 "" H 8200 4800 50  0000 L CNN
	1    8200 4800
	1    0    0    -1  
$EndComp
$Comp
L BC817-40 Q1
U 1 1 58091D67
P 6050 2450
F 0 "Q1" H 6250 2525 50  0000 L CNN
F 1 "BC817-40" H 6250 2450 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 5500 2000 50  0000 L CIN
F 3 "" H 6050 2450 50  0000 L CNN
	1    6050 2450
	1    0    0    -1  
$EndComp
$Comp
L LDS-8103AX LED1
U 1 1 58091D68
P 5550 1600
F 0 "LED1" H 5550 2200 60  0000 C CNN
F 1 "LDS-8103AX" H 5550 1000 60  0000 C CNN
F 2 "LDS8103-AX:LDS8103-AX_rev" H 5900 1200 60  0001 C CNN
F 3 "" H 5900 1200 60  0001 C CNN
	1    5550 1600
	1    0    0    -1  
$EndComp
$Comp
L LDS-8103AX LED2
U 1 1 58091D69
P 7700 1600
F 0 "LED2" H 7700 2200 60  0000 C CNN
F 1 "LDS-8103AX" H 7700 1000 60  0000 C CNN
F 2 "LDS8103-AX:LDS8103-AX_rev" H 8050 1200 60  0001 C CNN
F 3 "" H 8050 1200 60  0001 C CNN
	1    7700 1600
	1    0    0    -1  
$EndComp
$Comp
L LDS-8103AX LED3
U 1 1 58091D6A
P 7700 4000
F 0 "LED3" H 7700 4600 60  0000 C CNN
F 1 "LDS-8103AX" H 7700 3400 60  0000 C CNN
F 2 "LDS8103-AX:LDS8103-AX_rev" H 8050 3600 60  0001 C CNN
F 3 "" H 8050 3600 60  0001 C CNN
	1    7700 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 58091D6B
P 6150 2650
F 0 "#PWR06" H 6150 2400 50  0001 C CNN
F 1 "GND" H 6150 2500 50  0000 C CNN
F 2 "" H 6150 2650 50  0000 C CNN
F 3 "" H 6150 2650 50  0000 C CNN
	1    6150 2650
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 58091D6C
P 3800 1300
F 0 "R11" V 3750 1100 50  0000 C CNN
F 1 "180" V 3800 1300 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3730 1300 50  0001 C CNN
F 3 "" H 3800 1300 50  0000 C CNN
	1    3800 1300
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 58091D6D
P 3800 1400
F 0 "R12" V 3750 1200 50  0000 C CNN
F 1 "180" V 3800 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3730 1400 50  0001 C CNN
F 3 "" H 3800 1400 50  0000 C CNN
	1    3800 1400
	0    1    1    0   
$EndComp
$Comp
L R R13
U 1 1 58091D6E
P 3800 1500
F 0 "R13" V 3750 1300 50  0000 C CNN
F 1 "180" V 3800 1500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3730 1500 50  0001 C CNN
F 3 "" H 3800 1500 50  0000 C CNN
	1    3800 1500
	0    1    1    0   
$EndComp
$Comp
L R R14
U 1 1 58091D6F
P 3800 1600
F 0 "R14" V 3750 1400 50  0000 C CNN
F 1 "180" V 3800 1600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3730 1600 50  0001 C CNN
F 3 "" H 3800 1600 50  0000 C CNN
	1    3800 1600
	0    1    1    0   
$EndComp
$Comp
L R R15
U 1 1 58091D70
P 3800 1700
F 0 "R15" V 3750 1500 50  0000 C CNN
F 1 "180" V 3800 1700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3730 1700 50  0001 C CNN
F 3 "" H 3800 1700 50  0000 C CNN
	1    3800 1700
	0    1    1    0   
$EndComp
$Comp
L R R16
U 1 1 58091D71
P 3800 1800
F 0 "R16" V 3750 1600 50  0000 C CNN
F 1 "180" V 3800 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3730 1800 50  0001 C CNN
F 3 "" H 3800 1800 50  0000 C CNN
	1    3800 1800
	0    1    1    0   
$EndComp
$Comp
L R R17
U 1 1 58091D72
P 3800 1900
F 0 "R17" V 3750 1700 50  0000 C CNN
F 1 "180" V 3800 1900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3730 1900 50  0001 C CNN
F 3 "" H 3800 1900 50  0000 C CNN
	1    3800 1900
	0    1    1    0   
$EndComp
$Comp
L R R18
U 1 1 58091D73
P 3800 2000
F 0 "R18" V 3750 1800 50  0000 C CNN
F 1 "180" V 3800 2000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3730 2000 50  0001 C CNN
F 3 "" H 3800 2000 50  0000 C CNN
	1    3800 2000
	0    1    1    0   
$EndComp
$Comp
L GND #PWR07
U 1 1 58091D74
P 8300 2650
F 0 "#PWR07" H 8300 2400 50  0001 C CNN
F 1 "GND" H 8300 2500 50  0000 C CNN
F 2 "" H 8300 2650 50  0000 C CNN
F 3 "" H 8300 2650 50  0000 C CNN
	1    8300 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 58091D75
P 8300 5000
F 0 "#PWR08" H 8300 4750 50  0001 C CNN
F 1 "GND" H 8300 4850 50  0000 C CNN
F 2 "" H 8300 5000 50  0000 C CNN
F 3 "" H 8300 5000 50  0000 C CNN
	1    8300 5000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR09
U 1 1 58091D76
P 1250 6700
F 0 "#PWR09" H 1250 6550 50  0001 C CNN
F 1 "VCC" H 1250 6850 50  0000 C CNN
F 2 "" H 1250 6700 50  0000 C CNN
F 3 "" H 1250 6700 50  0000 C CNN
	1    1250 6700
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR010
U 1 1 58091D77
P 1600 6700
F 0 "#PWR010" H 1600 6550 50  0001 C CNN
F 1 "VCC" H 1600 6850 50  0000 C CNN
F 2 "" H 1600 6700 50  0000 C CNN
F 3 "" H 1600 6700 50  0000 C CNN
	1    1600 6700
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR011
U 1 1 58091D78
P 1950 6700
F 0 "#PWR011" H 1950 6550 50  0001 C CNN
F 1 "VCC" H 1950 6850 50  0000 C CNN
F 2 "" H 1950 6700 50  0000 C CNN
F 3 "" H 1950 6700 50  0000 C CNN
	1    1950 6700
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 58091D79
P 1250 6850
F 0 "C4" H 1275 6950 50  0000 L CNN
F 1 "100nF" H 1275 6750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1288 6700 50  0001 C CNN
F 3 "" H 1250 6850 50  0000 C CNN
	1    1250 6850
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 58091D7A
P 1600 6850
F 0 "C5" H 1625 6950 50  0000 L CNN
F 1 "100nF" H 1625 6750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1638 6700 50  0001 C CNN
F 3 "" H 1600 6850 50  0000 C CNN
	1    1600 6850
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 58091D7B
P 1950 6850
F 0 "C6" H 1975 6950 50  0000 L CNN
F 1 "100nF" H 1975 6750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1988 6700 50  0001 C CNN
F 3 "" H 1950 6850 50  0000 C CNN
	1    1950 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 58091D7C
P 1250 7000
F 0 "#PWR012" H 1250 6750 50  0001 C CNN
F 1 "GND" H 1250 6850 50  0000 C CNN
F 2 "" H 1250 7000 50  0000 C CNN
F 3 "" H 1250 7000 50  0000 C CNN
	1    1250 7000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 58091D7D
P 1600 7000
F 0 "#PWR013" H 1600 6750 50  0001 C CNN
F 1 "GND" H 1600 6850 50  0000 C CNN
F 2 "" H 1600 7000 50  0000 C CNN
F 3 "" H 1600 7000 50  0000 C CNN
	1    1600 7000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 58091D7E
P 1950 7000
F 0 "#PWR014" H 1950 6750 50  0001 C CNN
F 1 "GND" H 1950 6850 50  0000 C CNN
F 2 "" H 1950 7000 50  0000 C CNN
F 3 "" H 1950 7000 50  0000 C CNN
	1    1950 7000
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 58091D7F
P 1150 2750
F 0 "C3" H 1175 2850 50  0000 L CNN
F 1 "100nF" H 1175 2650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1188 2600 50  0001 C CNN
F 3 "" H 1150 2750 50  0000 C CNN
	1    1150 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 58091D80
P 1150 2900
F 0 "#PWR015" H 1150 2650 50  0001 C CNN
F 1 "GND" H 1150 2750 50  0000 C CNN
F 2 "" H 1150 2900 50  0000 C CNN
F 3 "" H 1150 2900 50  0000 C CNN
	1    1150 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 58091D81
P 700 2400
F 0 "#PWR016" H 700 2150 50  0001 C CNN
F 1 "GND" H 700 2250 50  0000 C CNN
F 2 "" H 700 2400 50  0000 C CNN
F 3 "" H 700 2400 50  0000 C CNN
	1    700  2400
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR017
U 1 1 58091D82
P 5000 2800
F 0 "#PWR017" H 5000 2650 50  0001 C CNN
F 1 "VCC" H 5000 2950 50  0000 C CNN
F 2 "" H 5000 2800 50  0000 C CNN
F 3 "" H 5000 2800 50  0000 C CNN
	1    5000 2800
	1    0    0    -1  
$EndComp
Text Label 1300 1300 2    60   ~ 0
RESET
Text Label 4250 2600 2    60   ~ 0
RESET
Text Label 4950 1300 2    60   ~ 0
LED_A1
Text Label 4950 1400 2    60   ~ 0
LED_A2
Text Label 4950 1500 2    60   ~ 0
LED_B
Text Label 4950 1600 2    60   ~ 0
LED_C
Text Label 4950 1700 2    60   ~ 0
LED_D1
Text Label 4950 1800 2    60   ~ 0
LED_D2
Text Label 4950 1900 2    60   ~ 0
LED_E
Text Label 4950 2000 2    60   ~ 0
LED_F
Text Label 7100 1300 2    60   ~ 0
LED_A1
Text Label 7100 1400 2    60   ~ 0
LED_A2
Text Label 7100 1500 2    60   ~ 0
LED_B
Text Label 7100 1600 2    60   ~ 0
LED_C
Text Label 7100 1700 2    60   ~ 0
LED_D1
Text Label 7100 1800 2    60   ~ 0
LED_D2
Text Label 7100 1900 2    60   ~ 0
LED_E
Text Label 7100 2000 2    60   ~ 0
LED_F
Text Label 7100 3700 2    60   ~ 0
LED_A1
Text Label 7100 3800 2    60   ~ 0
LED_A2
Text Label 7100 3900 2    60   ~ 0
LED_B
Text Label 7100 4000 2    60   ~ 0
LED_C
Text Label 7100 4100 2    60   ~ 0
LED_D1
Text Label 7100 4200 2    60   ~ 0
LED_D2
Text Label 7100 4300 2    60   ~ 0
LED_E
Text Label 7100 4400 2    60   ~ 0
LED_F
Text Label 4950 1200 2    60   ~ 0
LED_DP
Text Label 7100 1200 2    60   ~ 0
LED_DP
$Comp
L R R2
U 1 1 58091D83
P 3650 3100
F 0 "R2" V 3600 3300 50  0000 C CNN
F 1 "180" V 3650 3100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3580 3100 50  0001 C CNN
F 3 "" H 3650 3100 50  0000 C CNN
	1    3650 3100
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 58091D84
P 3650 3200
F 0 "R3" V 3600 3400 50  0000 C CNN
F 1 "180" V 3650 3200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3580 3200 50  0001 C CNN
F 3 "" H 3650 3200 50  0000 C CNN
	1    3650 3200
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 58091D85
P 3650 3300
F 0 "R4" V 3600 3500 50  0000 C CNN
F 1 "180" V 3650 3300 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3580 3300 50  0001 C CNN
F 3 "" H 3650 3300 50  0000 C CNN
	1    3650 3300
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 58091D86
P 3650 3400
F 0 "R5" V 3600 3600 50  0000 C CNN
F 1 "180" V 3650 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3580 3400 50  0001 C CNN
F 3 "" H 3650 3400 50  0000 C CNN
	1    3650 3400
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 58091D87
P 3650 3500
F 0 "R6" V 3600 3700 50  0000 C CNN
F 1 "180" V 3650 3500 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3580 3500 50  0001 C CNN
F 3 "" H 3650 3500 50  0000 C CNN
	1    3650 3500
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 58091D88
P 3650 3600
F 0 "R7" V 3600 3800 50  0000 C CNN
F 1 "180" V 3650 3600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3580 3600 50  0001 C CNN
F 3 "" H 3650 3600 50  0000 C CNN
	1    3650 3600
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 58091D89
P 3650 3700
F 0 "R8" V 3600 3900 50  0000 C CNN
F 1 "180" V 3650 3700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3580 3700 50  0001 C CNN
F 3 "" H 3650 3700 50  0000 C CNN
	1    3650 3700
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 58091D8A
P 3650 3800
F 0 "R9" V 3600 4000 50  0000 C CNN
F 1 "180" V 3650 3800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3580 3800 50  0001 C CNN
F 3 "" H 3650 3800 50  0000 C CNN
	1    3650 3800
	0    1    1    0   
$EndComp
Text Label 6150 1200 0    60   ~ 0
LED_G1
Text Label 6150 1300 0    60   ~ 0
LED_G2
Text Label 6150 1400 0    60   ~ 0
LED_H
Text Label 6150 1500 0    60   ~ 0
LED_J
Text Label 6150 1600 0    60   ~ 0
LED_K
Text Label 6150 1800 0    60   ~ 0
LED_M
Text Label 6150 1900 0    60   ~ 0
LED_N
Text Label 6150 1700 0    60   ~ 0
LED_L
Text Label 8300 1200 0    60   ~ 0
LED_G1
Text Label 8300 1300 0    60   ~ 0
LED_G2
Text Label 8300 1400 0    60   ~ 0
LED_H
Text Label 8300 1500 0    60   ~ 0
LED_J
Text Label 8300 1600 0    60   ~ 0
LED_K
Text Label 8300 1700 0    60   ~ 0
LED_L
Text Label 8300 1800 0    60   ~ 0
LED_M
Text Label 8300 1900 0    60   ~ 0
LED_N
Text Label 8300 3600 0    60   ~ 0
LED_G1
Text Label 8300 3700 0    60   ~ 0
LED_G2
Text Label 8300 3800 0    60   ~ 0
LED_H
Text Label 8300 3900 0    60   ~ 0
LED_J
Text Label 8300 4000 0    60   ~ 0
LED_K
Text Label 8300 4100 0    60   ~ 0
LED_L
Text Label 8300 4200 0    60   ~ 0
LED_M
Text Label 8300 4300 0    60   ~ 0
LED_N
$Comp
L BC817-40 Q4
U 1 1 58091D8B
P 10250 2450
F 0 "Q4" H 10450 2525 50  0000 L CNN
F 1 "BC817-40" H 10450 2450 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 9300 2000 50  0000 L CIN
F 3 "" H 10250 2450 50  0000 L CNN
	1    10250 2450
	1    0    0    -1  
$EndComp
$Comp
L LDS-8103AX LED4
U 1 1 58091D8C
P 9750 1600
F 0 "LED4" H 9750 2200 60  0000 C CNN
F 1 "LDS-8103AX" H 9750 1000 60  0000 C CNN
F 2 "LDS8103-AX:LDS8103-AX_rev" H 10100 1200 60  0001 C CNN
F 3 "" H 10100 1200 60  0001 C CNN
	1    9750 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 58091D8D
P 10350 2650
F 0 "#PWR018" H 10350 2400 50  0001 C CNN
F 1 "GND" H 10350 2500 50  0000 C CNN
F 2 "" H 10350 2650 50  0000 C CNN
F 3 "" H 10350 2650 50  0000 C CNN
	1    10350 2650
	1    0    0    -1  
$EndComp
Text Label 9150 1300 2    60   ~ 0
LED_A1
Text Label 9150 1400 2    60   ~ 0
LED_A2
Text Label 9150 1500 2    60   ~ 0
LED_B
Text Label 9150 1600 2    60   ~ 0
LED_C
Text Label 9150 1700 2    60   ~ 0
LED_D1
Text Label 9150 1800 2    60   ~ 0
LED_D2
Text Label 9150 1900 2    60   ~ 0
LED_E
Text Label 9150 2000 2    60   ~ 0
LED_F
Text Label 9150 1200 2    60   ~ 0
LED_DP
Text Label 10350 1200 0    60   ~ 0
LED_G1
Text Label 10350 1300 0    60   ~ 0
LED_G2
Text Label 10350 1400 0    60   ~ 0
LED_H
Text Label 10350 1500 0    60   ~ 0
LED_J
Text Label 10350 1600 0    60   ~ 0
LED_K
Text Label 10350 1700 0    60   ~ 0
LED_L
Text Label 10350 1800 0    60   ~ 0
LED_M
Text Label 10350 1900 0    60   ~ 0
LED_N
$Comp
L BC817-40 Q5
U 1 1 58091D8E
P 10250 4850
F 0 "Q5" H 10450 4925 50  0000 L CNN
F 1 "BC817-40" H 10450 4850 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 9300 4400 50  0000 L CIN
F 3 "" H 10250 4850 50  0000 L CNN
	1    10250 4850
	1    0    0    -1  
$EndComp
$Comp
L LDS-8103AX LED5
U 1 1 58091D8F
P 9750 4000
F 0 "LED5" H 9750 4600 60  0000 C CNN
F 1 "LDS-8103AX" H 9750 3400 60  0000 C CNN
F 2 "LDS8103-AX:LDS8103-AX_rev" H 10100 3600 60  0001 C CNN
F 3 "" H 10100 3600 60  0001 C CNN
	1    9750 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 58091D90
P 10350 5050
F 0 "#PWR019" H 10350 4800 50  0001 C CNN
F 1 "GND" H 10350 4900 50  0000 C CNN
F 2 "" H 10350 5050 50  0000 C CNN
F 3 "" H 10350 5050 50  0000 C CNN
	1    10350 5050
	1    0    0    -1  
$EndComp
Text Label 9150 3700 2    60   ~ 0
LED_A1
Text Label 9150 3800 2    60   ~ 0
LED_A2
Text Label 9150 3900 2    60   ~ 0
LED_B
Text Label 9150 4000 2    60   ~ 0
LED_C
Text Label 9150 4100 2    60   ~ 0
LED_D1
Text Label 9150 4200 2    60   ~ 0
LED_D2
Text Label 9150 4300 2    60   ~ 0
LED_E
Text Label 9150 4400 2    60   ~ 0
LED_F
Text Label 9150 3600 2    60   ~ 0
LED_DP
Text Label 10350 3600 0    60   ~ 0
LED_G1
Text Label 10350 3700 0    60   ~ 0
LED_G2
Text Label 10350 3800 0    60   ~ 0
LED_H
Text Label 10350 3900 0    60   ~ 0
LED_J
Text Label 10350 4000 0    60   ~ 0
LED_K
Text Label 10350 4100 0    60   ~ 0
LED_L
Text Label 10350 4200 0    60   ~ 0
LED_M
Text Label 10350 4300 0    60   ~ 0
LED_N
Text Label 3950 3100 0    60   ~ 0
LED_E
Text Label 3950 3200 0    60   ~ 0
LED_N
Text Label 3950 3300 0    60   ~ 0
LED_M
Text Label 3950 3400 0    60   ~ 0
LED_G1
Text Label 3950 3500 0    60   ~ 0
LED_F
Text Label 3950 3700 0    60   ~ 0
LED_J
Text Label 3950 3800 0    60   ~ 0
LED_A1
Text Label 3950 3600 0    60   ~ 0
LED_H
Text Label 3500 2200 0    60   ~ 0
LED_1
Text Label 3500 2300 0    60   ~ 0
LED_2
Text Label 3500 2400 0    60   ~ 0
LED_3
Text Label 3500 2500 0    60   ~ 0
LED_4
Text Label 3500 2600 0    60   ~ 0
LED_5
Text Label 5550 2450 2    60   ~ 0
LED_1
Text Label 7700 2450 2    60   ~ 0
LED_2
Text Label 7700 4800 2    60   ~ 0
LED_4
Text Label 9750 2450 2    60   ~ 0
LED_3
Text Label 9750 4850 2    60   ~ 0
LED_5
$Comp
L CONN_01X04 P3
U 1 1 58091D91
P 5200 3950
F 0 "P3" H 5200 4200 50  0000 C CNN
F 1 "DATA_IN" V 5300 3950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x04" H 5200 3950 50  0001 C CNN
F 3 "" H 5200 3950 50  0000 C CNN
	1    5200 3950
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P4
U 1 1 58091D92
P 5200 4800
F 0 "P4" H 5200 5050 50  0000 C CNN
F 1 "DATA_OUT" V 5300 4800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x04" H 5200 4800 50  0001 C CNN
F 3 "" H 5200 4800 50  0000 C CNN
	1    5200 4800
	1    0    0    1   
$EndComp
$Comp
L GND #PWR020
U 1 1 58091D93
P 5000 4100
F 0 "#PWR020" H 5000 3850 50  0001 C CNN
F 1 "GND" H 5000 3950 50  0000 C CNN
F 2 "" H 5000 4100 50  0000 C CNN
F 3 "" H 5000 4100 50  0000 C CNN
	1    5000 4100
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR021
U 1 1 58091D94
P 5000 4650
F 0 "#PWR021" H 5000 4500 50  0001 C CNN
F 1 "VCC" H 5000 4800 50  0000 C CNN
F 2 "" H 5000 4650 50  0000 C CNN
F 3 "" H 5000 4650 50  0000 C CNN
	1    5000 4650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR022
U 1 1 58091D95
P 2300 6700
F 0 "#PWR022" H 2300 6550 50  0001 C CNN
F 1 "VCC" H 2300 6850 50  0000 C CNN
F 2 "" H 2300 6700 50  0000 C CNN
F 3 "" H 2300 6700 50  0000 C CNN
	1    2300 6700
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 58091D96
P 2300 6850
F 0 "C7" H 2325 6950 50  0000 L CNN
F 1 "100nF" H 2325 6750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2338 6700 50  0001 C CNN
F 3 "" H 2300 6850 50  0000 C CNN
	1    2300 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 58091D97
P 2300 7000
F 0 "#PWR023" H 2300 6750 50  0001 C CNN
F 1 "GND" H 2300 6850 50  0000 C CNN
F 2 "" H 2300 7000 50  0000 C CNN
F 3 "" H 2300 7000 50  0000 C CNN
	1    2300 7000
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG024
U 1 1 58091D98
P 3750 6800
F 0 "#FLG024" H 3750 6895 50  0001 C CNN
F 1 "PWR_FLAG" H 3750 6980 50  0000 C CNN
F 2 "" H 3750 6800 50  0000 C CNN
F 3 "" H 3750 6800 50  0000 C CNN
	1    3750 6800
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG025
U 1 1 58091D99
P 3200 6800
F 0 "#FLG025" H 3200 6895 50  0001 C CNN
F 1 "PWR_FLAG" H 3200 6980 50  0000 C CNN
F 2 "" H 3200 6800 50  0000 C CNN
F 3 "" H 3200 6800 50  0000 C CNN
	1    3200 6800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 58091D9A
P 3200 6900
F 0 "#PWR026" H 3200 6650 50  0001 C CNN
F 1 "GND" H 3200 6750 50  0000 C CNN
F 2 "" H 3200 6900 50  0000 C CNN
F 3 "" H 3200 6900 50  0000 C CNN
	1    3200 6900
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR027
U 1 1 58091D9B
P 3750 6900
F 0 "#PWR027" H 3750 6750 50  0001 C CNN
F 1 "VCC" H 3750 7050 50  0000 C CNN
F 2 "" H 3750 6900 50  0000 C CNN
F 3 "" H 3750 6900 50  0000 C CNN
	1    3750 6900
	-1   0    0    1   
$EndComp
$Comp
L R R19
U 1 1 58091D9C
P 5700 2450
F 0 "R19" V 5780 2450 50  0000 C CNN
F 1 "470" V 5700 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5630 2450 50  0001 C CNN
F 3 "" H 5700 2450 50  0000 C CNN
	1    5700 2450
	0    1    1    0   
$EndComp
$Comp
L R R20
U 1 1 58091D9D
P 7850 2450
F 0 "R20" V 7930 2450 50  0000 C CNN
F 1 "470" V 7850 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7780 2450 50  0001 C CNN
F 3 "" H 7850 2450 50  0000 C CNN
	1    7850 2450
	0    1    1    0   
$EndComp
$Comp
L R R22
U 1 1 58091D9E
P 9900 2450
F 0 "R22" V 9980 2450 50  0000 C CNN
F 1 "470" V 9900 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9830 2450 50  0001 C CNN
F 3 "" H 9900 2450 50  0000 C CNN
	1    9900 2450
	0    1    1    0   
$EndComp
$Comp
L R R21
U 1 1 58091D9F
P 7850 4800
F 0 "R21" V 7930 4800 50  0000 C CNN
F 1 "470" V 7850 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7780 4800 50  0001 C CNN
F 3 "" H 7850 4800 50  0000 C CNN
	1    7850 4800
	0    1    1    0   
$EndComp
$Comp
L R R23
U 1 1 58091DA0
P 9900 4850
F 0 "R23" V 9980 4850 50  0000 C CNN
F 1 "470" V 9900 4850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9830 4850 50  0001 C CNN
F 3 "" H 9900 4850 50  0000 C CNN
	1    9900 4850
	0    1    1    0   
$EndComp
Text Label 7100 3600 2    60   ~ 0
LED_DP
$Comp
L VCC #PWR028
U 1 1 58091DA1
P 1150 2450
F 0 "#PWR028" H 1150 2300 50  0001 C CNN
F 1 "VCC" H 1150 2600 50  0000 C CNN
F 2 "" H 1150 2450 50  0000 C CNN
F 3 "" H 1150 2450 50  0000 C CNN
	1    1150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5000 2100 5200
Wire Wire Line
	2100 5100 2500 5100
Wire Wire Line
	2200 5100 2200 5000
Connection ~ 2100 5100
Wire Wire Line
	2300 5100 2300 5000
Connection ~ 2200 5100
Wire Wire Line
	2500 5100 2500 5000
Connection ~ 2300 5100
Wire Wire Line
	2100 900  2100 1000
Wire Wire Line
	2100 950  2500 950 
Wire Wire Line
	2200 950  2200 1000
Connection ~ 2100 950 
Wire Wire Line
	2300 950  2300 1000
Connection ~ 2200 950 
Wire Wire Line
	2500 950  2500 1000
Connection ~ 2300 950 
Wire Wire Line
	1000 2100 1300 2100
Connection ~ 1150 2100
Wire Wire Line
	1000 1700 1300 1700
Connection ~ 1150 1700
Wire Wire Line
	700  1700 700  2400
Connection ~ 700  2100
Wire Wire Line
	3500 2800 4250 2800
Wire Wire Line
	4750 2700 4850 2700
Wire Wire Line
	4850 2700 4850 2400
Wire Wire Line
	4850 2400 3950 2400
Wire Wire Line
	3950 2400 3950 2700
Wire Wire Line
	3950 2700 3500 2700
Wire Wire Line
	4250 2700 4200 2700
Wire Wire Line
	4200 2700 4200 2900
Wire Wire Line
	4200 2900 3500 2900
Wire Wire Line
	4750 2600 4750 2600
Wire Wire Line
	4750 2600 4750 3300
Wire Wire Line
	4750 2800 5000 2800
Wire Wire Line
	6150 2000 6150 2250
Wire Wire Line
	8300 2000 8300 2250
Wire Wire Line
	8300 4400 8300 4600
Wire Wire Line
	10350 2000 10350 2250
Wire Wire Line
	10350 4400 10350 4650
Wire Wire Line
	3800 3100 3950 3100
Wire Wire Line
	3800 3200 3950 3200
Wire Wire Line
	3800 3300 3950 3300
Wire Wire Line
	3800 3400 3950 3400
Wire Wire Line
	3800 3500 3950 3500
Wire Wire Line
	3800 3600 3950 3600
Wire Wire Line
	3800 3700 3950 3700
Wire Wire Line
	3800 3800 3950 3800
Wire Wire Line
	5000 4850 5000 4950
Wire Wire Line
	5000 4000 5000 4100
Connection ~ 5000 4950
Wire Wire Line
	3200 6800 3200 6900
Wire Wire Line
	3750 6800 3750 6900
Wire Wire Line
	1300 2500 1150 2500
Wire Wire Line
	1150 2450 1150 2600
Connection ~ 1150 2500
Text Notes 5450 4000 0    60   ~ 0
Input
Text Notes 5450 4850 0    60   ~ 0
Output
Wire Wire Line
	1150 1700 1150 1800
Wire Wire Line
	1150 2000 1150 2100
$Comp
L R R10
U 1 1 58091DA2
P 3650 4700
F 0 "R10" V 3750 4700 50  0000 C CNN
F 1 "180" V 3650 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3580 4700 50  0001 C CNN
F 3 "" H 3650 4700 50  0000 C CNN
	1    3650 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 4200 4250 4200
Wire Wire Line
	3500 4300 4250 4300
Wire Wire Line
	3500 4400 4250 4400
Wire Wire Line
	3500 4500 4250 4500
Wire Wire Line
	3500 4600 4250 4600
Text Label 3500 4000 0    60   ~ 0
RxD
Text Label 3500 4100 0    60   ~ 0
TxD
Text Label 3500 2800 0    60   ~ 0
MISO
Text Label 3500 2700 0    60   ~ 0
MOSI
Text Label 3500 2900 0    60   ~ 0
SCK
$Comp
L CP C8
U 1 1 58091DA3
P 2600 6850
F 0 "C8" H 2625 6950 50  0000 L CNN
F 1 "10uF" H 2625 6750 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 2638 6700 50  0001 C CNN
F 3 "" H 2600 6850 50  0000 C CNN
	1    2600 6850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR029
U 1 1 58091DA4
P 2600 6700
F 0 "#PWR029" H 2600 6550 50  0001 C CNN
F 1 "VCC" H 2600 6850 50  0000 C CNN
F 2 "" H 2600 6700 50  0000 C CNN
F 3 "" H 2600 6700 50  0000 C CNN
	1    2600 6700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 58091DA5
P 2600 7000
F 0 "#PWR030" H 2600 6750 50  0001 C CNN
F 1 "GND" H 2600 6850 50  0000 C CNN
F 2 "" H 2600 7000 50  0000 C CNN
F 3 "" H 2600 7000 50  0000 C CNN
	1    2600 7000
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 58091DA6
P 900 1000
F 0 "R1" V 980 1000 50  0000 C CNN
F 1 "10k" V 900 1000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 830 1000 50  0001 C CNN
F 3 "" H 900 1000 50  0000 C CNN
	1    900  1000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR031
U 1 1 58091DA7
P 900 850
F 0 "#PWR031" H 900 700 50  0001 C CNN
F 1 "VCC" H 900 1000 50  0000 C CNN
F 2 "" H 900 850 50  0000 C CNN
F 3 "" H 900 850 50  0000 C CNN
	1    900  850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  1150 900  1300
Wire Wire Line
	900  1300 1300 1300
Text Label 3950 1300 0    60   ~ 0
LED_D2
Text Label 3950 1400 0    60   ~ 0
LED_DP
Wire Wire Line
	3500 1300 3650 1300
Wire Wire Line
	3500 1400 3650 1400
Wire Wire Line
	3500 1500 3650 1500
Wire Wire Line
	3500 1600 3650 1600
Wire Wire Line
	3500 1700 3650 1700
Wire Wire Line
	3500 1800 3650 1800
Wire Wire Line
	3500 1900 3650 1900
Wire Wire Line
	3500 2000 3650 2000
Text Label 3950 1500 0    60   ~ 0
LED_C
Text Label 3950 1600 0    60   ~ 0
LED_L
Text Label 3950 1700 0    60   ~ 0
LED_G2
Text Label 3950 1800 0    60   ~ 0
LED_B
Text Label 3950 1900 0    60   ~ 0
LED_K
Text Label 3950 2000 0    60   ~ 0
LED_A2
Connection ~ 5000 4100
$Comp
L CONN_01X06 P1
U 1 1 58091DA8
P 4450 4450
F 0 "P1" H 4450 4100 50  0000 C CNN
F 1 "CONN_01X06" V 4550 4450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 4450 4450 50  0001 C CNN
F 3 "" H 4450 4450 50  0000 C CNN
	1    4450 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 58091DA9
P 4250 4700
F 0 "#PWR032" H 4250 4450 50  0001 C CNN
F 1 "GND" H 4250 4550 50  0000 C CNN
F 2 "" H 4250 4700 50  0000 C CNN
F 3 "" H 4250 4700 50  0000 C CNN
	1    4250 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4000 4800 4000
Wire Wire Line
	4800 4000 4800 3900
Wire Wire Line
	4800 3900 5000 3900
Wire Wire Line
	3500 4100 4800 4100
Wire Wire Line
	4800 4100 4800 4750
Wire Wire Line
	4800 4750 5000 4750
Wire Wire Line
	3800 4700 3900 4700
Wire Wire Line
	3900 4700 3900 5200
Wire Wire Line
	3900 5200 4050 5200
Text Label 4050 5200 0    60   ~ 0
LED_D1
$Comp
L CONN_01X02 P5
U 1 1 580B54AD
P 4550 6850
F 0 "P5" H 4550 7000 50  0000 C CNN
F 1 "CONN_01X02" V 4650 6850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 4550 6850 50  0001 C CNN
F 3 "" H 4550 6850 50  0000 C CNN
	1    4550 6850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR033
U 1 1 580B55D6
P 4350 6800
F 0 "#PWR033" H 4350 6650 50  0001 C CNN
F 1 "VCC" H 4350 6950 50  0000 C CNN
F 2 "" H 4350 6800 50  0000 C CNN
F 3 "" H 4350 6800 50  0000 C CNN
	1    4350 6800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 580B57CA
P 4350 6900
F 0 "#PWR034" H 4350 6650 50  0001 C CNN
F 1 "GND" H 4350 6750 50  0000 C CNN
F 2 "" H 4350 6900 50  0000 C CNN
F 3 "" H 4350 6900 50  0000 C CNN
	1    4350 6900
	1    0    0    -1  
$EndComp
$EndSCHEMATC