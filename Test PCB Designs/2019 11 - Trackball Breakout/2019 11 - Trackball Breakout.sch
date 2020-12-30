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
L Connector:Conn_01x10_Female J2
U 1 1 5DD52ABF
P 4300 3000
F 0 "J2" V 4465 2930 50  0000 C CNN
F 1 "Breakout" V 4374 2930 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 4300 3000 50  0001 C CNN
F 3 "~" H 4300 3000 50  0001 C CNN
	1    4300 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2600 4100 2600
Wire Wire Line
	3800 2700 4100 2700
Wire Wire Line
	3800 2800 4100 2800
Wire Wire Line
	3800 3000 4100 3000
Wire Wire Line
	3800 2900 4100 2900
Wire Wire Line
	3800 3100 4100 3100
$Comp
L BVH_Connectors_Misc:WM10984CT J1
U 1 1 5DD770A4
P 3800 2750
F 0 "J1" H 3608 3125 50  0000 C CNN
F 1 "WM10984CT" H 3608 3034 50  0000 C CNN
F 2 "BVH_Connectors_Misc:Molex_0855055002_RJ-45_Jack_Shielded_Yaesu_Numbering" H 3800 2750 50  0001 C CNN
F 3 "" H 3800 2750 50  0001 C CNN
	1    3800 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3200 4100 3200
Wire Wire Line
	3800 3300 4100 3300
Wire Wire Line
	3800 3400 4100 3400
Wire Wire Line
	3800 3500 4100 3500
NoConn ~ 3550 3600
$EndSCHEMATC
