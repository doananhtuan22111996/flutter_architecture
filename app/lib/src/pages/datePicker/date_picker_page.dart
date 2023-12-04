part of 'date_picker_controller.dart';

class DatePickerPage extends GetView<DatePickerController> {
  const DatePickerPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.datePicker);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar: AppBarWidget(
        headerPage: R.strings.datePicker,
      ).build(context),
      body: _body(context),
    );
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
          const AppTextBody1Widget(text: 'Date Picker'),
          SizedBox(height: AppThemeExt.of.majorScale(2)),
          AppDatePickerWidget(
            fieldKey: 'datePicker1',
            appDatePickerSize: AppDatePickerSize.small,
            onDatePicked: (datePicker) => controller.toastDate(datePicker),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
            child: AppDatePickerWidget(
              fieldKey: 'datePicker2',
              appDatePickerSize: AppDatePickerSize.medium,
              onDatePicked: (datePicker) => controller.toastDate(datePicker),
            ),
          ),
          AppDatePickerWidget(
            fieldKey: 'datePicker3',
            appDatePickerSize: AppDatePickerSize.large,
            onDatePicked: (datePicker) => controller.toastDate(datePicker),
          ),
          SizedBox(height: AppThemeExt.of.majorScale(2)),
          AppDatePickerWidget(
            fieldKey: 'datePicker4',
            appDatePickerSize: AppDatePickerSize.small,
            isDisabled: true,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
            child: AppDatePickerWidget(
              fieldKey: 'datePicker5',
              appDatePickerSize: AppDatePickerSize.medium,
              isDisabled: true,
            ),
          ),
          AppDatePickerWidget(
            fieldKey: 'datePicker6',
            appDatePickerSize: AppDatePickerSize.large,
            isDisabled: true,
          ),
        ],
      ),
    );
  }

  Widget _dateRange(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Date Picker'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppDateRangePickerWidget(
          fieldKey: 'dateRangePicker1',
          appDatePickerSize: AppDatePickerSize.small,
          onDateRangePicked: (dateRangePicker) =>
              controller.toastDateRange(dateRangePicker),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppDateRangePickerWidget(
            fieldKey: 'dateRangePicker2',
            appDatePickerSize: AppDatePickerSize.medium,
            onDateRangePicked: (dateRangePicker) =>
                controller.toastDateRange(dateRangePicker),
          ),
        ),
        AppDateRangePickerWidget(
          fieldKey: 'dateRangePicker3',
          appDatePickerSize: AppDatePickerSize.large,
          onDateRangePicked: (dateRangePicker) =>
              controller.toastDateRange(dateRangePicker),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppDateRangePickerWidget(
          fieldKey: 'dateRangePicker4',
          appDatePickerSize: AppDatePickerSize.small,
          initialDateRange: DateTimeRange(
              start: DateTime.now(), end: DateTime.now().addExt(5)),
          isDisabled: true,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppDateRangePickerWidget(
            fieldKey: 'dateRangePicker5',
            appDatePickerSize: AppDatePickerSize.medium,
            initialDateRange: DateTimeRange(
                start: DateTime.now(), end: DateTime.now().addExt(5)),
            isDisabled: true,
          ),
        ),
        AppDateRangePickerWidget(
          fieldKey: 'dateRangePicker6',
          appDatePickerSize: AppDatePickerSize.large,
          initialDateRange: DateTimeRange(
              start: DateTime.now(), end: DateTime.now().addExt(5)),
          isDisabled: true,
        ),
      ],
    );
  }

  Widget _time(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Time Picker'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTimePickerWidget(
          fieldKey: 'timePicker1',
          appDatePickerSize: AppDatePickerSize.small,
          onTimePicked: (timePicker) => controller.toastTime(timePicker),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppTimePickerWidget(
            fieldKey: 'timePicker2',
            appDatePickerSize: AppDatePickerSize.medium,
            onTimePicked: (timePicker) => controller.toastTime(timePicker),
          ),
        ),
        AppTimePickerWidget(
          fieldKey: 'timePicker3',
          appDatePickerSize: AppDatePickerSize.large,
          onTimePicked: (timePicker) => controller.toastTime(timePicker),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTimePickerWidget(
            fieldKey: 'timePicker4',
            appDatePickerSize: AppDatePickerSize.small,
            initialTime: TimeOfDay.now(),
            isDisabled: true),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(2)),
          child: AppTimePickerWidget(
            fieldKey: 'timePicker5',
            appDatePickerSize: AppDatePickerSize.medium,
            initialTime: TimeOfDay.now(),
            isDisabled: true,
          ),
        ),
        AppTimePickerWidget(
            fieldKey: 'timePicker6',
            appDatePickerSize: AppDatePickerSize.large,
            initialTime: TimeOfDay.now(),
            isDisabled: true),
      ],
    );
  }
}
