cd /d %~dp0

for %%i in (*.webp) do ffmpeg.exe -i %%i %%i.jpg