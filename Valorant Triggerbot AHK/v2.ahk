#NoEnv 
#persistent
#MaxThreadsPerHotkey 2
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
CoordMode, Pixel, Screen

;---var---
n1:= 4 ;box	       
c1:= 0xFEFE40 ; yellow="0xFEFE40", purple="0xA145A3"
x1:= A_ScreenWidth/2-n1 ;left
x2:= A_ScreenHeight/2-n1 ;top
x3:= A_ScreenWidth/2+n1 ;right
x4:= A_ScreenHeight/2+n1 ;bottom

;---
F1::
SoundBeep, 100, 200
settimer, loop1, off
settimer, loop2, off
tooltip, 
return
F2::
SoundBeep, 300, 200
settimer, loop1, 10
settimer, loop2, off
return
F3::
SoundBeep, 500, 200
settimer, loop1, off
settimer, loop2, 10
return
F4::
SoundBeep, 700, 200
settimer, loop1, 10
settimer, loop2, 10
return

;---loop---
loop1:

*~$LButton::
sleep 100
While GetKeyState("LButton", "P"){
random, ta2, 250, 350
random, n2, 10, 20
ta2 += n2
Click
sleep %ta2%
return
}


loop2:
PixelSearch()
return
random, ta1, 250, 350
random, n3, 10, 20
ta1 += n3
PixelSearch(){
PixelSearch, p0, p1, x1, x2, x3, x4, c1, 25, Fast RGB

If !(ErrorLevel) {
Click
sleep %ta1%
}
return
}

;---key---
Esc::ExitApp ;panic