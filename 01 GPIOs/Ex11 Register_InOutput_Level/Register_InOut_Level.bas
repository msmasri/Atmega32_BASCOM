'----------------------------++                          -

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------
'Config Portc = Output : Leds Alias Portc : Leds = &B11101111
'Config Pind.6 = Input : Switch_r Alias Pind.6 : Portd.6 = 1
'Config Pind.7 = Input : Swicht_l Alias Pind.7 : Portd.7 = 1

Ddrc = &B11111111
Ddrd.6 = 0 : Portd.6 = 1
Ddrd.7 = 0 : Portd.7 = 1

Portc = &B11111110
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Config Debounce = 25                                        ''#time for waiting
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'-------------------------->>Variables<<-------------
Dim Var1 As Byte
Dim Count_r As Byte
Dim Count_l As Byte
Dim A As Byte
'------------------------->>Main Program<<------

Do

 Debounce Pind.6 , 0 , Sw_r , Sub
 Debounce Pind.7 , 0 , Sw_l , Sub

Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
Sw_r:
For A = 0 To 7 Step 1
Rotate , Portc , Right , 1
Waitms 50
Incr Count_r : Print "Press Button Right  " ; Count_r
Next A
Return

Sw_l:
Rotate , Portc , Left , 1
Incr Count_l : Print "Press Button Left   " ; Count_l
Return
