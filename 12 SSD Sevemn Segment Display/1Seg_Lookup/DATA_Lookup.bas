
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
 Ssd = &HC0                                                 'to set zero for begin
 Do
    Debounce Pina.0 , 0 , Count , Sub
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~~~~~~
Count:
 Portc = Lookup(count_var , Lable_data)
 Incr Count_var
 If Count_var > 9 Then Count_var = 0
Return

Lable_data:                                                 'all these data will store in FLASH MEMORY
 Data &HC0 , &HF9 , &HA4 , &HB0 , &H99 , &H92 , &H82 , &HF8 , &H80 , &H90
 ' the data has index 0 , 1 , 2 , 3 ,........... 8 , 9 ect
 Data &HC0 , &HF9 , &HA4 , &HB0 , &H99 , &H92 , &H82 , &HF8 , &H80 , &H90
 'the data has index 10, 11, 12 ......because they are in the same lable

 Lable_example:
 'just an example the explain the difference two lables
 Data &HC0 , &HF9 , &HA4 , &HB0 , &H99 , &H92 , &H82 , &HF8 , &H80 , &H90
 ' the data has index 0 , 1 , 2 , 3 ,........... 8 , 9 ect
 Data &HC0 , &HF9 , &HA4 , &HB0 , &H99 , &H92 , &H82 , &HF8 , &H80 , &H90
 'the data has index 10, 11, 12 ......because they are in the same lable



 'more about LOOKUPSTR, LOOKDOWN, RESTORE,READ