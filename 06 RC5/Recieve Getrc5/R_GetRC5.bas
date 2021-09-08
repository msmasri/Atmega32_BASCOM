

$regfile = "m32def.dat"
$crystal = 8000000

'---------------------->Configruration<--------
Config Rc5 = Pinb.1                                         'user Timer 0
Enable Interrupts
'------------------------>Variable<-------------
Dim Rc5_address As Byte
Dim Rc5_command As Byte
'----------------------->Main program<-----
Do
         Gosub Read_rc5
Loop
End

'----------------------->Subroutine<-------
Read_rc5:
 Getrc5(rc5_address , Rc5_command)

         If Rc5_address <> 255 Then
                Rc5_command = Rc5_command And &B01111111

                Print "Address is: " ; Rc5_address
                Print "Command is: " ; Rc5_command
         End If
Return