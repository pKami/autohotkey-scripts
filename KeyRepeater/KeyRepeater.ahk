;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         pKami <GITHUBMAIL>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IniFileName := "config.ini"
IniSection  := "Settings"


StartStopKey := "F2"
KeyToRepeat := 4
KeyDelay := 1000			; delay between actions, in ms

ActionDelay = 1000

; Gosub, InitIni	; use to create a new instance of config.ini file

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
		Send, 4
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
IniWrite, "F2", %IniFileName%, %IniSection%, "StartStopKey"
IniWrite, 4,	%IniFileName%, %IniSection%, "KeyToRepeat"
IniWrite, 4000, %IniFileName%, %IniSection%, "Delay"
return

ExitScript:
Sleep, ActionDelay
Pause, Toggle, 1
