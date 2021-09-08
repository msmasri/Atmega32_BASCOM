
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 8000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Counter , Edge = Falling , Clear Timer = 0
  On Timer0 Counter0_isr
  Enable Timer0
  Enable Interrupts
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim N_ovs As Word , Freg As Long
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
   Start Counter0 : Waitms 1000 : Stop Counter0
   Freg = N_ovs * 256 : Freg = Freg + Counter0
   Print "Frequency=" ; Freg ; " HZ"
   Counter0 = 0 : N_ovs = 0
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~
 Counter0_isr:
 Incr N_ovs
 Return

