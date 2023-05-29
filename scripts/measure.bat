@echo off
setlocal enabledelayedexpansion
set "psCommand=(Measure-Command {"
for %%A in (%*) do (
    set "psCommand=!psCommand! %%A"
)
set "psCommand=!psCommand! }).TotalMilliseconds"
powershell -Command "& { %psCommand% }"
endlocal
