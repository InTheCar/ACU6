#!/bin/bash
PathOfAppToCopy=~/ACU6/FilesToCopy/ACU6apps/HelloACU6/
TargetPathForApp=~/ACU6apps
if [ ! -d "$TargetPathForApp" ]; then
  echo "Directory doesn't exists. $TargetPathForApp"
  echo "creating $TargetPathForApp"
  mkdir $TargetPathForApp
fi
cp -rv $PathOfAppToCopy $TargetPathForApp

