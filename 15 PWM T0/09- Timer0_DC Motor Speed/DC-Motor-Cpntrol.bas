
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 1000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Pwm , Prescale = 64 , Compare_pwm = Clear_up
  Tccr0.3 = 1 : Tccr0.6 = 1                                 ' Fast PWM
' -----------------------------------------
  Config Pina.0 = Input : Incr_key Alias Pina.0 : Porta.0 = 1
  Config Pina.1 = Input : Decr_key Alias Pina.1 : Porta.1 = 1

  Config Single = Scientific , Digits = 2
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Duty_cycle As Single , Vout As Single

' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
   If Incr_key = 0 Then
      If Ocr0 < 255 Then Incr Ocr0
      Gosub Calculation
   End If

   If Decr_key = 0 Then
      If Ocr0 > 0 Then Decr Ocr0
      Gosub Calculation
   End If
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~
' Duty: 0 ~ 255 [0=0% / 255=100%]
Calculation:
 Duty_cycle = Ocr0 / 255 : Duty_cycle = Duty_cycle * 100
 Print "Duty = " ; Duty_cycle ; "%"

 Vout = Duty_cycle * 5 : Vout = Vout / 100
 Print "Vout = " ; Vout ; "V"
Return