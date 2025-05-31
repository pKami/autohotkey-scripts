; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Windows
; Author:         pKami (pkami.github.io)
;
; Description:
;	A library of small subroutines and functions I use in various other scripts.
;	Usage instructions attached at the bottom of this file.
;
;	TO INCLUDE THIS FILE USE
;	#Include _MySubroutines.ahk
;


; To prevent execution of below subroutine
Return

SlowerMouseClick:
	Loop 2 {
		alt := not alt
		
		if(alt)
		{
			Click down
		}
		else
		{
			Click up
		}
	Sleep, 100
	}	
Return

SlowerMouseClick200:
	Loop 2 {
		alt := not alt
		
		if(alt)
		{
			Click down
		}
		else
		{
			Click up
		}
	Sleep, 200
	}	
Return

SlowerMouseClickDelay:
	Loop 2 {
		alt := not alt
		
		if(alt)
		{
			Click down
		}
		else
		{
			Click up
		}
	Sleep, %Delay%
	}	
Return

SlowerMouseClickCoords(x,y) {
	MouseMove, x, y
	Gosub SlowerMouseClick
}

SlowerMouseClickDelay(Delay) {
	Loop 2 {
		alt := not alt
		
		if(alt)
		{
			Click down
		}
		else
		{
			Click up
		}
	Sleep, %Delay%
	}
}

SlowerMouseClickDelayCoords(Delay, x, y) {
	MouseMove, x, y
	SlowerMouseClickDelay(Delay)
}

SleepSecondsWithBreak(seconds, ExitKey := "e") {
	Loop 100
	{
		Sleep, seconds * 10
		if GetKeyState(ExitKey)
			Return
	}
}

SlowerKeypress(Key) {
	Send, {%Key% down}
	Sleep, 100
	Send, {%Key% up}
}

SlowerKeypressRepeatIntervals(key, repeats, ActionDelayMs := 1000) {
	Loop %repeats% {
		Sleep, %ActionDelayMs%
		SlowerKeypress(key)
		
		if GetKeyState(ExitKey)
			Return
	}
}

; Function: ClickCoordinates
; Params:
;   coords - an array of arrays, each inner array contains two elements: x and y coordinates
;   timeoutSec - delay in seconds between clicks
ClickCoordinates(coords, timeoutSec) {
    ; CoordMode, Mouse, Screen  ; Use screen coordinates; change to "Window" if needed
    for index, coord in coords {
		
	Send, %index%
        x := coord[1]
        y := coord[2]
        SlowerMouseClickCoords(x, y)
		
        SleepSecondsWithBreak(timeoutSec)
		
		if GetKeyState(ExitKey)
			Return
    }
}


;
;	EXAMPLE SUBROUTINE USE & SUBROUTINE TUTORIAL
;
;	^e::
;	Gosub, SlowerMouseClick 
;	MsgBox, The SlowerMouseClick subroutine has returned (it is finished).
;	return


;	Sub1: 	; If put before the main script body this is bad - it executes at script start. Put it AT THE END of your scripts if you embed it there.
;   	MsgBox 1
;	Return

;	func1() { ; Unlike subroutines - functions can be placed anywhere in the file.
;		Return 1
;	}


;	MSGBOX HOWTO
;
;	MsgBox, 4,, Would you like to continue? (press Yes or No)
;	IfMsgBox Yes
;		MsgBox You pressed Yes.
;	else
;		MsgBox You pressed No.
