import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text_widget.dart';

class AppTextDotPrefixWidget extends StatelessWidget {
  const AppTextDotPrefixWidget({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return _contentWithDotAtPrefix(context, content);
  }

  Widget _contentWithDotAtPrefix(BuildContext context, String content) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: context.theme.primaryColor),
          ),
          const SizedBox(width: 16),
          AppTextWidget(
            content,
            textStyle: context.theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
