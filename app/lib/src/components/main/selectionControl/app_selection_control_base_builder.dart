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
abstract class AppSelectionControlBaseBuilder {
  @protected
  late final String _fieldKey;
  @protected
  String? _label;
  @protected
  dynamic _value;
  @protected
  dynamic _radioGroupValue;
  @protected
  AppSelectionControlType? _appSelectionControlType;
  @protected
  AppSelectionControlSize? _appSelectionControlSize;
  @protected
  bool? _isDisabled;
  @protected
  void Function(dynamic value)? _onValueChanged;

  AppSelectionControlBaseBuilder setFieldKey(String fieldKey) {
    return this;
  }

  AppSelectionControlBaseBuilder setLabel(String? label) {
    return this;
  }

  AppSelectionControlBaseBuilder setValue(bool? value) {
    return this;
  }

  AppSelectionControlBaseBuilder setRadioGroupValue(dynamic radioGroupValue) {
    return this;
  }

  AppSelectionControlBaseBuilder setAppSelectionControlType(
      AppSelectionControlType? appSelectionControlType) {
    return this;
  }

  AppSelectionControlBaseBuilder setAppSelectionControlSize(
      AppSelectionControlSize? appSelectionControlSize) {
    return this;
  }

  AppSelectionControlBaseBuilder setOnValueChanged(
      void Function(dynamic value)? onValueChanged) {
    return this;
  }

  AppSelectionControlBaseBuilder setIsDisabled(bool? isDisabled) {
    return this;
  }

  Widget build(BuildContext context);
}
