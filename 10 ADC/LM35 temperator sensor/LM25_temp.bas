

$regfile = "m32def.dat"
$crystal = 8000000

'---------------------->Configruration<--------
Config Adc = Single , Prescaler = Auto , Reference = Internal
Start Adc

Config Single = Scientific , Digits = 2
'------------------------>Variable<-------------
Dim Lm35_p As Word , Lm35_n As Word
Dim Temperature_c As Single , Temperature_f As Single
Const V_ref = 2.56
'----------------------->Main program<-----
Do
Gosub Read_adc : Gosub Calc_temp : Gosub Conv_c_f : Gosub Display_var
Wait 1
Loop
End

'----------------------->Subroutine<-------
Read_adc:
Lm35_p = Getadc(0) : Lm35_n = Getadc(1)
Return
'---------------------------------------------------
Calc_temp:
Temperature_c = Lm35_p - Lm35_n
Temperature_c = Temperature_c / 4
Return
'--------------------------------------------------
Conv_c_f:
'fahrenheit=1.8*(Celsius) + 32
Temperature_f = 1.8 * Temperature_c : Temperature_f = Temperature_f + 32
Return
'--------------------------------------------------
Display_var:
Print "Lm35_p vaule is " ; Lm35_p
Print "Lm35_n vaule is " ; Lm35_n
Print "Temperature in Celsuis is " ; Temperature_c
Print "Temperature in Fahrenheit is " ; Temperature_f
Return



