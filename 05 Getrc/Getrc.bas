

$regfile = "m32def.dat"
$crystal = 8000000

'---------------------->Configruration<--------


'------------------------>Variable<-------------
Dim Var_rc As Word
Dim Last_var_rc As Word
'----------------------->Main program<-----
Do
Var_rc = Getrc(pinb , 0)
 If Last_var_rc <> Var_rc Then Gosub Func_rc
Loop
End

'----------------------->Subroutine<-------
Func_rc:
Print " Resistor value is " ; Var_rc
Last_var_rc = Var_rc
Wait 1
Return
