@echo off
::DONT TOUCH (batch call directory)
set "CALLFOLDER=%cd%"
::DONT TOUCH END

::Temporary file in user directory. Don't change if you don't know what this is. 
set "tmp_file=C:\Users\%USERNAME%\AppData\Local\Temp\get_apps.tmp"

::Set Path for software list
set "list_file=C:\Users\%USERNAME%\Documents\instaled_software.list"

echo _-_-_-_-_-_- WINDOWS INSTALLED APPS _-_-_-_-_-_-_ > %list_file%
wmic /OUTPUT:%tmp_file% product get name, version
type %tmp_file% >> %list_file%
del %tmp_file%
echo _-_-_-_-_-_-_ INSTALLED APPS END _-_-_-_-_-_-_ >> %list_file%
echo. && echo. >> %list_file%
echo _-_-_-_-_-_-_ CHOCO INSTALLED PACKAGES _-_-_-_-_-_-_ >> %list_file%
echo Name ^| version >> %list_file%
choco list --Local -r >> %list_file%
echo _-_-_-_-_-_-_ INSTALLED PACKAGES END _-_-_-_-_-_-_ >> %list_file%

cd %CALLFOLDER%
@echo on