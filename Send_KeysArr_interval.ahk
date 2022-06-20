; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Windows
; Author:         pKami (pkami.github.io)
;
; Script Function:
;	Sends given key(s) defined in KeysArr array in given intervals
;	Using {key down} and {key up} for increased compatibility (non-zero keypress time)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

LoopDelay := 300000			; Delay between loops (5 min)
LoopDelay := 500			; Delay between loops (0.5 sec)
ActionDelay := 500			; Delay between actions
KeysArr := [ "E", "G" ]		; keys to send

^+z::
{
	Loop
	{
		Sleep, 200	; wait

		For index, key in KeysArr		; press keys
		{
			Send {%key% down}
			Sleep 100
			Send {%key% up}
			
			Sleep, %ActionDelay%	; wait
			
			if GetKeyState("z")
				return
		}
			
		if GetKeyState("z")
			return
		
		Sleep, %LoopDelay%	; wait
	}
}
return
