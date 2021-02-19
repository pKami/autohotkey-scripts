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

Delay := 100
Return	; To prevent execution of below subroutines

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
