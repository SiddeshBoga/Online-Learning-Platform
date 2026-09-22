@echo off
set JAVA_HOME=C:\Program Files\Microsoft\jdk-17.0.19.10-hotspot
set PATH=%JAVA_HOME%\bin;C:\Users\ASUS\maven\apache-maven-3.9.6\bin;%PATH%
echo Starting backend on http://localhost:8080 ...
cd /d "%~dp0backend"
mvn spring-boot:run
pause
