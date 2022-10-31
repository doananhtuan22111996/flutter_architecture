import 'dart:math';

import 'package:flutter/material.dart';

extension StringExtensions on String {
  String toFormatNumber(int index) {
    if (index < 10) {
      return '0$index';
    } else {
      return index.toString();
    }
  }

  String get displayShortName {
    final components = split(' ');
    if (components.length > 1) {
      return components.first.substring(0, (min(1, components.first.length))) +
          components.last
              .substring(0, (min(1, components.last.length)))
              .toUpperCase();
    }
    return substring(0, (min(2, length))).toUpperCase();
  }

  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
