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
          child: AppTextBody1Widget(
            text: '${model.sickTypeId} - ${model.sickTypeName}',
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
