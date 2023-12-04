part of 'app_text_base_builder.dart';

class AppTextHeading3Widget extends AppTextBaseBuilder {
  const AppTextHeading3Widget({
    super.key,
    super.text,
    super.textAlign,
    super.textOverflow,
    super.textStyle,
    super.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final heading3 = context.textTheme.displaySmall;
    return Text(
      text ?? '-',
      textAlign: textAlign,
      style: textStyle?.copyWith(fontSize: heading3?.fontSize) ?? heading3,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
