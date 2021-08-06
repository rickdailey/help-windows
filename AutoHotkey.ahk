#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#n:: Run, notepad
#c:: Run, calc

#v::
Clipboard := Clipboard
Send ^v
Return

#`::
  Path := GetActiveExplorerPath()

  If Path
    Run, wt -d %Path%
  Else
    Run, wt

return


;;; Wheel over taskbar: increase/decrease volume.
#If MouseIsOver("ahk_class Shell_TrayWnd")
  WheelUp::Send {Volume_Up} 
  WheelDown::Send {Volume_Down}
#IfWinActive


;;; Visual Studio
#IfWinActive ahk_exe devenv.exe

  AppsKey & f::Send ^+f

  AppsKey & b::Send ^+b

  AppsKey & a::Send ^+a

  AppsKey & k::Send {Ctrl Down}kk{Ctrl Up}

  AppsKey & Left::Send {Ctrl Down}kp{Ctrl Up}

  AppsKey & Right::Send {Ctrl Down}kn{Ctrl Up}
  
  AppsKey & t::Send {Ctrl Down}rt{Ctrl Up}

#IfWinActive


;;; Explorer
#IfWinActive ahk_exe explorer.exe

  ~MButton::
    Doc := GetExplorerWindowDocument()

    if(!Doc)
      return

    Click

    Path := GetExplorerSelectedPath(Doc)
                  
    if(Path)
      Run, notepad %Path%
    
  return

#IfWinActive






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MouseIsOver(WinTitle)
{
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

GetExplorerSelectedPath(Doc)
{

  for Items in Doc.SelectedItems
  {
    return Items.path
  }
}

GetActiveExplorerPath()
{
  Doc := GetExplorerWindowDocument()

  if(!Doc)
    return
    
  return Doc.Folder.Self.Path
}

GetExplorerWindowDocument()
{
    hwnd := WinExist("A")
    
    for Window in ComObjCreate("Shell.Application").Windows
    {
      if (window.hwnd==hwnd)
      {
          return window.Document
      }
    }
}
