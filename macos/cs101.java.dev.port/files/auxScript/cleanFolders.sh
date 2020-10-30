#!/bin/bash

read -p "This will wipe your VS Code folders (extension/userdata). Are you sure? (y/n)? " CONT
if [ "$CONT" = "y" ]; then
	rm -r "~/Library/Application\ Support/Code";
	rm -r ~/.vscode;
	echo "Cleaned folders."
else
  echo "Leaving things untouched.";
fi






