@echo off
setlocal EnableDelayedExpansion
color 02

:: VARIABLES
:: Browser settings to simulate a real Firefox user
set brow="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0"
set type="Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8"
set enc="Accept-Encoding: gzip, deflate, br"
set lang="Accept-Language: en-US,en;q=0.9"
set ka="Connection: keep-alive"
set sec="Upgrade-Insecure-Requests: 1"
set te="TE: Trailers"
:: Origin headers to simulate a real browser request
set origin_google="Origin: https://www.google.com"
set origin_bing="Origin: https://www.bing.com"
set origin_yahoo="Origin: https://www.yahoo.com"
set origin_duckduckgo="Origin: https://www.duckduckgo.com"
:: Initial Referer (Starting with Google)
set referer="Referer: https://www.google.com/"
:: Initial prev_engine
set prev_engine=

::WORDS file
:: Check if the file exists
:getfile
set file=words.txt
if not exist "%file%" (
    echo %file% does not exist. Please enter the words filename: 
    set /p file=
    :: If the file still doesn't exist, prompt again
    if not exist "%file%" (
        goto getfile
    )
)

::LOGGING enable/disable
:getlogging
echo Enable logging to response.log? (Y/N):
set /p logging=

if /i "%logging%" == "Y" (
	echo Logging enabled.
) else if /i "%logging%" == "N" (
	echo Logging disabled.
) else (
	echo Unrecognized input.
	goto :getlogging
) 

::SHUFFLE the words
:: Check if shuffle.ps1 exists
if not exist "shuffle.ps1" (
    echo shuffle.ps1 does not exist.
    pause
    exit /b
)
echo Shuffling %file% with shuffle.ps1, please wait...
powershell -ExecutionPolicy Bypass -File "shuffle.ps1" "%file%"
echo Shuffle of %file% complete.
echo.

::MAIN function
:Main
:: Read the words.txt file line by line
for /f "delims=" %%a in (%file%) do (
    set search=%%a
	set query=

    :: Recalculate random engine selection inside the loop
    set /a random_engine=!random! %% 4

    :: Check which engine to use based on the random selection
    if !random_engine! == 0 (
		if !prev_engine! neq 0 (
			:: Perform the curl request for Google home
			call:curl google
			
			:: Update the referer for search query
			set referer="Referer: https://www.google.com/"
		)

        :: Perform the curl request for Google search query
		set query="search?q=!search!"
		call:curl google !query!

        :: Update the referer for the next search engine
        set referer="Referer: https://www.google.com/search?q=!search!"
		set prev_engine=0

    ) else if !random_engine! == 1 (
		if !prev_engine! neq 1 (
			:: Perform the curl request for Bing home
			call:curl bing
			
			:: Update the referer for search query
			set referer="Referer: https://www.bing.com/"
		)

        :: Perform the curl request for Bing search query
		set query="search?q=!search!"
		call:curl bing !query!

        :: Update the referer for the next search engine
        set referer="Referer: https://www.bing.com/search?q=!search!"
		set prev_engine=1

    ) else if !random_engine! == 2 (
		if !prev_engine! neq 2 (
			:: Perform the curl request for Yahoo home
			call:curl yahoo

			:: Update the referer for search query
			set referer="Referer: https://www.yahoo.com/"
		)

        :: Perform the curl request for Yahoo
		set query="search;?p=!search!&fr=sfp&fr2=sb-top"
		call:curl yahoo !query!

        :: Update the referer for the next search engine
        set referer="Referer: https://search.yahoo.com/search;?p=!search!&fr=sfp&fr2=sb-top"
		set prev_engine=2

    ) else if !random_engine! == 3 (
		if !prev_engine! neq 3 (
			:: Perform the curl request for DuckDuckGo home
			call:curl duckduckgo

			:: Update the referer for search query
			set referer="Referer: https://duckduckgo.com"
		)

        :: Perform the curl request for DuckDuckGo
		set query="?q=!search!&ia=web"
		call:curl duckduckgo !query!

        :: Update the referer for the next search engine
        set referer="Referer: https://www.duckduckgo.com/?q=!search!&ia=web"
		set prev_engine=3
    )
)

goto Main
::end Main - loops infinitely

::curl FUNCTION
:curl

::setup search query string, if its a homepage or not
if [%2]==[] ( set str=https://www.%1.com/
) else ( set str=https://www.%1.com/%2 )
	for /f "delims=" %%b in ('curl -L -A %brow% -H %type% -H %enc% -H %lang% -H %ka% -H %sec% -H !referer! -H %te% -H %origin_google% -s -w "%%{http_code} %%{time_total}s %%{url_effective}\n" -o NUL %str%') do (
		set result=%%b
		set result=!result:https://=!
		set result=!result:search.=!
		set result=!result:www.=!
		set result=!result:.com/=!

		echo !result!
		
		if /i "%logging%" == "Y" (
			echo !result! >> response.log
		)
	)

goto:end
::curl END

endlocal
pause
:end
