setlocal

set "FILE=%~1"

set /p FIRSTLINE=<"%FILE%"

if "%FIRSTLINE:~0,2%" == "PK" (

  move "%FILE%" "%FILE%.zip"

) else if "%FIRSTLINE:~0,3%" == "Rar" (

  move "%FILE%" "%FILE%.rar"

) else echo 不明なファイルです