import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_inkwell.dart';

class CustomSearchBar extends StatelessWidget {
  ///Cancelable operation ile klavyeden değer girme işlemi kontrol edilir
  ///Verilen delay içerisinde klavyeden yeni bir giriş olmaz ise bu fonksiyon tetiklenir.
  final Function(String value)? onChangeComplete;

  ///Klavyeden değer girme işlemi bittikten kaç milisaniye sonra on change complete fonksiyonunun tetikleneceğini belirler
  final Duration changeCompletionDelay;

  final String? hintText;
  final Widget? leadingIcon;
  final bool isOutlined;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextStyle? style;

  const CustomSearchBar({
    Key? key,
    this.onChangeComplete,
    this.changeCompletionDelay = const Duration(milliseconds: 800),
    this.hintText,
    this.leadingIcon,
    this.isOutlined = false,
    this.focusNode,
    this.controller,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode myfocusNode = focusNode ?? FocusNode();
    CancelableOperation? cancelableOpertaion;

    void _startCancelableOperation() {
      cancelableOpertaion = CancelableOperation.fromFuture(
        Future.delayed(changeCompletionDelay),
        onCancel: () {},
      );
    }

    TextField _buildTextField() {
      return TextField(
        controller: controller,
        focusNode: focusNode,
        maxLines: 1,
        onChanged: (value) async {
          await cancelableOpertaion?.cancel();
          _startCancelableOperation();
          cancelableOpertaion?.value.whenComplete(() async {
            if (onChangeComplete != null) onChangeComplete!(value);
          });
        },
        style: style,
        decoration: InputDecoration(
          prefixIcon: leadingIcon,
          enabledBorder: UnderlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(color: context.theme.disabledColor),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(color: context.theme.disabledColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(color: context.theme.primaryColor),
          ),
          hintStyle: context.textTheme.bodyText1
              ?.copyWith(color: context.theme.disabledColor),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          isDense: true,
          hintText: hintText,
        ),
      );
    }

    return CustomInkwell(
        padding: EdgeInsets.zero,
        disableTabEfect: true,
        onTap: myfocusNode.requestFocus,
        child: _buildTextField());
  }
}
