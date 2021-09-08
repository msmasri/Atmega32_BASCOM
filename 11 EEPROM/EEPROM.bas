
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 80000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~

' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM------------------
 Dim Var1 As Sram Byte At 100 , Var2 As Sram Word At 200
 Dim Var3 As Long , Var4 As Sram Integer At 300
 Dim I As Byte
 Dim Var(100) As Byte
 ' -------------EEPROM----------------
 Dim Var1_e As Eram Byte At 10 , Var2_e As Eram Word
 Dim Var3_e As Eram Long At &HFF
 Dim Var4_e As Eram Integer At &HFA

' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 'Var1 = Var1_e
 'Var2 = Var2_e                                             'to load all variable to sram before the processor start donig the program
 Var1_e = 55
 Var1 = 2
 Do
  'Var1 = Var1_e                                             'to do operation on variable because u can't do operation on variable in EEPROM direct
  'Incr Var1
  'Var1_e = Var1                                             'to store var in EEPROM again

 ' ---------------------------
  Readeeprom Var1 , 10                                      'to read from EEPROM at address 10
  Writeeeprom Var1 , 20                                     'to write the variable form sram to EEPROM at adress 20 in EEPROM
 ' --------------------------
   For I = 0 To 50
    Readeeprom Var(i) , I                                   ' to read an array from EEPROM
    ' add 10 to do the index starting from address 0
   Next I
 ' ---------------------------
 '---->[store data in EEPROM]
 Lable1:
 $eeprom                                                    'to store the data in EEPOM
 Data 1 , 2 , 3 , 4 , 5                                     ' 1 has index(address) 0 and 2 has 1 ect
 Lable2:
 Data 10 , 20 , 30 , 40 , 50                                ' it will store data in EEPROM because DIRECTIVE $EEPROM is active
 $data                                                      'to store the data in Flash memory again  (to end store in EEPROM)

 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~~~~~~
