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

Esc::ExitApp

*~$LButton::
sleep 100
While GetKeyState("LButton", "P"){

random, x, 100, 250
random, y, 150, 200
random, n, 50,200
random, z, 1 , 3

if (z == 1) {
sleep x
}
if(z == 2) {
sleep y
}
if( z == 3){
sleep b
}
Click
sleep x
}
return