
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 1000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Timer , Prescale = 1024
  Start Timer0

  Config Porta.0 = Output : Led Alias Porta.0
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
     If Tifr.0 = 1 Then                                     'Timer interrupt flag register
        Tifr.0 = 1                                          'to reset the bit in Timers you have to write 1 on the bit
        Toggle Led
     End If
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~~~~~~
