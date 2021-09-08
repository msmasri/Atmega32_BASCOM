

$regfile = "m32def.dat"
$crystal = 8000000
$baud = 9600
'------------------------->>Configuration<<---------

Config Lcdpin = Pin , Db4 = Portc.3 , Db5 = Portc.2 , Db6 = Portc.1 , Db7 = Portc.0 , E = Portc.4 , Rs = Portc.5
Config Lcd = 16 * 2
'-------------------------->>Variables<<-------------
Dim Var1 As Byte
'------------------------->>Main Program<<------
Do
  Gosub Lcd_4bits
Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
Lcd_4bits:
Cls
Upperline
Lcd "Hallo"
Waitms 1500
Return