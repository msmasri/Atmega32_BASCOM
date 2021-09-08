'-----------------------[Definitions]
$regfile = "m32def.dat"
$crystal = 8000000
'-----------------------
'-----------------------[GPIO Configurations]
Config Debounce = 500
Config Pinb.2 = Input : Portb.2 = 1 : Send_ir Alias Pinb.2
'-----------------------
'-----------------------[Variables]
Dim Togbit As Byte , Command As Byte , Address As Byte
'---------------------
Command = 18 : Togbit = 0 : Address = 27
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'--->[Main Program]
Do
   Debounce Send_ir , 0 , Power_command , Sub               'OC1A pin
Loop
End
'---<[End Main]
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'--->[Send RC5 Code]
Power_command:
   If Togbit = 0 Then Togbit = 32 Else Togbit = 0
   Rc5send Togbit , Address , Command
Return
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~