#!/bin/bash

if [ ! -z "$1" ]; then
  cd $1
fi

if cd flutter;
then
  git pull && cd ..;
else
  curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.35.1-stable.tar.xz && tar -xf flutter_linux_3.35.1-stable.tar.xz;
fi
ls
flutter/bin/flutter channel stable
flutter/bin/flutter doctor
flutter/bin/flutter clean
flutter/bin/flutter build web # Add -t if target is not the default
