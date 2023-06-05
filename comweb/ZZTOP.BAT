::  RHR        2.1       3/20/98    Add z2.bat
echo off
cls
echo.
echo.
echo.
echo                         Dell Computer Corporation
echo                          Software Restore Program
echo                               Version 2.1
echo.
echo.
echo 1. Run Image Integrity Check
echo 2. Restore System to Like Factory New Condition
echo 3. Exit to DOS
echo.
Choice /c:123
if errorlevel 3 goto exit
if errorlevel 2 goto restore
if errorlevel 1 goto check

:check
echo Please Wait...
zz -zzcheck -sure >nul
if not errorlevel 1 goto ok
echo Integrity Check Failed.
echo Call Your Dell Technical Support Representative.
goto end
:ok
echo Integrity Check Passed.
pause
zztop
goto end

:restore
zz -zzcheck -sure >nul
if not errorlevel 1 goto good
echo Integrity Check Failed.
echo Call Your Dell Technical Support Representative.
goto end
:good
cls
echo.
echo.
echo.
echo                    *****  WARNING  *****
ECHO                    All data on your hard
echo                    disk will be erased.
echo                    If you wish to make a
echo                    backup of your data files,
echo                    please exit now.
echo.
echo.
echo 1. Proceed with Software Restore
echo 2. Exit to DOS
echo.
Choice /c:12
if errorlevel 2 goto exit
if errorlevel 1 goto zz
:zz
echo Please Wait...
call z2.bat
echo.
echo.
echo Please remove the floppy disk and re-boot your computer.
goto end

:exit
goto end

:end
