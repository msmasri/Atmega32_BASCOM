

$regfile = "m32def.dat"
$crystal = 8000000
$baud = 9600
'---------------------->Configruration<--------
Config Clock = Soft                                         'user
Config Date = Dmy , Separator = /
Enable Interrupts                                           'becouse T2 active

'------------------------>Variable<-------------
Dim Last_sec As Byte
Dim Last_min As Byte
Dim Last_hour As Byte
Dim Last_day As Byte
Dim Last_month As Byte
Dim Last_year As Byte
'----------------------->Main program<-----
Time$ = "16:56:20"
Date$ = "14/01/12"
Do
   Gosub Timer_date
Loop
End

'----------------------->Subroutine<-------
Timer_date:
'Print "Time is " ; Time$
'Print "Date is " ; Date$
    If _sec <> Last_sec Then
       Last_sec = _sec
       Print "Second is " ; _sec                                         
     End If
If _min <> Last_min Then
   Last_min = _min
   Print "minute is " ; _min
End If
If _hour <> Last_hour Then
   Last_hour = _hour
   Print "Hour is " ; _hour
End If
If _day <> Last_day Then
   Last_day = _day
   Print "day is " ; _day
End If
If _month <> Last_month Then
   Last_month = _month
   Print "month is " ; _month
End If
If _year <> Last_year Then
   Last_year = _year
   Print "year is " ; _year
End If
Return
