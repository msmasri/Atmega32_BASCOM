

$regfile = "m32def.dat"
$crystal = 8000000
$baud = 9600
'---------------------->Configruration<--------
Config Aci = On , Compare = Off , Trigger = Toggle
On Aci Isr_aci
Enable Aci
Enable Interrupts
Start Ac

'------------------------>Variable<-------------
Dim I As Byte
'----------------------->Main program<-----
Do
    nop
Loop
End

'----------------------->Subroutine<-------
Isr_aci:
Incr I
Print "Analog convert interface " ; I
Return
