
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 8000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Counter , Edge = Falling , Clear Timer = 0
  Config Pinb.0 = Input : Portb.0 = 1
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Last_val As Byte
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Stop Counter0
 Do
   Counter0 = 0 : Start Counter0 : Waitms 1000 : Stop Counter0
   Print "Counter0: " ; Counter0 ; "HZ"
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~