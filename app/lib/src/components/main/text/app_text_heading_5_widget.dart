part of 'app_text_base_builder.dart';

class AppTextHeading5Widget extends AppTextBaseBuilder {
  @override
  Widget build(BuildContext context) {
    final orgTextStyle = context.textTheme.headlineSmall;
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
  AppTextHeading5Widget setMaxLines(int? maxLines) {
    _maxLines = maxLines;
    return this;
  }

  @override
  AppTextHeading5Widget setText(String? text) {
    _text = text;
    return this;
  }

  @override
  AppTextHeading5Widget setTextAlign(TextAlign? textAlign) {
    _textAlign = textAlign;
    return this;
  }

  @override
  AppTextHeading5Widget setTextOverFlow(TextOverflow? textOverflow) {
    _textOverflow = textOverflow;
    return this;
  }

  @override
  AppTextHeading5Widget setTextStyle(TextStyle? textStyle) {
    _textStyle = textStyle;
    return this;
  }

  @override
  AppTextHeading5Widget setColor(Color? color) {
    _color = color;
    return this;
  }
}
