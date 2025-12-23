@echo off
title Karazah Valuation - Quick Sync & Access
color 0A

echo.
echo =========================================================
echo   KARAZAH VALUATION PACKAGE - QUICK SYNC SCRIPT
echo =========================================================
echo.
echo Repository: https://github.com/thewahish/karazah-valuation
echo.

:: Check if git is available
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed or not in PATH
    echo Please install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
)

:: Create directory structure
if not exist "D:\Projects\Content-Creation" (
    echo Creating project directory structure...
    mkdir "D:\Projects\Content-Creation"
)

cd /d "D:\Projects\Content-Creation"

:: Check if repository exists
if exist "karazah-valuation\.git" (
    echo Repository found. Updating...
    cd karazah-valuation
    echo Pulling latest changes...
    git pull origin master
    if errorlevel 1 (
        echo WARNING: Failed to pull updates. Continuing with local version...
    )
) else (
    echo Repository not found. Cloning fresh copy...
    if exist "karazah-valuation" (
        echo Removing existing directory...
        rmdir /s /q "karazah-valuation" 2>nul
    )
    
    echo Cloning repository...
    git clone https://github.com/thewahish/karazah-valuation.git
    if errorlevel 1 (
        echo ERROR: Failed to clone repository
        echo Check your internet connection and try again
        pause
        exit /b 1
    )
    
    cd karazah-valuation
)

echo.
echo =========================================================
echo   SUCCESS! Repository is ready
echo =========================================================
echo.
echo Local Path: %CD%
echo.

:: Display available options
echo Available presentations:
echo [1] Main Investor Presentation (SS Productions Branded)
echo [2] Executive Summary Presentation  
echo [3] Browse All Files
echo [4] View in GitHub (online)
echo [5] View Deployment Guide
echo [0] Exit
echo.

set /p choice="Enter your choice (1-5, 0 to exit): "

if "%choice%"=="1" (
    echo Opening Main Investor Presentation...
    start KARAZAH-INVESTOR-PRESENTATION.html
) else if "%choice%"=="2" (
    echo Opening Executive Presentation...
    start KARAZAH-EXECUTIVE-PRESENTATION-FOR-ABDULLAH-SHAHIN.html
) else if "%choice%"=="3" (
    echo Opening project folder...
    start .
) else if "%choice%"=="4" (
    echo Opening GitHub repository...
    start https://github.com/thewahish/karazah-valuation
) else if "%choice%"=="5" (
    echo Opening Deployment Guide...
    start DEPLOYMENT-GUIDE.md
) else if "%choice%"=="0" (
    echo Goodbye!
    timeout /t 2 >nul
    exit /b 0
) else (
    echo Invalid choice. Opening main presentation...
    start KARAZAH-INVESTOR-PRESENTATION.html
)

echo.
echo =========================================================
echo   QUICK ACCESS LINKS
echo =========================================================
echo.
echo GitHub Repository:
echo https://github.com/thewahish/karazah-valuation
echo.
echo Public Access (after enabling GitHub Pages):
echo https://thewahish.github.io/karazah-valuation/
echo.
echo To enable GitHub Pages:
echo 1. Go to: https://github.com/thewahish/karazah-valuation/settings/pages
echo 2. Select "Deploy from a branch" 
echo 3. Choose "master" branch and "/ (root)"
echo 4. Click "Save"
echo.

pause