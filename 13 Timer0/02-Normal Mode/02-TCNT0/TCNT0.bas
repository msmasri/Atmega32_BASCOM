
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 1000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
 Config Timer0 = Timer , Prescale = 1024
'  Tccr0.3 = 0 : Tccr0.3 = 0
'  Tccr0.0 = 1 : Tccr0.1 = 0 : Tccr0.2 = 1

  Start Timer0

  Config Porta.0 = Output : Led Alias Porta.0
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
     If Tcnt0 = 244 Then                                    'timer0
        Timer0 = 0                                          'to reset the bit in Timers you have to write 1 on the bit
        Toggle Led
     End If
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~~~~~~