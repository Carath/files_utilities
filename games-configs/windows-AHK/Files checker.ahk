; Trouve les derniers fichiers modifiés d'un dossier.

SetWorkingDir, %A_Desktop%

delta := 500 ; 5 minutes.

#w:: ; Adresse à fournir par copy paste.
  SetBatchLines, -1
  InputBox, input, Entrer l'adresse du dossier à observer:, , , 400, 100
  To_write = %A_Desktop%\Info_script1.txt
  FileAppend, Filename`tTime`t`tPath`n`n, %To_write%
  time := A_Now
  Loop, %input%\*, 0, 1
  {
    x := time - A_LoopFileTimeModified
    if (x < delta)
    {
      FileAppend, %A_LoopFileName%`t%x%`t`t%A_LoopFileDir%`n, %To_write%
    }
  }
  MsgBox, Done.
  Return

#x:: ; Adresse obtenue en parcourant l'arborescence.
  SetBatchLines, -1
  FileSelectFolder, To_read, *%A_Desktop%
  To_write = %A_Desktop%\Info_script2.txt
  FileAppend, Filename`tTime`t`tPath`n`n, %To_write%
  time := A_Now
  Loop, %To_read%\*, 0, 1
  {
    x := time - A_LoopFileTimeModified
    if (x < delta)
    {
      FileAppend, %A_LoopFileName%`t%x%`t`t%A_LoopFileDir%`n, %To_write%
    }
  }
  MsgBox, Done.
  Return
