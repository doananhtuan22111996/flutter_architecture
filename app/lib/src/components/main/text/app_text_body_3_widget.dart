part of 'app_text_base_builder.dart';

class AppTextBody3Widget extends AppTextBaseBuilder {
  const AppTextBody3Widget({
    super.key,
    super.text,
    super.textStyle,
    super.textOverflow,
    super.maxLines,
    super.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final body3 = context.textTheme.bodySmall;
    return Text(
      text ?? '-',
      textAlign: textAlign,
      style: textStyle?.copyWith(fontSize: body3?.fontSize) ?? body3,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
