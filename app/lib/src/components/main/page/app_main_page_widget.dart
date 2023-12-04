part of 'app_main_page_base_builder.dart';

class AppMainPageWidget extends AppMainPageBaseBuilder {
  const AppMainPageWidget({
    super.key,
    super.body,
    super.appBar,
    super.backgroundColor,
    super.endDrawer,
    super.onEndDrawerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: key,
        backgroundColor: backgroundColor ?? AppColors.of.neutralColor[2],
        appBar: appBar,
        endDrawer: endDrawer,
        endDrawerEnableOpenDragGesture: false,
        onEndDrawerChanged: onEndDrawerChanged,
        body: body ?? const SizedBox(),
      ),
    );
  }
}
