#!/bin/bash

if [ ! -z "$1" ]; then
  cd $1
fi

if cd flutter;
then
  git pull && cd ..;
else
  git clone https://github.com/flutter/flutter.git;
fi
ls
flutter/bin/flutter channel stable
flutter/bin/flutter doctor
flutter/bin/flutter clean
flutter/bin/flutter build web # Add -t if target is not the default
