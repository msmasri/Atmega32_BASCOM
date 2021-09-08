'----------------------------++                          -

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------

Config Portc.0 = Output : Led Alias Portc.0
Config Pina.0 = Input : Porta.0 = 1
Sw_1 Alias Pina.0

'-------------------------->>Variables<<-------------
Dim Var1 As Byte
Dim A As Byte
Dim Flag As Bit
Flag = 0
'------------------------->>Main Program<<------
Do
      Gosub In_put

 Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
In_put:
If Pina.0 = 0 And Flag = 0 Then
   Set Led : Set Flag : Waitms 300
   Elseif Pina.0 = 0 And Flag = 1 Then
   Reset Led : Reset Flag : Waitms 300
End If
Return