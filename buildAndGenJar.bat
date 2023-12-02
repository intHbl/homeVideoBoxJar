@echo off

call "%~dp0\gradlew" assembleRelease --no-daemon

call "%~dp0\genJar.bat" %1

pause