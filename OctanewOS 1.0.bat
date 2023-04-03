@echo off
title Octanew OS 1.0

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