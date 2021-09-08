
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 8000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration SPI]~~~~~~~~~~~~
 Config Spi = Hard , Interrupt = Off , Data Order = Msb , Master = Yes , _
                     Polarity = Low , Phase = 0 , Clockrate = 64 , Noss = 0

 Spiinit
' --------------[Configuration LCD]------------
 Config Lcdpin = Pin , Db4 = Porta.3 , Db5 = Porta.2 , Db6 = Porta.1 , _
                       Db7 = Porta.0 , E = Porta.4 , Rs = Porta.5
' --------------[Configuration GPIO]------------
 Config Pina.6 = Input : Button Alias Pina.6 : Porta.6 = 1
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Var As Byte , S As String * 5

  Var = 123 : S = "Hallo"
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
  If Pina.6 = 0 Then Gosub Send_spi_data
  Waitms 100
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~
Send_spi_data:
 Spiout S , 5
Return