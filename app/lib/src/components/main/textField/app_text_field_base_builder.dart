import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../exts/R.dart';

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

abstract class AppTextFieldBaseBuilder extends StatelessWidget {
  @protected
  final GlobalKey<FormBuilderFieldState> _fieldState =
      GlobalKey<FormBuilderFieldState>();

  /// [_fieldKey] for FormBuilderField
  @protected
  final String fieldKey;
  @protected
  final String? hintText;
  @protected
  final int? maxLines;
  @protected
  final int? maxLength;
  @protected
  final bool? isDisabled;
  @protected
  final bool? obscureText;
  @protected
  final TextInputType? keyboardType;
  @protected
  final AppTextFieldSize? appTextFieldSize;
  @protected
  final List<TextInputFormatter>? inputFormatters;
  @protected
  final TextInputAction? textInputAction;
  @protected
  final void Function(String?)? onChanged;
  @protected
  final String? Function(String?)? validator;
  @protected
  final void Function(String?)? onFieldSubmitted;
  @protected
  final Widget? suffixIcon;

  AppTextFieldBaseBuilder({
    super.key,
    required this.fieldKey,
    this.hintText,
    this.maxLength,
    this.maxLines,
    this.isDisabled,
    this.obscureText,
    this.keyboardType,
    this.appTextFieldSize,
    this.inputFormatters,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.suffixIcon,
  });

  @protected
  Widget _buildMain({
    bool? obscureText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Function(String?)? valueListener,
    Function(String?)? errorListener,
  }) {
    return FormBuilderTextField(
      key: _fieldState,
      name: fieldKey,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: (value) {
        /// Value changed Callback
        valueListener?.call(value);
        onChanged?.call(value);
      },
      textAlign: TextAlign.start,
      maxLines: maxLines,
      maxLength: maxLength,
      readOnly: isDisabled == true,
      enabled: isDisabled == null || isDisabled == false,
      style: _textStyle,
      cursorColor: AppColors.of.primaryColor,
      obscureText: obscureText ?? this.obscureText ?? false,
      validator: (value) {
        /// Error value Callback
        final errorText = validator?.call(value);
        errorListener?.call(errorText);
        return errorText;
      },
      textInputAction: textInputAction,
      onSubmitted: onFieldSubmitted,
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
        hintText: hintText,
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

  TextStyle? get _textStyle => appTextFieldSize == AppTextFieldSize.large
      ? AppTextStyleExt.of.textBody2r
      : appTextFieldSize == AppTextFieldSize.small
          ? AppTextStyleExt.of.textBody2r
          : AppTextStyleExt.of.textBody1r;

  EdgeInsets get _contentPadding => appTextFieldSize == AppTextFieldSize.large
      ? EdgeInsets.symmetric(
          vertical: AppThemeExt.of.majorScale(3),
          horizontal: AppThemeExt.of.majorScale(4))
      : appTextFieldSize == AppTextFieldSize.small
          ? EdgeInsets.symmetric(
              vertical: AppThemeExt.of.majorScale(1),
              horizontal: AppThemeExt.of.majorScale(3))
          : EdgeInsets.symmetric(
              vertical: AppThemeExt.of.majorScale(2),
              horizontal: AppThemeExt.of.majorScale(4));

  BoxConstraints get _boxSuffixIconConstraints =>
      appTextFieldSize == AppTextFieldSize.large
          ? BoxConstraints.expand(
              height: AppThemeExt.of.majorScale(12),
              width: AppThemeExt.of.majorScale(12),
            )
          : appTextFieldSize == AppTextFieldSize.small
              ? BoxConstraints.expand(
                  height: AppThemeExt.of.majorScale(8),
                  width: AppThemeExt.of.majorScale(8),
                )
              : BoxConstraints.expand(
                  height: AppThemeExt.of.majorScale(10),
                  width: AppThemeExt.of.majorScale(10),
                );

  BoxConstraints get _boxPrefixIconConstraints =>
      appTextFieldSize == AppTextFieldSize.large
          ? BoxConstraints.expand(
              height: AppThemeExt.of.majorScale(12),
              width: AppThemeExt.of.majorScale(12))
          : appTextFieldSize == AppTextFieldSize.small
              ? BoxConstraints.expand(
                  height: AppThemeExt.of.majorScale(8),
                  width: AppThemeExt.of.majorScale(8),
                )
              : BoxConstraints.expand(
                  width: AppThemeExt.of.majorScale(10),
                  height: AppThemeExt.of.majorScale(10),
                );
}
