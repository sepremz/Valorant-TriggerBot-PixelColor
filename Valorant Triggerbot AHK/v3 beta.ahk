#NoEnv 
#persistent
#MaxThreadsPerHotkey 8
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
SoundBeep, 300, 200
SoundBeep, 400, 200

;HOTKEYS
key_stay_on	    := 	"F1"	; self explanatory		
key_hold_mode	:= 	"F2"	; scan will only scan if "key_hold" is pressed
key_fastclick 	:= 	"F3"	; self explanatory (on/off beep sound only)
key_burstclick  :=  "F4"    ; self explanatory
key_off		    := 	"F5"	; self explanatory	
key_exit	    := 	"F6"    ; self explanatory	
key_gui_hide	:=	"F7"	; hides gui (graphical user interface)		
key_hold	    :=	"LALT" 	; key that you hold to scan (example "T") 	

;SETTINGS
pixel_box	    := 3		    ; Keep between min 3 and max 8		
pixel_sens	    := 20	        ; higher/lower = more/less color sensitive 		
pixel_color	    := 0xA145A3     ; yellow="0xFEFE40", purple="0xA145A3" 
lowerreacttb    := 160          ; lowest delay tb ; for best use 150, 200, for more human 160, 300, and rage 10,11
upperreacttb    := 300          ; highest delay tb
lowerspam       := 10           ; lowest delay slow   
upperspam       := 20           ; highest delay fast
burstcount      := 3            ; x times
burstbullettimel:= 20
burstbullettimeu:= 30
bursttimingl    := 150
bursttimingu    := 170

;DO NOT TOUCH?
Gui,2:Font,Cdefault,Fixedsys
Gui,2:Color,Black
Gui,2:Color, EEAA99
Gui,2:Add,Progress, x10 y20 w100 h23 Disabled BackgroundGreen vC3
Gui,2:Add,Text, xp yp wp hp cYellow BackgroundTrans Center 0x200 vB3 gStart,ON
Gui,2:Add,Progress, x10 y20 w100 h23 Disabled BackgroundGreen vC2
Gui,2:Add,Text, xp yp wp hp cYellow BackgroundTrans Center 0x200 vB2 gStart,HOLD MODE
Gui,2:Add,Progress, xp yp wp hp Disabled BackgroundRED vC1
Gui,2:Add,Text, xp yp wp hp cYellow BackgroundTrans Center 0x200 vB1 gStart,OFF
Gui,2: Show, x10 y1 w200 h60
Gui,2:+LastFound +ToolWindow +AlwaysOnTop -Caption
WinSet, TransColor, EEAA99

leftbound:= A_ScreenWidth/2-pixel_box
rightbound:= A_ScreenWidth/2+pixel_box
topbound:= A_ScreenHeight/2-pixel_box
bottombound:= A_ScreenHeight/2+pixel_box 

hotkey, %key_stay_on%, stayon
hotkey, %key_hold_mode%, holdmode
hotkey, %key_fastclick%, fastclick
hotkey, %key_burstclick%, burstclick
hotkey, %key_off%, offloop
hotkey, %key_exit%, terminate
hotkey, %key_gui_hide%, guihide
return
start:
gui,2:submit,nohide
terminate:
SoundBeep, 300, 200
SoundBeep, 200, 200
Sleep 400
exitapp
;----------------------------
stayon:
SoundBeep, 300, 200
settimer, loop1, 100
settimer, loop2, off
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: show,B3
GuiControl,2: show,C3
return
holdmode:
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, 10
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: show,B2
GuiControl,2: show,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
return
fastclick:
x := 2
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, 100
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: show,B3
GuiControl,2: show,C3
return
burstclick:
x := 3
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, 100
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: show,B3
GuiControl,2: show,C3
return
;------------------------
offloop:
SoundBeep, 300, 200
settimer, loop1, off
settimer, loop2, off
GuiControl,2: show,B1
GuiControl,2: show,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
return
guihide:
GuiControl,2: hide,B1
GuiControl,2: hide,C1
GuiControl,2: hide,B2
GuiControl,2: hide,C2
GuiControl,2: hide,B3
GuiControl,2: hide,C3
return
;------------------------
*~$LButton::
While True { ;GetKeyState("LButton", "P") && !GetKeyState("a") && !GetKeyState("s") && !GetKeyState("d") && !GetKeyState("w") {
if (x == 2) {
Fastclick()
return
}
if (x == 3) {
Burst()
return
}
}
return

loop1:
PixelSearch()
return

loop2:
While GetKeyState(key_hold, "P"){
PixelSearch()
}
return

;---------------

Fastclick() {
global
while (GetKeyState("LButton", "P")){
random, tapping, lowerspam, upperspam
Click
sleep %tapping%
}
return
}
;---------------

Burst() {
global
sleep, 10
While GetKeyState("LButton", "P"){
loop, %burstcount%{
Click
random, randb, %burstbullettimel%, %burstbullettimeu%
sleep, randb
}
random, randd, %bursttimingl%, %bursttimingu%
sleep, randd
}
return
}
;---------------

PixelSearch() {
global
PixelSearch, FoundX, FoundY, leftbound, topbound, rightbound, bottombound, pixel_color, pixel_sens, Fast RGB
If !(ErrorLevel)
{
If !GetKeyState("LButton", "P") {

random, tap_time, %lowerreacttb%, %upperreacttb%
click
sleep %tap_time%
}
}
return
}
