import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_skeleton/app/components/main/text/app_text_widget.dart';
import 'package:get/get.dart';

import '../../config/theme/app_theme.dart';
import 'app_icon_widget.dart';

enum AvatarSize { normal, small, thumbnail }

extension AvatarSizeExtensions on AvatarSize {
  double get size {
    switch (this) {
      case AvatarSize.small:
        return 60;
      case AvatarSize.thumbnail:
        return 32;
      default:
        return 80;
    }
  }

  double get fontSize {
    switch (this) {
      case AvatarSize.small:
        return 25;
      case AvatarSize.thumbnail:
        return 15;
      default:
        return 30;
    }
  }
}

class AppAvatarWidget extends StatelessWidget {
  const AppAvatarWidget({
    Key? key,
    this.isDefault = false,
    this.isVerified = false,
    this.isError = false,
    this.avatarUrl,
    this.displayShortName,
    this.avatarSize = AvatarSize.normal,
  }) : super(key: key);

  final bool isDefault;
  final bool? isVerified;
  final bool isError;
  final String? avatarUrl;
  final String? displayShortName;
  final AvatarSize avatarSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isDefault
            ? AppIconWidget(
                Icons.person_outline,
                iconSize: avatarSize.size / 2,
                bgSize: avatarSize.size,
                bgColor: context.theme.iconTheme.color,
              )
            : Container(
                width: avatarSize.size,
                height: avatarSize.size,
                decoration: BoxDecoration(
                  color: context.theme.iconTheme.color,
                  shape: BoxShape.circle,
                ),
              ),
        Container(
          decoration: BoxDecoration(
            color: context.theme.disabledColor,
            borderRadius:
                BorderRadius.all(Radius.circular(avatarSize.size / 2)),
          ),
          width: avatarSize.size,
          height: avatarSize.size,
          alignment: Alignment.center,
          child: avatarUrl != null &&
                  avatarUrl?.isNotEmpty == true &&
                  avatarUrl != 'http://example.org/image.jpg'
              ? ClipOval(child: _avatarView(context, avatarUrl!))
              : Center(
                  child: AppTextWidget(
                    !isDefault ? (displayShortName ?? '') : '',
                    textAlign: TextAlign.center,
                    textStyle: context.textTheme.titleLarge?.copyWith(
                        color: context.theme.hintColor,
                        fontWeight: FontWeight.bold,
                        fontSize: avatarSize.fontSize),
                  ),
                ),
        ),
        if (isError)
          Positioned(
            bottom: 0,
            right: 0,
            child: AppIconWidget(
              Icons.error_outline,
              iconSize: 18,
              bgSize: 20,
              bgColor: AppColors.get().neutralColor[0],
              iconColor: context.theme.errorColor,
            ),
          ),
      ],
    );
  }

  Widget _avatarView(BuildContext context, String identify) {
    if (identify.startsWith('http') == true) {
      return Image.network(
        identify,
        fit: BoxFit.fill,
        width: avatarSize.size,
        height: avatarSize.size,
      );
    }
    return Image.file(
      File(identify),
      fit: BoxFit.cover,
      width: avatarSize.size,
      height: avatarSize.size,
    );
  }
}
