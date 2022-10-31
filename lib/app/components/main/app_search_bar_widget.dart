import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/theme/app_theme.dart';
import 'button/app_icon_button_widget.dart';

class AppSearchBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppSearchBarWidget(
      {this.textStyle,
      this.goSearching,
      this.goBack,
      this.goBackEnabled = true,
      this.textEditingController,
      this.onTextChange,
      this.placeholderText,
      this.focusNode,
      Key? key})
      : super(key: key);

  final TextStyle? textStyle;
  final String? placeholderText;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool goBackEnabled;
  final Function? goBack;
  final Function(String)? goSearching;
  final Function(String)? onTextChange;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: goBackEnabled
          ? AppIconButtonWidget(
              icon: Icons.arrow_back,
              iconColor: AppColors.get().neutralColor[0],
              onPressed:
                  goBack != null ? () => goBack?.call() : () => Get.back(),
            )
          : const SizedBox(),
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.get().neutralColor[0],
        ),
        height: 40,
        padding: const EdgeInsets.only(left: 16),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.text,
          focusNode: focusNode,
          controller: textEditingController,
          onChanged: (value) {
            if (onTextChange != null) {
              onTextChange!(value);
            }
          },
          autofocus: true,
          textAlign: TextAlign.start,
          maxLines: 1,
          minLines: 1,
          readOnly: false,
          style: context.textTheme.bodyText2,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (v) {
            if (goSearching != null) {
              goSearching!(v);
            }
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              prefixIconConstraints: BoxConstraints.tight(const Size(30, 30)),
              prefixIcon: Icon(
                Icons.search,
                color: AppColors.get().neutralColor[80],
              ),
              labelText: placeholderText,
              fillColor: AppColors.get().neutralColor[0],
              focusColor: AppColors.get().neutralColor[0],
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: AppColors.get().neutralColor[0]!),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: AppColors.get().neutralColor[0]!),
                borderRadius: BorderRadius.circular(8),
              )),
        ),
      ),
      centerTitle: true,
      backgroundColor: context.theme.backgroundColor,
      flexibleSpace: Container(
        color: context.theme.backgroundColor,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              context.theme.primaryColorLight,
              context.theme.primaryColor,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Image.asset('assets/images/topbar_pattern.png')],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
