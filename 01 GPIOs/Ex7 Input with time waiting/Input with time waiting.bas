'----------------------------++                          -

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------

Config Portc = &B00110011 : Portc.6 = 1 : Portc.7 = 1
Config Porta.0 = Output
Config Pinb.0 = Input : Portb.0 = 1
Portc.0 = 1 : Portc.1 = 1
'-------------------------->>Variables<<-------------
Dim Var1 As Byte
Dim Count_1 As Byte
Dim Count_2 As Byte
Dim Count_3 As Byte
'------------------------->>Main Program<<------
Do
 If Pinc.6 = 0 Then Gosub Sw_1
 If Pinc.7 = 0 Then Gosub Sw_2
 If Pinb.0 = 0 Then Gosub Sw_3

 Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
Sw_1:
Incr Count_1 : Toggle Portc.0 : Print "Sw_1 presse  " ; Count_1
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Waitms 500                                                  '
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Return
'----------------------------------------------------------------
Sw_2:
Incr Count_2 : Toggle Portc.1 : Print "Sw_2 presse  " ; Count_2
Return
'--------------------------------------------------------------
Sw_3:
Incr Count_3 : Toggle Porta.0 : Print "Sw_3 presse  " ; Count_3 : Waitms 500
Return