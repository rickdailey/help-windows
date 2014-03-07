NotepadPath:= "U:\Software\Notepad2\Notepad2.exe"

#n::Run %NotepadPath%
^!n::Run %NotepadPath%

#IfWinActive ahk_class CabinetWClass
	MButton::
	{
		Click 
		PathToRun:= gst()
		Run, %NotepadPath% "%PathToRun%" ; example
		Return
	}
	Return

Return

gst() {   ; GetSelectedText or FilePath in Windows Explorer  by Learning one 

	IsClipEmpty := (Clipboard = "") ? 1 : 0

	if !IsClipEmpty {

		ClipboardBackup := ClipboardAll

		While !(Clipboard = "") {

			Clipboard =

			Sleep, 10

		}

	}

	Send, ^c

	ClipWait, 0.1

	ToReturn := Clipboard, Clipboard := ClipboardBackup

	if !IsClipEmpty

	ClipWait, 0.5, 1

	Return ToReturn

}