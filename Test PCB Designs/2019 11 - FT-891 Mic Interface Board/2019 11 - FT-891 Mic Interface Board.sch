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
L Connector:RJ45_Shielded J?
U 1 1 5DD251FC
P 1900 3500
F 0 "J?" H 1957 4167 50  0000 C CNN
F 1 "Mic Cable" H 1957 4076 50  0000 C CNN
F 2 "" V 1900 3525 50  0001 C CNN
F 3 "~" V 1900 3525 50  0001 C CNN
	1    1900 3500
	1    0    0    -1  
$EndComp
$Comp
L BVH_Connectors_Misc:AudioJack4_SwitchTR J?
U 1 1 5DD25F57
P 1900 2100
F 0 "J?" H 1832 2525 50  0000 C CNN
F 1 "Audio In" H 1832 2434 50  0000 C CNN
F 2 "" H 1850 2100 50  0001 C CNN
F 3 "~" H 1850 2100 50  0001 C CNN
	1    1900 2100
	1    0    0    -1  
$EndComp
Text HLabel 2300 3600 2    50   Input ~ 0
PTT
Text HLabel 2300 3700 2    50   Input ~ 0
RDO_GND
Text HLabel 2300 3500 2    50   Input ~ 0
RDO_MIC
Text HLabel 2300 3100 2    50   Input ~ 0
DOWN
Text HLabel 2300 3200 2    50   Input ~ 0
UP
$Comp
L power:+5V #PWR?
U 1 1 5DD2747A
P 2650 3300
F 0 "#PWR?" H 2650 3150 50  0001 C CNN
F 1 "+5V" H 2665 3473 50  0000 C CNN
F 2 "" H 2650 3300 50  0001 C CNN
F 3 "" H 2650 3300 50  0001 C CNN
	1    2650 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 3300 2300 3300
Text HLabel 2300 3400 2    50   Input ~ 0
RDO_MICGND
Text HLabel 2300 3800 2    50   Input ~ 0
FAST
Text Notes 1400 4300 0    50   ~ 0
Flipped RJ-45 pin numbers \nare dealt with in a modified \nfootprint - Thx Yaesu
Text HLabel 2100 2300 2    50   Input ~ 0
RDO_LEFT
Text HLabel 2100 2100 2    50   Input ~ 0
RDO_RIGHT
Text HLabel 2100 1900 2    50   Input ~ 0
RDO_AUDIO_GND
NoConn ~ 2100 2000
NoConn ~ 2100 2200
$Comp
L BVH_Connectors_Misc:AudioJack4_SwitchTR J?
U 1 1 5DD2D305
P 10000 4600
F 0 "J?" H 9620 4483 50  0000 R CNN
F 1 "Cell Headset" H 10350 4150 50  0000 R CNN
F 2 "" H 9950 4600 50  0001 C CNN
F 3 "~" H 9950 4600 50  0001 C CNN
	1    10000 4600
	-1   0    0    1   
$EndComp
Text HLabel 9800 4400 0    50   Input ~ 0
CELL_LEFT
Text HLabel 9800 4600 0    50   Input ~ 0
CELL_RIGHT
Text HLabel 9800 4800 0    50   Input ~ 0
CELL_MIC
Text HLabel 9800 4700 0    50   Input ~ 0
CELL_GND
Text Notes 9750 5000 0    50   ~ 0
CTIA Standard\nMic bias voltage rated at +2.5V
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5DD32667
P 10250 1650
F 0 "J?" H 10278 1676 50  0000 L CNN
F 1 "Headset Audio" H 9800 1900 50  0000 L CNN
F 2 "" H 10250 1650 50  0001 C CNN
F 3 "~" H 10250 1650 50  0001 C CNN
	1    10250 1650
	1    0    0    -1  
$EndComp
Text HLabel 10050 1550 0    50   Input ~ 0
HST_LEFT
Text HLabel 10050 1650 0    50   Input ~ 0
HST_RIGHT
Text HLabel 10050 1750 0    50   Input ~ 0
HST_GND
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 5DD3364C
P 10250 2150
F 0 "J?" H 10278 2176 50  0000 L CNN
F 1 "Headset Mic" H 9800 2400 50  0000 L CNN
F 2 "" H 10250 2150 50  0001 C CNN
F 3 "~" H 10250 2150 50  0001 C CNN
	1    10250 2150
	1    0    0    -1  
$EndComp
NoConn ~ 10050 2050
Text HLabel 10050 2150 0    50   Input ~ 0
HST_MIC
Text HLabel 10050 2250 0    50   Input ~ 0
HST_GND
Text HLabel 2200 5200 0    50   Input ~ 0
RDO_GND
Text HLabel 2200 5350 0    50   Input ~ 0
RDO_AUDIO_GND
Text HLabel 2200 5500 0    50   Input ~ 0
HST_GND
Text HLabel 2200 5650 0    50   Input ~ 0
CELL_GND
Wire Wire Line
	2200 5200 2200 5650
Text Notes 1700 1300 0    98   ~ 0
Inputs
Text Notes 9800 950  0    98   ~ 0
Outputs
Text Notes 9550 2600 0    50   ~ 0
1/4" Audio Out and \n0.205" Mic \nAviation Headset connections
Text Notes 9750 2800 0    50   ~ 0
Mic Bias ~ 12V
Wire Notes Line
	1400 5000 1400 5850
Wire Notes Line
	1400 5850 2350 5850
Wire Notes Line
	2350 5850 2350 5000
Wire Notes Line
	1400 5000 2350 5000
Text Notes 1600 5100 0    50   ~ 0
Ground Bonding
$EndSCHEMATC
