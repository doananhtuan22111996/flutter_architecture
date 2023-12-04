part of 'app_text_base_builder.dart';

class AppTextBody2Widget extends AppTextBaseBuilder {
  const AppTextBody2Widget({
    super.key,
    super.text,
    super.textStyle,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    final body2 = context.textTheme.bodyMedium;
    return Text(
      text ?? '-',
      textAlign: textAlign,
      style: textStyle?.copyWith(fontSize: body2?.fontSize) ?? body2,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
