
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 2000000
 $lib "i2c_twi.lbx"
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration I2C]~~~~~~~~~~~~
 Config Scl = Portc.0
 Config Sda = Portc.1
 Config Twi = 100000                                        '100kHZ
 I2cinit                                                    'initializes the SCL and SDL Pins
 Config Pinc.2 = Output : At24c_wp Alias Portc.2 : Set At24c_wp
' --------------[Configuration LCD]------------
 Config Lcdpin = Pin , Db4 = Porta.3 , Db5 = Porta.2 , Db6 = Porta.1 , _
                       Db7 = Porta.0 , E = Porta.4 , Rs = Porta.5

' --------------[Configuration GPIO]------------
 Config Pina.6 = Input : R_key Alias Pina.6 : Porta.6 = 1
 Config Pina.7 = Input : W_key Alias Pina.7 : Porta.7 = 1
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Read_val As Byte , Write_val As Byte , Address As Byte
'-------------[Constant]---------------
 Const At24c_w = &B10100000 : Const At24c_r = &B10100001
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Cursor Off : Print "I2C EEPROM Test Program."
 Do
   If W_key = 0 Then
      Input "Enter a Value: " , Write_val
      Input "Enter the Storing Adress: " , Address
      Reset At24c_wp : Waitms 10 : Gosub Write_eeprom : Waitms 10 : Set At24c_wp
      Print "---Written---"
      Bitwait W_key , Set
   End If

   If R_key = 0 Then
      Input "Enter the Adress to read: " , Address
      Gosub Read_eeprom
      Print "Value is: " ; Read_val : Cls : Lcd Read_val
      Print "---Done---"
      Bitwait R_key , Set
   End If
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~
Write_eeprom:
 I2cstart                                                   'Start condition
 I2cwbyte At24c_w                                           'Slave address
 I2cwbyte Address                                           'Address of EEPROm
 I2cwbyte Write_val                                         'Value to write
 I2cstop                                                    'Stop condition
Return

Read_eeprom:                                                'Generate start
 I2cstart                                                   'Slave address
 I2cwbyte At24c_w                                           'Address of EEPROM
 I2cwbyte Address                                           'Repeated start
 I2cstart                                                   'Slave address (read)
 I2cwbyte At24c_r                                           'Read byte
 I2crbyte Read_val , Nack                                   'Generate Stop
 I2cstop
Return