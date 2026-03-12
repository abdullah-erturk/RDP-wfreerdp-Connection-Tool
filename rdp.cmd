:: github.com/abdullah-erturk
:: erturk.netlify.app

@echo off
cd /d "%~dp0"
setlocal EnableDelayedExpansion
mode con cols=65 lines=50
title RDP Connection Tool ^| made by Abdullah ERTURK
color 0A

set "INI_FILE=%~dp0rdp_connections.ini"
set "B64ENC=JABrAGUAeQAgAD0AIAAiAHcAZgByAGUAZQByAGQAcAAiADsAIAAkAHMAZQBjACAAPQAgAFIAZQBhAGQALQBIAG8AcwB0ACAALQBQAHIAbwBtAHAAdAAgACcAUABhAHMAcwB3AG8AcgBkACcAIAAtAEEAcwBTAGUAYwB1AHIAZQBTAHQAcgBpAG4AZwA7ACAAJABwAHQAcgAgAD0AIABbAFMAeQBzAHQAZQBtAC4AUgB1AG4AdABpAG0AZQAuAEkAbgB0AGUAcgBvAHAAUwBlAHIAdgBpAGMAZQBzAC4ATQBhAHIAcwBoAGEAbABdADoAOgBTAGUAYwB1AHIAZQBTAHQAcgBpAG4AZwBUAG8AQgBTAFQAUgAoACQAcwBlAGMAKQA7ACAAJABwAGEAcwBzAHcAbwByAGQAIAA9ACAAWwBTAHkAcwB0AGUAbQAuAFIAdQBuAHQAaQBtAGUALgBJAG4AdABlAHIAbwBwAFMAZQByAHYAaQBjAGUAcwAuAE0AYQByAHMAaABhAGwAXQA6ADoAUAB0AHIAVABvAFMAdAByAGkAbgBnAEEAdQB0AG8AKAAkAHAAdAByACkAOwAgACQAYgB5AHQAZQBzACAAPQAgAFsAUwB5AHMAdABlAG0ALgBUAGUAeAB0AC4ARQBuAGMAbwBkAGkAbgBnAF0AOgA6AFUAVABGADgALgBHAGUAdABCAHkAdABlAHMAKAAkAHAAYQBzAHMAdwBvAHIAZAApADsAIAAkAGsAZQB5AEIAeQB0AGUAcwAgAD0AIABbAFMAeQBzAHQAZQBtAC4AVABlAHgAdAAuAEUAbgBjAG8AZABpAG4AZwBdADoAOgBVAFQARgA4AC4ARwBlAHQAQgB5AHQAZQBzACgAJABrAGUAeQApADsAIAAkAHIAZQBzAHUAbAB0ACAAPQAgACIAIgA7ACAAZgBvAHIAIAAoACQAaQAgAD0AIAAwADsAIAAkAGkAIAAtAGwAdAAgACQAYgB5AHQAZQBzAC4ATABlAG4AZwB0AGgAOwAgACQAaQArACsAKQAgAHsAIAAkAHIAZQBzAHUAbAB0ACAAKwA9ACAAIgB7ADAAOgBYADIAfQAiACAALQBmACAAKAAkAGIAeQB0AGUAcwBbACQAaQBdACAALQBiAHgAbwByACAAJABrAGUAeQBCAHkAdABlAHMAWwAkAGkAIAAlACAAJABrAGUAeQBCAHkAdABlAHMALgBMAGUAbgBnAHQAaABdACkAIAB9ADsAIABXAHIAaQB0AGUALQBPAHUAdABwAHUAdAAgACQAcgBlAHMAdQBsAHQA"
set "B64DEC=JABrAGUAeQAgAD0AIAAiAHcAZgByAGUAZQByAGQAcAAiADsAIAAkAGgAZQB4ACAAPQAgACQAZQBuAHYAOgBFAE4AQwBfAFAAQQBTAFMAXwBFAE4AVgA7ACAAJABrAGUAeQBCAHkAdABlAHMAIAA9ACAAWwBTAHkAcwB0AGUAbQAuAFQAZQB4AHQALgBFAG4AYwBvAGQAaQBuAGcAXQA6ADoAVQBUAEYAOAAuAEcAZQB0AEIAeQB0AGUAcwAoACQAawBlAHkAKQA7ACAAJABiAHkAdABlAHMAIAA9ACAAQAAoACkAOwAgAGYAbwByACAAKAAkAGkAIAA9ACAAMAA7ACAAJABpACAALQBsAHQAIAAkAGgAZQB4AC4ATABlAG4AZwB0AGgAOwAgACQAaQAgACsAPQAgADIAKQAgAHsAIAAkAGIAeQB0AGUAcwAgACsAPQAgAFsAQwBvAG4AdgBlAHIAdABdADoAOgBUAG8ASQBuAHQAMwAyACgAJABoAGUAeAAuAFMAdQBiAHMAdAByAGkAbgBnACgAJABpACwAIAAyACkALAAgADEANgApACAAfQA7ACAAJABwAGwAYQBpAG4AIAA9ACAAIgAiADsAIABmAG8AcgAgACgAJABpACAAPQAgADAAOwAgACQAaQAgAC0AbAB0ACAAJABiAHkAdABlAHMALgBMAGUAbgBnAHQAaAA7ACAAJABpACsAKwApACAAewAgACQAcABsAGEAaQBuACAAKwA9ACAAWwBjAGgAYQByAF0AKAAkAGIAeQB0AGUAcwBbACQAaQBdACAALQBiAHgAbwByACAAJABrAGUAeQBCAHkAdABlAHMAWwAkAGkAIAAlACAAJABrAGUAeQBCAHkAdABlAHMALgBMAGUAbgBnAHQAaABdACkAIAB9ADsAIABXAHIAaQB0AGUALQBPAHUAdABwAHUAdAAgACQAcABsAGEAaQBuAA=="
set "B64ENC_STR=JABrAGUAeQAgAD0AIAAiAHcAZgByAGUAZQByAGQAcAAiADsAIAAkAHAAbABhAGkAbgAgAD0AIAAkAGUAbgB2ADoAUABMAEEASQBOAF8AVABFAFgAVABfAEUATgBWADsAIAAkAGIAeQB0AGUAcwAgAD0AIABbAFMAeQBzAHQAZQBtAC4AVABlAHgAdAAuAEUAbgBjAG8AZABpAG4AZwBdADoAOgBVAFQARgA4AC4ARwBlAHQAQgB5AHQAZQBzACgAJABwAGwAYQBpAG4AKQA7ACAAJABrAGUAeQBCAHkAdABlAHMAIAA9ACAAWwBTAHkAcwB0AGUAbQAuAFQAZQB4AHQALgBFAG4AYwBvAGQAaQBuAGcAXQA6ADoAVQBUAEYAOAAuAEcAZQB0AEIAeQB0AGUAcwAoACQAawBlAHkAKQA7ACAAJAByAGUAcwB1AGwAdAAgAD0AIAAiACIAOwAgAGYAbwByACAAKAAkAGkAIAA9ACAAMAA7ACAAJABpACAALQBsAHQAIAAkAGIAeQB0AGUAcwAuAEwAZQBuAGcAdABoADsAIAAkAGkAKwArACkAIAB7ACAAJAByAGUAcwB1AGwAdAAgACsAPQAgACIAewAwADoAWAAyAH0AIgAgAC0AZgAgACgAJABiAHkAdABlAHMAWwAkAGkAXQAgAC0AYgB4AG8AcgAgACQAawBlAHkAQgB5AHQAZQBzAFsAJABpACAAJQAgACQAawBlAHkAQgB5AHQAZQBzAC4ATABlAG4AZwB0AGgAXQApACAAfQA7ACAAVwByAGkAdABlAC0ATwB1AHQAcAB1AHQAIAAkAHIAZQBzAHUAbAB0AA=="

:: wfreerdp.exe kontrolu
if not exist "%~dp0wfreerdp.exe" (
    cls
    echo.
	echo =================================================================
    echo  WARNING: wfreerdp.exe NOT FOUND
	echo =================================================================
    echo.
    echo  This tool requires 'wfreerdp.exe' in the same directory.
    echo.
    set "dl_choice="
    set /p dl_choice=" Open download page? (Y/N): "
    if /i "!dl_choice!"=="y" (
        echo.
        echo  Opening download page...
        start https://ci.freerdp.com/job/freerdp-nightly-windows/
    )
    echo.
    pause
    exit
)

:MENU
cls
echo.
echo     github.com/abdullah-erturk
echo.
echo     erturk.netlify.app
echo.
echo =================================================================
echo               	REMOTE DESKTOP CONNECTION TOOL
echo =================================================================
echo.
set "conn_count=0"

if exist "%INI_FILE%" (
    for /f "usebackq tokens=1,2,3,4 delims==" %%A in (`powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.IO.File]::ReadAllLines('%INI_FILE%',[System.Text.UTF8Encoding]::new($false))"`) do (
        set /a conn_count+=1
        set "alias_!conn_count!=%%A"
        set "ip_!conn_count!=%%B"
        set "user_!conn_count!=%%C"
        set "pass_!conn_count!=%%D"
    )
)

if !conn_count! EQU 0 goto NEW_CONN

echo Saved Connections:
echo -----------------------------------------------------------------
for /L %%I in (1, 1, !conn_count!) do (
    echo [%%I] !alias_%%I! ^(!ip_%%I!^)
)
echo.
echo [0] New Connection
echo [E] Edit a connection
echo [D] Delete a connection
echo.
set "choice="
set /p choice="Select an option: "

if "%choice%"=="" goto MENU
if "%choice%"=="0" goto NEW_CONN
if /i "%choice%"=="e" goto EDIT_MENU
if /i "%choice%"=="d" goto DELETE_MENU

call set "target_alias=%%alias_!choice!%%"
call set "target_ip=%%ip_!choice!%%"
if not "!target_ip!"=="" goto LOAD_SAVED
echo Invalid selection!
timeout /t 2 >nul
goto MENU

:LOAD_SAVED
call set "xor_user=%%user_!choice!%%"
call set "xor_pass=%%pass_!choice!%%"
echo.
echo Connecting to !target_alias! ^(!target_ip!^)...
set "ENC_PASS_ENV=!xor_user!"
for /f "usebackq delims=" %%P in (`powershell -NoProfile -ExecutionPolicy Bypass -EncodedCommand !B64DEC!`) do set "target_user=%%P"
set "ENC_PASS_ENV="
set "ENC_PASS_ENV=!xor_pass!"
for /f "usebackq delims=" %%P in (`powershell -NoProfile -ExecutionPolicy Bypass -EncodedCommand !B64DEC!`) do set "target_pass=%%P"
set "ENC_PASS_ENV="
timeout /t 2 >nul
start "" wfreerdp.exe /v:!target_ip! /u:!target_user! /p:"!target_pass!" /smart-sizing /cert:ignore
exit

:EDIT_MENU
cls
echo.
echo Saved Connections:
echo -----------------------------------------------------------
for /L %%I in (1, 1, !conn_count!) do (
    echo [%%I] !alias_%%I! ^(!ip_%%I!^)
)
echo.
set "edit_choice="
set /p edit_choice="Select connection to edit (or Enter to cancel): "
if "%edit_choice%"=="" goto MENU

call set "edit_alias=%%alias_!edit_choice!%%"
call set "edit_ip=%%ip_!edit_choice!%%"
call set "edit_xor_user=%%user_!edit_choice!%%"
call set "edit_xor_pass=%%pass_!edit_choice!%%"
if "!edit_ip!"=="" (
    echo Invalid selection!
    timeout /t 2 >nul
    goto MENU
)

:EDIT_FIELD
cls
echo.
echo Editing: !edit_alias! ^(!edit_ip!^)
echo -----------------------------------------------------------
echo [1] Connection Name  (current: !edit_alias!)
echo [2] IP Address       (current: !edit_ip!)
echo [3] Username         (encrypted)
echo [4] Password         (encrypted)
echo [S] Save and return
echo.
set "edit_field="
set /p edit_field="Select field to edit: "
if /i "%edit_field%"=="s" goto EDIT_SAVE
if "%edit_field%"=="1" goto EDIT_ALIAS
if "%edit_field%"=="2" goto EDIT_IP
if "%edit_field%"=="3" goto EDIT_USER
if "%edit_field%"=="4" goto EDIT_PASS
echo Invalid selection!
timeout /t 2 >nul
goto EDIT_FIELD

:EDIT_ALIAS
for /f "usebackq delims=" %%Z in (`powershell -NoProfile -Command "Read-Host 'New Connection Name'"`) do set "edit_alias=%%Z"
if "!edit_alias!"=="" set "edit_alias=!edit_ip!"
goto EDIT_FIELD

:EDIT_IP
set "new_ip="
set /p new_ip="New IP Address: "
if not "%new_ip%"=="" set "edit_ip=!new_ip!"
goto EDIT_FIELD

:EDIT_USER
for /f "usebackq delims=" %%Z in (`powershell -NoProfile -Command "Read-Host 'New Username'"`) do set "new_uname=%%Z"
if "!new_uname!"=="" goto EDIT_FIELD
set "PLAIN_TEXT_ENV=!new_uname!"
for /f "usebackq delims=" %%E in (`powershell -NoProfile -ExecutionPolicy Bypass -EncodedCommand !B64ENC_STR!`) do set "edit_xor_user=%%E"
set "PLAIN_TEXT_ENV="
goto EDIT_FIELD

:EDIT_PASS
for /f "usebackq delims=" %%E in (`powershell -NoProfile -ExecutionPolicy Bypass -EncodedCommand !B64ENC!`) do set "edit_xor_pass=%%E"
goto EDIT_FIELD

:EDIT_SAVE
set "EDIT_IDX_ENV=!edit_choice!"
set "ALIAS_ENV=!edit_alias!"
set "IP_ENV=!edit_ip!"
set "USER_ENV=!edit_xor_user!"
set "PASS_ENV=!edit_xor_pass!"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$idx=[int]$env:EDIT_IDX_ENV-1;$f='%INI_FILE%';$all=[System.IO.File]::ReadAllLines($f);$all[$idx]=$env:ALIAS_ENV+'='+$env:IP_ENV+'='+$env:USER_ENV+'='+$env:PASS_ENV;[System.IO.File]::WriteAllLines($f,[string[]]$all)"
set "EDIT_IDX_ENV=" & set "ALIAS_ENV=" & set "IP_ENV=" & set "USER_ENV=" & set "PASS_ENV="
echo.
echo Connection updated.
timeout /t 2 >nul
goto MENU

:DELETE_MENU
cls
echo.
echo Saved Connections:
echo -----------------------------------------------------------
for /L %%I in (1, 1, !conn_count!) do (
    echo [%%I] !alias_%%I! ^(!ip_%%I!^)
)
echo.
set "del_choice="
set /p del_choice="Enter number to delete (or Enter to cancel): "
if "%del_choice%"=="" goto MENU

call set "del_alias=%%alias_!del_choice!%%"
call set "del_ip=%%ip_!del_choice!%%"
if "!del_ip!"=="" (
    echo Invalid selection!
    timeout /t 2 >nul
    goto MENU
)
set "confirm="
set /p confirm="Delete '!del_alias!' ^(!del_ip!^)? (Y/N): "
if /i not "%confirm%"=="y" goto MENU
set "DEL_IDX_ENV=!del_choice!"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$idx=[int]$env:DEL_IDX_ENV-1;$f='%INI_FILE%';$all=[System.IO.File]::ReadAllLines($f);$out=@();for($i=0;$i-lt $all.Count;$i++){if($i-ne $idx){$out+=$all[$i]}};[System.IO.File]::WriteAllLines($f,[string[]]$out)"
set "DEL_IDX_ENV="
echo.
echo Connection deleted.
timeout /t 2 >nul
goto MENU

:NEW_CONN
echo.
set "ip="
set /p ip="Target IP Address (IP or IP:Port): "
if "%ip%"=="" (
    echo ERROR: IP address cannot be empty!
    timeout /t 2 >nul
    goto MENU
)
set "save_opt="
set /p save_opt="Save connection? (Y/N): "
echo.
if /i "%save_opt%"=="y" goto SAVE_CONN
goto JUST_CONNECT

:SAVE_CONN
for /f "usebackq delims=" %%Z in (`powershell -NoProfile -Command "Read-Host 'Connection Name (optional)'"`) do set "alias=%%Z"
if "!alias!"=="" set "alias=!ip!"
for /f "usebackq delims=" %%Z in (`powershell -NoProfile -Command "Read-Host 'Username'"`) do set "username=%%Z"
set "PLAIN_TEXT_ENV=!username!"
for /f "usebackq delims=" %%E in (`powershell -NoProfile -ExecutionPolicy Bypass -EncodedCommand !B64ENC_STR!`) do set "xor_user=%%E"
set "PLAIN_TEXT_ENV="
echo.
for /f "usebackq delims=" %%E in (`powershell -NoProfile -ExecutionPolicy Bypass -EncodedCommand !B64ENC!`) do set "xor_pass=%%E"

:: Decrypt for this session
set "ENC_PASS_ENV=!xor_user!"
for /f "usebackq delims=" %%P in (`powershell -NoProfile -ExecutionPolicy Bypass -EncodedCommand !B64DEC!`) do set "target_user=%%P"
set "ENC_PASS_ENV="
set "ENC_PASS_ENV=!xor_pass!"
for /f "usebackq delims=" %%P in (`powershell -NoProfile -ExecutionPolicy Bypass -EncodedCommand !B64DEC!`) do set "target_pass=%%P"
set "ENC_PASS_ENV="

set "ALIAS_ENV=!alias!"
set "IP_ENV=!ip!"
set "USER_ENV=!xor_user!"
set "PASS_ENV=!xor_pass!"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$f='%INI_FILE%'; $line=$env:ALIAS_ENV+'='+$env:IP_ENV+'='+$env:USER_ENV+'='+$env:PASS_ENV; [System.IO.File]::AppendAllText($f,$line+[Environment]::NewLine,[System.Text.UTF8Encoding]::new($false))"
set "ALIAS_ENV=" & set "IP_ENV=" & set "USER_ENV=" & set "PASS_ENV="
echo.
echo Connection saved as '!alias!'! Starting...
timeout /t 2 >nul
start "" wfreerdp.exe /v:!ip! /u:!target_user! /p:"!target_pass!" /smart-sizing /cert:ignore
exit

:JUST_CONNECT
echo.
echo Starting connection: !ip!
timeout /t 2 >nul
start "" wfreerdp.exe /v:!ip! /smart-sizing /cert:ignore
exit