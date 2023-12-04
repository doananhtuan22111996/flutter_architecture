part of 'avatar_controller.dart';

class AvatarPage extends GetView<AvatarController> {
  const AvatarPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.avatar);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
        appBar: AppBarWidget(headerPage: R.strings.avatar).build(context),
        body: _body(context));
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
        const AppTextBody1Widget(text: 'Avatar Network'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppAvatarNetworkWidget(
              link:
                  'https://kiemtientuweb.com/ckfinder/userfiles/images/avt-cute/avatar-cute-8.jpg',
              size: AppAvatarSize.small,
              onPressed: () => controller.toast(),
            ),
            AppAvatarNetworkWidget(
              link:
                  'https://kiemtientuweb.com/ckfinder/userfiles/images/avt-cute/avatar-cute-8.jpg',
              size: AppAvatarSize.medium,
              onPressed: () => controller.toast(),
            ),
            AppAvatarNetworkWidget(
              link:
                  'https://kiemtientuweb.com/ckfinder/userfiles/images/avt-cute/avatar-cute-8.jpg',
              size: AppAvatarSize.large,
              onPressed: () => controller.toast(),
            ),
            AppAvatarNetworkWidget(
              link:
                  'https://kiemtientuweb.com/ckfinder/userfiles/images/avt-cute/avatar-cute-8.jpg',
              size: AppAvatarSize.extraLarge,
              onPressed: () => controller.toast(),
            ),
          ],
        )
      ],
    );
  }

  Widget _label(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Avatar Label'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppAvatarTextWidget(
              text: 'GU',
              size: AppAvatarSize.small,
              onPressed: () => controller.toast(),
            ),
            AppAvatarTextWidget(
              text: 'GU',
              size: AppAvatarSize.medium,
              onPressed: () => controller.toast(),
            ),
            AppAvatarTextWidget(
              text: 'GU',
              size: AppAvatarSize.large,
              onPressed: () => controller.toast(),
            ),
            AppAvatarTextWidget(
              text: 'GU',
              size: AppAvatarSize.extraLarge,
              onPressed: () => controller.toast(),
            ),
          ],
        )
      ],
    );
  }

  Widget _default(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Avatar Default'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppAvatarSvgWidget(
              svg: R.svgs.avatar.account1.svg(),
              size: AppAvatarSize.small,
              onPressed: () => controller.toast(),
            ),
            AppAvatarSvgWidget(
              svg: R.svgs.avatar.account.svg(),
              size: AppAvatarSize.medium,
              onPressed: () => controller.toast(),
            ),
            AppAvatarSvgWidget(
              svg: R.svgs.avatar.account2.svg(),
              size: AppAvatarSize.large,
              onPressed: () => controller.toast(),
            ),
            AppAvatarSvgWidget(
              svg: R.svgs.avatar.account3.svg(),
              size: AppAvatarSize.extraLarge,
              onPressed: () => controller.toast(),
            ),
          ],
        )
      ],
    );
  }
}
