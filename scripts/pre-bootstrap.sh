#!/bin/zsh
echo "Installing fvm..."
dart pub global activate fvm
echo "Installing melos..."
dart pub global activate melos 4.1.0
echo "Installing flutter_gen..."
dart pub global activate flutter_gen
echo "Installing flutterfire_cli..."
dart pub global activate flutterfire_cli