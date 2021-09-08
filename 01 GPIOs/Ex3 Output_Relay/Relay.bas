'----------------------------++                          -

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------

Config Portc.0 = 1 : Led Alias Portc.0


'-------------------------->>Variables<<-------------
Dim Var1 As Byte
Dim A As Byte
'------------------------->>Main Program<<------
Do
      Gosub Relay

 Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
Relay:
  Set Led
  Waitms 500
  Reset Led
Return
