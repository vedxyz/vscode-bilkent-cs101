@echo off
setlocal enabledelayedexpansion
del tmpFile1234.txt

rem file name
set targetfile=visual-studio-code-15.0.1\data\user-data\User\settings.json

set locationfile=visual-studio-code-15.0.1\data\user-data\currentLocation.txt

rem current location with double back-slashes
set escapedlocation=%cd:\=\\%

rem value to be replaced
set /p find=<%locationfile%

rem value to replace with
set replace="java.home": "%escapedlocation%\\jdk-11.0.8+10",

rem save new location in locationfile
echo(%replace%> %locationfile%

rem modify settings.json
for /F "tokens=* delims=," %%n in (!targetfile!) do (
set line=%%n
set newline=!line:%find%=%replace%!
echo(!newline!>>tmpFile1234.txt
)

rem overwrite file
move tmpFile1234.txt %targetfile%
