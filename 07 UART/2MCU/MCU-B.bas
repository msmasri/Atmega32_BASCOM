

$regfile = "m32def.dat"
$crystal = 8000000
$baud = 9600
'---------------------->Configruration<--------
 Config Pinb.0 = Input : Portb.0 = 1 : Sw_b Alias Pinb.0
 Config Portb.1 = Output

'------------------------>Variable<-------------
Dim Var As String * 1
'----------------------->Main program<-----
Do
      Gosub Mcu_b
Loop
End

'----------------------->Subroutine<-------
Mcu_b:
If Ischarwaiting() = 1 Then
   Var = Inkey()
   If Var = "A" Then Toggle Portb.1
End If

If Sw_b = 0 Then
   Print "B" : Waitms 200
End If
