
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m16def.dat"
 $crystal = 8000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Portc = Output : Ssd Alias Portc
  Config Pina.0 = Input : Sw Alias Pina.0 : Porta.0 = 1

  Config Debounce = 25
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Count_var As Byte
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Ssd = &HC0
 Do
    Debounce Pina.0 , 0 , Count , Sub
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~~~~~~
Count:
      Select Case Count_var
             Case 0 : Ssd = &HC0
             Case 1 : Ssd = &HF9
             Case 2 : Ssd = &HA4
             Case 3 : Ssd = &HB0
             Case 4 : Ssd = &H99
             Case 5 : Ssd = &H92
             Case 6 : Ssd = &H82
             Case 7 : Ssd = &HF8
             Case 8 : Ssd = &H80
             Case 9 : Ssd = &H90
      End Select
 Incr Count_var
 If Count_var > 9 Then Count_var = 0
Return