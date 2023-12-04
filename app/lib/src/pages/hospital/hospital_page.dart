part of 'hospital_controller.dart';

class HospitalPage extends GetWidget<HospitalController> {
  const HospitalPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.hospital);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar: AppBarLeadingAvatarWidget(
        headerPage: R.strings.hospital,
        actions: const [
          AppButtonAppBarWidget(prefixIcon: Icon(Icons.more_horiz))
        ],
      ).build(context),
      body: AppListWidget<HospitalModel, HospitalController>(
        childWidget: (ctx, model, index) {
          return HospitalItemWidget(model: model, index: index);
        },
      ),
    );
  }
}

class HospitalItemController extends GetxController {
  int index = 0;

  HospitalItemController(this.index);

  void setIndex(int index) {
    this.index = index;
  }

  @override
  void onInit() {
    super.onInit();
    Logs.i('HospitalItemController init: $index');
  }

  @override
  void onClose() {
    super.onClose();
    Logs.i('HospitalItemController close: $index');
  }
}

class HospitalItemWidget extends StatelessWidget {
  final int index;
  final HospitalModel model;

  const HospitalItemWidget(
      {super.key, required this.index, required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HospitalItemController>(
      init: HospitalItemController(index),
      tag: index.toString(),
      builder: (controller) => Padding(
        padding: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
        child: Text('${model.hospitalId} - ${model.hospitalName}'),
      ),
    );
  }
}
