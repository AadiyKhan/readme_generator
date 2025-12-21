@echo off
REM Publishing script for README Generator (Windows)
REM This script helps you publish to PyPI

echo ==========================================
echo   README Generator - Publishing Script
echo ==========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed
    exit /b 1
)

REM Check if build tools are installed
python -c "import build" 2>nul
if errorlevel 1 (
    echo Installing build tools...
    pip install --upgrade build twine
)

REM Clean previous builds
echo.
echo Cleaning previous builds...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
if exist *.egg-info (
    for /d %%d in (*.egg-info) do rmdir /s /q "%%d"
)
echo Cleaned

REM Build the package
echo.
echo Building package...
python -m build
if errorlevel 1 (
    echo ERROR: Build failed
    pause
    exit /b 1
)
echo Built successfully

REM Ask where to publish
echo.
echo Where do you want to publish?
echo 1) TestPyPI (for testing)
echo 2) PyPI (production)
set /p choice="Enter choice (1 or 2): "

if "%choice%"=="1" (
    echo.
    echo ==========================================
    echo Publishing to TestPyPI...
    echo ==========================================
    echo.
    echo IMPORTANT: When prompted, enter:
    echo   Username: __token__
    echo   Password: Your TestPyPI API token (paste it)
    echo.
    echo Press any key to start upload...
    pause >nul
    echo.
    python -m twine upload --repository testpypi dist/*
    if errorlevel 1 (
        echo.
        echo ERROR: Upload failed!
        echo Make sure you entered the correct credentials.
        pause
        exit /b 1
    )
    echo.
    echo ==========================================
    echo Published to TestPyPI successfully!
    echo ==========================================
    echo.
    echo Test installation with:
    echo pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple/ castorscribe
) else if "%choice%"=="2" (
    echo.
    echo ==========================================
    echo Publishing to PyPI...
    echo ==========================================
    echo.
    echo IMPORTANT: When prompted, enter:
    echo   Username: __token__
    echo   Password: Your PyPI API token (paste it)
    echo.
    echo Press any key to start upload...
    pause >nul
    echo.
    python -m twine upload dist/*
    if errorlevel 1 (
        echo.
        echo ERROR: Upload failed!
        echo Make sure you entered the correct credentials.
        pause
        exit /b 1
    )
    echo.
    echo ==========================================
    echo Published to PyPI successfully!
    echo ==========================================
    echo.
    echo Install with:
    echo pip install castorscribe
) else (
    echo Invalid choice
    pause
    exit /b 1
)

echo.
echo ==========================================
echo   Done!
echo ==========================================
pause

