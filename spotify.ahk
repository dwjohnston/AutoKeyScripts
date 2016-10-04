#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;|---------------|
;|--[ SOURCES ]--|
;|---------------|
;Base Spotify Script from: http://www.autohotkey.com/board/topic/36239-spotify-global-hotkeys/
;Base Starring Script from: http://superuser.com/questions/324416/any-spotify-tweaks-with-keyboard-shortcut-to-star-tracks

;|------------------|
;|--[ SETTING UP ]--|
;|------------------|
DetectHiddenWindows, On ;Detect Spotify even if it's minimized
#IfWinExist ahk_class SpotifyMainWindow ;Only do the following if Spotify is running
spotify = ahk_class SpotifyMainWindow ;Set variable for Spotify Window Name

;|---------------|
;|--[ HOTKEYS ]--|
;|---------------|
; "CTRL + ALT + PAGEUP" for previous 
^!PGUP:: 
{
	ControlSend, ahk_parent, ^{Left}, %spotify% 
	return 
}

; "CTRL + ALT + PAGEDOWN" for next 
^!PGDN:: 
{ 
	ControlSend, ahk_parent, ^{Right}, %spotify% 
	return 
} 


; "CTRL + ALT + UP" for volume up
^!Up::
{ 
	ControlSend, ahk_parent, ^{Up}, %spotify% 
	return 
} 

; "CTRL + ALT + DOWN" for volume down
^!Down::
{ 
	ControlSend, ahk_parent, ^{Down}, %spotify% 
	return 
} 

^!Insert::
{
	SpotifyClicker(179, 809)
	return

}


^!End:: 
{
	SpotifyClicker(78, 865)
	return
}

SpotifyClicker(xx, yy) {
	spotify = ahk_class SpotifyMainWindow ;Set variable for Spotify Window Name


CoordMode, Mouse, Screen
MouseGetPos, OrigX, OrigY
WinActivate, ahk_class SpotifyMainWindow
WinGetPos, X, Y, Width, Height, ahk_class SpotifyMainWindow
Sleep, 500
MouseClick, left, X+xx, Y+yy
Sleep, 500
WinMinimize, ahk_class SpotifyMainWindow
MouseMove, OrigX, OrigY
return 
}


;|-----------------|
;|--[ FUNCTIONS ]--|
;|-----------------|

;Context menu helper function.
GetContextMenuItemText(hMenu, nPos)
{
	length := DllCall("GetMenuString"
			, "UInt", hMenu
			, "UInt", nPos
			, "UInt", 0 ; NULL
			, "Int", 0  ; Get length
			, "UInt", 0x0400)   ; MF_BYPOSITION
		VarSetCapacity(lpString, length + 1)
		length := DllCall("GetMenuString"
			, "UInt", hMenu
			, "UInt", nPos
			, "Str", lpString
			, "Int", length + 1
			, "UInt", 0x0400)
	return lpString
}