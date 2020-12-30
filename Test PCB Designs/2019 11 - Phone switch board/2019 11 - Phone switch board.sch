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
L Switch:SW_SPST SW1
U 1 1 5DD1AD92
P 6250 3100
F 0 "SW1" H 6250 3335 50  0000 C CNN
F 1 "SW_SPST" H 6250 3244 50  0000 C CNN
F 2 "Switches:TacButton_12mm_12mm_LED-optional" H 6250 3100 50  0001 C CNN
F 3 "" H 6250 3100 50  0001 C CNN
	1    6250 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3100 6050 3100
$Comp
L BVH_Connectors_Misc:AudioJack4_SwitchTR J1
U 1 1 5DD238E0
P 5300 3300
F 0 "J1" H 5232 3725 50  0000 C CNN
F 1 "AudioJack4_SwitchTR" H 5232 3634 50  0000 C CNN
F 2 "BVH_Connectors_Misc:SJ-43516-SMT-TRRS_Audio_Jack_w_switch" H 5250 3300 50  0001 C CNN
F 3 "~" H 5250 3300 50  0001 C CNN
	1    5300 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3500 6450 3500
Wire Wire Line
	6450 3500 6450 3100
NoConn ~ 5500 3200
NoConn ~ 5500 3300
NoConn ~ 5500 3400
$EndSCHEMATC
