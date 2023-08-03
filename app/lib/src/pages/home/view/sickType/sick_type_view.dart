part of 'sick_type_controller.dart';

class SickTypeView extends GetWidget<SickTypeController> {
  const SickTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListWidget<SickTypeModel, SickTypeController>(
      childWidget: (ctx, model, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppThemeExt.of.majorScale(4),
              vertical: AppThemeExt.of.majorScale(1)),
          child: AppTextBody1Widget()
              .setText('${model.sickTypeId} - ${model.sickTypeName}')
              .setMaxLines(1)
              .setTextOverFlow(TextOverflow.ellipsis)
              .build(context),
        );
      },
    );
  }
}
