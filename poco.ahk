
Capslock::

	Gui,Add,Text,,Enter Properties

	Gui,Add,Edit, vEditValue r10 w600 

	Gui,Add,Button, xs+200 gOK,OK

	Gui,Add,Button, x+10 gCancel,Cancel

	Gui,Show

Return

GuiEscape:
OK:
	Gui, Submit

	Loop,parse, EditValue, `n
	{
		if(StrLen(A_LoopField) == 0)
		{
			Continue
		}
		StringSplit, parts, A_LoopField, %A_Space%
		SendInput public%A_Space%
		
		if(parts0 == 1)
		{
			SendInput string %parts1%
		}else {
			SendInput %parts1% %parts2%
		}
		
		SendInput %A_Space%{{} get; set; {}} `n
		
	}

	Gui, Destroy

Return


Cancel:
	Gui, Destroy

Return