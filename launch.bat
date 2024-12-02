@echo off
setlocal

set num_instances=10

echo Launching 10 instances of search.bat, this will close when finished...

for /L %%i in (1,1,%num_instances%) do (
	start /min cmd /c "search.bat"
	echo Lauched %%i
	timeout /t 15 >nul
)

echo Finished launching.

endlocal
exit