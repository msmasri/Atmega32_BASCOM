

'----------------------------++                          -

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------

Config Porta.0 = Output : Led_a Alias Porta.0
Config Portc.0 = Output : Led_c Alias Portc.0

'-------------------------->>Variables<<-------------
Dim Var1 As Byte
'------------------------->>Main Program<<------
Do
Set Porta.0 : Reset Portc.0 : Waitms 500
Reset Porta.0 : Set Portc.0 : Waitms 555
Loop Until Var1 = 10

'------------------------->>Subroutine<<----------