part of 'app_text_base_builder.dart';

class AppTextHeading4Widget extends AppTextBaseBuilder {
  @override
  Widget build(BuildContext context) {
    final orgTextStyle = context.textTheme.headlineMedium;
    if (_textStyle == null) {
      setTextStyle(orgTextStyle);
    } else {
      setTextStyle(
        _textStyle?.copyWith(fontSize: orgTextStyle?.fontSize),
      );
    }
    return super.build(context);
  }

  @override
  AppTextHeading4Widget setMaxLines(int? maxLines) {
    _maxLines = maxLines;
    return this;
  }

  @override
  AppTextHeading4Widget setText(String? text) {
    _text = text;
    return this;
  }

  @override
  AppTextHeading4Widget setTextAlign(TextAlign? textAlign) {
    _textAlign = textAlign;
    return this;
  }

  @override
  AppTextHeading4Widget setTextOverFlow(TextOverflow? textOverflow) {
    _textOverflow = textOverflow;
    return this;
  }

  @override
  AppTextHeading4Widget setTextStyle(TextStyle? textStyle) {
    _textStyle = textStyle;
    return this;
  }

  @override
  AppTextHeading4Widget setColor(Color? color) {
    _color = color;
    return this;
  }
}
