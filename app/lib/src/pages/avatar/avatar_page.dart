part of 'avatar_controller.dart';

class AvatarPage extends GetView<AvatarController> {
  const AvatarPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.avatar);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(
            AppBarWidget().setHeaderPage(R.strings.avatar).build(context))
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeExt.of.majorScale(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _network(context),
            SizedBox(height: AppThemeExt.of.majorScale(2)),
            _label(context),
            SizedBox(height: AppThemeExt.of.majorScale(2)),
            _default(context),
          ],
        ),
      ),
    );
  }

  Widget _network(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Avatar Network').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppAvatarNetworkWidget()
                .setLink(
                    'https://kiemtientuweb.com/ckfinder/userfiles/images/avt-cute/avatar-cute-8.jpg')
                .setSize(AppAvatarSize.small)
                .setOnPressed(() => controller.toast())
                .build(context),
            AppAvatarNetworkWidget()
                .setLink(
                    'https://kiemtientuweb.com/ckfinder/userfiles/images/avt-cute/avatar-cute-8.jpg')
                .setSize(AppAvatarSize.medium)
                .setOnPressed(() => controller.toast())
                .build(context),
            AppAvatarNetworkWidget()
                .setLink(
                    'https://kiemtientuweb.com/ckfinder/userfiles/images/avt-cute/avatar-cute-8.jpg')
                .setSize(AppAvatarSize.large)
                .setOnPressed(() => controller.toast())
                .build(context),
            AppAvatarNetworkWidget()
                .setLink(
                    'https://kiemtientuweb.com/ckfinder/userfiles/images/avt-cute/avatar-cute-8.jpg')
                .setSize(AppAvatarSize.extraLarge)
                .setOnPressed(() => controller.toast())
                .build(context),
          ],
        )
      ],
    );
  }

  Widget _label(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Avatar Label').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppAvatarTextWidget()
                .setText('GU')
                .setSize(AppAvatarSize.small)
                .setOnPressed(() => controller.toast())
                .build(context),
            AppAvatarTextWidget()
                .setText('GU')
                .setSize(AppAvatarSize.medium)
                .setOnPressed(() => controller.toast())
                .build(context),
            AppAvatarTextWidget()
                .setText('GU')
                .setSize(AppAvatarSize.large)
                .setOnPressed(() => controller.toast())
                .build(context),
            AppAvatarTextWidget()
                .setText('GU')
                .setSize(AppAvatarSize.extraLarge)
                .setOnPressed(() => controller.toast())
                .build(context),
          ],
        )
      ],
    );
  }

  Widget _default(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Avatar Default').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppAvatarSvgWidget()
                .setSvg(R.svgs.icAvatar.svg())
                .setSize(AppAvatarSize.small)
                .setOnPressed(() => controller.toast())
                .build(context),
            AppAvatarSvgWidget()
                .setSvg(R.svgs.icAvatar.svg())
                .setSize(AppAvatarSize.medium)
                .setOnPressed(() => controller.toast())
                .build(context),
            AppAvatarSvgWidget()
                .setSvg(R.svgs.icAvatar.svg())
                .setSize(AppAvatarSize.large)
                .setOnPressed(() => controller.toast())
                .build(context),
            AppAvatarSvgWidget()
                .setSvg(R.svgs.icAvatar.svg())
                .setSize(AppAvatarSize.extraLarge)
                .setOnPressed(() => controller.toast())
                .build(context),
          ],
        )
      ],
    );
  }
}
