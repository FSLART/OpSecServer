@echo off
::DONT TOUCH (batch call directory)
set "CALLFOLDER=%cd%"
::DONT TOUCH END

::Set Path directorys to windows download folder
set "Win_download= C:\Users\%USERNAME%\Download\"
:: and choco download folder
set "Choco_download= C:\Users\%USERNAME%\AppData\Local\Temp\chocolatey\"

::Set Path to Logs directory
set "Log_Folder= C:\Users\%USERNAME%\Documents\Logs\"
::Log file name
if "%TIME:~2,1%" == ":" (
    set "FILENAME=log_download_0%time:~1,1%-%time:~3,2%-%time:~6,2%_%date:~-10,2%-%date:~-7,2%-%date:~-4,4%.txt"
) else (
    set "FILENAME=log_download_%time:~0,2%-%time:~3,2%-%time:~6,2%_%date:~-10,2%-%date:~-7,2%-%date:~-4,4%.txt"
)

if not exist %Log_Folder% (
    mkdir %Log_Folder%
)

::Start first copy
::Push to first directory and copy to log
echo -_-_-_-_-_-_- START OF DOWNLOAD FOLDER -_-_-_-_-_-_- > %Log_Folder%%FILENAME%
pushd %Win_download%
dir *.exe /s 1>> %Log_Folder%%FILENAME% 2>> %Log_Folder%%FILENAME%
::End first copy

echo -_-_-_-_-_-_- END OF DOWNLOAD FOLDER -_-_-_-_-_-_- >> %Log_Folder%%FILENAME%
echo. >> %Log_Folder%%FILENAME%
echo -_-_-_-_-_-_- START OF CHOCO DOWNLOAD FOLDER -_-_-_-_-_-_- >> %Log_Folder%%FILENAME%

::Start second copy
::Push to second directory and copy to log
pushd %Choco_download%
dir *.exe /s 1>> %Log_Folder%%FILENAME% 2>> %Log_Folder%%FILENAME%
echo -_-_-_-_-_-_- END OF CHOCO DOWNLOAD FOLDER -_-_-_-_-_-_- >> %Log_Folder%%FILENAME%
::End second copy

pushd %CALLFOLDER%
@echo on