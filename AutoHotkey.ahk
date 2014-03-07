SetTitleMatchMode, 2
CmdLinePath:= "U:\Software\cmder\cmder.exe"

#NumpadAdd::Run U:\TimeLog\TimeLog.exe
#NumpadDiv::Run U:\TimeLog\TimeLog.exe -v
#NumpadSub::Run U:\TimeLog\TimeLog.exe -f

#v::
Clipboard=%Clipboard%   ; will remove formatting

Sleep, 100   ; wait for Clipboard to update

Send ^v
Return

#`::
If WinActive("ahk_class CabinetWClass") ; for use in explorer.
{
	ClipSaved := ClipboardAll

	Send !d

	Sleep 10

	Send ^c

	Run %CmdLinePath% /start "%clipboard%"

	Clipboard := ClipSaved

	ClipSaved =
}
Else
{
	Run %CmdLinePath%
}
Return

#IfWinActive, ahk_class VirtualConsoleClass
!F4::WinClose, A
Return

#IfWinActive, Microsoft Visual Studio
RWin::SendInput ^+b
AppsKey::SendInput ^+f
Return