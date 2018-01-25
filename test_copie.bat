start /B
@echo off

:refreshtime
timeout /t 60
for /f "tokens=1,2,3 delims=:" %%a in ('time /t') do set heure=%%a
for /f "tokens=1,2,3 delims=:" %%a in ('time /t') do set minute=%%b
echo %heure%
echo %minute%
set COND=
if %heure% == 11 if %minute% == 45 set COND=1
if defined COND (echo Automatic-program-opening) else (goto :refreshtime)
if defined COND (echo %heure% : %minute% >> E:\Automatic-program-opening\texte.txt) else (goto :refreshtime)
if defined COND (E:\Automatic-program-opening\test.bat) else (goto :refreshtime)
goto :refreshtime
