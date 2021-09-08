
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
  Dim Duty_cycle As Single , Vout As Single

' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Ocr0 = 0
 Do
   If St_key = 0 Then Gosub Sawtooth
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~

Sawtooth:
 Do
  Incr Ocr0 : Waitms 1
  If C0_key = 0 Then Exit Do
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
