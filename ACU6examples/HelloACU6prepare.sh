#!/bin/bash
PathOfAppToCopy=~/ACU6/FilesToCopy/ACU6apps/HelloACU6/
TargetPathForApp=~/ACU6apps/
if [ ! -d "$TargetPathForApp" ]; then
  echo "Directory doesn't exists. $PathOfAppToCopy"
  echo "creating $TargetPathForApp"
  mkdir -p $PathOfAppToCopy
fi
cp -rv $PathOfAppToCopy $TargetPathForApp
unzip "$PathOfAppToCopy/project-template.zip"

