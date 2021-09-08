
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 1000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Pwm , Prescale = 1 , Compare_pwm = Clear_up
  Tccr0.3 = 1 : Tccr0.6 = 1                                 'Fast PMW
' -----------------------------------------
  Config Pina.0 = Input : C0_key Alias Pina.0 : Porta.0 = 1
  Config Pina.1 = Input : St_key Alias Pina.1 : Porta.1 = 1

  Config Single = Scientific , Digits = 2
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Duty_cycle As Single , Vout As Single , I As Byte

' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Ocr0 = 0
 Do
   If St_key = 0 Then Gosub Traiangular
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~

Traiangular:
 Do
   For I = 0 To 255 Step 1
     Ocr0 = I : Waitus 500
     If C0_key = 0 Then Exit Do
   Next I
   For I = 255 To 0 Step -1
     Ocr0 = I : Waitus 500
     If C0_key = 0 Then Exit Do
   Next I
 Loop
 Ocr0 = 0
Return
'----------------------------------
' Duty: 0 ~ 255 [0=0% / 255=100%]
Calculation:
 Duty_cycle = Ocr0 / 255 : Duty_cycle = Duty_cycle * 100
 Print "Duty = " ; Duty_cycle ; "%"

 Vout = Duty_cycle * 5 : Vout = Vout / 100
 Print "Vout = " ; Vout ; "V"
Return
