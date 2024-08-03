import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class Fsplash {
  static void preserve({required WidgetsBinding widgetsBinding}) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  static void remove() {
    FlutterNativeSplash.remove();
  }
}
