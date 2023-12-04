part of 'app_text_base_builder.dart';

class AppTextHeading5Widget extends AppTextBaseBuilder {
  const AppTextHeading5Widget({
    super.key,
    super.text,
    super.textAlign,
    super.textOverflow,
    super.textStyle,
    super.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final heading5 = context.textTheme.headlineSmall;
    return Text(
      text ?? '-',
      textAlign: textAlign,
      style: textStyle?.copyWith(fontSize: heading5?.fontSize) ?? heading5,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
