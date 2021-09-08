'----------------------------++                          -

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------

Config Portc = &B00110011 : Portc.6 = 1 : Portc.7 = 1
Config Porta.0 = Output
Config Pinb.0 = Input : Portb.0 = 1
Portc.0 = 1 : Portc.1 = 1
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Config Debounce = 25                                        ''#time for waiting
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'-------------------------->>Variables<<-------------
Dim Var1 As Byte
Dim Count_1 As Byte
Dim Count_2 As Byte
Dim Count_3 As Byte
'------------------------->>Main Program<<------
Do

 Debounce Pinc.6 , 0 , Shift_l , Sub                        'If Pinc.6 = 0 Then Gosub Sw_1
 Debounce Pinc.7 , 0 , Shift_r , Sub                        'If Pinc.7 = 0 Then Gosub Sw_2
 Debounce Pinb.0 , 0 , Sw_3 , Sub                           'If Pinb.0 = 0 Then Gosub Sw_3

 Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
Shift_l:
Incr Count_1 : Toggle Portc.0 : Print "Sw_1 presse  " ; Count_1
'Waitms 500
Return
Shift_r:
Incr Count_2 : Toggle Portc.1 : Print "Sw_2 presse  " ; Count_2
Return
