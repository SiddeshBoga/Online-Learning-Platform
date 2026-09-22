@echo off
set PATH=C:\Program Files\nodejs;%PATH%
echo Starting frontend on http://localhost:3000 ...
cd /d "%~dp0frontend"
npm start
pause
