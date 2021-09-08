
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m16def.dat"
 $crystal = 8000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Portc.0 = Output : Data_send Alias Portc.1
  Config Portc.1 = Output : Clock Alias Portc.1
  Config Portc.3 = Output : Latch Alias Portc.3

'  Config Int2 = Falling : On Int2 Count : Enable Int2 : Portb.2 = 1
'  Enable Interrupts
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Data_shiftout As Byte , I As Byte , J As Byte
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
    For I = 0 To 9
    Data_shiftout = Lookup(i , Segment)
        For J = 7 To 0 Step -1
           Data_send = Data_shiftout.j
           Set Clock : Waitus 10 : Reset Clock
        Next J
    Set Latch : Waitms 1 : Reset Latch
    Waitms 200
    Next I
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~~~~~~
Segment:
 Data &H3F , &H06 , &H5B , &H4F , &H66 , &H3D , &H7C , &H07 , &H7F , &H60
 'Data &HC0 , &HF9 , &HA4 , &HB0 , &H99 , &H92 , &H82 , &HF8 , &H80 , &H90
 ' the data has index 0 , 1 , 2 , 3 ,........... 8 , 9 ect
