@echo off
title Octanew OS

:start
echo Octanew OS Is Starting....
echo =============================
timeout /t 10
echo =============================
goto :OS

:OS
echo Welcome to Octanew OS.                                            
echo Do /help for a list of commands...
echo ============================

:run_question
echo ============================
set /p c=Command:
if /I "%c%" EQU "/help" goto :/help
if /I "%c%" EQU "/ip" goto :/ip
if /I "%c%" EQU "/date" goto :/date
if /I "%c%" EQU "/time" goto :/time
if /I "%c%" EQU "/reboot" goto :/reboot
if /I "%c%" EQU "/shutdown" goto :/shutdown
if /I "%c%" EQU "/calc" goto :/calc
if /I "%c%" EQU "/clr" goto :/clr
if /I "%c%" EQU "/timer" goto :/timer
echo Sorry that is not a valid command, type /help for a list of commands.
goto :run_question

:/help
echo Here is the list of commands:
echo ===============================
echo /help: shows list of commands. 
echo /ip: shows your current IP address. 
echo /date: shows todays date. 
echo /time: shows current time (will need to be ran again to refresh clock).
echo /reboot: reboots the operating system.
echo /shutdown: turns off the operating system.
echo /calc: allows you to use a built in calculator for Octanew OS.
echo /timer: allows you to make a custom timer in minutes.
echo /clr: clears the screen.
goto :run_question

:/ip
ipconfig
goto :run_question

:/date
echo %date%
echo ============================
goto :run_question

:/time
echo %time%
echo ============================
goto :run_question

:/reboot
echo reboot in:
timeout /t 5
start OctanewOS.bat
exit

:/shutdown
echo shutdown in:
timeout /t 10
exit

:/calc
:menu
echo Choose an option, 1, 2, 3, or 4:
echo 1. Addition
echo 2. Subtraction
echo 3. Multiplication
echo 4. Division

set /p option=Enter option number:

if "%option%"=="1" goto add
if "%option%"=="2" goto sub
if "%option%"=="3" goto mul
if "%option%"=="4" goto div

:add
set /p num1=Enter first number:
set /p num2=Enter second number:
set /a result=%num1%+%num2%
echo Result: %result%
goto :run_question

:sub
set /p num1=Enter first number:
set /p num2=Enter second number:
set /a result=%num1%-%num2%
echo Result: %result%
goto :run_question

:mul
set /p num1=Enter first number:
set /p num2=Enter second number:
set /a result=%num1%*%num2%
echo Result: %result%
goto :run_question

:div
set /p num1=Enter first number:
set /p num2=Enter second number:
set /a result=%num1%/%num2%
echo Result: %result%
goto :run_question

:/timer
set /p minutes=Enter the number of minutes to countdown:

set /a seconds=%minutes%*60

:loop
echo Countdown: %seconds% seconds left
timeout /t 1 /nobreak > nul
set /a seconds=seconds-1
if %seconds% gtr 0 goto loop

echo Time's up!
goto :run_question

:/clr
cls
goto :run_question