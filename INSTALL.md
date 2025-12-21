# Installation Guide

## Quick Install

### Windows
1. Open Command Prompt or PowerShell in this folder
2. Run: `install.bat`
3. Set your API key: `setx GEMINI_API_KEY "your_api_key_here"`
4. Restart your terminal

### Linux/Mac
1. Open Terminal in this folder
2. Run: `chmod +x install.sh && ./install.sh`
3. Set your API key: `export GEMINI_API_KEY='your_api_key_here'`
4. Add to `~/.bashrc` or `~/.zshrc` to make it permanent

## Manual Install

### Option 1: Install as Package (Recommended)
```bash
pip install -e .
```

This installs the tool globally so you can use it from anywhere.

### Option 2: Install Dependencies Only
```bash
pip install -r requirements.txt
```

Then run: `python main.py [project_folder]`

## Usage After Installation

Once installed, you can use it from anywhere:

```bash
# Generate README for current directory
readme-gen

# Generate README for specific folder
readme-gen C:\projects\my-project
readme-gen ~/projects/my-project

# Alternative command name
generate-readme [project_folder]
```

## Setting API Key

### Windows (Permanent)
```cmd
setx GEMINI_API_KEY "your_api_key_here"
```

### Windows (Temporary - Current Session)
```cmd
set GEMINI_API_KEY=your_api_key_here
```

### Linux/Mac (Permanent)
Add to `~/.bashrc` or `~/.zshrc`:
```bash
export GEMINI_API_KEY='your_api_key_here'
```

Then reload: `source ~/.bashrc`

### Linux/Mac (Temporary - Current Session)
```bash
export GEMINI_API_KEY='your_api_key_here'
```

## Get API Key

Get your Google Gemini API key from: https://makersuite.google.com/app/apikey

## Troubleshooting

### Command not found
- Make sure Python Scripts folder is in your PATH
- On Windows: Usually `C:\Users\YourName\AppData\Local\Programs\Python\Python3X\Scripts`
- Restart your terminal after installation

### Permission Denied (Linux/Mac)
- Use `sudo pip3 install -e .` if needed
- Or install in user space: `pip3 install --user -e .`

