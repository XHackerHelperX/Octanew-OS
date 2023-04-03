@echo off
title Octanew OS 1.3

:start
echo Octanew OS Is Starting....
echo =============================
timeout /t 10
echo =============================
goto :OS

:OS
set hour=%time:~0,2%
if "%hour:~0,1%"==" " set hour=0%hour:~1,1%

if %hour% GEQ 0 if %hour% LEQ 11 (
  echo Good morning!
) else if %hour% GEQ 12 if %hour% LEQ 17 (
  echo Good afternoon!
) else if %hour% GEQ 18 if %hour% LEQ 23 (
  echo Good evening!
)
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
if /I "%c%" EQU "/color" goto :/color
if /I "%c%" EQU "/randnum" goto :/randnum
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
echo /color: allows you to change the color of the operating system.
echo /randnum: generates a random number based in user input.
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
start "" "%~f0"
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

:/color
echo Choose a color:
echo 1 = Blue
echo 2 = Green
echo 3 = Aqua
echo 4 = Red
echo 5 = Purple
echo 6 = Yellow
echo 7 = White
echo 8 = Gray
echo 9 = Light Blue
echo A = Light Green
echo B = Light Aqua
echo C = Light Red
echo D = Light Purple
echo E = Light Yellow
echo F = Bright White
set /p color=Enter the color number/letter: 

color %color%
goto :run_question

:/randnum
set /p min=Enter the minimum value: 
set /p max=Enter the maximum value: 

set /a range=%max%-%min%+1
set /a num=%random% %% %range% + %min%

echo Random number between %min% and %max%: %num%
goto :run_question