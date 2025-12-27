@echo off
setlocal

REM 获取当前脚本所在目录
set "currentDir=%~dp0"

REM 检查Chrome是否安装
set "chromePath="
for /f "tokens=*" %%i in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" /ve 2^>nul') do (
    set "chromePath=%%i"
)

if "%chromePath%"=="" (
    echo chrome.exe not found, please install Google Chrome before running the script.
    pause
    exit /b
)

REM 获取chrome.exe的路径
for /f "tokens=2,*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" /ve 2^>nul') do set "chromeExe=%%b"

REM 运行Chrome，并指定参数
start "" "%chromeExe%" --user-data-dir="%currentDir%dataDir" --disable-web-security --allow-running-insecure-content --start-maximized --enable-gamepad --allow-file-access-from-files "%currentDir%index.html"

endlocal
