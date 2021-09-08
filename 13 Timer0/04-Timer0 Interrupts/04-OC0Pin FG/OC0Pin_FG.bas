
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 1000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Timer , Prescale = 1 , Clear Timer = 1
  Ocr0 = 50
  Tccr0.5 = 0 : Tccr0.4 = 1
  Enable Oc0
  Enable Interrupts

'  Tccr0.3 = 0 : Tccr0.3 = 0
'  Tccr0.0 = 1 : Tccr0.1 = 0 : Tccr0.2 = 1

  Config Portb.3 = Output
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------

' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do

 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~
