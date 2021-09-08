'----------------------------++                          -

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------
Config Portc = Output : Leds Alias Portc : Leds = &B11101111
Config Pind.6 = Input : Switch_r Alias Pind.6 : Portd.6 = 1
Config Pind.7 = Input : Swicht_l Alias Pind.7 : Portd.7 = 1
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Config Debounce = 25                                        ''#time for waiting
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'-------------------------->>Variables<<-------------
Dim Var1 As Byte
Dim Count_r As Byte
Dim Count_l As Byte
'------------------------->>Main Program<<------

Do

 Debounce Pind.6 , 0 , Sw_r , Sub
 Debounce Pind.7 , 0 , Sw_l , Sub

Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
Sw_r:
Shift , Leds , Right , 1
Incr Count_r : Print "Press Button Right  " ; Count_r
Return

Sw_l:
Shift , Leds , Left , 1
Incr Count_l : Print "Press Button Left   " ; Count_l
Return
