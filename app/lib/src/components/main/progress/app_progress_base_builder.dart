import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:resources/resources.dart';

part 'app_progress_basic_widget.dart';
part 'app_progress_circle_widget.dart';
part 'app_progress_line_widget.dart';

enum AppProgressSize {
  basicLarge(size: 'baseLarge', value: 8),
  basicMedium(size: 'basicMedium', value: 6),
  basicSmall(size: 'basicSmall', value: 2),
  lineMedium(size: 'lineMedium', value: 6),
  lineLarge(size: 'lineLarge', value: 8),
  circleMedium(size: 'circleMedium', value: 2),
  circleLarge(size: 'circleLarge', value: 6);

  final String size;
  final double value;

  const AppProgressSize({required this.size, required this.value});
}

enum AppProgressType {
  processing(type: 'processing'),
  success(type: 'success'),
  error(type: 'error');

  final String type;
  const AppProgressType({required this.type});
}

abstract class AppProgressBaseBuilder {
  static const double maxProgress = 100;
  @protected
  AppProgressSize? _appProgressSize;
  @protected
  double? _maxProgress;
  @protected
  double? _progress;
  @protected
  AppProgressType? _appProgressType;
  @protected
  bool? _isWithNumber;

  AppProgressBaseBuilder setAppProgressSize(AppProgressSize? appProgressSize) {
    return this;
  }

  AppProgressBaseBuilder setMaxProgress(double? maxProgress) {
    return this;
  }

  AppProgressBaseBuilder setProgress(double? progress) {
    return this;
  }

  AppProgressBaseBuilder setAppProgressType(AppProgressType? appProgressType) {
    return this;
  }

  AppProgressBaseBuilder setIsWithNumber(bool? isWithNumber) {
    return this;
  }

  Widget build(BuildContext context);
}
