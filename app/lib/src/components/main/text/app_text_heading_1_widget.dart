part of 'app_text_base_builder.dart';

class AppTextHeading1Widget extends AppTextBaseBuilder {
  const AppTextHeading1Widget({
    super.key,
    super.text,
    super.textStyle,
    super.textAlign,
    super.textOverflow,
    super.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final heading1 = context.textTheme.displayLarge;
    return Text(
      text ?? '-',
      textAlign: textAlign,
      style: textStyle?.copyWith(fontSize: heading1?.fontSize) ?? heading1,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
