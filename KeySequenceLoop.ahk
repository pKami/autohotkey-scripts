; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Windows
; Author:         pKami (pkami.github.io)
;
; Script Function:
;	Sends key sequence (specified in KeySequence array) in a loop, with Delay between keystrokes.
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Delay := 500			; delay between actions
KeySequence := [ "d", "s", "d", "d", "w", "w" ]		; key sequence to be pressed

+q::
Loop
{
	For index, value in KeySequence
	{
		key := "{" value "}"
		Send %key%	;
		Sleep, %Delay%	; wait
		
		if GetKeyState("F2")
			return
	}
	
	if GetKeyState("F2")
		return
}
return