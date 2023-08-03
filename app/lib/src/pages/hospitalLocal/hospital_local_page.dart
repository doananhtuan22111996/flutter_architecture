part of 'hospital_local_controller.dart';

class HospitalLocalPage extends GetWidget<HospitalLocalController> {
  const HospitalLocalPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.hospitalLocal);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(AppBarLeadingAvatarWidget()
            .setHeaderPage(R.strings.hospital)
            .build(context))
        .setBody(
          Column(
            children: [
              SizedBox(height: AppThemeExt.of.majorScale(2)),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppThemeExt.of.majorScale(4)),
                  child: AppFilledButtonWidget()
                      .setButtonText('Clear Data')
                      .setOnPressed(() {
                    controller.onRequestDeleteAll();
                  }).build(context),
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
                            child: AppTextBody1Widget()
                                .setText(
                                    '${model.hospitalId} - ${model.hospitalName}')
                                .setMaxLines(1)
                                .setTextOverFlow(TextOverflow.ellipsis)
                                .build(context),
                          ),
                          AppOutlinedButtonWidget()
                              .setPrefixIcon(const Icon(Icons.close))
                              .setAppButtonType(AppButtonType.circle)
                              .setOnPressed(() {
                            controller.onRequestDeleteAt(id: model.hospitalId);
                          }).build(context),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
        .build(context);
  }
}
