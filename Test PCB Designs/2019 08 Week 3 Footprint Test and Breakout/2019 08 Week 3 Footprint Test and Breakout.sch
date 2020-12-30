EESchema Schematic File Version 4
LIBS:2019 08 Week 3 Footprint Test and Breakout-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RF_Ham:DRV818V U1
U 1 1 5D5C7072
P 8700 2450
F 0 "U1" H 8675 2915 50  0000 C CNN
F 1 "DRV818V" H 8675 2824 50  0000 C CNN
F 2 "RF_Ham:DRV818V" H 8300 2450 50  0001 C CNN
F 3 "" H 8300 2450 50  0001 C CNN
	1    8700 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J3
U 1 1 5D5C7193
P 10100 2450
F 0 "J3" H 10199 2426 50  0000 L CNN
F 1 "Conn_Coaxial" H 10199 2335 50  0000 L CNN
F 2 "Connectors_RF_Ham:SMA_THT_90deg" H 10100 2450 50  0001 C CNN
F 3 " ~" H 10100 2450 50  0001 C CNN
	1    10100 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 2450 9900 2450
$Comp
L power:GND #PWR0101
U 1 1 5D5C7264
P 9750 2250
F 0 "#PWR0101" H 9750 2000 50  0001 C CNN
F 1 "GND" H 9755 2077 50  0000 C CNN
F 2 "" H 9750 2250 50  0001 C CNN
F 3 "" H 9750 2250 50  0001 C CNN
	1    9750 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 2250 9600 2250
Wire Wire Line
	9600 2350 9600 2250
Connection ~ 9600 2250
Wire Wire Line
	9600 2250 9750 2250
Wire Wire Line
	9450 2350 9600 2350
$Comp
L power:GND #PWR0102
U 1 1 5D5C72D1
P 10100 2650
F 0 "#PWR0102" H 10100 2400 50  0001 C CNN
F 1 "GND" H 10105 2477 50  0000 C CNN
F 2 "" H 10100 2650 50  0001 C CNN
F 3 "" H 10100 2650 50  0001 C CNN
	1    10100 2650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J1
U 1 1 5D5C737E
P 7400 3450
F 0 "J1" H 7506 3828 50  0000 C CNN
F 1 "Conn_01x05_Male" H 7506 3737 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 7400 3450 50  0001 C CNN
F 3 "~" H 7400 3450 50  0001 C CNN
	1    7400 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J2
U 1 1 5D5C73F7
P 9800 3250
F 0 "J2" H 9773 3180 50  0000 R CNN
F 1 "Conn_01x05_Male" H 9773 3271 50  0000 R CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 9800 3250 50  0001 C CNN
F 3 "~" H 9800 3250 50  0001 C CNN
	1    9800 3250
	-1   0    0    1   
$EndComp
Text GLabel 7900 2250 0    50   Input ~ 0
SQ
Text GLabel 7900 2350 0    50   Input ~ 0
AF_OUT
Text GLabel 7900 2450 0    50   Input ~ 0
~PTT
Text GLabel 7900 2550 0    50   Input ~ 0
~PD
Text GLabel 7900 2650 0    50   Input ~ 0
~HI_PWR
Text GLabel 9450 2550 2    50   Input ~ 0
RXD
Text GLabel 9450 2650 2    50   Input ~ 0
TXD
Text GLabel 9450 2750 2    50   Input ~ 0
MIC_IN
$Comp
L power:+3.3V #PWR0103
U 1 1 5D5C785E
P 7450 2750
F 0 "#PWR0103" H 7450 2600 50  0001 C CNN
F 1 "+3.3V" H 7465 2923 50  0000 C CNN
F 2 "" H 7450 2750 50  0001 C CNN
F 3 "" H 7450 2750 50  0001 C CNN
	1    7450 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2750 7900 2750
$Comp
L power:+3.3V #PWR0104
U 1 1 5D5C78AF
P 7950 3250
F 0 "#PWR0104" H 7950 3100 50  0001 C CNN
F 1 "+3.3V" H 7965 3423 50  0000 C CNN
F 2 "" H 7950 3250 50  0001 C CNN
F 3 "" H 7950 3250 50  0001 C CNN
	1    7950 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3250 7950 3250
$Comp
L power:GND #PWR0105
U 1 1 5D5C7914
P 9150 3050
F 0 "#PWR0105" H 9150 2800 50  0001 C CNN
F 1 "GND" H 9155 2877 50  0000 C CNN
F 2 "" H 9150 3050 50  0001 C CNN
F 3 "" H 9150 3050 50  0001 C CNN
	1    9150 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3050 9600 3050
Text GLabel 9600 3150 0    50   Input ~ 0
SQ
Text GLabel 9600 3250 0    50   Input ~ 0
AF_OUT
Text GLabel 9600 3350 0    50   Input ~ 0
~PTT
Text GLabel 9600 3450 0    50   Input ~ 0
MIC_IN
Text GLabel 7600 3350 2    50   Input ~ 0
~PD
Text GLabel 7600 3450 2    50   Input ~ 0
~HI_PWR
Text GLabel 7600 3550 2    50   Input ~ 0
RXD
Text GLabel 7600 3650 2    50   Input ~ 0
TXD
$EndSCHEMATC
