import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIconSvgButtonWidget extends StatelessWidget {
  const AppIconSvgButtonWidget(
      {Key? key, required this.asset, this.onPressed, this.color})
      : super(key: key);

  final String asset;
  final Function? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 40,
          height: 40,
          child: SvgPicture.asset(
            asset,
            fit: BoxFit.none,
            color: color,
          ),
        ),
        onTap: () => onPressed?.call(),
      ),
    );
  }
}
