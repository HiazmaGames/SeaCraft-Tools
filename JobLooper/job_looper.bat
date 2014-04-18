@Echo off

SET TIME_TO_WAIT=15
SET n=0

if "%~1" NEQ "" SET TIME_TO_WAIT=%1
if "%~2" == "" goto no_param_id
if "%~3" == "" goto no_param_key

Echo JobLooper v.1.1
Echo  - Calls matchmaking cloud job each %TIME_TO_WAIT% seconds

:Loop
SET /A n=n+1
echo.
echo [%n%] %date% %time%

curl -X POST ^
  -H "X-Parse-Application-Id: %~2" ^
  -H "X-Parse-Master-Key: %~3" ^
  -H "Content-Type: application/json" ^
  -d "{}" ^
  https://api.parse.com/1/jobs/processMatchmakingQueue

timeout /T %TIME_TO_WAIT% /NOBREAK
Goto Loop

:no_param_id
echo Application Id is not defined

:no_param_key
echo Master Key is not defined