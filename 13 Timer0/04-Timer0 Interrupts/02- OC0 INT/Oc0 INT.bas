
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 1000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Timer , Prescale = 1024 , Clear Timer = 1
  Enable Compare0
  On Compare0 T0_isr
  Compare0 = 244
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
  Incr Count_250ms
Return