@Echo off

Echo LogSaver v.1.1 (UDK/UE3)
Echo  - Caches log each 12 hours to prevent them be deleted by the engine

if "%~1" == "" goto no_param_name
if "%~2" == "" goto no_param_location
if "%~3" == "" goto no_param_destination

SET TIME_TO_WAIT=43200
SET n=0
SET LOG_LOCATION=%2
SET BASE_DESTINATION=%3

:Loop
SET /A n=n+1
SET DT=%date%
set DT=%DT::=.%
set DT=%DT:,=.%
set DT=%DT: =_%
set DT=%DT:/=-%
SET LOG_DESTINATION=%BASE_DESTINATION%\%1\Logs_%n%_%DT%
echo.
echo [%n%] %date% %time%

xcopy %LOG_LOCATION% %LOG_DESTINATION% /c /q /i /s

timeout /T %TIME_TO_WAIT% /NOBREAK
Goto Loop

:no_param_name
echo Server name is not defined

:no_param_location
echo Log location is not defined

:no_param_destination
echo Log destination is not defined