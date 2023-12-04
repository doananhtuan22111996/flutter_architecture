part of 'app_text_base_builder.dart';

class AppTextHeading2Widget extends AppTextBaseBuilder {
  const AppTextHeading2Widget({
    super.key,
    super.text,
    super.textStyle,
    super.textAlign,
    super.textOverflow,
    super.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final heading2 = context.textTheme.displayMedium;
    return Text(
      text ?? '-',
      textAlign: textAlign,
      style: textStyle?.copyWith(fontSize: heading2?.fontSize) ?? heading2,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
