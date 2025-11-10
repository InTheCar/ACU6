#!/bin/bash

# Define variables
PathOfAppToCopy=~/ACU6/FilesToCopy/ACU6apps/HelloACU6
TargetPathForAppDirectory=~/ACU6apps
AppPath=$TargetPathForAppDirectory/HelloACU6

# Ensure the target directory exists
if [ ! -d "$TargetPathForAppDirectory" ]; then
  echo "Directory doesn't exist: $TargetPathForAppDirectory"
  echo "Creating $TargetPathForAppDirectory"
  mkdir -p "$TargetPathForAppDirectory"
fi

# Copy the application directory
echo "Copying from $PathOfAppToCopy to $TargetPathForAppDirectory"
cp -rv "$PathOfAppToCopy" "$TargetPathForAppDirectory"

# Unzip the project template if it exists
if [ -f "$AppPath/project-template.zip" ]; then
  echo "Unzipping project-template.zip to $AppPath"
  unzip -o "$AppPath/project-template.zip" -d "$AppPath"
else
  echo "Error: $AppPath/project-template.zip not found!"
fi
