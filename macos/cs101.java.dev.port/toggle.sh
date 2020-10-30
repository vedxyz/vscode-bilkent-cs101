#!/bin/bash

# First, install AdoptOpenJDK.
# Download VS Code. Do not launch it.
# Move your extensions folder into to ~/.vscode/     (.vscode/extensions)
# set launcher.sh chmod to 775
# Move the CONTENTS of user-data to ~/Library/Application\ Support/Code      (Code/User)
# java.home should be set to the correct place, no need to script.
# Make a script that will toggle users' extensions and Code folder.

chmod 775 "$(pwd)/files/.vscode/extensions/vscjava.vscode-java-debug-0.29.0/scripts/launcher.sh"

mkdir -p ~/.vscode
mkdir -p ~/Library/Application\ Support/Code


mv ~/Library/Application\ Support/Code "$(pwd)/files/tmptransfer"
mv "$(pwd)/files/Code" ~/Library/Application\ Support


mv ~/.vscode "$(pwd)/files/tmptransfer"
mv "$(pwd)/files/.vscode" ~/


mv "$(pwd)/files/tmptransfer/.vscode" "$(pwd)/files"
mv "$(pwd)/files/tmptransfer/Code" "$(pwd)/files"


