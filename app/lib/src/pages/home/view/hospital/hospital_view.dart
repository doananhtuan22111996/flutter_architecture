part of 'hospital_controller.dart';

class HospitalView extends GetWidget<HospitalController> {
  const HospitalView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListWidget<HospitalModel, HospitalController>(
      childWidget: (ctx, model, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppThemeExt.of.majorScale(4),
              vertical: AppThemeExt.of.majorScale(1)),
          child: AppTextBody1Widget()
              .setText('${model.hospitalId} - ${model.hospitalName}')
              .setMaxLines(1)
              .setTextOverFlow(TextOverflow.ellipsis)
              .build(context),
        );
      },
    );
  }
}
