'----------------------------++                          -

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------

Config Portc.0 = Output : Led Alias Portc.0
Config Pina.0 = Input : Sw_1 Alias Pina.0

'-------------------------->>Variables<<-------------
Dim Var1 As Byte
Dim A As Byte
'------------------------->>Main Program<<------
Do
      Gosub In_put

 Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
In_put:
If Pina.0 = 0 Then
   Toggle Led : Waitms 500
End If
Return