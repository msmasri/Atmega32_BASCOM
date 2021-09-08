
' ~~~~~~~~~~~~~~~[Definition]~~~~~~~~~~~~~~
 $regfile = "m32def.dat"
 $crystal = 1000000
 $baud = 9600
' ~~~~~~~~~~~~~~[Configuration]~~~~~~~~~~~~
  Config Timer0 = Pwm , Prescale = 8 , Compare_pwm = Clear_up
  Tccr0.3 = 1 : Tccr0.6 = 1
  On Oc0 Oc0_isr : On Ovf0 Ovf0_isr
' -----------------------------------------
  Config Pina.0 = Input : Co_key Alias Pina.0 : Porta.0 = 1
  Config Pina.1 = Input : St_key Alias Pina.1 : Porta.1 = 1

  Config Single = Scientific , Digits = 2
' ~~~~~~~~~~~~~~[Variable]~~~~~~~~~~~~~~~~~
' ----------------SARM--------------
  Dim Duty_cycle As Single , Vout As Single , I As Byte , Index As Byte
  Dim Single_var As Single , Sine_arr(256) As Byte , Value As Byte
' ~~~~~~~~~~~[Main Program]~~~~~~~~~~~~~
 Do
   If St_key = 0 Then Gosub Sine

   If Co_key = 0 Then
   Disable Interrupts : Ocr0 = 0
   End If
 Loop
 End
' ~~~~~~~~~~~~~[Subroutine]~~~~~~~~~~
' Duty: 0 ~ 255 [0=0% / 255=100%]
'Calculation:
' Duty_cycle = Ocr0 / 255 : Duty_cycle = Duty_cycle * 100
' Print "Duty = " ; Duty_cycle ; "%"

' Vout = Duty_cycle * 5 : Vout = Vout / 100
' Print "Vout = " ; Vout ; "V"
'Return
'----------------------
 Sine:
 'f(x)=X * sine(2*Pi*f(sig)*t)
 'Sinetable = shift_val + (peak_val*sin(2*Pi*(i/256)));
 '>> i=0:1:255;
 '>> sinetable = int(128 + (128*sine(6.283 * (i/255)));
 For I = 0 To 255
    Single_var = I / 255 : Single_var = Single_var * 6.283
    Single_var = Sin(single_var) : Single_var = Single_var * 128
    Single_var = Single_var + 128 : Sine_arr(i + 1) = Int(single_var)
    If Sine_arr(i + 1) > 255 Then Sine_arr(i + 1) = 255
 Next I
  Index = 1 : Enable Oc0 : Enable Ovf0 : Enable Interrupts
 Return
'----------------------
 Oc0_isr:
  Ocr0 = Sine_arr(index) : If Index = 255 Then Index = 1 Else Incr Index
  Waitms 1
 Return
'----------------------
Ovf0_isr:

Return
