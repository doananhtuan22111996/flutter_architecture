import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIconSvgWidget extends StatelessWidget {
  const AppIconSvgWidget(this.asset, {this.size, Key? key}) : super(key: key);

  final String asset;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: size,
      height: size,
    );
  }
}
