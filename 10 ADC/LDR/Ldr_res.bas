

$regfile = "m32def.dat"
$crystal = 8000000

'---------------------->Configruration<--------
Config Adc = Single , Prescaler = Auto , Reference = Avcc
Start Adc

Config Single = Scientific , Digits = 2
'------------------------>Variable<-------------
Dim Ldr As Word , Ldr_v As Single
Const V_ref = 5
'----------------------->Main program<-----
Do
Gosub Read_ldr : Gosub Calc_v                               'Gosub Calc_r
Wait 1
Loop
End

'----------------------->Subroutine<-------
Read_ldr:
Ldr = Getadc(0)
Print "ADC channel 0 vaule is " ; Ldr
Return
Calc_v:
Ldr_v = Ldr * V_ref : Ldr_v = Ldr_v / 1024
Print "Ldr Voltage is " ; Ldr_v
Return
'Calc_r:
'R0 = Voltage0 * 10 : R0 = R0 / 5
'R1 = Voltage1 * 10 : R1 = R1 / 5
'Print "R0 value is " ; R0
'Print "R1 value is " ; R1
'Return