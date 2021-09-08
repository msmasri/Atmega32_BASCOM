
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 1000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Timer , Prescale = 1024
  On Ovf0 T0_isr
  Timer0 = 12                                               'to start from 12 to 255 NOT from 0
  Enable Ovf0
  Enable Interrupts

'  Tccr0.3 = 0 : Tccr0.3 = 0
'  Tccr0.0 = 1 : Tccr0.1 = 0 : Tccr0.2 = 1

  Config Porta.0 = Output : Led Alias Porta.0
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Count_250ms As Byte
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do

 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~

T0_isr:
  Toggle Led
  Timer0 = 12                                               'to load the value again after overflowing
Return