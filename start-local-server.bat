@echo off
echo === CHAY LOCAL SERVER CHO WEBSITE ===
echo.

cd /d "%~dp0"

REM Thử Python
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo Tim thay Python!
    echo Dang chay server tai http://localhost:8000
    echo Nhan Ctrl+C de dung server
    echo.
    python -m http.server 8000
    exit /b 0
)

REM Thử Node.js http-server
where http-server >nul 2>&1
if %errorlevel% == 0 (
    echo Tim thay http-server!
    echo Dang chay server tai http://localhost:8000
    echo Nhan Ctrl+C de dung server
    echo.
    http-server -p 8000
    exit /b 0
)

REM Thử PHP
php --version >nul 2>&1
if %errorlevel% == 0 (
    echo Tim thay PHP!
    echo Dang chay server tai http://localhost:8000
    echo Nhan Ctrl+C de dung server
    echo.
    php -S localhost:8000
    exit /b 0
)

echo Khong tim thay server nao!
echo.
echo Vui long cai dat mot trong cac cong cu sau:
echo 1. Python: https://www.python.org/downloads/
echo 2. Node.js http-server: npm install -g http-server
echo 3. PHP: https://www.php.net/downloads
echo 4. Hoac su dung Live Server trong VS Code
echo.
pause

