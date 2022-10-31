import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_theme.dart';
import 'app_text_widget.dart';

class AppTextFieldWidget extends StatefulWidget {
  const AppTextFieldWidget({
    Key? key,
    required this.label,
    this.initValue,
    required this.hintText,
    this.maxLines = 10,
    this.maxLength,
    this.isHidePassword = false,
    this.isWarning = false,
    this.isCounterText = false,
    this.isRequired = false,
    required this.onChanged,
    this.textInputFormatter,
    this.keyboardType,
    this.validator,
    this.textInputAction = TextInputAction.done,
    this.textFieldFocusNode,
    this.onActionTap,
    this.suffixIcon,
    this.isDisabled = false,
    this.suffixIconConstraints,
  }) : super(key: key);

  final String label;
  final String? initValue;
  final String hintText;
  final int maxLines;
  final int? maxLength;
  final bool isHidePassword;
  final bool isWarning;
  final bool isCounterText;
  final bool isRequired;
  final bool isDisabled;
  final Function(String value) onChanged;
  final Function(String value)? onActionTap;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final TextInputAction textInputAction;
  final FocusNode? textFieldFocusNode;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  late final TextEditingController _textEditingController;
  final isFocused = false.obs;
  late FocusNode _textFieldFocusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initValue);
    _textFieldFocusNode =
        _textFieldFocusNode = widget.textFieldFocusNode ?? FocusNode();
  }

  @override
  void didUpdateWidget(covariant AppTextFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initValue != widget.initValue) {
      // https://stackoverflow.com/questions/72365756/setstate-or-markneedsbuild-called-during-build-textfield
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          _textEditingController.value = TextEditingValue(
              text: widget.initValue ?? '',
              selection: TextSelection.collapsed(
                  offset: (widget.initValue?.length) ?? 0 - 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.isDisabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextWidget(
                  widget.label,
                  textStyle: context.textTheme.caption?.copyWith(
                    color: AppColors.get().neutralColor[60],
                  ),
              ),
              if (widget.isRequired) const SizedBox(width: 2),
              if (widget.isRequired)
                AppTextWidget(
                  '*',
                  textStyle: context.textTheme.caption
                      ?.copyWith(color: context.theme.errorColor),
                )
            ],
          ),
          Focus(
            onFocusChange: (value) {
              isFocused.value = value;
            },
            child: TextFormField(
              keyboardType: widget.keyboardType,
              inputFormatters: widget.textInputFormatter,
              focusNode: _textFieldFocusNode,
              controller: _textEditingController,
              onChanged: (value) => widget.onChanged(value),
              textAlign: TextAlign.start,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              minLines: 1,
              readOnly: false,
              style: context.textTheme.bodyText2,
              obscureText: widget.isHidePassword,
              validator: widget.validator,
              textInputAction: widget.textInputAction,
              onFieldSubmitted: (v) {
                if (widget.onActionTap != null) {
                  widget.onActionTap!(v);
                }
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.get().neutralColor[20]!),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.get().neutralColor[20]!),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: context.theme.primaryColor),
                ),
                hintText: widget.hintText,
                hintStyle: context.textTheme.bodyText2
                    ?.copyWith(color: context.theme.hintColor),
                contentPadding: const EdgeInsets.only(top: 10, bottom: 12),
                isDense: true,
                suffixIcon: widget.suffixIcon,
                suffixIconConstraints: widget.suffixIconConstraints ??
                    BoxConstraints.tight(const Size(24, 24)),
                counterText: widget.isCounterText ? null : '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
