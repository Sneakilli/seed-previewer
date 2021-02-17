#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^j::
Loop, 2
{
; Select Singleplayer
MouseMove, 960, 520, 0
Click
Sleep, 150

; Select most recent world
MouseMove, 800, 350, 0
Click
Sleep, 150

; Press delete
MouseMove, 800, 970, 0
Click
Sleep, 150

; Confirm deletion
MouseMove, 800, 620, 0
Click
Sleep, 200

; Create new world
MouseMove, 1100, 870, 0
Click
Sleep, 150

; Set to creative
MouseMove, 800, 450, 0
Click
Click
Sleep, 150

; Confirm generation settings
MouseMove, 800, 970, 0
Click
Sleep, 18000 ; Waiting for world to generate

; Clear the above block
Send, {/}
Sleep, 100
Send, tp {@}a {~} {~} {~} 0 -90{Enter}
Sleep, 100
Send, {LButton down}
Sleep, 100
Send, {LButton up}
Sleep, 200

; Get seed
Send, {/}
Sleep, 100
Send, seed{Enter}
Sleep, 200
Send, t
Sleep, 200
MouseMove 200, 870, 0
Sleep, 200
Click
Sleep, 100
FileCreateDir, G:\MultiMC\instances\1.16.5\.minecraft\screenshots\ %clipboard%
Sleep, 500
Send, {Escape}
Sleep, 100

; Turn off UI
SendInput, {F1}
Sleep, 100

; Start flying
SendInput, {Space down}
Sleep, 60
SendInput, {Space up}
sleep, 100
SendInput, {Space down}
Sleep, 60
SendInput, {Space up}

; Take screenshots from each angle
Send, {/}
Sleep, 100
Send, tp {@}a {~} {~}15 {~} 0 0{Enter}
Sleep, 1000
SendInput, {F2}
Sleep, 300

Send, {/}
Sleep, 100
Send, tp {@}a {~} {~} {~} 90 0{Enter}
Sleep, 1000
SendInput, {F2}
Sleep, 300

Send, {/}
Sleep, 100
Send, tp {@}a {~} {~} {~} 180 0{Enter}
Sleep, 1000
SendInput, {F2}
Sleep, 300

Send, {/}
Sleep, 100
Send, tp {@}a {~} {~} {~} 270 0{Enter}
Sleep, 1000
SendInput, {F2}
Sleep, 300

FileMove, G:\MultiMC\instances\1.16.5\.minecraft\screenshots\*.png, G:\MultiMC\instances\1.16.5\.minecraft\screenshots\ %clipboard%

; Exit to main menu
SendInput, {F1}
Sleep, 10
SendInput, {Escape}
Sleep, 100
MouseMove, 960, 720, 0
Click
Sleep, 5000
}

ExitApp
return

^t::
ExitApp
return