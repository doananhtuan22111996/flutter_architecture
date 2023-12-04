import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_text_heading_1_widget.dart';

part 'app_text_heading_2_widget.dart';

part 'app_text_heading_3_widget.dart';

part 'app_text_heading_4_widget.dart';

part 'app_text_heading_5_widget.dart';

part 'app_text_body_1_widget.dart';

part 'app_text_body_2_widget.dart';

part 'app_text_body_3_widget.dart';

abstract class AppTextBaseBuilder extends StatelessWidget {
  @protected
  final String? text;
  @protected
  final TextStyle? textStyle;
  @protected
  final TextAlign? textAlign;
  @protected
  final int? maxLines;
  @protected
  final TextOverflow? textOverflow;

  const AppTextBaseBuilder({
    super.key,
    this.text,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
  });
}
