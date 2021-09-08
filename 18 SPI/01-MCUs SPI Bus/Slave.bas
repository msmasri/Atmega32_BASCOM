
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 8000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration SPI]~~~~~~~~~~~~
 Config Spi = Hard , Interrupt = On , Data Order = Msb , Master = No , _
                     Polarity = Low , Phase = 0 , Clockrate = 64 , Noss = 0

 Spiinit
 On Spi Spi_isr
 Enable Spi
 Enable Interrupts
' --------------[Configuration LCD]------------
 Config Lcdpin = Pin , Db4 = Porta.3 , Db5 = Porta.2 , Db6 = Porta.1 , _
                       Db7 = Porta.0 , E = Porta.4 , Rs = Porta.5
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Var As Byte , S As String * 5
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
    nop
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~
Spi_isr:
 Spiin Var , 5 : Print Var
Return