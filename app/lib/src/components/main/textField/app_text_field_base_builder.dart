import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'app_text_field_widget.dart';

enum AppTextFieldSize {
  large(value: 48),
  medium(value: 40),
  small(value: 32);

  final int value;

  const AppTextFieldSize({required this.value});
}

abstract class AppTextFieldBaseBuilder {
  /// [_fieldKey] for FormBuilderField
  @protected
  late final String _fieldKey;
  @protected
  String? _value;
  @protected
  String? _hintText;
  @protected
  int? _maxLines;
  @protected
  int? _maxLength;
  @protected
  bool? _isDisabled;
  @protected
  bool? _obscureText;
  @protected
  TextInputType? _keyboardType;
  @protected
  AppTextFieldSize? _appTextFieldSize;
  @protected
  List<TextInputFormatter>? _inputFormatters;
  @protected
  void Function(String?)? _onChanged;
  @protected
  String? Function(String?)? _validator;

  AppTextFieldBaseBuilder setFieldKey(String? fieldKey);

  AppTextFieldBaseBuilder setValue(String? value);

  AppTextFieldBaseBuilder setHintText(String? hintText);

  AppTextFieldBaseBuilder setIsDisabled(bool? isDisabled);

  AppTextFieldBaseBuilder setMaxLines(int? maxLines) {
    return this;
  }

  AppTextFieldBaseBuilder setAppTextFieldSize(
      AppTextFieldSize? appTextFieldSize) {
    return this;
  }

  AppTextFieldBaseBuilder setMaxLength(int? maxLength) {
    return this;
  }

  AppTextFieldBaseBuilder setKeyboardType(TextInputType? keyboardType) {
    return this;
  }

  AppTextFieldBaseBuilder setInputFormatters(
      List<TextInputFormatter>? inputFormatters) {
    return this;
  }

  AppTextFieldBaseBuilder setOnChanged(void Function(String?)? onChanged) {
    return this;
  }

  AppTextFieldBaseBuilder setValidator(String? Function(String?)? validator) {
    return this;
  }

  AppTextFieldBaseBuilder setObscureText(bool? obscureText) {
    return this;
  }

  Widget build(BuildContext context);
}
