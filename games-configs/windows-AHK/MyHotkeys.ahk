; Script version 3.9
; AutoHotkey version 1.1

; Place this .ahk file in the startup folder with default program AutoHotkey, in:
; %ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp
; or in %AppData%\Microsoft\Windows\Start Menu\Programs\Startup
; This file is UTF-8 encoded.

; # , Lwin -> windows key
; ^ , Lctrl -> ctrl key
; + , Lshift -> shift key
; ! , Lalt -> alt key
; <^>! , Ralt -> alt gr key

;---------------------------------------------------------------------------
; Variables area, do _not_ define hotkeys here !

SetWorkingDir, %A_Desktop% ; to save files on the desktop by default.
SetNumLockState, AlwaysOn
SetCapsLockState, AlwaysOff

GroupAdd, ToSpare, ahk_class Progman
GroupAdd, ToSpare, ahk_class WorkerW
GroupAdd, ToSpare, ahk_class Shell_TrayWnd
GroupAdd, ToSpare, ahk_class NotifyIconOverflowWindow
GroupAdd, ToSpare, ahk_class ClockFlyoutWindow
GroupAdd, ToSpare, ahk_class Shell_CharmWindow
GroupAdd, ToSpare, ahk_class ClassicShell.CMenuContainer
GroupAdd, ToSpare, ahk_class AutoHotkey

GroupAdd, Browser, ahk_class MozillaWindowClass
GroupAdd, Browser, ahk_class Chrome_WidgetWin_1

GroupAdd, Game, ahk_class Warcraft III
GroupAdd, Game, ahk_class Quake 3: Arena
GroupAdd, Game, ahk_class CNQ3 ; cpma
GroupAdd, Game, ahk_class Quake Live
GroupAdd, Game, ahk_class SDL_app ; for Return To Castle Wolfenstein
GroupAdd, Game, ahk_class UnrealTournamentUnrealWWindowsViewportWindow ; UT99
GroupAdd, Game, ahk_class KillingFloorUnrealWWindowsViewportWindow ; Killing Floor
GroupAdd, Game, ahk_class Valve001 ; Left 4 Dead 2

ahkclass(s)
{
  If (s="Firefox")
    Return "ahk_class MozillaWindowClass"
  If (s="Chrome")
    Return "ahk_class Chrome_WidgetWin_1"
  Else
    Return ""
}

default_browser := "Firefox"
default_browser_class := ahkclass(default_browser)

;---------------------------------------------------------------------------
; Hotkeys area:

f9::Send {Volume_Mute}
f10::Send {Volume_Down}
f11::Send {Volume_Up}
f12::Return

#f::Send ^+n ; creates a new folder.
#s::Run Notepad.exe
;^Esc::DllCall("LockWorkStation")
^!f1::Reload
^!f2::Suspend
^!f3::KeyHistory
^!f4:: ; prints the active window class.
  WinGetClass, class, A
  MsgBox, The active window's class is "%class%".
  Return
+Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "AlwaysOff" : "AlwaysOn"
#z::Run, %A_AppData%
;~NumpadEnter & NumpadAdd::Send ^{NumpadAdd}
;~NumpadEnter & NumpadSub::Send ^{NumpadSub}
~Ralt & Rctrl::Run Taskmgr.exe
~NumpadAdd & NumpadDiv::Send #{PrintScreen} ; ~ to not block NumpadAdd.
~NumpadAdd & Up::Send {PgUp}
~NumpadAdd & Down::Send {PgDn}
~NumpadAdd & Left::Send {Home}
~NumpadAdd & Right::Send {End}

^WheelUp::Send {WheelUp}
^WheelDown::Send {WheelDown}
~Lctrl & Backspace::Send {Backspace}
^!Left::Send {Left} ; this and the 3 following: to prevent screens rotations.
^!Right::Send {Right}
^!Down::Send {Down}
^!Up::Send {Up}
^Down::Send {Down}
^Up::Send {Up}
AppsKey::Return
F22::Return
#Enter::Send {Enter} ; to prevent opening the Windows Narrator.
#Space::Return ; to prevent keyboard language changes.
!Lshift::Return ; same.
+Lalt::Return ; same.
#Tab::Return ; to prevent launching the webcam.
<^>!Space::Send {Space} ; AltGr + space
Lalt & Lwin::Return ; preventing switches to desktop.
Lctrl & Lwin::Return ; same.

!f4::
  IfWinActive, ahk_group ToSpare
    Return
  Else
    Winclose, A
    Return

!<^>!f4:: ; Alt + AltGr + f4 : kill process. Be cautious with this one.
  IfWinActive, ahk_group ToSpare
    Return
  IfWinActive, ahk_class CabinetWClass
    Winclose, A
  Else
    WinGet, active_pid, PID, A
    Process, Close, %active_pid% ; WinKill is weak.
    Return

;Numlock::
  Send {Home}
  Send {f5}
  Return

~Rctrl & Backspace::
  x:=ClipboardAll
  Clipboard =
  Clipboard:="ÀÉÇ¡¿«»©®™Ø÷√∞є≈≠≤≥±¹²³€"
  ClipWait 0.1
  Send ^v
  Clipboard:=x
  Return

openLink(s)
{
  x:=ClipboardAll
  Clipboard =
  Send ^c
  ClipWait 0.1
  Run % s Clipboard
  Clipboard:=x
  ;Sleep 500
  ;WinActivate, %default_browser_class%
  Return
}

#a::Return
#q::Return
;#a::openLink("https://www.google.fr/#q=")
;#q::openLink("https://translate.google.fr/#en/fr/")

digit(s,i)
{
  k:=Asc(SubStr(s,i,1))
  Return 48<=k and k<=57 ? 1 : 0
}

next(e)
{
  x:=ClipboardAll
  Clipboard =
  Send ^l
  Send ^c
  ClipWait 0.1
  s:=Clipboard
  n:=StrLen(s)
  j:=n
  while (j>0 and not digit(s,j))
    j:=j-1
  i:=j-1
  while (i>0 and digit(s,i))
    i:=i-1
  Clipboard:= j=0 ? s : SubStr(s,1,i) e+SubStr(s,i+1,j-i) SubStr(s,j+1,n)
  Send ^v
  Send {Enter}
  Clipboard:=x
  Return
}

ClassNNClick(command) ; command: ClassNN found using Window Spy.
{
  WinGetTitle, Title, A
  SetControlDelay -1 ; this and "NA" may improve reliability.
  ControlClick, %command%, %Title%,,,, NA
  Return
}

;---------------------------------------------------------------------------

#IfWinActive, ahk_class Progman ; Windows Desktop.
  ^z::Return ; no permanent deletion

#IfWinActive, ahk_class CabinetWClass ; Windows Explorer.
  ^z::Return ; same.

  ^Capslock::Send {Left}

  ^Tab::Send {Right}

  ~Tab & a::Send !{Left} ; ~ to not block tab

  ~Tab & z::Send !{Right}

#IfWinActive, ahk_group Browser
  ^q::Send ^t

  ~Tab & a::Send !{Left}

  ~Tab & z::Send !{Right}

  ~Tab & e::Send ^+t

  ^Capslock::Send ^+{Tab}

  !&::next(-1)

  !é::next(1)

;#IfWinActive, ahk_class MozillaWindowClass
;  ^Lshift::Send ^b

#IfWinActive, ahk_class Chrome_WidgetWin_1
  ^Lshift::Send ^+o

#IfWinActive, ahk_class Photo_Lightweight_Viewer ; Windows Viewer.
  Down::Return

  Up::Return

  ^w::Winclose, A

  ^Lshift::ClassNNClick("Photos_ButtonEx11") ; zoom

  ^Capslock::ClassNNClick("Photos_ButtonEx12") ; left

  f::ClassNNClick("Photos_ButtonEx13") ; slideshow mode. Toggle back with F again.

  ^Tab::ClassNNClick("Photos_ButtonEx14") ; right

#IfWinActive, ahk_class Photo_Slideshow_FrameWindow ; Windows Viewer slideshow.
  ^Capslock::Send {Left}

  ^Tab::Send {Right}

#IfWinActive, ahk_class Notepad++
  ^Capslock::Send ^+{Tab}

#IfWinActive, ahk_class SUMATRA_PDF_FRAME
  ^Capslock::Send ^+{Tab}

  Left::Send p

  Right::Send n

#IfWinActive, ahk_group Game
  Lwin::Return ; switch back to desktop with alt + tab

  f12::WinMinimize, A
    WinMinimize, A
    Return

  ;f8::Send #{PrintScreen} ; issues in QL

#IfWinActive, ahk_class UnrealTournamentUnrealWWindowsViewportWindow
  !Tab::Return

  !Space::Send Space

#IfWinActive, ahk_class KillingFloorUnrealWWindowsViewportWindow
  f8::Send #{PrintScreen}

#IfWinActive

;---------------------------------------------------------------------------
