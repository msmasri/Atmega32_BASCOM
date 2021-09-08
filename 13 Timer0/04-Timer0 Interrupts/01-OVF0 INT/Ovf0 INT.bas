
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 1000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Timer , Prescale = 1024
  Enable Ovf0                                               'timer0
  On Ovf0 T0_isr                                            'timer0
  Enable Interrupts

'  Tccr0.3 = 0 : Tccr0.3 = 0
'  Tccr0.0 = 1 : Tccr0.1 = 0 : Tccr0.2 = 1

  Start Timer0

  Config Porta.0 = Output : Led Alias Porta.0
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
                                                 'timer 0
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~

T0_isr:
  Toggle Led
Return