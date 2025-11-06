#!/bin/bash
PathOfAppToCopy=~/ACU6/FilesToCopy/ACU6apps/HelloACU6/
TargetPathForAppDirectory=~/ACU6apps/
AppPath=~/ACU6apps/HelloACU6/
if [ ! -d "TargetPathForAppDirectory" ]; then
  echo "Directory doesn't exists. $TargetPathForAppDirectory"
  echo "creating $TargetPathForAppDirectory"
  mkdir -p $TargetPathForAppDirectory
fi
cp -rv $PathOfAppToCopy $AppPath
unzip "$AppPath/project-template.zip"

