part of 'doctor_controller.dart';

class DoctorView extends GetWidget<DoctorController> {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListWidget<DoctorModel, DoctorController>(
      childWidget: (ctx, model, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppThemeExt.of.majorScale(4),
              vertical: AppThemeExt.of.majorScale(1)),
          child: AppTextBody1Widget(
            text: '${model.doctorId} - ${model.doctorName}',
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
