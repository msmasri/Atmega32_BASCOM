

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------
Config Portc = Output : Config Porta = Output
Config Int0 = Falling : On Int0 Sw_int0 : Enable Int0
Config Int1 = Falling : On Int1 Sw_int1 : Enable Int1
Config Int2 = Falling : On Int2 Sw_int2 : Enable Int2
Enable Interrupts
Portd.2 = 1 : Portd.3 = 1 : Portb.2 = 1
'-------------------------->>Variables<<-------------
Dim Var1 As Byte
Dim Count_1 As Byte
Dim Count_2 As Byte
Dim Count_3 As Byte
'------------------------->>Main Program<<------
Do
    Idle
Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
Sw_int0:
Incr Count_1 : Toggle Portc.0 : Print "Sw_int0 presse  " ; Count_1
Return
Sw_int1:
Incr Count_2 : Toggle Portc.1 : Print "Sw_int1 presse  " ; Count_2
Return
Sw_int2:
Incr Count_2 : Toggle Porta.0 : Print "Sw_int2 presse  " ; Count_3
Return