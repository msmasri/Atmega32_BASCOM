

$regfile = "m32def.dat"
$crystal = 8000000

'---------------------->Configruration<--------
Config Adc = Single , Prescaler = Auto , Reference = Avcc
Start Adc

Config Single = Scientific , Digits = 2
'------------------------>Variable<-------------
Dim Adc_var_0 As Word , Adc_var_1 As Word
Dim Voltage0 As Single , Voltage1 As Single
Dim R0 As Single , R1 As Single
Const V_ref = 5
'----------------------->Main program<-----
Do
Gosub Read_var : Gosub Calc_v : Gosub Calc_r
Wait 10
Loop
End

'----------------------->Subroutine<-------
Read_var:
Adc_var_0 = Getadc(0)
Print "ADC channel 0 vaule is " ; Adc_var_0
Adc_var_1 = Getadc(1)
Print "ADC channel 1 vaule is " ; Adc_var_1
Return
Calc_v:
Voltage0 = Adc_var_0 * V_ref : Voltage0 = Voltage0 / 1024
Voltage1 = Adc_var_1 * V_ref : Voltage1 = Voltage1 / 1024
Print "Voltage 0 is " ; Voltage0
Print "Voltage 1 is " ; Voltage1
Return
Calc_r:
R0 = Voltage0 * 10 : R0 = R0 / 5
R1 = Voltage1 * 10 : R1 = R1 / 5
Print "R0 value is " ; R0
Print "R1 value is " ; R1
Return


