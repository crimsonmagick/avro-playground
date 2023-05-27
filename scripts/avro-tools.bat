@echo off

set JAVA="%JAVA_HOME%\bin\java"
set SEMVER_SCRIPT="%~dp0semver.ps1"

REM Run the PowerShell script to get the JAR file with the most recent version
for /f "usebackq delims=" %%F in (`powershell -ExecutionPolicy Bypass -File "%SEMVER_SCRIPT%" "%~dp0.."`) do (
    set "AVRO_TOOLS_PATH=%~dp0..\%%F"
    goto :RunAvroTools
)

REM If no matching JAR file is found, display an error message
echo Error: No avro-tools JAR file found in the parent directory.
exit /b 1

:RunAvroTools
REM Pass all command line arguments to the Avro Tools command
%JAVA% -jar "%AVRO_TOOLS_PATH%" %*
