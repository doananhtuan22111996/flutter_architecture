part of 'app_text_base_builder.dart';

class AppTextHeading3Widget extends AppTextBaseBuilder {
  @override
  Widget build(BuildContext context) {
    final orgTextStyle = context.textTheme.displaySmall;
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
  AppTextHeading3Widget setMaxLines(int? maxLines) {
    _maxLines = maxLines;
    return this;
  }

  @override
  AppTextHeading3Widget setText(String? text) {
    _text = text;
    return this;
  }

  @override
  AppTextHeading3Widget setTextAlign(TextAlign? textAlign) {
    _textAlign = textAlign;
    return this;
  }

  @override
  AppTextHeading3Widget setTextOverFlow(TextOverflow? textOverflow) {
    _textOverflow = textOverflow;
    return this;
  }

  @override
  AppTextHeading3Widget setTextStyle(TextStyle? textStyle) {
    _textStyle = textStyle;
    return this;
  }

  @override
  AppTextHeading3Widget setColor(Color? color) {
    _color = color;
    return this;
  }
}
