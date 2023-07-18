@echo off

cd /d %~dp0
mkdir temp

for %%i in (*.avif) do (
avifdec.exe %%i %%i.jpg
move %%i.jpg .\temp\
)
pause