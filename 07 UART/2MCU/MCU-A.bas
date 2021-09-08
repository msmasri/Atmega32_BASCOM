

$regfile = "m32def.dat"
$crystal = 8000000
$baud = 9600
'---------------------->Configruration<--------
 Config Pinb.0 = Input : Portb.0 = 1 : Sw_a Alias Pinb.0
 Config Portb.1 = Output
'------------------------>Variable<-------------
Dim Var As String * 1
'----------------------->Main program<-----
Do
      Gosub Mcu_a
Loop
End

'----------------------->Subroutine<-------
Mcu_a:
If Ischarwaiting() = 1 Then
   Var = Inkey()
   If Var = "B" Then Toggle Portb.1
End If

If Sw_a = 0 Then
   Print "A" : Waitms 200
End If
