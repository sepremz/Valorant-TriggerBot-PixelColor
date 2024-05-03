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
random, x, 30, 350
Click
sleep x
}
return