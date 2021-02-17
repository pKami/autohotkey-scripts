; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Windows
; Author:         pKami (pkami.github.io)
; Original Author:	Sang (from autohotkey.com forums)
;
; Script Function:
;	This script displays pressed keys (also key combos) as a tooltip
;	Originally posted by Sang in this thread: https://autohotkey.com/board/topic/118783-storing-a-key-combination-in-a-variable/
;	I've just edited it a bit.
;

#NoEnv  ; Recommended for performance and compatibility with future releases.https://www.autoitscript.com/site/
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent

F1::
Loop, 95
{ 
	key := Chr(A_Index + 31)
	Hotkey, ~*%key%, Display
}

Display:
If A_ThisHotkey =
	Return

mods = Ctrl,Shift,Alt,LWin,RWin
prefix =

Loop, Parse, mods,`,
{
	GetKeyState, mod, %A_LoopField%
	If mod = D
		prefix = %prefix%%A_LoopField% +
}

hotKey := A_ThisHotkey
StringTrimLeft, key, hotKey, 2
vk := Format("vk{:X}", GetKeyVK(SubStr(hotKey,3)))
sc := Format("sc{:X}", GetKeySC(SubStr(hotKey,3)))
asc := Asc(SubStr(hotKey,3))

if key=%a_Space%
	key=Space
ToolTip, Keys pressed:`n%prefix%%key%  ( %asc% | %vk% | %sc% )
SetTimer, RemoveToolTip, 2000
Return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return
