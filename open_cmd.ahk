; sets Win-c to open a command prompt
;   - if a folder window is active, the command prompt will start in that directory;
;   - otherwise the command prompt will open in whatever directory you specify as the default below
#c::
if WinActive("ahk_class CabinetWClass") 
or WinActive("ahk_class ExploreWClass")
{
  Send {Shift Down}{AppsKey}{Shift Up}
  Sleep 10
  Send w{enter}
  WinActivate, "ahk_class ConsoleWindowClass"
}
else
{
  run, cmd, C:\
}
return