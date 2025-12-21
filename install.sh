#!/bin/bash

echo "========================================"
echo "  README Generator - Installation"
echo "========================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python 3 is not installed or not in PATH"
    echo "Please install Python 3.8+ from https://www.python.org/"
    exit 1
fi

echo "Installing README Generator..."
echo ""

# Install the package in development mode
pip3 install -e .

if [ $? -ne 0 ]; then
    echo ""
    echo "ERROR: Installation failed!"
    echo "Make sure you have pip installed and try again."
    exit 1
fi

echo ""
echo "========================================"
echo "  Installation Complete!"
echo "========================================"
echo ""
echo "You can now use the README generator from anywhere:"
echo ""
echo "  castorscribe [project_folder]"
echo ""
echo "Or:"
echo ""
echo "  generate-readme [project_folder]"
echo ""
echo "Example:"
echo "  castorscribe ~/projects/my-project"
echo ""
echo "Don't forget to set your API key:"
echo "  export GEMINI_API_KEY='your_api_key_here'"
echo "  # Add to ~/.bashrc or ~/.zshrc to make it permanent"
echo ""

