import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/translations/strings_enum.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(color: context.theme.primaryColor),
        const SizedBox(height: 12),
        Text(Strings.loading.tr, style: context.theme.textTheme.bodyText1),
      ],
    );
  }
}
