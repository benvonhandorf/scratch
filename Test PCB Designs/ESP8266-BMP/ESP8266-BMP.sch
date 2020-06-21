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
L ESP8266:ESP-12F U?
U 1 1 5EEE92F1
P 5400 3300
F 0 "U?" H 5400 4065 50  0000 C CNN
F 1 "ESP-12F" H 5400 3974 50  0000 C CNN
F 2 "" H 5400 3300 50  0001 C CNN
F 3 "" H 5400 3300 50  0001 C CNN
	1    5400 3300
	1    0    0    -1  
$EndComp
Text Notes 1250 1450 0    50   ~ 0
Custom PCB for ESP8266 Blackmagic Probe setup\nGoals:\n- ESP-12F module\n- Wireless debugging\n- Power from target\n- SWD or JTAG
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 5EEEA0BA
P 8700 2800
F 0 "J?" H 8750 3217 50  0000 C CNN
F 1 "T_DBG" H 8750 3126 50  0000 C CNN
F 2 "Connector_PinSocket_1.27mm:PinSocket_2x05_P1.27mm_Vertical" H 8700 2800 50  0001 C CNN
F 3 "~" H 8700 2800 50  0001 C CNN
	1    8700 2800
	1    0    0    -1  
$EndComp
Text GLabel 8500 2600 0    50   Input ~ 0
Vref
$Comp
L power:GND #PWR?
U 1 1 5EEEACFC
P 8150 2700
F 0 "#PWR?" H 8150 2450 50  0001 C CNN
F 1 "GND" H 8155 2527 50  0000 C CNN
F 2 "" H 8150 2700 50  0001 C CNN
F 3 "" H 8150 2700 50  0001 C CNN
	1    8150 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2700 8350 2700
Wire Wire Line
	8500 2800 8350 2800
Wire Wire Line
	8350 2800 8350 2700
Connection ~ 8350 2700
Wire Wire Line
	8350 2700 8500 2700
NoConn ~ 8500 2900
Text GLabel 8500 3000 0    50   Input ~ 0
GNDdetect
Text GLabel 9000 2600 2    50   Input ~ 0
TMS
Text GLabel 9000 2700 2    50   Input ~ 0
TCK
Text GLabel 9000 2800 2    50   Input ~ 0
TDO
Text GLabel 9000 2900 2    50   Input ~ 0
TDI
Text GLabel 9000 3000 2    50   Input ~ 0
~TReset
$Comp
L Connector_Generic:Conn_01x03 J?
U 1 1 5EEEC26B
P 9000 1700
F 0 "J?" H 9080 1742 50  0000 L CNN
F 1 "ESP_Serial" H 9080 1651 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 9000 1700 50  0001 C CNN
F 3 "~" H 9000 1700 50  0001 C CNN
	1    9000 1700
	1    0    0    -1  
$EndComp
Text GLabel 8800 1600 0    50   Input ~ 0
TXD
Text GLabel 8800 1700 0    50   Input ~ 0
RXD
$Comp
L power:GND #PWR?
U 1 1 5EEED235
P 8550 1800
F 0 "#PWR?" H 8550 1550 50  0001 C CNN
F 1 "GND" H 8555 1627 50  0000 C CNN
F 2 "" H 8550 1800 50  0001 C CNN
F 3 "" H 8550 1800 50  0001 C CNN
	1    8550 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 1800 8800 1800
Text GLabel 6300 3000 2    50   Input ~ 0
TXD
Text GLabel 6300 3100 2    50   Input ~ 0
RXD
Text GLabel 6300 3300 2    50   Input ~ 0
TMS
Text GLabel 4500 3600 0    50   Input ~ 0
TDI
Text GLabel 4500 3400 0    50   Input ~ 0
TDO
Text GLabel 6300 3200 2    50   Input ~ 0
TCK
Text Notes 8450 3450 0    50   ~ 0
Cortex Pinout\nTMS -> SWDIO\nTCK -> SWDCK\nTDO -> SWO
Text GLabel 4500 3500 0    50   Input ~ 0
~TReset
Text Notes 8250 1450 0    50   ~ 0
Serial connection for ESP programming and \ntarget comms
Text GLabel 6300 3400 2    50   Input ~ 0
GPIO0
Text GLabel 6300 3500 2    50   Input ~ 0
GPIO2
Text GLabel 2050 4750 2    50   Input ~ 0
GPIO0
Text GLabel 2000 3500 2    50   Input ~ 0
GPIO2
$Comp
L power:+3.3V #PWR?
U 1 1 5EEEF870
P 1850 4350
F 0 "#PWR?" H 1850 4200 50  0001 C CNN
F 1 "+3.3V" H 1865 4523 50  0000 C CNN
F 2 "" H 1850 4350 50  0001 C CNN
F 3 "" H 1850 4350 50  0001 C CNN
	1    1850 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EEEFCD2
P 1900 3100
F 0 "#PWR?" H 1900 2950 50  0001 C CNN
F 1 "+3.3V" H 1915 3273 50  0000 C CNN
F 2 "" H 1900 3100 50  0001 C CNN
F 3 "" H 1900 3100 50  0001 C CNN
	1    1900 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EEF0570
P 1900 3350
F 0 "R?" H 1970 3396 50  0000 L CNN
F 1 "10k" H 1970 3305 50  0000 L CNN
F 2 "" V 1830 3350 50  0001 C CNN
F 3 "~" H 1900 3350 50  0001 C CNN
	1    1900 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EEF091D
P 1850 4600
F 0 "R?" H 1920 4646 50  0000 L CNN
F 1 "10k" H 1920 4555 50  0000 L CNN
F 2 "" V 1780 4600 50  0001 C CNN
F 3 "~" H 1850 4600 50  0001 C CNN
	1    1850 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3500 2000 3500
Wire Wire Line
	1900 3200 1900 3100
Wire Wire Line
	1850 4350 1850 4450
Wire Wire Line
	1850 4750 2050 4750
Wire Wire Line
	1650 4750 1850 4750
Connection ~ 1850 4750
$Comp
L power:GND #PWR?
U 1 1 5EEF2577
P 1050 4750
F 0 "#PWR?" H 1050 4500 50  0001 C CNN
F 1 "GND" H 1055 4577 50  0000 C CNN
F 2 "" H 1050 4750 50  0001 C CNN
F 3 "" H 1050 4750 50  0001 C CNN
	1    1050 4750
	1    0    0    -1  
$EndComp
Text Notes 1400 5050 0    50   ~ 0
Pull low on boot\nfor UART bootloader
Text GLabel 6300 3600 2    50   Input ~ 0
GPIO15
Text GLabel 1300 2950 2    50   Input ~ 0
GPIO15
$Comp
L Device:R R?
U 1 1 5EEF3251
P 1150 3100
F 0 "R?" H 1220 3146 50  0000 L CNN
F 1 "10k" H 1220 3055 50  0000 L CNN
F 2 "" V 1080 3100 50  0001 C CNN
F 3 "~" H 1150 3100 50  0001 C CNN
	1    1150 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEF37D6
P 1150 3400
F 0 "#PWR?" H 1150 3150 50  0001 C CNN
F 1 "GND" H 1155 3227 50  0000 C CNN
F 2 "" H 1150 3400 50  0001 C CNN
F 3 "" H 1150 3400 50  0001 C CNN
	1    1150 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 3400 1150 3250
Wire Wire Line
	1150 2950 1300 2950
$Comp
L power:GND #PWR?
U 1 1 5EEF4327
P 6450 3700
F 0 "#PWR?" H 6450 3450 50  0001 C CNN
F 1 "GND" H 6455 3527 50  0000 C CNN
F 2 "" H 6450 3700 50  0001 C CNN
F 3 "" H 6450 3700 50  0001 C CNN
	1    6450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3700 6300 3700
$Comp
L power:+3.3V #PWR?
U 1 1 5EEF4C36
P 4000 3700
F 0 "#PWR?" H 4000 3550 50  0001 C CNN
F 1 "+3.3V" H 4015 3873 50  0000 C CNN
F 2 "" H 4000 3700 50  0001 C CNN
F 3 "" H 4000 3700 50  0001 C CNN
	1    4000 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEF6EB8
P 3650 3000
F 0 "#PWR?" H 3650 2750 50  0001 C CNN
F 1 "GND" H 3655 2827 50  0000 C CNN
F 2 "" H 3650 3000 50  0001 C CNN
F 3 "" H 3650 3000 50  0001 C CNN
	1    3650 3000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW?
U 1 1 5EEF7B73
P 4050 3000
F 0 "SW?" H 4050 3235 50  0000 C CNN
F 1 "RST" H 4050 3144 50  0000 C CNN
F 2 "BVH_Switches:TacButton_SMD_5mm_5mm" H 4050 3000 50  0001 C CNN
F 3 "~" H 4050 3000 50  0001 C CNN
	1    4050 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 3000 3850 3000
$Comp
L Switch:SW_SPST SW?
U 1 1 5EEF95EA
P 1450 4750
F 0 "SW?" H 1450 4985 50  0000 C CNN
F 1 "BOOT" H 1450 4894 50  0000 C CNN
F 2 "BVH_Switches:TacButton_SMD_5mm_5mm" H 1450 4750 50  0001 C CNN
F 3 "~" H 1450 4750 50  0001 C CNN
	1    1450 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 4750 1250 4750
$Comp
L BVH_Voltage_Regulators:C C?
U 1 1 5EEFB3D5
P 1500 5850
F 0 "C?" H 1615 5896 50  0000 L CNN
F 1 "10uF" H 1615 5805 50  0000 L CNN
F 2 "" H 1538 5700 50  0001 C CNN
F 3 "" H 1500 5850 50  0001 C CNN
	1    1500 5850
	1    0    0    -1  
$EndComp
$Comp
L BVH_Voltage_Regulators:C C?
U 1 1 5EEFB42C
P 1900 5850
F 0 "C?" H 2015 5896 50  0000 L CNN
F 1 "0.1uF" H 2015 5805 50  0000 L CNN
F 2 "" H 1938 5700 50  0001 C CNN
F 3 "" H 1900 5850 50  0001 C CNN
	1    1900 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EEFB6CD
P 1500 5550
F 0 "#PWR?" H 1500 5400 50  0001 C CNN
F 1 "+3.3V" H 1515 5723 50  0000 C CNN
F 2 "" H 1500 5550 50  0001 C CNN
F 3 "" H 1500 5550 50  0001 C CNN
	1    1500 5550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EEFBCEF
P 1900 5550
F 0 "#PWR?" H 1900 5400 50  0001 C CNN
F 1 "+3.3V" H 1915 5723 50  0000 C CNN
F 2 "" H 1900 5550 50  0001 C CNN
F 3 "" H 1900 5550 50  0001 C CNN
	1    1900 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEFC0D2
P 1500 6100
F 0 "#PWR?" H 1500 5850 50  0001 C CNN
F 1 "GND" H 1505 5927 50  0000 C CNN
F 2 "" H 1500 6100 50  0001 C CNN
F 3 "" H 1500 6100 50  0001 C CNN
	1    1500 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EEFC4B2
P 1900 6100
F 0 "#PWR?" H 1900 5850 50  0001 C CNN
F 1 "GND" H 1905 5927 50  0000 C CNN
F 2 "" H 1900 6100 50  0001 C CNN
F 3 "" H 1900 6100 50  0001 C CNN
	1    1900 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 6100 1900 6000
Wire Wire Line
	1500 6000 1500 6100
Wire Wire Line
	1500 5700 1500 5550
Wire Wire Line
	1900 5550 1900 5700
Text Notes 3950 4800 0    50   ~ 0
Pin selections from\nhttps://github.com/walmis/blackmagic-espidf/blob/master/main/Kconfig.projbuild\nBut modified to avoid boot pins
Text Notes 1700 3750 0    50   ~ 0
Fixed boot pins
Wire Notes Line
	950  3850 950  2750
Wire Notes Line
	950  4050 2450 4050
Wire Notes Line
	2450 4050 2450 5150
Wire Notes Line
	2450 5150 950  5150
Wire Notes Line
	950  5150 950  4050
Text Notes 1450 6500 0    50   ~ 0
Decoupling
Wire Notes Line
	1250 5300 2350 5300
Wire Notes Line
	2350 5300 2350 6600
Wire Notes Line
	2350 6600 1250 6600
Wire Notes Line
	1250 6600 1250 5300
NoConn ~ 5150 4200
NoConn ~ 5250 4200
NoConn ~ 5450 4200
NoConn ~ 5550 4200
NoConn ~ 5650 4200
NoConn ~ 4500 3300
NoConn ~ 4500 3100
Text GLabel 4500 3200 0    50   Input ~ 0
CH_PD
Text GLabel 2700 3500 2    50   Input ~ 0
CH_PD
$Comp
L Device:R R?
U 1 1 5EF193D6
P 2550 3350
F 0 "R?" H 2620 3396 50  0000 L CNN
F 1 "10k" H 2620 3305 50  0000 L CNN
F 2 "" V 2480 3350 50  0001 C CNN
F 3 "~" H 2550 3350 50  0001 C CNN
	1    2550 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EF19B53
P 2550 3100
F 0 "#PWR?" H 2550 2950 50  0001 C CNN
F 1 "+3.3V" H 2565 3273 50  0000 C CNN
F 2 "" H 2550 3100 50  0001 C CNN
F 3 "" H 2550 3100 50  0001 C CNN
	1    2550 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3100 2550 3200
Wire Wire Line
	2550 3500 2700 3500
Wire Notes Line
	950  2750 3100 2750
Wire Notes Line
	3100 2750 3100 3850
Wire Notes Line
	3100 3850 950  3850
Text GLabel 4450 5550 0    50   Input ~ 0
Vref
$Comp
L power:+3.3V #PWR?
U 1 1 5EF1BCA0
P 4900 5500
F 0 "#PWR?" H 4900 5350 50  0001 C CNN
F 1 "+3.3V" H 4915 5673 50  0000 C CNN
F 2 "" H 4900 5500 50  0001 C CNN
F 3 "" H 4900 5500 50  0001 C CNN
	1    4900 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 5550 4900 5550
Wire Wire Line
	4900 5550 4900 5500
$Comp
L power:GND #PWR?
U 1 1 5EF20CC4
P 6550 5650
F 0 "#PWR?" H 6550 5400 50  0001 C CNN
F 1 "GND" H 6555 5477 50  0000 C CNN
F 2 "" H 6550 5650 50  0001 C CNN
F 3 "" H 6550 5650 50  0001 C CNN
	1    6550 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EF20CCE
P 6550 5200
F 0 "R?" H 6620 5246 50  0000 L CNN
F 1 "1k" H 6620 5155 50  0000 L CNN
F 2 "" V 6480 5200 50  0001 C CNN
F 3 "~" H 6550 5200 50  0001 C CNN
	1    6550 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5EF20CD8
P 6550 5500
F 0 "D?" V 6589 5382 50  0000 R CNN
F 1 "STAT" V 6498 5382 50  0000 R CNN
F 2 "" H 6550 5500 50  0001 C CNN
F 3 "~" H 6550 5500 50  0001 C CNN
	1    6550 5500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6550 4850 6550 5050
Wire Wire Line
	4000 3700 4500 3700
Wire Wire Line
	4250 3000 4500 3000
NoConn ~ 5350 4200
Text GLabel 6550 4850 2    50   Input ~ 0
GPIO15
$Comp
L power:GND #PWR?
U 1 1 5EF2BAD1
P 8850 4350
F 0 "#PWR?" H 8850 4100 50  0001 C CNN
F 1 "GND" H 8855 4177 50  0000 C CNN
F 2 "" H 8850 4350 50  0001 C CNN
F 3 "" H 8850 4350 50  0001 C CNN
	1    8850 4350
	1    0    0    -1  
$EndComp
Text GLabel 9000 4050 0    50   Input ~ 0
TDO
Text GLabel 9000 4150 0    50   Input ~ 0
TDI
Text GLabel 9000 4250 0    50   Input ~ 0
~TReset
Text Notes 8500 4800 0    50   ~ 0
Even side matches STM “Pill” Pinout\nF header for direct connection to pill boards\n2.54mm Pin Headers for easy breakout
$Comp
L power:GND #PWR?
U 1 1 5EF2F3A1
P 9650 4350
F 0 "#PWR?" H 9650 4100 50  0001 C CNN
F 1 "GND" H 9655 4177 50  0000 C CNN
F 2 "" H 9650 4350 50  0001 C CNN
F 3 "" H 9650 4350 50  0001 C CNN
	1    9650 4350
	1    0    0    -1  
$EndComp
Text GLabel 9500 4050 2    50   Input ~ 0
Vref
Text GLabel 9500 4250 2    50   Input ~ 0
TCK
Text GLabel 9500 4150 2    50   Input ~ 0
TMS
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J?
U 1 1 5EF36222
P 9200 4150
F 0 "J?" H 9250 4467 50  0000 C CNN
F 1 "JTAG" H 9250 4376 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical" H 9200 4150 50  0001 C CNN
F 3 "~" H 9200 4150 50  0001 C CNN
	1    9200 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 4350 9500 4350
Wire Wire Line
	8850 4350 9000 4350
$EndSCHEMATC
