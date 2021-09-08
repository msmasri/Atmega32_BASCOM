

$regfile = "m32def.dat"
$crystal = 8000000

'------------------------->>Configuration<<---------
Config Kbd = Portb , Debounce = 100 , Delay = 175

'-------------------------->>Variables<<-------------
Dim Var1 As Byte
Dim Var_kpd As Byte
'------------------------->>Main Program<<------
Do
  'Idle
    Var_kpd = Getkbd()
    'Print Var_kpd
    If Var_kpd < 16 Then Gosub Keypad
Loop Until Var1 = 10

'------------------------->>Subroutine<<----------
Keypad:
Select Case Var_kpd
           Case 00 : Print "key Pressed is (1)"
           Case 01 : Print "key Pressed is (2)"
           Case 02 : Print "key Pressed is (3)"
           Case 03 : Print "key Pressed is (A)"
           Case 04 : Print "key Pressed is (4)"
           Case 05 : Print "key Pressed is (5)"
           Case 06 : Print "key Pressed is (6)"
           Case 07 : Print "key Pressed is (B)"
           Case 08 : Print "key Pressed is (7)"
           Case 09 : Print "key Pressed is (8)"
           Case 10 : Print "key Pressed is (9)"
           Case 11 : Print "key Pressed is (C)"
           Case 12 : Print "key Pressed is (*)"
           Case 13 : Print "key Pressed is (0)"
           Case 14 : Print "key Pressed is (#)"
           Case 15 : Print "key Pressed is (D)"
     End Select
Return