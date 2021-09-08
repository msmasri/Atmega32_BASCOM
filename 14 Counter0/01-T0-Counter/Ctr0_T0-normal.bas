
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 8000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Counter , Edge = Falling , Clear Timer = 0

' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Last_val As Byte
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Start Counter0
 Do
    If Last_val <> Counter0 Then
       Last_val = Counter0 : Print Counter0
    End If

 Loop Until Tifr.0 = 1
 Stop Counter0 : Print "END"                                'tcnt0
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~