

$regfile = "m32def.dat"
$crystal = 8000000
$baud = 9600
'------------------------->>Configuration<<---------

Config Lcdpin = Pin , Port = Portd , E = Portc.7 , Rs = Portc.6
Config Lcd = 16 * 2
'-------------------------->>Variables<<-------------
Dim Var1 As Byte
'------------------------->>Main Program<<------
Do
  Gosub Lcd_4bits
Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
Lcd_4bits:
Locate 1 , 3
Lcd "Hallo"
Wait 5
Return