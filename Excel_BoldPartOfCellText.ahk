; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Windows
; Author:         pKami (pkami.github.io)
;
; Script Function:
;	Having to bold just a fragment of cell text in Excel can be quite a tedious task if there are a lot of such cells to style.
;	If your text cells have a given format, for instance: bold starting from the 5th character until the 10th character, or bold from the 5th character until the '(' character, this script can automate that.
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^e::
{
	StartIndex := 5		; start index - where to start the bolding
	MinLength := 5		; length which will not even check for terminating character
	MaxLength := 50		; length after which going right will stop
	; StartingCharacter := "("		; TODO one day, maybe some day
	TerminatingCharacter := "("		; after the script stumbles upon this character in the clipboard, it will stop going right
	IncludingTerminatingCharacter := False		; whether the terminating character should be included in bold text
	DelayMs := 100		; how fast the script can execute actions (depends mostly on computer performance)
	NumRows := 2		; how many rows to iterate over
	
	Loop %NumRows%
	{
		Send {F2}	; edit cell
		Sleep, DelayMs
		Send {Home}		; go to start of cell
		Sleep, DelayMs/2
		Send {Right %StartIndex%}	; go to StartIndex
		Sleep, DelayMs	
		Send {Shift Down}{Right %MinLength%}{Shift Up}
		
		Loop %MaxLength%	; go right as far as MaxLength allows, until found the TerminatingCharacter
		{
			Send {Ctrl Down}c{Ctrl Up}
			Sleep, DelayMs/2
			
			if GetKeyState("Escape")	; hold this key to abort the script
				return
			if Clipboard Contains %TerminatingCharacter%
				break
			
			Send {Shift Down}{Right}{Shift Up}
		}
		
		if (!IncludingTerminatingCharacter) {
			Send {Shift Down}{Left}{Shift Up}
			Sleep, DelayMs/2
		}
		
		Send {Ctrl Down}b{Ctrl Up}
		Sleep, DelayMs/2
		Send {Enter}
		Sleep, DelayMs
		
		if GetKeyState("Escape")	; hold this key to abort the script
			return
	}
}
return

