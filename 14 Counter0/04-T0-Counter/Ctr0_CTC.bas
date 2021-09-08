 $regfile = "m32def.dat"
 $crystal = 8000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Counter , Edge = Falling , Clear Timer = 1
  Compare0 = 128
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Last_val As Byte
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
     If Last_val <> Counter0 Then
        Last_val = Counter0 : Print Counter0
     End If
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~
