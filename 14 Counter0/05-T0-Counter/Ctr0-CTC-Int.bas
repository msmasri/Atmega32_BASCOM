 $regfile = "m32def.dat"
 $crystal = 8000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Counter , Edge = Falling , Clear Timer = 1
  On Compare0 Counter0_isr
  Compare0 = 20
  Enable Compare0
  Enable Interrupts
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim N_ovs As Word , Last_val As Byte
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
   If Last_val <> Counter0 Then
      Last_val = Counter0 : Print Counter0
   End If
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~
 Counter0_isr:
 Incr N_ovs : Print "INT NO.:" ; N_ovs
 Return
