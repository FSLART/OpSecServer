@echo off
::DONT TOUCH (batch call directory)
pushd %cd%
::DONT TOUCH END

::Set Path directorys to windows download folder
set "Win_download= C:\Users\%USERNAME%\Downloads\"
:: and choco download folder
set "Choco_download= C:\Users\%USERNAME%\AppData\Local\Temp\chocolatey\"

::Set Path to Logs directory
set "Log_Folder= C:\Users\%USERNAME%\Documents\Logs\"
::Log file name
if "%TIME:~1,1%" == ":" (
    set "FILENAME=log_download_0%time:~0,1%-%time:~3,2%-%time:~6,2%_%date:~-10,2%-%date:~-7,2%-%date:~-4,4%.log"
) else (
    set "FILENAME=log_download_%time:~0,2%-%time:~3,2%-%time:~6,2%_%date:~-10,2%-%date:~-7,2%-%date:~-4,4%.log"
)

if not exist %Log_Folder% (
    mkdir %Log_Folder%
)

::Start first copy
::Push to first directory and copy to log
echo -_-_-_-_-_-_- START OF DOWNLOAD FOLDER -_-_-_-_-_-_- > %Log_Folder%%FILENAME%
cd %Win_download%
dir *.exe /s >> %Log_Folder%%FILENAME% 2>nul
::End first copy

echo -_-_-_-_-_-_- END OF DOWNLOAD FOLDER -_-_-_-_-_-_- >> %Log_Folder%%FILENAME%
echo. >> %Log_Folder%%FILENAME%
echo -_-_-_-_-_-_- START OF CHOCO DOWNLOAD FOLDER -_-_-_-_-_-_- >> %Log_Folder%%FILENAME%

::Start second copy
::Push to second directory and copy to log
cd %Choco_download%
dir *.exe /s >> %Log_Folder%%FILENAME% 2>nul
echo -_-_-_-_-_-_- END OF CHOCO DOWNLOAD FOLDER -_-_-_-_-_-_- >> %Log_Folder%%FILENAME%
::End second copy

echo. && echo Downloads log file created and added to %Log_Folder% && echo.

:promt
set /p "userInput=Open the log in terminal (y/n):"
if /i "%userInput%"=="Y" goto yes
if /i "%userInput%"=="y" goto yes
if /i "%userInput%"=="N" goto end
if /i "%userInput%"=="n" goto end
echo Unknow character
goto promt

:yes
more %Log_Folder%%FILENAME%

:end
popd
@echo on