#!/bin/bash
########## setLocation.sh script for Linux version of VS Code for Bilkent CS 101 (Last update: 29.10.2020)




##### Set java.home
# Grab paths to necessary files in order to set java.home
targetfile="$(pwd)/visual-studio-code-15.0.1/data/user-data/User/settings.json"

locationfile="$(pwd)/visual-studio-code-15.0.1/data/user-data/currentLocation.txt"

find=$(head -n 1 "$locationfile")

replace='"java.home": "'"$(pwd)"'/jdk-11.0.8+10",'

# Update location cache
echo "$replace" > "$locationfile"

# Set java.home
sed -i "s=$find=$replace=" "$targetfile"




##### Set permissions for the folder, prevent permission related issues
# Set launcher script permission to 755 so VS Code can execute it
chmod 755 "$(pwd)/visual-studio-code-15.0.1/data/extensions/vscjava.vscode-java-debug-0.29.0/scripts/launcher.sh"

# Actually, let's just set the whole thing to 755... Or should we? This is the part I'm not sure of.
# There are certainly issues that originate from not enough permissions, but I don't know whether this is the best way to deal with it or not.
chmod -R 755 "$(pwd)"




##### Create VS Code shortcut
# Fixing directory names in the shortcut
sed -i "s+PWD_VARIABLE+$(pwd)/visual-studio-code-15.0.1+g" "VS Code for CS101.desktop"

# Make the shortcut show up in the Applications menu
mkdir -p "$HOME/.local/share/applications/"
ln -sf "$(pwd)/VS Code for CS101.desktop" "$HOME/.local/share/applications/VS Code for CS101.desktop"
update-desktop-database ~/.local/share/applications




##### Add JDK to PATH if the terminal is integrated to VS Code
# Remove previous conditional clause, if there is one
sed -i "/cs101.java.dev.port/d" ~/.bashrc

# Conditional clause for adding JDK to path if $CS101 is set (using VS Code's integrated terminal env. setting)
# (.bashrc is run every time BASH is started, not limited to when setLocation.sh is run.)
echo "[[ \$CS101 ]] && export PATH=\"$(pwd)/jdk-11.0.8+10/bin:\$PATH\"" >> ~/.bashrc



