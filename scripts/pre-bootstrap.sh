#!/bin/zsh
echo "Installing fvm..."
dart pub global activate fvm
echo "Installing Melos..."
dart pub global activate melos 4.1.0
echo "Installing FlutterGen..."
dart pub global activate flutter_gen