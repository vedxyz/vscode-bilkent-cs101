#!/bin/bash

printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf '# Running... Output of class '"\"${*: -1}\""':\n'
# Needs to be the last argument 

# Run the usual commands.
"$@"

# Now for the binary syncing bit
sourcedir=${*: -2:1}
targetdir="$(pwd)/"

# Add mirror command here
rsync -aqu --delete "$sourcedir" "$targetdir"  

printf "\n"
printf "\n"


