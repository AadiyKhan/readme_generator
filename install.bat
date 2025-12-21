@echo off
echo ========================================
echo   README Generator - Installation
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.8+ from https://www.python.org/
    pause
    exit /b 1
)

echo Installing README Generator...
echo.

REM Install the package in development mode
pip install -e .

if errorlevel 1 (
    echo.
    echo ERROR: Installation failed!
    echo Make sure you have pip installed and try again.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   Installation Complete!
echo ========================================
echo.
echo You can now use the README generator from anywhere:
echo.
echo   castorscribe [project_folder]
echo.
echo Or:
echo.
echo   generate-readme [project_folder]
echo.
echo Example:
echo   castorscribe C:\projects\my-project
echo.
echo Don't forget to set your API key:
echo   setx GEMINI_API_KEY "your_api_key_here"
echo.
pause

