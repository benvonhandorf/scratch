EESchema Schematic File Version 4
EELAYER 30 0
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
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 5F95CF80
P 6000 6050
F 0 "J?" H 6050 6467 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 6050 6376 50  0000 C CNN
F 2 "" H 6000 6050 50  0001 C CNN
F 3 "~" H 6000 6050 50  0001 C CNN
	1    6000 6050
	1    0    0    -1  
$EndComp
Text GLabel 6300 5950 2    50   Input ~ 0
SWCLK
Text GLabel 6300 5850 2    50   Input ~ 0
SWDIO
NoConn ~ 6300 6150
NoConn ~ 5800 6150
$Comp
L power:+3.3V #PWR?
U 1 1 5F9638CF
P 5600 5850
F 0 "#PWR?" H 5600 5700 50  0001 C CNN
F 1 "+3.3V" H 5615 6023 50  0000 C CNN
F 2 "" H 5600 5850 50  0001 C CNN
F 3 "" H 5600 5850 50  0001 C CNN
	1    5600 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 5850 5800 5850
$Comp
L power:GND #PWR?
U 1 1 5F96403D
P 5600 6250
F 0 "#PWR?" H 5600 6000 50  0001 C CNN
F 1 "GND" H 5605 6077 50  0000 C CNN
F 2 "" H 5600 6250 50  0001 C CNN
F 3 "" H 5600 6250 50  0001 C CNN
	1    5600 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 6250 5800 6250
Wire Wire Line
	5600 6250 5600 6050
Wire Wire Line
	5600 6050 5800 6050
Connection ~ 5600 6250
Wire Wire Line
	5800 6050 5800 5950
Connection ~ 5800 6050
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5F965B66
P 800 1150
F 0 "J?" H 718 825 50  0000 C CNN
F 1 "Conn_01x02" H 718 916 50  0000 C CNN
F 2 "" H 800 1150 50  0001 C CNN
F 3 "~" H 800 1150 50  0001 C CNN
	1    800  1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1000 1050 1100 1050
$Comp
L power:GND #PWR?
U 1 1 5F967243
P 1100 1150
F 0 "#PWR?" H 1100 900 50  0001 C CNN
F 1 "GND" H 1105 977 50  0000 C CNN
F 2 "" H 1100 1150 50  0001 C CNN
F 3 "" H 1100 1150 50  0001 C CNN
	1    1100 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1150 1000 1150
Text Notes 550  650  0    50   ~ 0
VIN Supports +5VDC
$Comp
L power:+3.3V #PWR?
U 1 1 5F96866A
P 3000 1050
F 0 "#PWR?" H 3000 900 50  0001 C CNN
F 1 "+3.3V" H 3015 1223 50  0000 C CNN
F 2 "" H 3000 1050 50  0001 C CNN
F 3 "" H 3000 1050 50  0001 C CNN
	1    3000 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F9691CB
P 7050 1000
F 0 "#PWR?" H 7050 850 50  0001 C CNN
F 1 "+3.3V" H 7065 1173 50  0000 C CNN
F 2 "" H 7050 1000 50  0001 C CNN
F 3 "" H 7050 1000 50  0001 C CNN
	1    7050 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F9696F0
P 7050 1300
F 0 "#PWR?" H 7050 1050 50  0001 C CNN
F 1 "GND" H 7055 1127 50  0000 C CNN
F 2 "" H 7050 1300 50  0001 C CNN
F 3 "" H 7050 1300 50  0001 C CNN
	1    7050 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F96EBC6
P 7350 1150
F 0 "C?" H 7442 1196 50  0000 L CNN
F 1 "0.1uF" H 7442 1105 50  0000 L CNN
F 2 "" H 7350 1150 50  0001 C CNN
F 3 "~" H 7350 1150 50  0001 C CNN
	1    7350 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F96EDB5
P 7650 1150
F 0 "C?" H 7742 1196 50  0000 L CNN
F 1 "0.1uF" H 7742 1105 50  0000 L CNN
F 2 "" H 7650 1150 50  0001 C CNN
F 3 "~" H 7650 1150 50  0001 C CNN
	1    7650 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F96EFD9
P 7900 1150
F 0 "C?" H 7992 1196 50  0000 L CNN
F 1 "0.1uF" H 7992 1105 50  0000 L CNN
F 2 "" H 7900 1150 50  0001 C CNN
F 3 "~" H 7900 1150 50  0001 C CNN
	1    7900 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F96F1BC
P 8150 1150
F 0 "C?" H 8242 1196 50  0000 L CNN
F 1 "0.1uF" H 8242 1105 50  0000 L CNN
F 2 "" H 8150 1150 50  0001 C CNN
F 3 "~" H 8150 1150 50  0001 C CNN
	1    8150 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 1300 7050 1250
Wire Wire Line
	7050 1250 7350 1250
Connection ~ 7350 1250
Wire Wire Line
	7350 1250 7650 1250
Connection ~ 7650 1250
Wire Wire Line
	7650 1250 7900 1250
Connection ~ 7900 1250
Wire Wire Line
	7900 1250 8150 1250
Wire Wire Line
	7050 1000 7050 1050
Wire Wire Line
	7050 1050 7350 1050
Connection ~ 7350 1050
Wire Wire Line
	7350 1050 7650 1050
Connection ~ 7650 1050
Wire Wire Line
	7650 1050 7900 1050
Connection ~ 7900 1050
Wire Wire Line
	7900 1050 8150 1050
$Comp
L power:+3.3V #PWR?
U 1 1 5F970366
P 8750 1050
F 0 "#PWR?" H 8750 900 50  0001 C CNN
F 1 "+3.3V" H 8765 1223 50  0000 C CNN
F 2 "" H 8750 1050 50  0001 C CNN
F 3 "" H 8750 1050 50  0001 C CNN
	1    8750 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F97075A
P 8750 1300
F 0 "#PWR?" H 8750 1050 50  0001 C CNN
F 1 "GND" H 8755 1127 50  0000 C CNN
F 2 "" H 8750 1300 50  0001 C CNN
F 3 "" H 8750 1300 50  0001 C CNN
	1    8750 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F970A60
P 9300 1150
F 0 "C?" H 9392 1196 50  0000 L CNN
F 1 "0.1uF" H 9392 1105 50  0000 L CNN
F 2 "" H 9300 1150 50  0001 C CNN
F 3 "~" H 9300 1150 50  0001 C CNN
	1    9300 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR?
U 1 1 5F970FA6
P 9500 1050
F 0 "#PWR?" H 9500 900 50  0001 C CNN
F 1 "+3.3VA" H 9515 1223 50  0000 C CNN
F 2 "" H 9500 1050 50  0001 C CNN
F 3 "" H 9500 1050 50  0001 C CNN
	1    9500 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 5F97123D
P 9500 1300
F 0 "#PWR?" H 9500 1050 50  0001 C CNN
F 1 "GNDA" H 9505 1127 50  0000 C CNN
F 2 "" H 9500 1300 50  0001 C CNN
F 3 "" H 9500 1300 50  0001 C CNN
	1    9500 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 1300 9500 1250
Wire Wire Line
	9500 1250 9300 1250
Wire Wire Line
	8750 1250 8750 1300
Connection ~ 9300 1250
Wire Wire Line
	9300 1250 8750 1250
Wire Wire Line
	9300 1050 9500 1050
Connection ~ 9300 1050
$Comp
L power:+5V #PWR?
U 1 1 5F97C025
P 1450 1050
F 0 "#PWR?" H 1450 900 50  0001 C CNN
F 1 "+5V" H 1465 1223 50  0000 C CNN
F 2 "" H 1450 1050 50  0001 C CNN
F 3 "" H 1450 1050 50  0001 C CNN
	1    1450 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F97F44D
P 9900 5450
F 0 "#PWR?" H 9900 5300 50  0001 C CNN
F 1 "+5V" H 9915 5623 50  0000 C CNN
F 2 "" H 9900 5450 50  0001 C CNN
F 3 "" H 9900 5450 50  0001 C CNN
	1    9900 5450
	1    0    0    -1  
$EndComp
Text Notes 9700 5200 0    50   ~ 0
5VDC Output\nCurrent dependent on input power
$Comp
L power:GND #PWR?
U 1 1 5F980875
P 9900 5850
F 0 "#PWR?" H 9900 5600 50  0001 C CNN
F 1 "GND" H 9905 5677 50  0000 C CNN
F 2 "" H 9900 5850 50  0001 C CNN
F 3 "" H 9900 5850 50  0001 C CNN
	1    9900 5850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5F980A4D
P 10500 5550
F 0 "J?" H 10580 5542 50  0000 L CNN
F 1 "Conn_01x02" H 10580 5451 50  0000 L CNN
F 2 "" H 10500 5550 50  0001 C CNN
F 3 "~" H 10500 5550 50  0001 C CNN
	1    10500 5550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5F980D5C
P 10500 5850
F 0 "J?" H 10580 5842 50  0000 L CNN
F 1 "Conn_01x02" H 10580 5751 50  0000 L CNN
F 2 "" H 10500 5850 50  0001 C CNN
F 3 "~" H 10500 5850 50  0001 C CNN
	1    10500 5850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 5F98106A
P 10500 6150
F 0 "J?" H 10580 6142 50  0000 L CNN
F 1 "Conn_01x02" H 10580 6051 50  0000 L CNN
F 2 "" H 10500 6150 50  0001 C CNN
F 3 "~" H 10500 6150 50  0001 C CNN
	1    10500 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 5550 10150 5850
Wire Wire Line
	10150 5850 10300 5850
Wire Wire Line
	10150 5550 10300 5550
Wire Wire Line
	10150 5850 10150 6150
Wire Wire Line
	10150 6150 10300 6150
Connection ~ 10150 5850
Wire Wire Line
	10300 6250 10200 6250
Wire Wire Line
	10200 6250 10200 5950
Wire Wire Line
	10200 5950 10300 5950
Wire Wire Line
	10200 5950 10200 5650
Wire Wire Line
	10200 5650 10300 5650
Connection ~ 10200 5950
$Comp
L power:+5V #PWR?
U 1 1 5F988A0E
P 1100 1050
F 0 "#PWR?" H 1100 900 50  0001 C CNN
F 1 "+5V" H 1115 1223 50  0000 C CNN
F 2 "" H 1100 1050 50  0001 C CNN
F 3 "" H 1100 1050 50  0001 C CNN
	1    1100 1050
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP2112K-3.3 U?
U 1 1 5F989A27
P 2500 1150
F 0 "U?" H 2500 1492 50  0000 C CNN
F 1 "AP2112K-3.3" H 2500 1401 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 2500 1475 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 2500 1250 50  0001 C CNN
	1    2500 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F98B6C3
P 2500 1500
F 0 "#PWR?" H 2500 1250 50  0001 C CNN
F 1 "GND" H 2505 1327 50  0000 C CNN
F 2 "" H 2500 1500 50  0001 C CNN
F 3 "" H 2500 1500 50  0001 C CNN
	1    2500 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1500 2500 1450
$Comp
L Device:R_Small R?
U 1 1 5F98C990
P 2000 1150
F 0 "R?" H 2059 1196 50  0000 L CNN
F 1 "100K" H 2059 1105 50  0000 L CNN
F 2 "" H 2000 1150 50  0001 C CNN
F 3 "~" H 2000 1150 50  0001 C CNN
	1    2000 1150
	1    0    0    -1  
$EndComp
Connection ~ 2000 1050
Wire Wire Line
	2000 1050 2200 1050
Wire Wire Line
	2200 1150 2200 1300
Wire Wire Line
	2200 1300 2000 1300
Wire Wire Line
	2000 1300 2000 1250
Wire Wire Line
	2800 1050 2950 1050
$Comp
L Device:C_Small C?
U 1 1 5F992631
P 1650 1150
F 0 "C?" H 1742 1196 50  0000 L CNN
F 1 "10u" H 1742 1105 50  0000 L CNN
F 2 "" H 1650 1150 50  0001 C CNN
F 3 "~" H 1650 1150 50  0001 C CNN
	1    1650 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1050 1650 1050
Connection ~ 1650 1050
Wire Wire Line
	1650 1050 2000 1050
$Comp
L power:GND #PWR?
U 1 1 5F993299
P 1650 1350
F 0 "#PWR?" H 1650 1100 50  0001 C CNN
F 1 "GND" H 1655 1177 50  0000 C CNN
F 2 "" H 1650 1350 50  0001 C CNN
F 3 "" H 1650 1350 50  0001 C CNN
	1    1650 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1350 1650 1250
$Comp
L Device:C_Small C?
U 1 1 5F994ACA
P 2950 1150
F 0 "C?" H 3042 1196 50  0000 L CNN
F 1 "10u" H 3042 1105 50  0000 L CNN
F 2 "" H 2950 1150 50  0001 C CNN
F 3 "~" H 2950 1150 50  0001 C CNN
	1    2950 1150
	1    0    0    -1  
$EndComp
Connection ~ 2950 1050
Wire Wire Line
	2950 1050 3000 1050
$Comp
L power:GND #PWR?
U 1 1 5F994D93
P 2950 1350
F 0 "#PWR?" H 2950 1100 50  0001 C CNN
F 1 "GND" H 2955 1177 50  0000 C CNN
F 2 "" H 2950 1350 50  0001 C CNN
F 3 "" H 2950 1350 50  0001 C CNN
	1    2950 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1350 2950 1250
$Comp
L power:+3.3V #PWR?
U 1 1 5F9A1810
P 2550 2850
F 0 "#PWR?" H 2550 2700 50  0001 C CNN
F 1 "+3.3V" H 2565 3023 50  0000 C CNN
F 2 "" H 2550 2850 50  0001 C CNN
F 3 "" H 2550 2850 50  0001 C CNN
	1    2550 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR?
U 1 1 5F9A32BD
P 3050 2850
F 0 "#PWR?" H 3050 2700 50  0001 C CNN
F 1 "+3.3VA" H 3065 3023 50  0000 C CNN
F 2 "" H 3050 2850 50  0001 C CNN
F 3 "" H 3050 2850 50  0001 C CNN
	1    3050 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2850 3050 2950
Wire Wire Line
	2550 2850 2550 2950
$Comp
L power:GNDA #PWR?
U 1 1 5F9A5D01
P 2750 6600
F 0 "#PWR?" H 2750 6350 50  0001 C CNN
F 1 "GNDA" H 2755 6427 50  0000 C CNN
F 2 "" H 2750 6600 50  0001 C CNN
F 3 "" H 2750 6600 50  0001 C CNN
	1    2750 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F9A7AC8
P 2650 6800
F 0 "#PWR?" H 2650 6550 50  0001 C CNN
F 1 "GND" H 2655 6627 50  0000 C CNN
F 2 "" H 2650 6800 50  0001 C CNN
F 3 "" H 2650 6800 50  0001 C CNN
	1    2650 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 6800 2650 6550
Wire Wire Line
	2750 6550 2750 6600
Text GLabel 6300 6250 2    50   Input ~ 0
~RESET
Text GLabel 1950 6350 0    50   Input ~ 0
~RESET
Text GLabel 5650 7000 0    50   Input ~ 0
~RESET
$Comp
L Switch:SW_SPST SW?
U 1 1 5F9B234F
P 6500 7000
F 0 "SW?" H 6500 7235 50  0000 C CNN
F 1 "SW_SPST" H 6500 7144 50  0000 C CNN
F 2 "" H 6500 7000 50  0001 C CNN
F 3 "~" H 6500 7000 50  0001 C CNN
	1    6500 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F9B261F
P 6800 7000
F 0 "#PWR?" H 6800 6750 50  0001 C CNN
F 1 "GND" H 6805 6827 50  0000 C CNN
F 2 "" H 6800 7000 50  0001 C CNN
F 3 "" H 6800 7000 50  0001 C CNN
	1    6800 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 7000 6700 7000
$Comp
L power:+3.3V #PWR?
U 1 1 5F9B87B4
P 2650 2850
F 0 "#PWR?" H 2650 2700 50  0001 C CNN
F 1 "+3.3V" H 2665 3023 50  0000 C CNN
F 2 "" H 2650 2850 50  0001 C CNN
F 3 "" H 2650 2850 50  0001 C CNN
	1    2650 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F9B89E5
P 2750 2850
F 0 "#PWR?" H 2750 2700 50  0001 C CNN
F 1 "+3.3V" H 2765 3023 50  0000 C CNN
F 2 "" H 2750 2850 50  0001 C CNN
F 3 "" H 2750 2850 50  0001 C CNN
	1    2750 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5F9B8BCF
P 2850 2850
F 0 "#PWR?" H 2850 2700 50  0001 C CNN
F 1 "+3.3V" H 2865 3023 50  0000 C CNN
F 2 "" H 2850 2850 50  0001 C CNN
F 3 "" H 2850 2850 50  0001 C CNN
	1    2850 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2850 2850 2950
Wire Wire Line
	2750 2950 2750 2850
Wire Wire Line
	2650 2950 2650 2850
Text GLabel 2350 2850 1    50   Input ~ 0
VDDCORE
Wire Wire Line
	2350 2850 2350 2950
Text GLabel 5750 950  2    50   Input ~ 0
VDDCORE
$Comp
L Device:C_Small C?
U 1 1 5F9C5566
P 5750 1150
F 0 "C?" H 5842 1196 50  0000 L CNN
F 1 "0.1uF" H 5842 1105 50  0000 L CNN
F 2 "" H 5750 1150 50  0001 C CNN
F 3 "~" H 5750 1150 50  0001 C CNN
	1    5750 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F9C58FD
P 5750 1300
F 0 "#PWR?" H 5750 1050 50  0001 C CNN
F 1 "GND" H 5755 1127 50  0000 C CNN
F 2 "" H 5750 1300 50  0001 C CNN
F 3 "" H 5750 1300 50  0001 C CNN
	1    5750 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1300 5750 1250
Wire Wire Line
	5750 1050 5750 950 
Wire Wire Line
	9150 1050 9300 1050
Wire Wire Line
	8750 1050 8850 1050
$Comp
L Device:Ferrite_Bead FB?
U 1 1 5F972DBC
P 9000 1050
F 0 "FB?" V 8726 1050 50  0000 C CNN
F 1 "Ferrite_Bead" V 8817 1050 50  0000 C CNN
F 2 "" V 8930 1050 50  0001 C CNN
F 3 "~" H 9000 1050 50  0001 C CNN
	1    9000 1050
	0    1    1    0   
$EndComp
Text GLabel 2250 2850 1    50   Input ~ 0
VSW
Wire Wire Line
	2250 2850 2250 2950
Text GLabel 5000 950  2    50   Input ~ 0
VSW
$Comp
L Device:L_Small L?
U 1 1 5F9D3225
P 4700 950
F 0 "L?" V 4885 950 50  0000 C CNN
F 1 "10uH" V 4794 950 50  0000 C CNN
F 2 "" H 4700 950 50  0001 C CNN
F 3 "~" H 4700 950 50  0001 C CNN
	1    4700 950 
	0    -1   -1   0   
$EndComp
Text GLabel 5000 1100 2    50   Input ~ 0
VDDCORE
Wire Wire Line
	4550 1100 4900 1100
Wire Wire Line
	4800 950  5000 950 
$Comp
L Device:C_Small COUT2
U 1 1 5F9D8121
P 4900 1200
F 0 "COUT2" H 4992 1246 50  0000 L CNN
F 1 "0.1uF" H 4992 1155 50  0000 L CNN
F 2 "" H 4900 1200 50  0001 C CNN
F 3 "~" H 4900 1200 50  0001 C CNN
	1    4900 1200
	1    0    0    -1  
$EndComp
Connection ~ 4900 1100
Wire Wire Line
	4900 1100 5000 1100
$Comp
L Device:C_Small COUT1
U 1 1 5F9D85EC
P 4550 1200
F 0 "COUT1" H 4642 1246 50  0000 L CNN
F 1 "4.7uF" H 4642 1155 50  0000 L CNN
F 2 "" H 4550 1200 50  0001 C CNN
F 3 "~" H 4550 1200 50  0001 C CNN
	1    4550 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F9DA2A9
P 4550 1350
F 0 "#PWR?" H 4550 1100 50  0001 C CNN
F 1 "GND" H 4555 1177 50  0000 C CNN
F 2 "" H 4550 1350 50  0001 C CNN
F 3 "" H 4550 1350 50  0001 C CNN
	1    4550 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1300 4550 1350
Wire Wire Line
	4550 1100 4550 950 
Wire Wire Line
	4550 950  4600 950 
Connection ~ 4550 1100
$Comp
L power:GNDA #PWR?
U 1 1 5F9E30F8
P 4900 1350
F 0 "#PWR?" H 4900 1100 50  0001 C CNN
F 1 "GNDA" H 4905 1177 50  0000 C CNN
F 2 "" H 4900 1350 50  0001 C CNN
F 3 "" H 4900 1350 50  0001 C CNN
	1    4900 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 1350 4900 1300
$Comp
L power:+3.3V #PWR?
U 1 1 5F9EE001
P 5750 6750
F 0 "#PWR?" H 5750 6600 50  0001 C CNN
F 1 "+3.3V" H 5765 6923 50  0000 C CNN
F 2 "" H 5750 6750 50  0001 C CNN
F 3 "" H 5750 6750 50  0001 C CNN
	1    5750 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F9F0A66
P 5750 6900
F 0 "R?" H 5809 6946 50  0000 L CNN
F 1 "10k" H 5809 6855 50  0000 L CNN
F 2 "" H 5750 6900 50  0001 C CNN
F 3 "~" H 5750 6900 50  0001 C CNN
	1    5750 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F9F301D
P 6000 7000
F 0 "R?" V 5804 7000 50  0000 C CNN
F 1 "330" V 5895 7000 50  0000 C CNN
F 2 "" H 6000 7000 50  0001 C CNN
F 3 "~" H 6000 7000 50  0001 C CNN
	1    6000 7000
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F9F3798
P 6500 7250
F 0 "C?" V 6271 7250 50  0000 C CNN
F 1 "0.1uF" V 6362 7250 50  0000 C CNN
F 2 "" H 6500 7250 50  0001 C CNN
F 3 "~" H 6500 7250 50  0001 C CNN
	1    6500 7250
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 7250 6700 7250
Wire Wire Line
	6700 7250 6700 7000
Connection ~ 6700 7000
Wire Wire Line
	6400 7250 6300 7250
Wire Wire Line
	6300 7250 6300 7000
Connection ~ 6300 7000
Wire Wire Line
	5900 7000 5750 7000
Connection ~ 5750 7000
Wire Wire Line
	5750 7000 5650 7000
Wire Wire Line
	5750 6750 5750 6800
Wire Wire Line
	6100 7000 6300 7000
Text GLabel 7150 5950 2    50   Input ~ 0
SWCLK
$Comp
L power:+3.3V #PWR?
U 1 1 5FA23063
P 6850 5950
F 0 "#PWR?" H 6850 5800 50  0001 C CNN
F 1 "+3.3V" H 6865 6123 50  0000 C CNN
F 2 "" H 6850 5950 50  0001 C CNN
F 3 "" H 6850 5950 50  0001 C CNN
	1    6850 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5FA23629
P 7000 5950
F 0 "R?" V 6804 5950 50  0000 C CNN
F 1 "1k" V 6895 5950 50  0000 C CNN
F 2 "" H 7000 5950 50  0001 C CNN
F 3 "~" H 7000 5950 50  0001 C CNN
	1    7000 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 5950 7150 5950
Wire Wire Line
	6900 5950 6850 5950
NoConn ~ 6300 6050
Text GLabel 1950 4750 0    50   Input ~ 0
XIN
Text GLabel 1950 4850 0    50   Input ~ 0
XOUT
$Comp
L MCU_Microchip_SAMD:ATSAMD51J18A-M U?
U 1 1 5F958CE1
P 2650 4750
F 0 "U?" H 2650 4750 50  0000 C CNN
F 1 "ATSAMD51J18A-M" H 2650 4500 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-64-1EP_9x9mm_P0.5mm_EP4.7x4.7mm" H 2650 4750 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/60001507E.pdf" H 2650 4750 50  0001 C CNN
	1    2650 4750
	1    0    0    -1  
$EndComp
Text GLabel 3350 5250 2    50   Input ~ 0
XIN2
Text GLabel 3350 5350 2    50   Input ~ 0
XOUT2
Text GLabel 1950 3350 0    50   Input ~ 0
XIN32
Text GLabel 1950 3450 0    50   Input ~ 0
XOUT32
Text Notes 1100 7400 0    50   ~ 0
Pin Considerations:\nAvoid w/32kHz OSC - PB00-03, PA02-PA03\nHigh Sink pins - PA08, PA09, PA12, PA13, PA16, PA17, PA22, PA23
Text GLabel 5550 4350 0    50   Input ~ 0
XIN
Text GLabel 5550 4650 0    50   Input ~ 0
XOUT
Text GLabel 3350 4550 2    50   Input ~ 0
~CS
Text GLabel 3350 4450 2    50   Input ~ 0
SCK
$Comp
L power:GND #PWR?
U 1 1 5FA45CD7
P 10600 3750
F 0 "#PWR?" H 10600 3500 50  0001 C CNN
F 1 "GND" H 10605 3577 50  0000 C CNN
F 2 "" H 10600 3750 50  0001 C CNN
F 3 "" H 10600 3750 50  0001 C CNN
	1    10600 3750
	1    0    0    -1  
$EndComp
Text GLabel 10150 3450 2    50   Input ~ 0
COPI
Text GLabel 10150 3350 2    50   Input ~ 0
CIPO
Text GLabel 10150 3650 2    50   Input ~ 0
SCK
Text GLabel 10150 3550 2    50   Input ~ 0
~CS
$Comp
L Connector_Generic:Conn_01x05 J?
U 1 1 5FA486E3
P 9950 3550
F 0 "J?" H 9868 3125 50  0000 C CNN
F 1 "SPI" H 9868 3216 50  0000 C CNN
F 2 "" H 9950 3550 50  0001 C CNN
F 3 "~" H 9950 3550 50  0001 C CNN
	1    9950 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	10150 3750 10600 3750
Wire Wire Line
	9900 5450 10200 5450
Wire Wire Line
	10200 5450 10200 5650
Connection ~ 10200 5650
Wire Wire Line
	9900 5550 10150 5550
Wire Wire Line
	9900 5550 9900 5850
Connection ~ 10150 5550
Text Notes 6750 4600 2    50   ~ 0
Unclear if I need an external crystal \nfor the work I'm doing.
$EndSCHEMATC
