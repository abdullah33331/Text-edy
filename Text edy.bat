@echo off
title Text Edy
:menu
cls
echo ============================
echo       Text Edy
echo ============================
echo 1. Create a new file
echo 2. Edit an existing file
echo 3. Exit
echo ============================
set /p choice=Choose an option: 

if "%choice%"=="1" goto newfile
if "%choice%"=="2" goto editfile
if "%choice%"=="3" exit
goto menu

:newfile
cls
set /p filename=Enter the name of the new file (with extension): 
echo Type your text below. Type ":wq" on a new line to save and exit.
echo. > "%filename%"
:write
set /p line=
if "%line%"==":wq" goto menu
echo %line% >> "%filename%"
goto write

:editfile
cls
set /p filename=Enter the name of the file to edit: 
if not exist "%filename%" (
    echo File not found!
    pause
    goto menu
)
echo Current contents of "%filename%":
type "%filename%"
echo ============================
echo Type your text below. Type ":wq" on a new line to save and exit.
:append
set /p line=
if "%line%"==":wq" goto menu
echo %line% >> "%filename%"
goto append