
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 8000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Portc = Output : Ssd_0 Alias Portc
  Config Portd = Output : Ssd_1 Alias Portd

  Config Int2 = Falling : On Int2 Count : Enable Int2 : Portb.2 = 1
  Enable Interrupts
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Count_var As Byte , Count_dec As Byte
  Dim Var As Byte
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Ssd_1 = &HC0
 Ssd_0 = &HC0                                               'to set zero for begin
 Do
    For Var = 0 To 9 Step 1
    Gosub Count
    Next Var
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~~~~~~
Count:
 Portc = Lookup(count_var , Lable_data)
 Portd = Lookup(count_dec , Lable_data)
 Incr Count_var
 If Count_var > 9 Then
    Count_var = 0 : Incr Count_dec
    If Count_dec > 9 Then Count_dec = 0
 End If
 Wait 1
Return

Lable_data:                                                 'all these data will store in FLASH MEMORY
 Data &HC0 , &HF9 , &HA4 , &HB0 , &H99 , &H92 , &H82 , &HF8 , &H80 , &H90
 ' the data has index 0 , 1 , 2 , 3 ,........... 8 , 9 ect
