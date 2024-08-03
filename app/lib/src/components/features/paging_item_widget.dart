import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utilities/utilities.dart';

import '../../config/app_theme.dart';

class PagingItemController extends GetxController {
  int index = 0;

  PagingItemController(this.index);

  void setIndex(int index) {
    this.index = index;
  }

  @override
  void onInit() {
    super.onInit();
    Logs.i('PagingItemController init: $index');
  }

  @override
  void onClose() {
    super.onClose();
    Logs.i('PagingItemController close: $index');
  }
}

class PagingItemWidget extends StatelessWidget {
  final int index;
  final UserModel model;

  const PagingItemWidget({super.key, required this.index, required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PagingItemController>(
      init: PagingItemController(index),
      tag: index.toString(),
      builder: (controller) => Padding(
        padding: EdgeInsets.all(AppThemeExt.of.majorScale(2)),
        child: Card.filled(
          child: Padding(
            padding: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User id: ${model.id}'),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                Text('User name: ${model.name}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
