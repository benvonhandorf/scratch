EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "FT-891 Audio breakout - 3 Band EQ Shield"
Date "2020-02-09"
Rev "v0.1"
Comp "Sky Iron Studio"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3250 2700 0    50   Input ~ 0
Audio_In
Text HLabel 6050 2600 2    50   Output ~ 0
Audio_Out_L
$Comp
L Amplifier_Operational:OPA1678 U1
U 1 1 5E491E4B
P 4650 2600
F 0 "U1" H 4650 2967 50  0000 C CNN
F 1 "OPA1678" H 4650 2876 50  0000 C CNN
F 2 "SMD_Packages:SOIC-8-N" H 4650 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/opa1678.pdf" H 4650 2600 50  0001 C CNN
F 4 "X" H 4650 2600 50  0001 C CNN "Spice_Primitive"
F 5 "OPA1678-dual" H 4650 2600 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4650 2600 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/benvh/projects/kicad-library/Simulation/OPA1678/OPA1678-dual.lib" H 4650 2600 50  0001 C CNN "Spice_Lib_File"
	1    4650 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR02
U 1 1 5E49554A
P 3750 2200
F 0 "#PWR02" H 3750 1950 50  0001 C CNN
F 1 "GNDA" H 3755 2027 50  0000 C CNN
F 2 "" H 3750 2200 50  0001 C CNN
F 3 "" H 3750 2200 50  0001 C CNN
	1    3750 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2200 4150 2200
Wire Wire Line
	4150 2200 4150 2500
Wire Wire Line
	4150 2500 4350 2500
Wire Wire Line
	6050 2600 4950 2600
Connection ~ 4950 2600
$Comp
L Amplifier_Operational:OPA1678 U1
U 3 1 5E497090
P 7700 2600
F 0 "U1" H 7658 2646 50  0000 L CNN
F 1 "OPA1678" H 7658 2555 50  0000 L CNN
F 2 "SMD_Packages:SOIC-8-N" H 7700 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/opa1678.pdf" H 7700 2600 50  0001 C CNN
F 4 "X" H 7700 2600 50  0001 C CNN "Spice_Primitive"
F 5 "OPA1678-dual" H 7700 2600 50  0001 C CNN "Spice_Model"
F 6 "Y" H 7700 2600 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/benvh/projects/kicad-library/Simulation/OPA1678/OPA1678-dual.lib" H 7700 2600 50  0001 C CNN "Spice_Lib_File"
	3    7700 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5E4984E8
P 7600 2050
F 0 "#PWR01" H 7600 1900 50  0001 C CNN
F 1 "+5V" H 7615 2223 50  0000 C CNN
F 2 "" H 7600 2050 50  0001 C CNN
F 3 "" H 7600 2050 50  0001 C CNN
	1    7600 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5E4987EF
P 7600 3100
F 0 "#PWR03" H 7600 2850 50  0001 C CNN
F 1 "GND" H 7605 2927 50  0000 C CNN
F 2 "" H 7600 3100 50  0001 C CNN
F 3 "" H 7600 3100 50  0001 C CNN
	1    7600 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3100 7600 2900
Wire Wire Line
	7600 2300 7600 2250
$Comp
L Device:C C1
U 1 1 5E49915D
P 8250 2550
F 0 "C1" H 8365 2596 50  0000 L CNN
F 1 "0.1uF" H 8365 2505 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8288 2400 50  0001 C CNN
F 3 "~" H 8250 2550 50  0001 C CNN
	1    8250 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2400 8250 2250
Wire Wire Line
	8250 2250 7600 2250
Connection ~ 7600 2250
Wire Wire Line
	7600 2250 7600 2050
Wire Wire Line
	7600 2900 8250 2900
Wire Wire Line
	8250 2900 8250 2700
Connection ~ 7600 2900
$Comp
L Amplifier_Operational:OPA1678 U1
U 2 1 5E49AA78
P 4700 4250
F 0 "U1" H 4700 4617 50  0000 C CNN
F 1 "OPA1678" H 4700 4526 50  0000 C CNN
F 2 "SMD_Packages:SOIC-8-N" H 4700 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/opa1678.pdf" H 4700 4250 50  0001 C CNN
F 4 "X" H 4700 4250 50  0001 C CNN "Spice_Primitive"
F 5 "OPA1678-dual" H 4700 4250 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4700 4250 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/benvh/projects/kicad-library/Simulation/OPA1678/OPA1678-dual.lib" H 4700 4250 50  0001 C CNN "Spice_Lib_File"
	2    4700 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4150 4400 4150
Wire Wire Line
	5000 4250 5000 4650
Wire Wire Line
	5000 4650 4300 4650
Wire Wire Line
	4300 4650 4300 4350
Wire Wire Line
	4300 4350 4400 4350
Text HLabel 6100 4250 2    50   Output ~ 0
Audio_Out_R
Wire Wire Line
	5000 4250 6100 4250
Connection ~ 5000 4250
Wire Wire Line
	4950 2600 4950 3100
$Comp
L Device:R R1
U 1 1 5E4C4511
P 3800 2700
F 0 "R1" V 3593 2700 50  0000 C CNN
F 1 "4.7k" V 3684 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3730 2700 50  0001 C CNN
F 3 "~" H 3800 2700 50  0001 C CNN
	1    3800 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5E4C4B5E
P 4450 3450
F 0 "RV1" V 4243 3450 50  0000 C CNN
F 1 "10k" V 4334 3450 50  0000 C CNN
F 2 "BVH_Components_Misc:Potentiometer_TT_P090S-Top-Adjust" H 4450 3450 50  0001 C CNN
F 3 "~" H 4450 3450 50  0001 C CNN
	1    4450 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 2700 4350 2700
Wire Wire Line
	4100 2700 3950 2700
Connection ~ 4100 2700
Wire Wire Line
	3650 2700 3250 2700
$Comp
L Device:C C2
U 1 1 5E4D4CD0
P 4450 3100
F 0 "C2" V 4198 3100 50  0000 C CNN
F 1 "1nF" V 4289 3100 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4488 2950 50  0001 C CNN
F 3 "~" H 4450 3100 50  0001 C CNN
	1    4450 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 3450 4100 3450
Wire Wire Line
	4100 2700 4100 3100
Wire Wire Line
	4600 3100 4950 3100
Connection ~ 4950 3100
Wire Wire Line
	4300 3100 4100 3100
Connection ~ 4100 3100
Wire Wire Line
	4100 3100 4100 3450
Wire Wire Line
	4450 3600 4950 3600
Wire Wire Line
	4950 3100 4950 3600
Connection ~ 4450 3600
Wire Wire Line
	4450 3600 4150 3600
Wire Wire Line
	4150 3600 4150 4150
Text Notes 5100 3250 0    50   ~ 0
Filter:\nC = 1nF\n@1  - 159MHz - Not great, but minimum \ngain and low R will predominate?\n@10k - 15kHz
NoConn ~ 4600 3450
$Comp
L pspice:VSOURCE V1
U 1 1 5EE73326
P 2050 3350
F 0 "V1" H 2278 3396 50  0000 L CNN
F 1 "VSOURCE" H 2278 3305 50  0000 L CNN
F 2 "" H 2050 3350 50  0001 C CNN
F 3 "~" H 2050 3350 50  0001 C CNN
F 4 "V" H 2050 3350 50  0001 C CNN "Spice_Primitive"
F 5 "dc 0 ac 1" H 2050 3350 50  0001 C CNN "Spice_Model"
F 6 "Y" H 2050 3350 50  0001 C CNN "Spice_Netlist_Enabled"
	1    2050 3350
	1    0    0    -1  
$EndComp
Text HLabel 2000 2800 0    50   Input ~ 0
Audio_In
Wire Wire Line
	2050 3050 2050 2800
Wire Wire Line
	2050 2800 2000 2800
$Comp
L pspice:VSOURCE V2
U 1 1 5EE76558
P 2000 5200
F 0 "V2" H 2228 5246 50  0000 L CNN
F 1 "VSOURCE" H 2228 5155 50  0000 L CNN
F 2 "" H 2000 5200 50  0001 C CNN
F 3 "~" H 2000 5200 50  0001 C CNN
F 4 "V" H 2000 5200 50  0001 C CNN "Spice_Primitive"
F 5 "dc 5 ac 0" H 2000 5200 50  0001 C CNN "Spice_Model"
F 6 "Y" H 2000 5200 50  0001 C CNN "Spice_Netlist_Enabled"
	1    2000 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5EE76C83
P 2000 4900
F 0 "#PWR06" H 2000 4750 50  0001 C CNN
F 1 "+5V" H 2015 5073 50  0000 C CNN
F 2 "" H 2000 4900 50  0001 C CNN
F 3 "" H 2000 4900 50  0001 C CNN
	1    2000 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5EE771E4
P 2000 5500
F 0 "#PWR08" H 2000 5250 50  0001 C CNN
F 1 "GND" H 2005 5327 50  0000 C CNN
F 2 "" H 2000 5500 50  0001 C CNN
F 3 "" H 2000 5500 50  0001 C CNN
	1    2000 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR09
U 1 1 5EE7A598
P 4250 5950
F 0 "#PWR09" H 4250 5700 50  0001 C CNN
F 1 "GNDA" H 4255 5777 50  0000 C CNN
F 2 "" H 4250 5950 50  0001 C CNN
F 3 "" H 4250 5950 50  0001 C CNN
	1    4250 5950
	1    0    0    -1  
$EndComp
$Comp
L pspice:VSOURCE V3
U 1 1 5EE7AAB6
P 3650 5650
F 0 "V3" H 3878 5696 50  0000 L CNN
F 1 "VSOURCE" H 3878 5605 50  0000 L CNN
F 2 "" H 3650 5650 50  0001 C CNN
F 3 "~" H 3650 5650 50  0001 C CNN
F 4 "V" H 3650 5650 50  0001 C CNN "Spice_Primitive"
F 5 "dc 2.5 ac 0" H 3650 5650 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3650 5650 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3650 5650
	1    0    0    -1  
$EndComp
$Comp
L pspice:VSOURCE V4
U 1 1 5EE7EF7B
P 3650 6250
F 0 "V4" H 3878 6296 50  0000 L CNN
F 1 "VSOURCE" H 3878 6205 50  0000 L CNN
F 2 "" H 3650 6250 50  0001 C CNN
F 3 "~" H 3650 6250 50  0001 C CNN
F 4 "V" H 3650 6250 50  0001 C CNN "Spice_Primitive"
F 5 "dc 2.5 ac 0" H 3650 6250 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3650 6250 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3650 6250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5EE8179E
P 3650 5350
F 0 "#PWR07" H 3650 5200 50  0001 C CNN
F 1 "+5V" H 3665 5523 50  0000 C CNN
F 2 "" H 3650 5350 50  0001 C CNN
F 3 "" H 3650 5350 50  0001 C CNN
	1    3650 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5EE81CED
P 3650 6550
F 0 "#PWR010" H 3650 6300 50  0001 C CNN
F 1 "GND" H 3655 6377 50  0000 C CNN
F 2 "" H 3650 6550 50  0001 C CNN
F 3 "" H 3650 6550 50  0001 C CNN
	1    3650 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 5950 4250 5950
Connection ~ 3650 5950
$Comp
L power:GNDA #PWR04
U 1 1 5EE87F7A
P 2050 3650
F 0 "#PWR04" H 2050 3400 50  0001 C CNN
F 1 "GNDA" H 2055 3477 50  0000 C CNN
F 2 "" H 2050 3650 50  0001 C CNN
F 3 "" H 2050 3650 50  0001 C CNN
	1    2050 3650
	1    0    0    -1  
$EndComp
Text HLabel 8300 4750 2    50   Output ~ 0
Audio_Out_R
Text HLabel 8300 4450 2    50   Output ~ 0
Audio_Out_L
$Comp
L power:GND #PWR05
U 1 1 5EE8F230
P 7650 4600
F 0 "#PWR05" H 7650 4350 50  0001 C CNN
F 1 "GND" H 7655 4427 50  0000 C CNN
F 2 "" H 7650 4600 50  0001 C CNN
F 3 "" H 7650 4600 50  0001 C CNN
	1    7650 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4600 7650 4550
Wire Wire Line
	7650 4450 8300 4450
Wire Wire Line
	7650 4550 8300 4550
Wire Wire Line
	8300 4550 8300 4750
Connection ~ 7650 4550
Wire Wire Line
	7650 4550 7650 4450
$EndSCHEMATC
