#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo
echo "========================================================="
echo "  KARAZAH VALUATION PACKAGE - QUICK SYNC SCRIPT"
echo "========================================================="
echo
echo "Repository: https://github.com/thewahish/karazah-valuation"
echo

# Check if git is available
if ! command -v git &> /dev/null; then
    echo -e "${RED}ERROR: Git is not installed${NC}"
    echo "Please install Git from: https://git-scm.com/download"
    exit 1
fi

# Create directory structure
PROJECT_DIR="$HOME/Projects/Content-Creation"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# Check if repository exists
if [ -d "karazah-valuation/.git" ]; then
    echo -e "${BLUE}Repository found. Updating...${NC}"
    cd karazah-valuation
    echo "Pulling latest changes..."
    git pull origin master
    if [ $? -ne 0 ]; then
        echo -e "${YELLOW}WARNING: Failed to pull updates. Continuing with local version...${NC}"
    fi
else
    echo -e "${BLUE}Repository not found. Cloning fresh copy...${NC}"
    if [ -d "karazah-valuation" ]; then
        echo "Removing existing directory..."
        rm -rf "karazah-valuation"
    fi
    
    echo "Cloning repository..."
    git clone https://github.com/thewahish/karazah-valuation.git
    if [ $? -ne 0 ]; then
        echo -e "${RED}ERROR: Failed to clone repository${NC}"
        echo "Check your internet connection and try again"
        exit 1
    fi
    
    cd karazah-valuation
fi

echo
echo -e "${GREEN}=========================================================${NC}"
echo -e "${GREEN}  SUCCESS! Repository is ready${NC}"
echo -e "${GREEN}=========================================================${NC}"
echo
echo "Local Path: $(pwd)"
echo

# Display available options
echo "Available presentations:"
echo "[1] Main Investor Presentation (SS Productions Branded)"
echo "[2] Executive Summary Presentation"
echo "[3] Browse All Files"
echo "[4] View in GitHub (online)"
echo "[5] View Deployment Guide"
echo "[0] Exit"
echo

read -p "Enter your choice (1-5, 0 to exit): " choice

case $choice in
    1)
        echo "Opening Main Investor Presentation..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open KARAZAH-INVESTOR-PRESENTATION.html
        else
            xdg-open KARAZAH-INVESTOR-PRESENTATION.html 2>/dev/null || echo "Please open KARAZAH-INVESTOR-PRESENTATION.html manually"
        fi
        ;;
    2)
        echo "Opening Executive Presentation..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open KARAZAH-EXECUTIVE-PRESENTATION-FOR-ABDULLAH-SHAHIN.html
        else
            xdg-open KARAZAH-EXECUTIVE-PRESENTATION-FOR-ABDULLAH-SHAHIN.html 2>/dev/null || echo "Please open KARAZAH-EXECUTIVE-PRESENTATION-FOR-ABDULLAH-SHAHIN.html manually"
        fi
        ;;
    3)
        echo "Opening project folder..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open .
        else
            xdg-open . 2>/dev/null || echo "Project location: $(pwd)"
        fi
        ;;
    4)
        echo "Opening GitHub repository..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open https://github.com/thewahish/karazah-valuation
        else
            xdg-open https://github.com/thewahish/karazah-valuation 2>/dev/null || echo "Please visit: https://github.com/thewahish/karazah-valuation"
        fi
        ;;
    5)
        echo "Opening Deployment Guide..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open DEPLOYMENT-GUIDE.md
        else
            xdg-open DEPLOYMENT-GUIDE.md 2>/dev/null || cat DEPLOYMENT-GUIDE.md
        fi
        ;;
    0)
        echo "Goodbye!"
        sleep 1
        exit 0
        ;;
    *)
        echo "Invalid choice. Opening main presentation..."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open KARAZAH-INVESTOR-PRESENTATION.html
        else
            xdg-open KARAZAH-INVESTOR-PRESENTATION.html 2>/dev/null || echo "Please open KARAZAH-INVESTOR-PRESENTATION.html manually"
        fi
        ;;
esac

echo
echo "========================================================="
echo "  QUICK ACCESS LINKS"
echo "========================================================="
echo
echo "GitHub Repository:"
echo "https://github.com/thewahish/karazah-valuation"
echo
echo "Public Access (after enabling GitHub Pages):"
echo "https://thewahish.github.io/karazah-valuation/"
echo
echo "To enable GitHub Pages:"
echo "1. Go to: https://github.com/thewahish/karazah-valuation/settings/pages"
echo "2. Select 'Deploy from a branch'"
echo "3. Choose 'master' branch and '/ (root)'"
echo "4. Click 'Save'"
echo

read -p "Press Enter to continue..."