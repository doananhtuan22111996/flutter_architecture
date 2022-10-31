import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRichTextWidget extends StatelessWidget {
  const AppRichTextWidget(
      {Key? key, required this.textSpans})
      : super(key: key);

  final List<TextSpan> textSpans;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.textTheme.bodyMedium,
        children: textSpans,
      ),
    );
  }
}
