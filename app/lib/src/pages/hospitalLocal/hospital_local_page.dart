part of 'hospital_local_controller.dart';

class HospitalLocalPage extends GetWidget<HospitalLocalController> {
  const HospitalLocalPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.hospitalLocal);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
        appBar: AppBarLeadingAvatarWidget(headerPage: R.strings.hospital)
            .build(context),
        body: Column(
          children: [
            SizedBox(height: AppThemeExt.of.majorScale(2)),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppThemeExt.of.majorScale(4)),
                child: AppFilledButtonWidget(
                  buttonText: 'Clear Data',
                  onPressed: () {
                    controller.onRequestDeleteAll();
                  },
                ).build(context),
              ),
            ),
            Expanded(
              child: AppListWidget<HospitalModel, HospitalLocalController>(
                childWidget: (ctx, model, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppThemeExt.of.majorScale(4),
                        vertical: AppThemeExt.of.majorScale(1)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AppTextBody1Widget(
                            text: '${model.hospitalId} - ${model.hospitalName}',
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                        AppOutlinedButtonWidget.icon(
                          prefixIcon: const Icon(Icons.close),
                          appButtonType: AppButtonType.circle,
                          onPressed: () => controller.onRequestDeleteAt(
                              id: model.hospitalId),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
