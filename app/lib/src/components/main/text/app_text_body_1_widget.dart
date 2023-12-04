part of 'app_text_base_builder.dart';

class AppTextBody1Widget extends AppTextBaseBuilder {
   const AppTextBody1Widget({
    super.key,
    super.text,
    super.textStyle,
    super.maxLines,
    super.textAlign,
    super.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    final body1 = context.textTheme.bodyLarge;
    return Text(
      text ?? '-',
      textAlign: textAlign,
      style: textStyle?.copyWith(fontSize: body1?.fontSize) ?? body1,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
