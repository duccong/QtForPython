@echo off
set /p intervalTime="Enter time (HH:MM): "
:loop
echo %time% > CurrentTime.txt
timeout /t %intervalTime% /nobreak >nul
goto loop
