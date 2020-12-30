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
L 2019-05-Week-1-Footprint-Test-and-Breakout-rescue:Rocker_SMD-switches_inputs SW2
U 1 1 5CD09252
P 3700 2850
F 0 "SW2" H 3725 2505 50  0000 C CNN
F 1 "Rocker_SMD" H 3725 2596 50  0000 C CNN
F 2 "BVH_Switches:Rocker_SMD" H 3600 2850 50  0001 C CNN
F 3 "" H 3600 2850 50  0001 C CNN
	1    3700 2850
	-1   0    0    1   
$EndComp
$Comp
L 2019-05-Week-1-Footprint-Test-and-Breakout-rescue:5_Way_Tac_Switch_SMD-switches_inputs SW1
U 1 1 5CD09607
P 3700 1950
F 0 "SW1" H 3700 1555 50  0000 C CNN
F 1 "5_Way_Tac_Switch_SMD" H 3700 1646 50  0000 C CNN
F 2 "BVH_Switches:5_Way_Tac_Switch_SMD" H 3700 1950 50  0001 C CNN
F 3 "" H 3700 1950 50  0001 C CNN
	1    3700 1950
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 5CD0978F
P 5700 3350
F 0 "J1" H 5673 3230 50  0000 R CNN
F 1 "Conn_01x06_Male" H 5673 3321 50  0000 R CNN
F 2 "Connectors_JST:JST_PH_S6B-PH-K_06x2.00mm_Angled" H 5700 3350 50  0001 C CNN
F 3 "~" H 5700 3350 50  0001 C CNN
	1    5700 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3250 3550 3250 2850
Wire Wire Line
	3250 3550 5500 3550
Wire Wire Line
	3250 2850 3250 2000
Connection ~ 3250 2850
Wire Wire Line
	5500 3450 4750 3450
Wire Wire Line
	4750 3450 4750 3000
Wire Wire Line
	4750 3000 4100 3000
Wire Wire Line
	4750 3000 4750 1950
Wire Wire Line
	4750 1950 4150 1950
Connection ~ 4750 3000
Wire Wire Line
	5500 3350 4850 3350
Wire Wire Line
	4850 3350 4850 2700
Wire Wire Line
	4850 2700 4100 2700
Wire Wire Line
	4850 2700 4850 1750
Wire Wire Line
	4850 1750 4150 1750
Connection ~ 4850 2700
Wire Wire Line
	5500 3250 4950 3250
Wire Wire Line
	4950 3250 4950 2150
Wire Wire Line
	4950 2150 4150 2150
Wire Wire Line
	5500 3150 5050 3150
Wire Wire Line
	5050 3150 5050 1850
Wire Wire Line
	5050 1850 4150 1850
Wire Wire Line
	5500 3050 5150 3050
Wire Wire Line
	5150 3050 5150 2850
Wire Wire Line
	5150 2850 4100 2850
Wire Wire Line
	5150 2850 5150 2050
Wire Wire Line
	5150 2050 4150 2050
Connection ~ 5150 2850
$Comp
L power:GND #PWR0101
U 1 1 5CD0A727
P 3250 3550
F 0 "#PWR0101" H 3250 3300 50  0001 C CNN
F 1 "GND" H 3255 3377 50  0000 C CNN
F 2 "" H 3250 3550 50  0001 C CNN
F 3 "" H 3250 3550 50  0001 C CNN
	1    3250 3550
	1    0    0    -1  
$EndComp
Connection ~ 3250 3550
$EndSCHEMATC
