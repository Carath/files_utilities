
; Startup folder:  C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
; Y foutre le fichier (.ahk) contenant ce qui suit, en lui donnant comme
; programme par défaut AutoHotkey.

; # , Lwin -> touche windows
; ! , Lalt -> touche alt
; ^ , Lctrl -> touche ctrl
; + , Lshift -> touche shift
;---------------------------------------------------------------------------
; Zône à variables: ne pas y placer de hotkey.

SetWorkingDir, %A_Desktop%

;---------------------------------------------------------------------------

list_files(Directory)
{
  SplitPath, Directory, name
  Loop, %Directory%\*, 1
    FileAppend, %A_LoopFileName%`n, %name%-%A_Now%.txt
  Return files
}

#w::list_files("D:\Films")

#e::
  FileSelectFolder, path, *%A_Desktop%
  list_files(path)
  Return

;---------------------------------------------------------------------------
