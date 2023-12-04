part of 'app_text_base_builder.dart';

class AppTextHeading4Widget extends AppTextBaseBuilder {
  const AppTextHeading4Widget({
    super.key,
    super.text,
    super.textAlign,
    super.textOverflow,
    super.textStyle,
    super.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final heading4 = context.textTheme.headlineMedium;
    return Text(
      text ?? '-',
      textAlign: textAlign,
      style: textStyle?.copyWith(fontSize: heading4?.fontSize) ?? heading4,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
