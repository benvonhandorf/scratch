EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
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
LIBS:switches_inputs
LIBS:2018-Jan-Footprint-Test-cache
EELAYER 25 0
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
L xbox_joystick JOY1
U 1 1 5AA04B48
P 1950 2300
F 0 "JOY1" H 1950 1550 60  0000 C CNN
F 1 "xbox_joystick" H 1950 2900 60  0000 C CNN
F 2 "Switches:XBOX-JOYSTICK" H 1950 2300 60  0001 C CNN
F 3 "" H 1950 2300 60  0001 C CNN
	1    1950 2300
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x05 J1
U 1 1 5AA04B7C
P 2750 2300
F 0 "J1" H 2750 2600 50  0000 C CNN
F 1 "Conn_01x05" H 2750 2000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 2750 2300 50  0001 C CNN
F 3 "" H 2750 2300 50  0001 C CNN
	1    2750 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2000 2150 2100
Wire Wire Line
	2150 2100 2550 2100
Wire Wire Line
	2150 2400 2350 2400
Wire Wire Line
	2350 2100 2350 2700
Connection ~ 2350 2100
Wire Wire Line
	2350 2700 2150 2700
Connection ~ 2350 2400
Wire Wire Line
	2150 2300 2250 2300
Wire Wire Line
	2250 2200 2250 2600
Wire Wire Line
	2250 2200 2550 2200
Wire Wire Line
	2250 2600 2150 2600
Connection ~ 2250 2300
Wire Wire Line
	2150 2200 2200 2200
Wire Wire Line
	2200 2200 2200 2250
Wire Wire Line
	2200 2250 2550 2250
Wire Wire Line
	2550 2250 2550 2300
Wire Wire Line
	2150 2500 2450 2500
Wire Wire Line
	2450 2500 2450 2400
Wire Wire Line
	2450 2400 2550 2400
Wire Wire Line
	2550 2500 2500 2500
Wire Wire Line
	2500 2500 2500 2800
Wire Wire Line
	2500 2800 2150 2800
$EndSCHEMATC
