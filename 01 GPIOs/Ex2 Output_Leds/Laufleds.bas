'----------------------------++                          -

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------

Config Porta = Output : Leds_a Alias Porta
Config Portc = Output : Leds_c Alias Portc : Portc = &HFF

Config Portb = Output

'-------------------------->>Variables<<-------------
Dim Var1 As Byte
Dim A As Byte
'------------------------->>Main Program<<------
Do
 Set Portb.1   
 Gosub Forwr : Gosub Backwr

 Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
Forwr:
For A = 0 To 7 Step 1
  Set Porta.a : Set Portc.a : Waitms 100
  Next A
Return
'---------------------------------
Backwr:
For A = 7 To 0 Step -1
  Reset Porta.a : Reset Portc.a : Waitms 100
  Next A
Return