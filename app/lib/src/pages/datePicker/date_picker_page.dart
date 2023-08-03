part of 'date_picker_controller.dart';

class DatePickerPage extends GetView<DatePickerController> {
  const DatePickerPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.datePicker);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(
            AppBarWidget().setHeaderPage(R.strings.datePicker).build(context))
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
            _date(context),
            SizedBox(height: AppThemeExt.of.majorScale(2)),
            _dateRange(context),
            SizedBox(height: AppThemeExt.of.majorScale(2)),
            _time(context),
          ],
        ),
      ),
    );
  }

  Widget _date(BuildContext context) {
    return FormBuilder(
      key: GlobalKey<FormBuilderState>(),
      initialValue: {
        'datePicker4': DateTime.now(),
        'datePicker5': DateTime.now(),
        'datePicker6': DateTime.now(),
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextBody1Widget().setText('Date Picker').build(context),
          SizedBox(height: AppThemeExt.of.majorScale(2)),
          AppDatePickerWidget()
              .setAppDatePickerSize(AppDatePickerSize.small)
              .setFieldKey('datePicker1')
              .setOnDatePicked((datePicker) => controller.toastDate(datePicker))
              .build(context),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
            child: AppDatePickerWidget()
                .setAppDatePickerSize(AppDatePickerSize.medium)
                .setFieldKey('datePicker2')
                .setOnDatePicked(
                    (datePicker) => controller.toastDate(datePicker))
                .build(context),
          ),
          AppDatePickerWidget()
              .setAppDatePickerSize(AppDatePickerSize.large)
              .setFieldKey('datePicker3')
              .setOnDatePicked((datePicker) => controller.toastDate(datePicker))
              .build(context),
          SizedBox(height: AppThemeExt.of.majorScale(2)),
          AppDatePickerWidget()
              .setAppDatePickerSize(AppDatePickerSize.small)
              .setFieldKey('datePicker4')
              .setIsDisabled(true)
              .build(context),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
            child: AppDatePickerWidget()
                .setAppDatePickerSize(AppDatePickerSize.medium)
                .setFieldKey('datePicker5')
                .setIsDisabled(true)
                .build(context),
          ),
          AppDatePickerWidget()
              .setAppDatePickerSize(AppDatePickerSize.large)
              .setFieldKey('datePicker6')
              .setIsDisabled(true)
              .build(context),
        ],
      ),
    );
  }

  Widget _dateRange(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Date Picker').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppDateRangePickerWidget()
            .setAppDatePickerSize(AppDatePickerSize.small)
            .setFieldKey('dateRangePicker1')
            .setOnDateRangePicked(
                (dateRangePicker) => controller.toastDateRange(dateRangePicker))
            .build(context),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppDateRangePickerWidget()
              .setAppDatePickerSize(AppDatePickerSize.medium)
              .setFieldKey('dateRangePicker2')
              .setOnDateRangePicked((dateRangePicker) =>
                  controller.toastDateRange(dateRangePicker))
              .build(context),
        ),
        AppDateRangePickerWidget()
            .setAppDatePickerSize(AppDatePickerSize.large)
            .setFieldKey('dateRangePicker3')
            .setOnDateRangePicked(
                (dateRangePicker) => controller.toastDateRange(dateRangePicker))
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppDateRangePickerWidget()
            .setAppDatePickerSize(AppDatePickerSize.small)
            .setFieldKey('dateRangePicker4')
            .setInitialDateRange(DateTimeRange(
                start: DateTime.now(), end: DateTime.now().addExt(5)))
            .setIsDisabled(true)
            .build(context),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppDateRangePickerWidget()
              .setAppDatePickerSize(AppDatePickerSize.medium)
              .setFieldKey('dateRangePicker5')
              .setInitialDateRange(DateTimeRange(
                  start: DateTime.now(), end: DateTime.now().addExt(5)))
              .setIsDisabled(true)
              .build(context),
        ),
        AppDateRangePickerWidget()
            .setAppDatePickerSize(AppDatePickerSize.large)
            .setFieldKey('dateRangePicker6')
            .setInitialDateRange(DateTimeRange(
                start: DateTime.now(), end: DateTime.now().addExt(5)))
            .setIsDisabled(true)
            .build(context),
      ],
    );
  }

  Widget _time(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Time Picker').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTimePickerWidget()
            .setAppDatePickerSize(AppDatePickerSize.small)
            .setFieldKey('timePicker1')
            .setOnTimePicked((timePicked) => controller.toastTime(timePicked))
            .build(context),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppTimePickerWidget()
              .setAppDatePickerSize(AppDatePickerSize.medium)
              .setFieldKey('timePicker2')
              .setOnTimePicked((timePicked) => controller.toastTime(timePicked))
              .build(context),
        ),
        AppTimePickerWidget()
            .setAppDatePickerSize(AppDatePickerSize.large)
            .setFieldKey('timePicker3')
            .setOnTimePicked((timePicked) => controller.toastTime(timePicked))
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTimePickerWidget()
            .setAppDatePickerSize(AppDatePickerSize.small)
            .setFieldKey('timePicker4')
            .setInitialTime(TimeOfDay.now())
            .setIsDisabled(true)
            .build(context),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppTimePickerWidget()
              .setAppDatePickerSize(AppDatePickerSize.medium)
              .setFieldKey('timePicker5')
              .setInitialTime(TimeOfDay.now())
              .setIsDisabled(true)
              .build(context),
        ),
        AppTimePickerWidget()
            .setAppDatePickerSize(AppDatePickerSize.large)
            .setFieldKey('timePicker6')
            .setInitialTime(TimeOfDay.now())
            .setIsDisabled(true)
            .build(context),
      ],
    );
  }
}
