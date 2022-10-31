import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Center(
      child: CircularProgressIndicator(
        color: context.theme.primaryColor,
        backgroundColor: context.theme.primaryColor.withOpacity(0.5),
      ),
    );
  }
}
