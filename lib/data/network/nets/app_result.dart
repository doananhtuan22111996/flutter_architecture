import 'app_exception.dart';

class AppResult<BM> {
  AppResult._();

  factory AppResult.success(BM? netData) {
    return AppResultSuccess<BM>(netData: netData);
  }
  factory AppResult.failure(AppException? exception) {
    return AppResultFailure(exception: exception);
  }
}

class AppResultSuccess<BM> extends AppResult<BM> {
  AppResultSuccess({required this.netData, this.nextPage}) : super._();

  final BM? netData;
  final int? nextPage;
}

class AppResultFailure<BM> extends AppResult<BM> {
  AppResultFailure({required this.exception}) : super._();
  final AppException? exception;
}
