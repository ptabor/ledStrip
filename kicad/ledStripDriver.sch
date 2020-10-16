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
L power:+12V #PWR0101
U 1 1 5E232AC2
P 1350 1500
F 0 "#PWR0101" H 1350 1350 50  0001 C CNN
F 1 "+12V" H 1365 1673 50  0000 C CNN
F 2 "" H 1350 1500 50  0001 C CNN
F 3 "" H 1350 1500 50  0001 C CNN
	1    1350 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 JIN1
U 1 1 5E233251
P 1250 2200
F 0 "JIN1" H 1330 2192 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 1330 2101 50  0000 L CNN
F 2 "ptabOther:TerminalBlock_RND_205-00023_1x02_P10.00mm_Horizontal(2mmdrill)" H 1250 2200 50  0001 C CNN
F 3 "~" H 1250 2200 50  0001 C CNN
	1    1250 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1500 1050 1500
Wire Wire Line
	1050 1500 1050 1950
Wire Wire Line
	1050 2300 1050 2750
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 5E235A41
P 2050 1950
F 0 "SW1" H 2050 2217 50  0000 C CNN
F 1 "SW_DIP_x01" H 2050 2126 50  0000 C CNN
F 2 "ptabOther:ROCKER_SWITCH_7x0.5mm" H 2050 1950 50  0001 C CNN
F 3 "~" H 2050 1950 50  0001 C CNN
	1    2050 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1950 1050 1950
Connection ~ 1050 1950
Wire Wire Line
	1050 1950 1050 2200
$Comp
L Device:Fuse F2
U 1 1 5E236E0F
P 5000 1950
F 0 "F2" V 4803 1950 50  0000 C CNN
F 1 "V12A5-10" V 4894 1950 50  0000 C CNN
F 2 "Fuse:Fuseholder_Cylinder-5x20mm_Stelvio-Kontek_PTF78_Horizontal_Open" V 4930 1950 50  0001 C CNN
F 3 "~" H 5000 1950 50  0001 C CNN
	1    5000 1950
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5E238A6F
P 2500 2200
F 0 "D1" V 2454 2279 50  0000 L CNN
F 1 "D_Schottky_SS14" V 2545 2279 50  0000 L CNN
F 2 "ptabOther:D_SMA_Handsoldering" H 2500 2200 50  0001 C CNN
F 3 "~" H 2500 2200 50  0001 C CNN
	1    2500 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4250 1350 4850 1350
Wire Wire Line
	4250 2650 4850 2650
$Comp
L Device:Fuse F1
U 1 1 5E2475FA
P 5000 1350
F 0 "F1" V 4803 1350 50  0000 C CNN
F 1 "V12A5-10" V 4894 1350 50  0000 C CNN
F 2 "Fuse:Fuseholder_Cylinder-5x20mm_Stelvio-Kontek_PTF78_Horizontal_Open" V 4930 1350 50  0001 C CNN
F 3 "~" H 5000 1350 50  0001 C CNN
	1    5000 1350
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F3
U 1 1 5E24E9A6
P 5000 2650
F 0 "F3" V 4803 2650 50  0000 C CNN
F 1 "V12A5-10" V 4894 2650 50  0000 C CNN
F 2 "Fuse:Fuseholder_Cylinder-5x20mm_Stelvio-Kontek_PTF78_Horizontal_Open" V 4930 2650 50  0001 C CNN
F 3 "~" H 5000 2650 50  0001 C CNN
	1    5000 2650
	0    1    1    0   
$EndComp
$Comp
L Device:CP C1
U 1 1 5E24FEB0
P 5400 1500
F 0 "C1" H 5518 1546 50  0000 L CNN
F 1 "47uF" H 5518 1455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.80mm" H 5438 1350 50  0001 C CNN
F 3 "~" H 5400 1500 50  0001 C CNN
	1    5400 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C0
U 1 1 5E2542C3
P 5400 2100
F 0 "C0" H 5518 2146 50  0000 L CNN
F 1 ">0.47uF" H 5518 2055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.80mm" H 5438 1950 50  0001 C CNN
F 3 "~" H 5400 2100 50  0001 C CNN
	1    5400 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 5E2555D7
P 5400 2900
F 0 "C3" H 5518 2946 50  0000 L CNN
F 1 ">47uF" H 5518 2855 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.80mm" H 5438 2750 50  0001 C CNN
F 3 "~" H 5400 2900 50  0001 C CNN
	1    5400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 2650 5400 2650
Wire Wire Line
	5400 1950 5150 1950
Wire Wire Line
	5150 1300 5150 1350
Connection ~ 5150 1350
Connection ~ 4250 1950
Wire Wire Line
	4250 1950 4250 2650
Wire Wire Line
	5400 1650 5950 1650
Connection ~ 5400 1950
Wire Wire Line
	5400 2300 6000 2300
Connection ~ 5400 2650
Wire Wire Line
	5400 3050 6000 3050
$Comp
L Connector:Screw_Terminal_01x03 JOUT2
U 1 1 5E2690AA
P 6350 2050
F 0 "JOUT2" H 6430 2092 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 6430 2001 50  0000 L CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00002_1x03_P5.00mm_Horizontal" H 6350 2050 50  0001 C CNN
F 3 "~" H 6350 2050 50  0001 C CNN
	1    6350 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 JOUT3
U 1 1 5E2696CC
P 6400 2750
F 0 "JOUT3" H 6480 2792 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 6480 2701 50  0000 L CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00002_1x03_P5.00mm_Horizontal" H 6400 2750 50  0001 C CNN
F 3 "~" H 6400 2750 50  0001 C CNN
	1    6400 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1950 6150 1950
Wire Wire Line
	5400 2650 6200 2650
Wire Wire Line
	6150 1550 5950 1550
Wire Wire Line
	5950 1550 5950 1650
Wire Wire Line
	6150 2150 6000 2150
Wire Wire Line
	6000 2150 6000 2300
Wire Wire Line
	6200 2850 6000 2850
Wire Wire Line
	6000 2850 6000 3050
Wire Wire Line
	2350 1950 2500 1950
Connection ~ 2500 1950
Wire Wire Line
	2500 1950 2500 2050
Wire Wire Line
	2500 2350 2500 2650
Connection ~ 5400 1350
Wire Wire Line
	5400 1350 6150 1350
Wire Wire Line
	5150 1350 5400 1350
Wire Wire Line
	5400 1650 5400 1700
Connection ~ 5400 1650
Wire Wire Line
	5400 2250 5400 2300
Connection ~ 5400 2300
Wire Wire Line
	5400 2300 5400 2350
Wire Wire Line
	5550 6550 6200 6550
Text Label 5700 6550 0    50   ~ 0
RELAY_DRIVER
$Comp
L power:+3V3 #PWR0110
U 1 1 5E2D4E31
P 8700 2750
F 0 "#PWR0110" H 8700 2600 50  0001 C CNN
F 1 "+3V3" H 8715 2923 50  0000 C CNN
F 2 "" H 8700 2750 50  0001 C CNN
F 3 "" H 8700 2750 50  0001 C CNN
	1    8700 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R_LS1_3V1
U 1 1 5E2D6073
P 8700 3050
F 0 "R_LS1_3V1" V 8800 2850 50  0000 L CNN
F 1 "4k7" V 8700 3000 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8630 3050 50  0001 C CNN
F 3 "~" H 8700 3050 50  0001 C CNN
	1    8700 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2850 9100 2850
Wire Wire Line
	9100 2850 9100 3000
$Comp
L Device:R R_LS1_12V1
U 1 1 5E2DD8A0
P 9350 3050
F 0 "R_LS1_12V1" V 9450 2900 50  0000 L CNN
F 1 "4k7" V 9350 2950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9280 3050 50  0001 C CNN
F 3 "~" H 9350 3050 50  0001 C CNN
	1    9350 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q2
U 1 1 5E2D37DB
P 9100 3200
F 0 "Q2" V 9351 3200 50  0000 C CNN
F 1 "AO3400" V 9442 3200 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9300 3300 50  0001 C CNN
F 3 "~" H 9100 3200 50  0001 C CNN
	1    9100 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 2850 9350 2900
Wire Wire Line
	9350 3200 9350 3300
Wire Wire Line
	9350 3300 9300 3300
Connection ~ 9350 3300
Wire Wire Line
	8500 3300 8700 3300
Wire Wire Line
	8700 2850 8700 2900
Wire Wire Line
	8700 3200 8700 3300
Connection ~ 8700 3300
Wire Wire Line
	8700 3300 8900 3300
Text Label 9650 3300 0    50   ~ 0
STRIP1_LOGIC_12V
$Comp
L power:+3V3 #PWR0112
U 1 1 5E281B0A
P 8700 3800
F 0 "#PWR0112" H 8700 3650 50  0001 C CNN
F 1 "+3V3" H 8715 3973 50  0000 C CNN
F 2 "" H 8700 3800 50  0001 C CNN
F 3 "" H 8700 3800 50  0001 C CNN
	1    8700 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R_LS2_3V1
U 1 1 5E281B16
P 8700 4000
F 0 "R_LS2_3V1" V 8800 3800 50  0000 L CNN
F 1 "4k7" V 8700 3950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8630 4000 50  0001 C CNN
F 3 "~" H 8700 4000 50  0001 C CNN
	1    8700 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3800 9100 3800
Wire Wire Line
	9100 3800 9100 3950
$Comp
L Device:R R_LS2_12V1
U 1 1 5E281B1E
P 9350 4000
F 0 "R_LS2_12V1" V 9450 3850 50  0000 L CNN
F 1 "4k7" V 9350 3900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9280 4000 50  0001 C CNN
F 3 "~" H 9350 4000 50  0001 C CNN
	1    9350 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q3
U 1 1 5E281B24
P 9100 4150
F 0 "Q3" V 9351 4150 50  0000 C CNN
F 1 "AO3400" V 9442 4150 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9300 4250 50  0001 C CNN
F 3 "~" H 9100 4150 50  0001 C CNN
	1    9100 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 3800 9350 3850
Wire Wire Line
	9350 4150 9350 4250
Wire Wire Line
	9350 4250 9300 4250
Connection ~ 9350 4250
Wire Wire Line
	8500 4250 8700 4250
Wire Wire Line
	8700 3800 8700 3850
Connection ~ 8700 3800
Wire Wire Line
	8700 4150 8700 4250
Connection ~ 8700 4250
Wire Wire Line
	8700 4250 8900 4250
$Comp
L power:+3V3 #PWR0114
U 1 1 5E2854A2
P 8700 4800
F 0 "#PWR0114" H 8700 4650 50  0001 C CNN
F 1 "+3V3" H 8715 4973 50  0000 C CNN
F 2 "" H 8700 4800 50  0001 C CNN
F 3 "" H 8700 4800 50  0001 C CNN
	1    8700 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R_LS3_3V1
U 1 1 5E2854AE
P 8700 5000
F 0 "R_LS3_3V1" V 8800 4800 50  0000 L CNN
F 1 "4k7" V 8700 4950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8630 5000 50  0001 C CNN
F 3 "~" H 8700 5000 50  0001 C CNN
	1    8700 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 4800 9100 4800
Wire Wire Line
	9100 4800 9100 4950
$Comp
L Device:R R_LS3_12V1
U 1 1 5E2854B6
P 9350 5000
F 0 "R_LS3_12V1" V 9450 4850 50  0000 L CNN
F 1 "4k7" V 9350 4950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9280 5000 50  0001 C CNN
F 3 "~" H 9350 5000 50  0001 C CNN
	1    9350 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q4
U 1 1 5E2854BC
P 9100 5150
F 0 "Q4" V 9351 5150 50  0000 C CNN
F 1 "AO3400" V 9442 5150 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9300 5250 50  0001 C CNN
F 3 "~" H 9100 5150 50  0001 C CNN
	1    9100 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 4800 9350 4850
Wire Wire Line
	9350 5150 9350 5250
Wire Wire Line
	9350 5250 9300 5250
Wire Wire Line
	8500 5250 8700 5250
Wire Wire Line
	8700 4800 8700 4850
Connection ~ 8700 4800
Wire Wire Line
	8700 5150 8700 5250
Connection ~ 8700 5250
Wire Wire Line
	8700 5250 8900 5250
Text Label 9700 5250 0    50   ~ 0
STRIP3_LOGIC_12V
Text Label 8500 3300 2    50   ~ 0
STRIP1_LOGIC_3V
Text Label 8500 4250 2    50   ~ 0
STRIP2_LOGIC_3V
Text Label 8500 5250 2    50   ~ 0
STRIP3_LOGIC_3V
Wire Wire Line
	5550 5250 6200 5250
Text Label 5700 5550 0    50   ~ 0
STRIP1_LOGIC_3V
Text Label 5700 5250 0    50   ~ 0
STRIP2_LOGIC_3V
Text Label 5700 5150 0    50   ~ 0
STRIP3_LOGIC_3V
Wire Wire Line
	5550 5550 6200 5550
Wire Wire Line
	5550 5150 6200 5150
NoConn ~ 5550 5350
NoConn ~ 5550 5450
NoConn ~ 5550 6050
NoConn ~ 5550 6150
NoConn ~ 5550 6350
NoConn ~ 5550 6450
NoConn ~ 5550 6650
NoConn ~ 5550 6750
NoConn ~ 5550 6850
$Comp
L ptabOther:5V_STEP_DOWN U2
U 1 1 5E433FDE
P 2500 3000
F 0 "U2" H 2022 3046 50  0000 R CNN
F 1 "5V_STEP_DOWN" H 2022 2955 50  0000 R CNN
F 2 "ptabOther:DC_STEP_DOWN_MODULE_223_17" H 2500 2400 50  0001 C CNN
F 3 "" H 2500 3000 50  0001 C CNN
	1    2500 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 5E436B9E
P 3150 3950
F 0 "#PWR0107" H 3150 3800 50  0001 C CNN
F 1 "+5V" H 3165 4123 50  0000 C CNN
F 2 "" H 3150 3950 50  0001 C CNN
F 3 "" H 3150 3950 50  0001 C CNN
	1    3150 3950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5E439337
P 2500 3500
F 0 "#PWR0116" H 2500 3250 50  0001 C CNN
F 1 "GND" H 2505 3327 50  0000 C CNN
F 2 "" H 2500 3500 50  0001 C CNN
F 3 "" H 2500 3500 50  0001 C CNN
	1    2500 3500
	1    0    0    -1  
$EndComp
$Comp
L G5RL1AELN12DC:G5RL1AELN12DC K1
U 1 1 5E43BD99
P 3750 2450
F 0 "K1" V 3650 2500 50  0000 R CNN
F 1 "G5RL1AELN5DC" V 3750 2750 50  0000 R CNN
F 2 "myKicadLib:RELAY_G5RL1AELN12DC" H 3750 2450 50  0001 L BNN
F 3 "2.3 USD" H 3750 2450 50  0001 L BNN
F 4 "Manufacturer recommendations" H 3750 2450 50  0001 L BNN "Field4"
F 5 "Low Stock" H 3750 2450 50  0001 L BNN "Field5"
F 6 "DIP-6" H 3750 2450 50  0001 L BNN "Field6"
F 7 "OMRON" H 3750 2450 50  0001 L BNN "Field7"
F 8 "Electromechanical Relay 12VDC 272Ohm 16A SPST-NO (29x12.7x15.7)mm THT Power Relay" H 3750 2450 50  0001 L BNN "Field8"
	1    3750 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4250 1350 4250 1950
Wire Wire Line
	2500 1950 3550 1950
Wire Wire Line
	3950 1950 4250 1950
Wire Wire Line
	4250 1950 4850 1950
$Comp
L power:GND #PWR0117
U 1 1 5E489917
P 4500 3050
F 0 "#PWR0117" H 4500 2800 50  0001 C CNN
F 1 "GND" H 4505 2877 50  0000 C CNN
F 2 "" H 4500 3050 50  0001 C CNN
F 3 "" H 4500 3050 50  0001 C CNN
	1    4500 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2950 4500 3050
Wire Wire Line
	2500 3350 2500 3400
$Comp
L Device:R R1
U 1 1 5E4914B8
P 3350 3400
F 0 "R1" H 3420 3446 50  0000 L CNN
F 1 "~47ohm" H 3420 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3280 3400 50  0001 C CNN
F 3 "~" H 3350 3400 50  0001 C CNN
	1    3350 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3550 3350 3600
Text Label 3350 3600 0    50   ~ 0
RELAY_DRIVER
$Comp
L Device:D D3
U 1 1 5E49D6B4
P 3700 2950
F 0 "D3" H 3700 3166 50  0000 C CNN
F 1 "M1" H 3700 3075 50  0000 C CNN
F 2 "ptabOther:D_SMA_Handsoldering" H 3700 2950 50  0001 C CNN
F 3 "~" H 3700 2950 50  0001 C CNN
	1    3700 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2950 3950 2950
Wire Wire Line
	8700 2850 8700 2750
Connection ~ 8700 2850
$Comp
L Connector:Screw_Terminal_01x03 JOUT1
U 1 1 5E26790C
P 6350 1450
F 0 "JOUT1" H 6430 1492 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 6430 1401 50  0000 L CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00002_1x03_P5.00mm_Horizontal" H 6350 1450 50  0001 C CNN
F 3 "~" H 6350 1450 50  0001 C CNN
	1    6350 1450
	1    0    0    -1  
$EndComp
Text HLabel 6150 2750 0    50   Input ~ 0
STRIP3_LOGIC_12V
Wire Wire Line
	6150 2750 6200 2750
Text HLabel 6100 2050 0    50   Input ~ 0
STRIP2_LOGIC_12V
Wire Wire Line
	6100 2050 6150 2050
Text HLabel 6100 1450 0    50   Input ~ 0
STRIP1_LOGIC_12V
Wire Wire Line
	6100 1450 6150 1450
$Comp
L power:GNDA #PWR0102
U 1 1 5E57E94A
P 1050 2750
F 0 "#PWR0102" H 1050 2500 50  0001 C CNN
F 1 "GNDA" H 1055 2577 50  0000 C CNN
F 2 "" H 1050 2750 50  0001 C CNN
F 3 "" H 1050 2750 50  0001 C CNN
	1    1050 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0103
U 1 1 5E58215F
P 5400 1700
F 0 "#PWR0103" H 5400 1450 50  0001 C CNN
F 1 "GNDA" H 5405 1527 50  0000 C CNN
F 2 "" H 5400 1700 50  0001 C CNN
F 3 "" H 5400 1700 50  0001 C CNN
	1    5400 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0104
U 1 1 5E58268B
P 5400 2300
F 0 "#PWR0104" H 5400 2050 50  0001 C CNN
F 1 "GNDA" H 5405 2127 50  0000 C CNN
F 2 "" H 5400 2300 50  0001 C CNN
F 3 "" H 5400 2300 50  0001 C CNN
	1    5400 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0105
U 1 1 5E582BCB
P 5400 3050
F 0 "#PWR0105" H 5400 2800 50  0001 C CNN
F 1 "GNDA" H 5405 2877 50  0000 C CNN
F 2 "" H 5400 3050 50  0001 C CNN
F 3 "" H 5400 3050 50  0001 C CNN
	1    5400 3050
	1    0    0    -1  
$EndComp
Connection ~ 5400 3050
$Comp
L power:GND #PWR0118
U 1 1 5E58532F
P 6050 4400
F 0 "#PWR0118" H 6050 4150 50  0001 C CNN
F 1 "GND" H 6055 4227 50  0000 C CNN
F 2 "" H 6050 4400 50  0001 C CNN
F 3 "" H 6050 4400 50  0001 C CNN
	1    6050 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0119
U 1 1 5E585BC7
P 6250 4400
F 0 "#PWR0119" H 6250 4150 50  0001 C CNN
F 1 "GNDA" H 6255 4227 50  0000 C CNN
F 2 "" H 6250 4400 50  0001 C CNN
F 3 "" H 6250 4400 50  0001 C CNN
	1    6250 4400
	1    0    0    -1  
$EndComp
Text Label 2500 1950 0    50   ~ 0
12V_PRE_RELAY
Text Label 4250 1950 0    50   ~ 0
12V_POST_RELAY
Text Label 5400 1350 0    50   ~ 0
12V_JOUT1
Text Label 5400 1950 0    50   ~ 0
12V_JOUT2
Text Label 5400 2650 0    50   ~ 0
12V_JOUT3
Wire Wire Line
	6050 4400 6250 4400
Text Label 9700 5150 1    50   ~ 0
12V_POST_RELAY
Text Label 9350 3700 0    50   ~ 0
12V_POST_RELAY
Text Label 9350 2750 0    50   ~ 0
12V_POST_RELAY
$Comp
L Device:R R_L3_12V1
U 1 1 5E7C1E56
P 9500 5250
F 0 "R_L3_12V1" V 9400 5250 50  0000 C CNN
F 1 "300" V 9500 5250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9430 5250 50  0001 C CNN
F 3 "~" H 9500 5250 50  0001 C CNN
	1    9500 5250
	0    -1   -1   0   
$EndComp
Connection ~ 9350 5250
Wire Wire Line
	10000 5250 9650 5250
$Comp
L Device:R R9
U 1 1 5E7F5FB9
P 9500 4250
F 0 "R9" V 9500 4250 50  0000 C CNN
F 1 "R_L2_12V" V 9400 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9430 4250 50  0001 C CNN
F 3 "~" H 9500 4250 50  0001 C CNN
	1    9500 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9650 4250 10050 4250
$Comp
L Device:R R_L1_12V1
U 1 1 5E7F63B4
P 9500 3300
F 0 "R_L1_12V1" V 9400 3300 50  0000 C CNN
F 1 "300" V 9500 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9430 3300 50  0001 C CNN
F 3 "~" H 9500 3300 50  0001 C CNN
	1    9500 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9650 3300 10050 3300
Text Label 9700 4250 0    50   ~ 0
STRIP2_LOGIC_12V
Wire Wire Line
	5400 2650 5400 2750
Wire Wire Line
	3800 4850 3800 4650
Connection ~ 3800 4850
$Comp
L Device:C C2
U 1 1 5EFFFE12
P 3950 4850
F 0 "C2" V 3698 4850 50  0000 C CNN
F 1 "0.1uF" V 3900 4850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3988 4700 50  0001 C CNN
F 3 "~" H 3950 4850 50  0001 C CNN
	1    3950 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 4350 4200 4350
Connection ~ 4150 4350
Wire Wire Line
	4150 4600 4150 4350
Wire Wire Line
	3850 4600 3850 5250
Connection ~ 3850 4600
$Comp
L Device:C C4
U 1 1 5EFF4315
P 4000 4600
F 0 "C4" V 3748 4600 50  0000 C CNN
F 1 "0.1uF" V 3950 4600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4038 4450 50  0001 C CNN
F 3 "~" H 4000 4600 50  0001 C CNN
	1    4000 4600
	0    1    1    0   
$EndComp
$Comp
L Connector:AudioJack3_SwitchTR J1
U 1 1 5E69679B
P 750 4450
F 0 "J1" H 732 4775 50  0000 C CNN
F 1 "AudioJack3_SwitchTR" H 732 4684 50  0000 C CNN
F 2 "ptabOther:AudioJack3_SwitchTR_PJ3024" H 750 4450 50  0001 C CNN
F 3 "~" H 750 4450 50  0001 C CNN
	1    750  4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 5650 3150 5650
Wire Wire Line
	2900 6050 2900 5650
Wire Wire Line
	3950 6050 3850 6050
Wire Wire Line
	3950 6000 3950 5950
Wire Wire Line
	3800 5650 3750 5650
Wire Wire Line
	3750 5850 3950 5850
Wire Wire Line
	3050 5750 3150 5750
$Comp
L power:GND #PWR0120
U 1 1 5E639C9B
P 3050 5750
F 0 "#PWR0120" H 3050 5500 50  0001 C CNN
F 1 "GND" V 3055 5622 50  0000 R CNN
F 2 "" H 3050 5750 50  0001 C CNN
F 3 "" H 3050 5750 50  0001 C CNN
	1    3050 5750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5E636336
P 3800 5650
F 0 "#PWR0115" H 3800 5400 50  0001 C CNN
F 1 "GND" H 3805 5477 50  0000 C CNN
F 2 "" H 3800 5650 50  0001 C CNN
F 3 "" H 3800 5650 50  0001 C CNN
	1    3800 5650
	0    -1   -1   0   
$EndComp
$Comp
L Device:Rotary_Encoder_Switch SW2
U 1 1 5E632A05
P 3450 5750
F 0 "SW2" H 3450 6117 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 3450 6026 50  0000 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC12E-Switch_Vertical_H20mm" H 3300 5910 50  0001 C CNN
F 3 "~" H 3450 6010 50  0001 C CNN
	1    3450 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5E62F286
P 3800 7000
F 0 "#PWR0113" H 3800 6750 50  0001 C CNN
F 1 "GND" H 3805 6827 50  0000 C CNN
F 2 "" H 3800 7000 50  0001 C CNN
F 3 "" H 3800 7000 50  0001 C CNN
	1    3800 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6150 3650 6150
$Comp
L Switch:SW_Push SW3
U 1 1 5E62A0E9
P 3650 6350
F 0 "SW3" V 3604 6498 50  0000 L CNN
F 1 "SW_Push" V 3695 6498 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 3650 6550 50  0001 C CNN
F 3 "~" H 3650 6550 50  0001 C CNN
	1    3650 6350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5E6237DC
P 4200 4350
F 0 "#PWR0111" H 4200 4100 50  0001 C CNN
F 1 "GND" H 4205 4177 50  0000 C CNN
F 2 "" H 4200 4350 50  0001 C CNN
F 3 "" H 4200 4350 50  0001 C CNN
	1    4200 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 5250 3950 5250
Wire Wire Line
	3850 4450 3850 4600
Wire Wire Line
	3800 4650 2850 4650
Wire Wire Line
	3800 5350 3800 4850
Wire Wire Line
	3950 5350 3800 5350
Wire Wire Line
	4750 4050 4750 4150
Wire Wire Line
	4750 4450 4750 4750
NoConn ~ 3950 6450
NoConn ~ 3950 6250
NoConn ~ 3950 5750
NoConn ~ 3950 5650
NoConn ~ 3950 5450
NoConn ~ 3950 5150
NoConn ~ 5050 7150
NoConn ~ 4900 7150
NoConn ~ 3950 5050
NoConn ~ 3950 5550
NoConn ~ 3950 6750
NoConn ~ 3950 6650
NoConn ~ 3950 6550
NoConn ~ 4900 4750
Wire Wire Line
	4600 4150 4600 4750
$Comp
L power:+3.3V #PWR0106
U 1 1 5E411863
P 4600 4150
F 0 "#PWR0106" H 4600 4000 50  0001 C CNN
F 1 "+3.3V" H 4615 4323 50  0000 C CNN
F 2 "" H 4600 4150 50  0001 C CNN
F 3 "" H 4600 4150 50  0001 C CNN
	1    4600 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 5E3C85E8
P 4750 4300
F 0 "D2" V 4796 4221 50  0000 R CNN
F 1 "D_Schottky_SS14" V 4705 4221 50  0000 R CNN
F 2 "ptabOther:D_SMA_Handsoldering" H 4750 4300 50  0001 C CNN
F 3 "~" H 4750 4300 50  0001 C CNN
	1    4750 4300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5E2C341E
P 4750 7400
F 0 "#PWR0109" H 4750 7150 50  0001 C CNN
F 1 "GND" H 4755 7227 50  0000 C CNN
F 2 "" H 4750 7400 50  0001 C CNN
F 3 "" H 4750 7400 50  0001 C CNN
	1    4750 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 5E2C217B
P 4750 4050
F 0 "#PWR0108" H 4750 3900 50  0001 C CNN
F 1 "+5V" H 4765 4223 50  0000 C CNN
F 2 "" H 4750 4050 50  0001 C CNN
F 3 "" H 4750 4050 50  0001 C CNN
	1    4750 4050
	1    0    0    -1  
$EndComp
Text Label 4750 4500 0    50   ~ 0
VDD_5V
$Comp
L Device:C C_VDD_MSGEQ7
U 1 1 5F4FE5A5
P 1850 5300
F 0 "C_VDD_MSGEQ7" V 1598 5300 50  0000 C CNN
F 1 "0.1uF" V 1689 5300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1888 5150 50  0001 C CNN
F 3 "~" H 1850 5300 50  0001 C CNN
	1    1850 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 5300 1700 5600
$Comp
L power:GND #PWR0121
U 1 1 5F504516
P 2000 5400
F 0 "#PWR0121" H 2000 5150 50  0001 C CNN
F 1 "GND" H 2005 5227 50  0000 C CNN
F 2 "" H 2000 5400 50  0001 C CNN
F 3 "" H 2000 5400 50  0001 C CNN
	1    2000 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 5400 2000 5300
$Comp
L power:GND #PWR0122
U 1 1 5F50A08D
P 2300 6900
F 0 "#PWR0122" H 2300 6650 50  0001 C CNN
F 1 "GND" H 2305 6727 50  0000 C CNN
F 2 "" H 2300 6900 50  0001 C CNN
F 3 "" H 2300 6900 50  0001 C CNN
	1    2300 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 5F518DB5
P 1700 6900
F 0 "#PWR0123" H 1700 6650 50  0001 C CNN
F 1 "GND" H 1705 6727 50  0000 C CNN
F 2 "" H 1700 6900 50  0001 C CNN
F 3 "" H 1700 6900 50  0001 C CNN
	1    1700 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6600 1700 6900
$Comp
L Device:C C_GND_MSGEQ7
U 1 1 5F51DDB8
P 2300 6550
F 0 "C_GND_MSGEQ7" H 2415 6596 50  0000 L CNN
F 1 "0.1uF" H 2415 6505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2338 6400 50  0001 C CNN
F 3 "~" H 2300 6550 50  0001 C CNN
	1    2300 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 6400 2300 6400
Wire Wire Line
	2300 6700 2300 6900
Connection ~ 1700 5300
$Comp
L Device:R R_CKIN_MSGEQ7
U 1 1 5F543B05
P 950 6400
F 0 "R_CKIN_MSGEQ7" V 743 6400 50  0000 C CNN
F 1 "200k" V 834 6400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 880 6400 50  0001 C CNN
F 3 "~" H 950 6400 50  0001 C CNN
	1    950  6400
	0    1    1    0   
$EndComp
Wire Wire Line
	1100 6400 1150 6400
Wire Wire Line
	800  6400 600  6400
Wire Wire Line
	600  6400 600  5300
Wire Wire Line
	600  5300 1700 5300
$Comp
L power:GND #PWR0124
U 1 1 5F54E35A
P 1150 6900
F 0 "#PWR0124" H 1150 6650 50  0001 C CNN
F 1 "GND" H 1155 6727 50  0000 C CNN
F 2 "" H 1150 6900 50  0001 C CNN
F 3 "" H 1150 6900 50  0001 C CNN
	1    1150 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_CKIN_MSGEQ7
U 1 1 5F54ECFF
P 1150 6550
F 0 "C_CKIN_MSGEQ7" H 1265 6596 50  0000 L CNN
F 1 "33pF" H 1265 6505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1188 6400 50  0001 C CNN
F 3 "~" H 1150 6550 50  0001 C CNN
	1    1150 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R_IN_R_MSQEQ7
U 1 1 5F55A5C3
P 1200 5000
F 0 "R_IN_R_MSQEQ7" V 1300 4750 50  0000 L CNN
F 1 "22k" V 1200 4900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1130 5000 50  0001 C CNN
F 3 "~" H 1200 5000 50  0001 C CNN
	1    1200 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C_IN_MSGEQ7
U 1 1 5F56545C
P 1100 5500
F 0 "C_IN_MSGEQ7" H 750 5600 50  0000 L CNN
F 1 "10nF" H 900 5400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1138 5350 50  0001 C CNN
F 3 "~" H 1100 5500 50  0001 C CNN
	1    1100 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R_IN_L_MSQEQ1
U 1 1 5F588C7F
P 1000 5000
F 0 "R_IN_L_MSQEQ1" V 1100 4800 50  0000 L CNN
F 1 "22k" V 1000 4900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 930 5000 50  0001 C CNN
F 3 "~" H 1000 5000 50  0001 C CNN
	1    1000 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 5150 1200 5250
Wire Wire Line
	1000 4850 1000 4650
Connection ~ 1000 4650
Wire Wire Line
	1000 4650 950  4650
Wire Wire Line
	1200 4850 1200 4450
Connection ~ 1200 4450
Wire Wire Line
	1200 4450 2550 4450
Wire Wire Line
	950  4450 1200 4450
Wire Wire Line
	1000 5150 1000 5250
Wire Wire Line
	1000 5250 1100 5250
Wire Wire Line
	1100 5350 1100 5250
Connection ~ 1100 5250
Wire Wire Line
	1100 5250 1200 5250
Wire Wire Line
	1200 6100 1100 6100
$Comp
L Audio:MSGEQ7 U3
U 1 1 5F43F127
P 1700 6100
F 0 "U3" H 1700 6781 50  0000 C CNN
F 1 "MSGEQ7" H 1700 6690 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 1700 6100 50  0001 C CNN
F 3 "http://mix-sig.com/images/datasheets/MSGEQ7.pdf" H 1700 6100 50  0001 C CNN
	1    1700 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 5650 1100 6100
Wire Wire Line
	2200 5800 2550 5800
Wire Wire Line
	2550 5800 2550 7650
Wire Wire Line
	2550 7650 6400 7650
Wire Wire Line
	6400 7650 6400 5950
Wire Wire Line
	6400 5950 5550 5950
Wire Wire Line
	5550 5850 6450 5850
Wire Wire Line
	6450 5850 6450 7700
Wire Wire Line
	6450 7700 2500 7700
Wire Wire Line
	2500 7700 2500 5900
Wire Wire Line
	2500 5900 2200 5900
Wire Wire Line
	2200 6200 2450 6200
Wire Wire Line
	2450 6200 2450 7750
$Comp
L esp32_modules:MOD_ESP32_DEV_universal U1
U 1 1 5E3BCE16
P 4750 5950
F 0 "U1" H 4750 7331 50  0000 C CNN
F 1 "MOD_ESP32_DEV_universal" H 4750 7240 50  0000 C CNN
F 2 "ptabEsp32Modules:MOD_ESP32_DEV_DEVKITC-32D" H 3800 4850 50  0001 L BNN
F 3 "MOD_ESP32" H 2650 5700 50  0001 L BNN
	1    4750 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R_P11
U 1 1 5F615C3F
P 2700 4450
F 0 "R_P11" V 2800 4450 50  0000 C CNN
F 1 "xxk?" V 2700 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 4450 50  0001 C CNN
F 3 "~" H 2700 4450 50  0001 C CNN
	1    2700 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R R_L11
U 1 1 5F6197B4
P 2700 4650
F 0 "R_L11" V 2800 4650 50  0000 C CNN
F 1 "xxk?" V 2700 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2630 4650 50  0001 C CNN
F 3 "~" H 2700 4650 50  0001 C CNN
	1    2700 4650
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 4650 1000 4650
Wire Wire Line
	2850 4450 3850 4450
$Comp
L Device:R R_ENC_B1
U 1 1 5F69D010
P 3300 6000
F 0 "R_ENC_B1" V 3200 5800 50  0000 L CNN
F 1 "10k" V 3300 5950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3230 6000 50  0001 C CNN
F 3 "~" H 3300 6000 50  0001 C CNN
	1    3300 6000
	0    1    1    0   
$EndComp
$Comp
L Device:R R_ENC_A1
U 1 1 5F69DB04
P 3700 6050
F 0 "R_ENC_A1" V 3600 5850 50  0000 L CNN
F 1 "10k" V 3700 5950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3630 6050 50  0001 C CNN
F 3 "~" H 3700 6050 50  0001 C CNN
	1    3700 6050
	0    1    1    0   
$EndComp
$Comp
L Device:C C_ENC_B1
U 1 1 5F6A8930
P 3150 6800
F 0 "C_ENC_B1" V 3100 6850 50  0000 L CNN
F 1 "10nF" H 3000 6700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3188 6650 50  0001 C CNN
F 3 "~" H 3150 6800 50  0001 C CNN
	1    3150 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6950 3150 7000
Wire Wire Line
	3150 7000 3450 7000
$Comp
L Device:C C_ENC_A1
U 1 1 5F6BF82A
P 3450 6800
F 0 "C_ENC_A1" V 3400 6850 50  0000 L CNN
F 1 "10nF" H 3350 6700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3488 6650 50  0001 C CNN
F 3 "~" H 3450 6800 50  0001 C CNN
	1    3450 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6950 3450 7000
Connection ~ 3450 7000
Wire Wire Line
	3450 7000 3650 7000
Wire Wire Line
	3650 6550 3650 7000
Connection ~ 3650 7000
Wire Wire Line
	3650 7000 3800 7000
Wire Wire Line
	3050 3000 3150 3000
$Comp
L Device:CP C_EL_5V1
U 1 1 5F80E5A4
P 2850 3400
F 0 "C_EL_5V1" V 2700 3400 50  0000 C CNN
F 1 ">50uF" V 3000 3400 50  0000 C CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.4" H 2888 3250 50  0001 C CNN
F 3 "~" H 2850 3400 50  0001 C CNN
	1    2850 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	2500 3400 2650 3400
Connection ~ 2500 3400
Wire Wire Line
	2500 3400 2500 3500
Wire Wire Line
	3150 3000 3150 3400
Wire Wire Line
	3000 3400 3150 3400
Connection ~ 3150 3400
Wire Wire Line
	3150 3400 3150 3500
Wire Wire Line
	3000 3800 3000 3500
Wire Wire Line
	3000 3500 3150 3500
Connection ~ 3150 3500
Wire Wire Line
	2650 3400 2650 3750
Wire Wire Line
	2650 3750 2700 3800
Connection ~ 2650 3400
Wire Wire Line
	2650 3400 2700 3400
Connection ~ 3550 2950
$Comp
L Device:Q_NPN_BEC Q1
U 1 1 5E4A2D93
P 3350 3050
F 0 "Q1" V 3678 3050 50  0000 C CNN
F 1 "Q_NPN_BEC_S8050" V 3587 3050 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3550 3150 50  0001 C CNN
F 3 "~" H 3350 3050 50  0001 C CNN
	1    3350 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3150 3000 3150 2950
Connection ~ 3150 3000
Wire Wire Line
	3950 2950 4500 2950
Connection ~ 3950 2950
$Comp
L Connector:USB_A J2
U 1 1 5F8C0B69
P 8300 1550
F 0 "J2" H 8357 2017 50  0000 C CNN
F 1 "USB_POWER_OUT" H 8357 1926 50  0000 C CNN
F 2 "Connector_USB:USB_A_CONNFLY_DS1095-WNR0" H 8450 1500 50  0001 C CNN
F 3 " ~" H 8450 1500 50  0001 C CNN
	1    8300 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C_E_USB_OUT1
U 1 1 5F8C25F4
P 9100 1800
F 0 "C_E_USB_OUT1" H 9218 1846 50  0000 L CNN
F 1 ">20uF" H 9218 1755 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.4" H 9138 1650 50  0001 C CNN
F 3 "~" H 9100 1800 50  0001 C CNN
	1    9100 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 1950 8200 2050
Wire Wire Line
	8200 2050 8300 2050
Wire Wire Line
	8300 2050 8300 1950
Connection ~ 8300 2050
Wire Wire Line
	8600 1350 8800 1350
Wire Wire Line
	9100 1350 9250 1350
Connection ~ 9100 1350
$Comp
L power:GND #PWR0126
U 1 1 5F92523A
P 9250 2050
F 0 "#PWR0126" H 9250 1800 50  0001 C CNN
F 1 "GND" H 9255 1877 50  0000 C CNN
F 2 "" H 9250 2050 50  0001 C CNN
F 3 "" H 9250 2050 50  0001 C CNN
	1    9250 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0127
U 1 1 5F925CA8
P 9250 1350
F 0 "#PWR0127" H 9250 1200 50  0001 C CNN
F 1 "+5V" H 9265 1523 50  0000 C CNN
F 2 "" H 9250 1350 50  0001 C CNN
F 3 "" H 9250 1350 50  0001 C CNN
	1    9250 1350
	1    0    0    -1  
$EndComp
NoConn ~ 8600 1550
NoConn ~ 8600 1650
Wire Wire Line
	8300 2050 8800 2050
$Comp
L Device:CP C_T_USB_OUT1
U 1 1 5F9816EE
P 8800 1550
F 0 "C_T_USB_OUT1" H 8918 1596 50  0000 L CNN
F 1 ">1uF" H 8918 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8838 1400 50  0001 C CNN
F 3 "~" H 8800 1550 50  0001 C CNN
	1    8800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 1400 8800 1350
Connection ~ 8800 1350
Wire Wire Line
	8800 1350 9100 1350
Wire Wire Line
	8800 1700 8800 2050
Connection ~ 8800 2050
Wire Wire Line
	8800 2050 9100 2050
Wire Wire Line
	9100 2050 9100 1950
Connection ~ 9100 2050
Wire Wire Line
	9100 2050 9250 2050
Wire Wire Line
	9100 1350 9100 1650
$Comp
L Device:CP C_T_5V1
U 1 1 5F9D9987
P 2850 3800
F 0 "C_T_5V1" V 2700 3800 50  0000 C CNN
F 1 "1uF" V 3000 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2888 3650 50  0001 C CNN
F 3 "~" H 2850 3800 50  0001 C CNN
	1    2850 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 6050 3450 6050
Wire Wire Line
	3150 5850 3150 6000
Connection ~ 3150 6000
Wire Wire Line
	3450 6000 3950 6000
Wire Wire Line
	3150 6000 3150 6650
Wire Wire Line
	3450 6050 3450 6650
Connection ~ 3450 6050
Wire Wire Line
	3450 6050 3550 6050
Connection ~ 1150 6400
Wire Wire Line
	1150 6400 1200 6400
Wire Wire Line
	1150 6700 1150 6900
Wire Wire Line
	4750 7150 4750 7450
Wire Wire Line
	950  4350 4150 4350
Wire Wire Line
	4150 4600 4150 4850
Wire Wire Line
	4150 4850 4100 4850
Connection ~ 4150 4600
Wire Wire Line
	1700 4850 1700 5300
$Comp
L power:+5V #PWR0125
U 1 1 5FAC4D06
P 1700 4850
F 0 "#PWR0125" H 1700 4700 50  0001 C CNN
F 1 "+5V" H 1715 5023 50  0000 C CNN
F 2 "" H 1700 4850 50  0001 C CNN
F 3 "" H 1700 4850 50  0001 C CNN
	1    1700 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R_EQ_V_DIV2
U 1 1 5FAC794B
P 6600 6500
F 0 "R_EQ_V_DIV2" H 6670 6546 50  0000 L CNN
F 1 "10k" H 6670 6455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6530 6500 50  0001 C CNN
F 3 "~" H 6600 6500 50  0001 C CNN
	1    6600 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 7750 6600 6650
Wire Wire Line
	2450 7750 6600 7750
Wire Wire Line
	6600 6350 6600 6250
Wire Wire Line
	6600 6250 5550 6250
$Comp
L Device:R R_EQ_V_DIV1
U 1 1 5FADEEFF
P 6600 6000
F 0 "R_EQ_V_DIV1" H 6670 6046 50  0000 L CNN
F 1 "10k" H 6670 5955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6530 6000 50  0001 C CNN
F 3 "~" H 6600 6000 50  0001 C CNN
	1    6600 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 6150 6600 6250
Connection ~ 6600 6250
$Comp
L power:GND #PWR0128
U 1 1 5FAEB8EB
P 6600 5650
F 0 "#PWR0128" H 6600 5400 50  0001 C CNN
F 1 "GND" H 6605 5477 50  0000 C CNN
F 2 "" H 6600 5650 50  0001 C CNN
F 3 "" H 6600 5650 50  0001 C CNN
	1    6600 5650
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 5650 6600 5850
Wire Wire Line
	3150 3500 3150 3950
$EndSCHEMATC
