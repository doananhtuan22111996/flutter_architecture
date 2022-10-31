import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppChipSvgWidget extends StatelessWidget {
  const AppChipSvgWidget({
    Key? key,
    required this.asset,
    this.isDot = false,
    this.onTap,
  }) : super(key: key);

  final String asset;
  final Function()? onTap;
  final bool isDot;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 40,
            height: 32,
            decoration: BoxDecoration(
              color: context.theme.backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(asset),
          ),
          if (isDot)
            Positioned(
              top: 6,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.theme.errorColor,
                ),
                width: 8,
                height: 8,
              ),
            )
        ],
      ),
    );
  }
}
