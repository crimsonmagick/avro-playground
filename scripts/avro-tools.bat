@echo off

setlocal

set JAVA="%JAVA_HOME%\bin\java"

REM Get the avro-tools JAR file with the most recent version
for /f "delims=" %%I in ('dir /b /o:-n "%~dp0..\"avro-tools*.jar') do (
    set "AVRO_TOOLS_PATH=%~dp0..\%%I"
    goto :RunAvroTools
)

REM If no matching JAR file is found, display an error message
echo Error: No avro-tools JAR file found in the parent directory.
exit /b 1

:RunAvroTools
REM Pass all command line arguments to the Avro Tools command
%JAVA% -jar "%AVRO_TOOLS_PATH%" %*

endlocal