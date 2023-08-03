import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'app_text_field_widget.dart';

part 'app_text_field_password_widget.dart';

part 'app_text_field_with_clear_widget.dart';

part 'app_text_field_search_widget.dart';

enum AppTextFieldSize {
  large(value: 48),
  medium(value: 40),
  small(value: 32);

  final int value;

  const AppTextFieldSize({required this.value});
}

abstract class AppTextFieldBaseBuilder {
  @protected
  final GlobalKey<FormBuilderFieldState> _fieldState =
      GlobalKey<FormBuilderFieldState>();

  /// [_fieldKey] for FormBuilderField
  @protected
  late final String _fieldKey;
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
  TextInputAction? _textInputAction;
  @protected
  void Function(String?)? _onChanged;
  @protected
  String? Function(String?)? _validator;
  @protected
  void Function(String?)? _onFieldSubmitted;
  @protected
  Widget? _suffixIcon;

  AppTextFieldBaseBuilder setFieldKey(String fieldKey);

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

  AppTextFieldBaseBuilder setTextInputAction(TextInputAction? textInputAction) {
    return this;
  }

  AppTextFieldBaseBuilder setOnFieldSubmitted(
      String? Function(String?)? onFieldSubmitted) {
    return this;
  }

  AppTextFieldBaseBuilder setSuffixIcon(Widget? suffixIcon) {
    return this;
  }

  Widget build(BuildContext context);

  Widget _buildMain({
    Widget? prefixIcon,
    Widget? suffixIcon,
    Function(String?)? valueListener,
    Function(String?)? errorListener,
  }) {
    return FormBuilderTextField(
      key: _fieldState,
      name: _fieldKey,
      keyboardType: _keyboardType,
      inputFormatters: _inputFormatters,
      onChanged: (value) {
        /// Value changed Callback
        valueListener?.call(value);
        _onChanged?.call(value);
      },
      textAlign: TextAlign.start,
      maxLines: _maxLines,
      maxLength: _maxLength,
      readOnly: _isDisabled == true,
      enabled: _isDisabled == null || _isDisabled == false,
      style: _textStyle,
      cursorColor: AppColors.of.primaryColor,
      obscureText: _obscureText ?? false,
      validator: (value) {
        /// Error value Callback
        final errorText = _validator?.call(value);
        errorListener?.call(errorText);
        return errorText;
      },
      textInputAction: _textInputAction,
      onSubmitted: _onFieldSubmitted,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.of.neutralColor[5]!),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.of.neutralColor[3]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.of.primaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.of.errorColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.of.errorColor),
        ),
        hintText: _hintText,
        hintStyle: _textStyle?.copyWith(color: AppColors.of.neutralColor[6]),
        contentPadding: _contentPadding,
        errorStyle: AppTextStyleExt.of.textBody3r
            ?.copyWith(color: AppColors.of.errorColor),
        isDense: true,
        suffixIcon: suffixIcon,
        suffixIconConstraints:
            suffixIcon != null ? _boxSuffixIconConstraints : null,
        prefixIcon: prefixIcon,
        prefixIconConstraints:
            prefixIcon != null ? _boxPrefixIconConstraints : null,
      ),
    );
  }

  TextStyle? get _textStyle => _appTextFieldSize == AppTextFieldSize.large
      ? AppTextStyleExt.of.textBody2r
      : _appTextFieldSize == AppTextFieldSize.small
          ? AppTextStyleExt.of.textBody2r
          : AppTextStyleExt.of.textBody1r;

  EdgeInsets get _contentPadding => _appTextFieldSize == AppTextFieldSize.large
      ? EdgeInsets.symmetric(
          vertical: AppThemeExt.of.majorScale(3),
          horizontal: AppThemeExt.of.majorScale(4))
      : _appTextFieldSize == AppTextFieldSize.small
          ? EdgeInsets.symmetric(
              vertical: AppThemeExt.of.majorScale(1),
              horizontal: AppThemeExt.of.majorScale(3))
          : EdgeInsets.symmetric(
              vertical: AppThemeExt.of.majorScale(2),
              horizontal: AppThemeExt.of.majorScale(4));

  BoxConstraints get _boxSuffixIconConstraints =>
      _appTextFieldSize == AppTextFieldSize.large
          ? BoxConstraints.expand(
              height: AppThemeExt.of.majorScale(12),
              width: AppThemeExt.of.majorScale(12),
            )
          : _appTextFieldSize == AppTextFieldSize.small
              ? BoxConstraints.expand(
                  height: AppThemeExt.of.majorScale(8),
                  width: AppThemeExt.of.majorScale(8),
                )
              : BoxConstraints.expand(
                  height: AppThemeExt.of.majorScale(10),
                  width: AppThemeExt.of.majorScale(10),
                );

  BoxConstraints get _boxPrefixIconConstraints =>
      _appTextFieldSize == AppTextFieldSize.large
          ? BoxConstraints.expand(
              height: AppThemeExt.of.majorScale(12),
              width: AppThemeExt.of.majorScale(12))
          : _appTextFieldSize == AppTextFieldSize.small
              ? BoxConstraints.expand(
                  height: AppThemeExt.of.majorScale(8),
                  width: AppThemeExt.of.majorScale(8),
                )
              : BoxConstraints.expand(
                  width: AppThemeExt.of.majorScale(10),
                  height: AppThemeExt.of.majorScale(10),
                );
}
