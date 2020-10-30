@echo off

REM Change code page to UTF-8 for better compatibility.
@chcp.com 65001 > NUL 

REM Add blank lines to improve readability.
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
@echo(
for %%a in (%*) do set lastarg=%%a
@echo(# Running... Output of class "%lastarg%":

REM Execute real command passed by args
%*

REM Mirror the bin folder into workspace folder. (.class files)
REM if %2 is -Dfile.encoding then set sourcedir as %5
REM if %2 is not -Dfile.encoding then set sourcedir as %14

set sourcedir=%5
set targetdir="%cd%\bin"

set isdebug=false

if not "%~2"=="-Dfile.encoding" (
  shift
  shift
  shift
  shift
  shift
  set isdebug=true
)

if %isdebug%==true (
  set sourcedir=%9
)

@robocopy %sourcedir% %targetdir% /MIR > nul

@echo(