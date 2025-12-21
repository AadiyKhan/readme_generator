#!/bin/bash

# Publishing script for README Generator
# This script helps you publish to PyPI

set -e

echo "=========================================="
echo "  README Generator - Publishing Script"
echo "=========================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if build tools are installed
echo "Checking dependencies..."
if ! command -v python &> /dev/null; then
    echo -e "${RED}ERROR: Python is not installed${NC}"
    exit 1
fi

if ! python -c "import build" 2>/dev/null; then
    echo -e "${YELLOW}Installing build tools...${NC}"
    pip install --upgrade build twine
fi

# Clean previous builds
echo ""
echo "Cleaning previous builds..."
rm -rf build/ dist/ *.egg-info
echo -e "${GREEN}✓ Cleaned${NC}"

# Build the package
echo ""
echo "Building package..."
python -m build
echo -e "${GREEN}✓ Built successfully${NC}"

# Ask where to publish
echo ""
echo "Where do you want to publish?"
echo "1) TestPyPI (for testing)"
echo "2) PyPI (production)"
read -p "Enter choice (1 or 2): " choice

case $choice in
    1)
        echo ""
        echo "Publishing to TestPyPI..."
        echo "Username: __token__"
        echo "Password: Your TestPyPI API token (starts with pypi-)"
        python -m twine upload --repository testpypi dist/*
        echo ""
        echo -e "${GREEN}✓ Published to TestPyPI!${NC}"
        echo ""
        echo "Test installation with:"
        echo "pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple/ castorscribe"
        ;;
    2)
        echo ""
        echo "Publishing to PyPI..."
        echo "Username: __token__"
        echo "Password: Your PyPI API token (starts with pypi-)"
        python -m twine upload dist/*
        echo ""
        echo -e "${GREEN}✓ Published to PyPI!${NC}"
        echo ""
        echo "Install with:"
        echo "pip install castorscribe"
        ;;
    *)
        echo -e "${RED}Invalid choice${NC}"
        exit 1
        ;;
esac

echo ""
echo "=========================================="
echo "  Done!"
echo "=========================================="

