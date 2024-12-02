@echo off
setlocal

:: Count the number of cmd.exe processes
for /f "delims=" %%i in ('tasklist /FI "IMAGENAME eq cmd.exe" /NH 2^>nul') do (
    set /a count+=1
)

echo Number of cmd.exe processes: %count%

endlocal
pause