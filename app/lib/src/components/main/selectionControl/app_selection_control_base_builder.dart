import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'app_check_box_widget.dart';

part 'app_basic_radio_widget.dart';

enum AppSelectionControlType {
  checkBox(type: 'checkBox'),
  radioBox(type: 'radioBox'),
  switchBox(type: 'switchBox');

  const AppSelectionControlType({required this.type});

  final String type;
}

enum AppSelectionControlSize {
  switchNormal(size: 'switchNormal', width: 28, height: 16),
  switchLarge(size: 'switchLarge', width: 28, height: 16),
  switchSmall(size: 'switchSmall', width: 49, height: 24);

  const AppSelectionControlSize(
      {required this.size, required this.width, required this.height});

  final String size;
  final int width;
  final int height;
}

// TODO Build switch widget
abstract class AppSelectionControlBaseBuilder<T> extends StatelessWidget {
  @protected
  final String fieldKey;
  @protected
  final String? label;
  @protected
  final T value;
  @protected
  final T? radioGroupValue;
  @protected
  final AppSelectionControlType? appSelectionControlType;
  @protected
  final AppSelectionControlSize? appSelectionControlSize;
  @protected
  final bool? isDisabled;
  @protected
  final void Function(dynamic value)? onValueChanged;

  const AppSelectionControlBaseBuilder({
    super.key,
    required this.fieldKey,
    required this.value,
    this.radioGroupValue,
    this.label,
    this.appSelectionControlSize,
    this.appSelectionControlType,
    this.isDisabled,
    this.onValueChanged,
  });
}
