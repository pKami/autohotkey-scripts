; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Windows
; Author:         pKami (pkami.github.io)
;
; Script Function:
;	Repeat a key with delay and key configured in config.ini
;	Like an AutoClicker, but for keyboard key.

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IniFileName := "config.ini"
IniSection  := "Settings"

if !FileExist(IniFileName)
    Gosub, InitIni	; use to create a new instance of config.ini file

StartStopKey := "F2"
KeyToRepeat := 4
KeyDelay := 1000			; delay between keystrokes, in ms

IniRead, KeyToRepeat, %IniFileName%, %IniSection%, KeyToRepeat, 4
IniRead, KeyDelay, %IniFileName%, %IniSection%, KeyDelay, 1000
MsgBox, "KeyToRepeat is: " %KeyToRepeat%
MsgBox, "KeyDelay is: " %KeyDelay%

ActionDelay = 1000			; script internal delay between actions

F3::
{
	Sleep, ActionDelay
	Gosub, ValidateParams

	Sleep, ActionDelay
	Hotkey,%StartStopKey%,ExitScript
	
	Sleep, ActionDelay/2
	Gosub, MainLoop
}
return

MainLoop:
	Loop	; MAIN LOOP
	{
		Sleep, KeyDelay/2	; wait 
		Send, %KeyToRepeat%
		Sleep, KeyDelay/2	; wait 
	}
return

ValidateParams:
	if (StartStopKey = "")
	{
		MsgBox, "ERROR: No StartStopKey defined!"
		ExitApp, 2
	}
return

InitIni:	; use to create a new instance of config.ini file
; IniWrite, "F2", %IniFileName%, %IniSection%, StartStopKey
IniWrite, 2,	%IniFileName%, %IniSection%, KeyToRepeat
IniWrite, 2000, %IniFileName%, %IniSection%, KeyDelay
return

ExitScript:
Sleep, ActionDelay
Pause, Toggle, 1
