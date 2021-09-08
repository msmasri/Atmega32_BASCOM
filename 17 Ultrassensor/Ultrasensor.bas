

$regfile = "m32def.dat"
$crystal = 8000000


 '~~~~~~~~~~~~~~~~LCD Configuration~~~~~~~~~~~~~~~~~~~~'
 Config Lcdpin = Pin , Db4 = Portc.4 , Db5 = Portc.5 , Db6 = Portc.6 , Db7 = Portc.7 , E = Portc.3 , Rs = Portc.2
 Config Lcd = 16 * 2

 '~~~~~~~~~~~~~~~Input Output Cinfiguration~~~~~~~~~~~~'
 Config Porta.4 = Output : Trig Alias Porta.4
 Config Porta.3 = Input
 '~~~~~~~~~~~~~~Variable Configuration~~~~~~~~~~~~~~~~~'
 Dim S As Word
 Dim R As Single

 Config Single = Scientific , Digits = 2


 Do

 Gosub Ultrasensor

 Loop
 End

 Ultrasensor:
  Trig = 1
  Waitus 15
  Trig = 0
  Waitus 10
  Pulsein S , Pina , 3 , 1
  R = S * 0.1725
  Upperline
  Lcd "Distance is Cm"
  Lowerline
  Lcd "     " ; R
  Waitms 50
 Return