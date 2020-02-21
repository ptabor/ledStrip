EESchema Schematic File Version 4
LIBS:ledStripDriver-cache
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
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00023_1x02_P10.00mm_Horizontal" H 1250 2200 50  0001 C CNN
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
F 2 "ptabOther:ROCKER_SWITCH" H 2050 1950 50  0001 C CNN
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
F 2 "ptabOther:FUSE_HOLDER_CAR_MEDIUM_PA66" V 4930 1950 50  0001 C CNN
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
F 2 "Diode_SMD:D_SMA_Handsoldering" H 2500 2200 50  0001 C CNN
F 3 "~" H 2500 2200 50  0001 C CNN
	1    2500 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 1350 4850 1350
Wire Wire Line
	4150 2650 4850 2650
$Comp
L Device:Fuse F1
U 1 1 5E2475FA
P 5000 1350
F 0 "F1" V 4803 1350 50  0000 C CNN
F 1 "V12A5-10" V 4894 1350 50  0000 C CNN
F 2 "ptabOther:FUSE_HOLDER_CAR_MEDIUM_PA66" V 4930 1350 50  0001 C CNN
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
F 2 "ptabOther:FUSE_HOLDER_CAR_MEDIUM_PA66" V 4930 2650 50  0001 C CNN
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
	5400 2650 5400 2750
Wire Wire Line
	5400 1950 5150 1950
Wire Wire Line
	5150 1300 5150 1350
Connection ~ 5150 1350
Connection ~ 4150 1950
Wire Wire Line
	4150 1950 4150 2650
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
$Comp
L power:+5V #PWR0108
U 1 1 5E2C217B
P 3250 3950
F 0 "#PWR0108" H 3250 3800 50  0001 C CNN
F 1 "+5V" H 3265 4123 50  0000 C CNN
F 2 "" H 3250 3950 50  0001 C CNN
F 3 "" H 3250 3950 50  0001 C CNN
	1    3250 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5E2C341E
P 3250 7300
F 0 "#PWR0109" H 3250 7050 50  0001 C CNN
F 1 "GND" H 3255 7127 50  0000 C CNN
F 2 "" H 3250 7300 50  0001 C CNN
F 3 "" H 3250 7300 50  0001 C CNN
	1    3250 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 7350 3250 7300
Connection ~ 3250 7300
Wire Wire Line
	3250 7300 3250 7050
Wire Wire Line
	4050 6450 4700 6450
Text Label 4200 6450 0    50   ~ 0
RELAY_DRIVER
$Comp
L power:+3V3 #PWR0110
U 1 1 5E2D4E31
P 9750 700
F 0 "#PWR0110" H 9750 550 50  0001 C CNN
F 1 "+3V3" H 9765 873 50  0000 C CNN
F 2 "" H 9750 700 50  0001 C CNN
F 3 "" H 9750 700 50  0001 C CNN
	1    9750 700 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E2D6073
P 9750 1000
F 0 "R2" H 9820 1046 50  0000 L CNN
F 1 "5kOhm" H 9820 955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9680 1000 50  0001 C CNN
F 3 "~" H 9750 1000 50  0001 C CNN
	1    9750 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 800  10150 800 
Wire Wire Line
	10150 800  10150 950 
$Comp
L Device:R R5
U 1 1 5E2DD8A0
P 10400 1000
F 0 "R5" H 10470 1046 50  0000 L CNN
F 1 "5kOhm" H 10470 955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10330 1000 50  0001 C CNN
F 3 "~" H 10400 1000 50  0001 C CNN
	1    10400 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q2
U 1 1 5E2D37DB
P 10150 1150
F 0 "Q2" V 10401 1150 50  0000 C CNN
F 1 "AO3400" V 10492 1150 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 10350 1250 50  0001 C CNN
F 3 "~" H 10150 1150 50  0001 C CNN
	1    10150 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	10400 800  10400 850 
Wire Wire Line
	10400 1150 10400 1250
Wire Wire Line
	10400 1250 10350 1250
Wire Wire Line
	10400 1250 10700 1250
Connection ~ 10400 1250
Wire Wire Line
	9550 1250 9750 1250
Wire Wire Line
	9750 800  9750 850 
Wire Wire Line
	9750 1150 9750 1250
Connection ~ 9750 1250
Wire Wire Line
	9750 1250 9950 1250
Text Label 10400 1250 0    50   ~ 0
STRIP1_LOGIC_12V
$Comp
L power:+3V3 #PWR0112
U 1 1 5E281B0A
P 9750 1750
F 0 "#PWR0112" H 9750 1600 50  0001 C CNN
F 1 "+3V3" H 9765 1923 50  0000 C CNN
F 2 "" H 9750 1750 50  0001 C CNN
F 3 "" H 9750 1750 50  0001 C CNN
	1    9750 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E281B16
P 9750 1950
F 0 "R3" H 9820 1996 50  0000 L CNN
F 1 "5kOhm" H 9820 1905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9680 1950 50  0001 C CNN
F 3 "~" H 9750 1950 50  0001 C CNN
	1    9750 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 1750 10150 1750
Wire Wire Line
	10150 1750 10150 1900
$Comp
L Device:R R6
U 1 1 5E281B1E
P 10400 1950
F 0 "R6" H 10470 1996 50  0000 L CNN
F 1 "5kOhm" H 10470 1905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10330 1950 50  0001 C CNN
F 3 "~" H 10400 1950 50  0001 C CNN
	1    10400 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q3
U 1 1 5E281B24
P 10150 2100
F 0 "Q3" V 10401 2100 50  0000 C CNN
F 1 "AO3400" V 10492 2100 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 10350 2200 50  0001 C CNN
F 3 "~" H 10150 2100 50  0001 C CNN
	1    10150 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	10400 1750 10400 1800
Wire Wire Line
	10400 2100 10400 2200
Wire Wire Line
	10400 2200 10350 2200
Wire Wire Line
	10400 2200 10700 2200
Connection ~ 10400 2200
Wire Wire Line
	9550 2200 9750 2200
Wire Wire Line
	9750 1750 9750 1800
Connection ~ 9750 1750
Wire Wire Line
	9750 2100 9750 2200
Connection ~ 9750 2200
Wire Wire Line
	9750 2200 9950 2200
Text Label 10400 2200 0    50   ~ 0
STRIP2_LOGIC_12V
$Comp
L power:+3V3 #PWR0114
U 1 1 5E2854A2
P 9750 2750
F 0 "#PWR0114" H 9750 2600 50  0001 C CNN
F 1 "+3V3" H 9765 2923 50  0000 C CNN
F 2 "" H 9750 2750 50  0001 C CNN
F 3 "" H 9750 2750 50  0001 C CNN
	1    9750 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E2854AE
P 9750 2950
F 0 "R4" H 9820 2996 50  0000 L CNN
F 1 "5kOhm" H 9820 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9680 2950 50  0001 C CNN
F 3 "~" H 9750 2950 50  0001 C CNN
	1    9750 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 2750 10150 2750
Wire Wire Line
	10150 2750 10150 2900
$Comp
L Device:R R7
U 1 1 5E2854B6
P 10400 2950
F 0 "R7" H 10470 2996 50  0000 L CNN
F 1 "5kOhm" H 10470 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10330 2950 50  0001 C CNN
F 3 "~" H 10400 2950 50  0001 C CNN
	1    10400 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GSD Q4
U 1 1 5E2854BC
P 10150 3100
F 0 "Q4" V 10401 3100 50  0000 C CNN
F 1 "AO3400" V 10492 3100 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 10350 3200 50  0001 C CNN
F 3 "~" H 10150 3100 50  0001 C CNN
	1    10150 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	10400 2750 10400 2800
Wire Wire Line
	10400 3100 10400 3200
Wire Wire Line
	10400 3200 10350 3200
Wire Wire Line
	10400 3200 10700 3200
Connection ~ 10400 3200
Wire Wire Line
	9550 3200 9750 3200
Wire Wire Line
	9750 2750 9750 2800
Connection ~ 9750 2750
Wire Wire Line
	9750 3100 9750 3200
Connection ~ 9750 3200
Wire Wire Line
	9750 3200 9950 3200
Text Label 10400 3200 0    50   ~ 0
STRIP3_LOGIC_12V
Text Label 9550 1250 2    50   ~ 0
STRIP1_LOGIC_3V
Text Label 9550 2200 2    50   ~ 0
STRIP2_LOGIC_3V
Text Label 9550 3200 2    50   ~ 0
STRIP3_LOGIC_3V
Wire Wire Line
	4050 5150 4700 5150
Text Label 4200 5450 0    50   ~ 0
STRIP1_LOGIC_3V
Text Label 4200 5150 0    50   ~ 0
STRIP2_LOGIC_3V
Text Label 4200 5050 0    50   ~ 0
STRIP3_LOGIC_3V
$Comp
L Device:D_Schottky D2
U 1 1 5E3C85E8
P 3250 4200
F 0 "D2" V 3296 4121 50  0000 R CNN
F 1 "D_Schottky_SS14" V 3205 4121 50  0000 R CNN
F 2 "Diode_SMD:D_SMA_Handsoldering" H 3250 4200 50  0001 C CNN
F 3 "~" H 3250 4200 50  0001 C CNN
	1    3250 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 5450 4700 5450
Wire Wire Line
	4050 5050 4700 5050
$Comp
L power:+3.3V #PWR0106
U 1 1 5E411863
P 3100 4050
F 0 "#PWR0106" H 3100 3900 50  0001 C CNN
F 1 "+3.3V" H 3115 4223 50  0000 C CNN
F 2 "" H 3100 4050 50  0001 C CNN
F 3 "" H 3100 4050 50  0001 C CNN
	1    3100 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4050 3100 4650
NoConn ~ 3400 4650
NoConn ~ 4050 5250
NoConn ~ 4050 5350
NoConn ~ 4050 5950
NoConn ~ 4050 6050
NoConn ~ 4050 6250
NoConn ~ 4050 6350
NoConn ~ 2450 6450
NoConn ~ 2450 6550
NoConn ~ 2450 6650
NoConn ~ 4050 6550
NoConn ~ 4050 6650
NoConn ~ 4050 6750
NoConn ~ 2450 5450
NoConn ~ 2450 4950
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
P 3150 2850
F 0 "#PWR0107" H 3150 2700 50  0001 C CNN
F 1 "+5V" H 3165 3023 50  0000 C CNN
F 2 "" H 3150 2850 50  0001 C CNN
F 3 "" H 3150 2850 50  0001 C CNN
	1    3150 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2850 3150 3000
Wire Wire Line
	3150 3000 3050 3000
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
P 3700 2450
F 0 "K1" V 3600 2500 50  0000 R CNN
F 1 "G5RL1AELN5DC" V 3700 2750 50  0000 R CNN
F 2 "myKicadLib:RELAY_G5RL1AELN12DC" H 3700 2450 50  0001 L BNN
F 3 "2.3 USD" H 3700 2450 50  0001 L BNN
F 4 "Manufacturer recommendations" H 3700 2450 50  0001 L BNN "Field4"
F 5 "Low Stock" H 3700 2450 50  0001 L BNN "Field5"
F 6 "DIP-6" H 3700 2450 50  0001 L BNN "Field6"
F 7 "OMRON" H 3700 2450 50  0001 L BNN "Field7"
F 8 "Electromechanical Relay 12VDC 272Ohm 16A SPST-NO (29x12.7x15.7)mm THT Power Relay" H 3700 2450 50  0001 L BNN "Field8"
	1    3700 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 1350 4150 1950
Wire Wire Line
	2500 1950 3500 1950
Wire Wire Line
	3900 1950 4150 1950
Wire Wire Line
	4150 1950 4850 1950
Wire Wire Line
	3500 2950 3500 3000
Wire Wire Line
	3500 3000 3150 3000
Connection ~ 3150 3000
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
	4300 2950 4500 2950
Wire Wire Line
	4500 2950 4500 3050
Wire Wire Line
	2500 3350 2500 3500
$Comp
L Device:R R1
U 1 1 5E4914B8
P 4100 3650
F 0 "R1" H 4170 3696 50  0000 L CNN
F 1 "47ohm" H 4170 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4030 3650 50  0001 C CNN
F 3 "~" H 4100 3650 50  0001 C CNN
	1    4100 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3250 4100 3500
Wire Wire Line
	4100 3800 4100 4100
Text Label 4100 4100 0    50   ~ 0
RELAY_DRIVER
$Comp
L Device:D D3
U 1 1 5E49D6B4
P 3650 2950
F 0 "D3" H 3650 3166 50  0000 C CNN
F 1 "M1" H 3650 3075 50  0000 C CNN
F 2 "Diode_SMD:D_SMA_Handsoldering" H 3650 2950 50  0001 C CNN
F 3 "~" H 3650 2950 50  0001 C CNN
	1    3650 2950
	1    0    0    -1  
$EndComp
Connection ~ 3500 2950
Wire Wire Line
	3800 2950 3900 2950
$Comp
L Device:Q_NPN_BEC Q1
U 1 1 5E4A2D93
P 4100 3050
F 0 "Q1" V 4428 3050 50  0000 C CNN
F 1 "Q_NPN_BEC_S8050" V 4337 3050 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4300 3150 50  0001 C CNN
F 3 "~" H 4100 3050 50  0001 C CNN
	1    4100 3050
	0    -1   -1   0   
$EndComp
Connection ~ 3900 2950
NoConn ~ 3400 7050
NoConn ~ 3550 7050
NoConn ~ 2450 5050
NoConn ~ 2450 5350
NoConn ~ 2450 5550
NoConn ~ 2450 5650
NoConn ~ 2450 6150
NoConn ~ 2450 6350
NoConn ~ 4050 5650
NoConn ~ 4050 5750
NoConn ~ 4050 5850
NoConn ~ 4050 6150
Wire Wire Line
	9750 800  9750 700 
Connection ~ 9750 800 
Wire Wire Line
	3250 4350 3250 4650
Wire Wire Line
	3250 3950 3250 4050
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
Text Label 4150 1950 0    50   ~ 0
12V_POST_RELAY
Text Label 5400 1350 0    50   ~ 0
12V_JOUT1
Text Label 5400 1950 0    50   ~ 0
12V_JOUT2
Text Label 5400 2650 0    50   ~ 0
12V_JOUT3
Wire Wire Line
	6050 4400 6250 4400
Text Label 10400 2750 0    50   ~ 0
12V_POST_RELAY
Text Label 10400 1750 0    50   ~ 0
12V_POST_RELAY
Text Label 10400 800  0    50   ~ 0
12V_POST_RELAY
Wire Wire Line
	2450 5250 2300 5250
Wire Wire Line
	2300 5250 2300 4750
Wire Wire Line
	2300 4550 2100 4550
Wire Wire Line
	2100 4350 2350 4350
Wire Wire Line
	2350 4350 2350 4500
Wire Wire Line
	2350 5150 2450 5150
$Comp
L power:GND #PWR0111
U 1 1 5E6237DC
P 2700 4250
F 0 "#PWR0111" H 2700 4000 50  0001 C CNN
F 1 "GND" H 2705 4077 50  0000 C CNN
F 2 "" H 2700 4250 50  0001 C CNN
F 3 "" H 2700 4250 50  0001 C CNN
	1    2700 4250
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 5E62A0E9
P 2150 6250
F 0 "SW3" V 2104 6398 50  0000 L CNN
F 1 "SW_Push" V 2195 6398 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 2150 6450 50  0001 C CNN
F 3 "~" H 2150 6450 50  0001 C CNN
	1    2150 6250
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 6050 2150 6050
$Comp
L power:GND #PWR0113
U 1 1 5E62F286
P 2150 6600
F 0 "#PWR0113" H 2150 6350 50  0001 C CNN
F 1 "GND" H 2155 6427 50  0000 C CNN
F 2 "" H 2150 6600 50  0001 C CNN
F 3 "" H 2150 6600 50  0001 C CNN
	1    2150 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6450 2150 6600
$Comp
L Device:Rotary_Encoder_Switch SW2
U 1 1 5E632A05
P 1950 5650
F 0 "SW2" H 1950 6017 50  0000 C CNN
F 1 "Rotary_Encoder_Switch" H 1950 5926 50  0000 C CNN
F 2 "Rotary_Encoder:RotaryEncoder_Alps_EC12E-Switch_Vertical_H20mm" H 1800 5810 50  0001 C CNN
F 3 "~" H 1950 5910 50  0001 C CNN
	1    1950 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5E636336
P 2300 5550
F 0 "#PWR0115" H 2300 5300 50  0001 C CNN
F 1 "GND" H 2305 5377 50  0000 C CNN
F 2 "" H 2300 5550 50  0001 C CNN
F 3 "" H 2300 5550 50  0001 C CNN
	1    2300 5550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5E639C9B
P 1550 5650
F 0 "#PWR0120" H 1550 5400 50  0001 C CNN
F 1 "GND" V 1555 5522 50  0000 R CNN
F 2 "" H 1550 5650 50  0001 C CNN
F 3 "" H 1550 5650 50  0001 C CNN
	1    1550 5650
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 5650 1650 5650
$Comp
L esp32_modules:MOD_ESP32_DEV_universal U1
U 1 1 5E3BCE16
P 3250 5850
F 0 "U1" H 3250 7231 50  0000 C CNN
F 1 "MOD_ESP32_DEV_universal" H 3250 7140 50  0000 C CNN
F 2 "ptabEsp32Modules:MOD_ESP32_DEV_DEVKITC-32D" H 2300 4750 50  0001 L BNN
F 3 "MOD_ESP32" H 1150 5600 50  0001 L BNN
	1    3250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 5750 2450 5750
Wire Wire Line
	2300 5550 2250 5550
Wire Wire Line
	1650 5750 1650 5900
Wire Wire Line
	1650 5900 2450 5900
Wire Wire Line
	2450 5900 2450 5850
Wire Wire Line
	2450 5950 1400 5950
Wire Wire Line
	1400 5950 1400 5550
Wire Wire Line
	1400 5550 1650 5550
$Comp
L Connector:AudioJack3_SwitchTR J1
U 1 1 5E69679B
P 1900 4350
F 0 "J1" H 1882 4675 50  0000 C CNN
F 1 "AudioJack3_SwitchTR" H 1882 4584 50  0000 C CNN
F 2 "ptabOther:AudioJack3_SwitchTR_PJ3024" H 1900 4350 50  0001 C CNN
F 3 "~" H 1900 4350 50  0001 C CNN
	1    1900 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5EFF4315
P 2500 4500
F 0 "C4" V 2248 4500 50  0000 C CNN
F 1 "0.1uF" V 2450 4500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2538 4350 50  0001 C CNN
F 3 "~" H 2500 4500 50  0001 C CNN
	1    2500 4500
	0    1    1    0   
$EndComp
Connection ~ 2350 4500
Wire Wire Line
	2350 4500 2350 5150
Wire Wire Line
	2100 4250 2600 4250
Wire Wire Line
	2650 4500 2650 4250
Connection ~ 2650 4250
Wire Wire Line
	2650 4250 2700 4250
$Comp
L Device:C C2
U 1 1 5EFFFE12
P 2450 4750
F 0 "C2" V 2198 4750 50  0000 C CNN
F 1 "0.1uF" V 2400 4750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2488 4600 50  0001 C CNN
F 3 "~" H 2450 4750 50  0001 C CNN
	1    2450 4750
	0    1    1    0   
$EndComp
Connection ~ 2300 4750
Wire Wire Line
	2300 4750 2300 4550
Wire Wire Line
	2600 4750 2600 4250
Connection ~ 2600 4250
Wire Wire Line
	2600 4250 2650 4250
$EndSCHEMATC