@echo off

setlocal ENABLEDELAYEDEXPANSION

for %%f in (*.bin) do (

	set name=%%f
	
	set flName=!name:.bin=!
	
	mkdir "!flName!"
	move "!name!" .\"!flName!"\
)

pause