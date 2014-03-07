#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Scrolllock::Suspend, % GetKeyState("Scrolllock","t") ? "Off" : "On"


+Capslock::Capslock

$[::SendInput {{}
$]::SendInput {}}
${::SendInput [
$}::SendInput ]


$1::SendInput {!}
$2::SendInput {@}
$3::SendInput {#}
$4::SendInput {$}
$5::SendInput `%
$6::SendInput {^}
$7::SendInput {&}
$8::SendInput {*}
$9::SendInput {(}
$0::SendInput {)}
$+1::SendInput 1
$+2::SendInput 2
$+3::SendInput 3
$+4::SendInput 4
$+5::SendInput 5
$+6::SendInput 6
$+7::SendInput 7
$+8::SendInput 8
$+9::SendInput 9
$+0::SendInput 10