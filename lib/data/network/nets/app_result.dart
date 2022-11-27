import 'app_exception.dart';

class AppResult<BM> {
  AppResult._();

  factory AppResult.success(BM? netData,
      {bool hasMore = false, int total = 0}) {
    return AppResultSuccess<BM>(
        netData: netData, hasMore: hasMore, total: total);
  }
  factory AppResult.failure(AppException? exception) {
    return AppResultFailure(exception: exception);
  }

  factory AppResult.exceptionEmpty() {
    return AppResultEmpty();
  }
}

class AppResultSuccess<BM> extends AppResult<BM> {
  AppResultSuccess({required this.netData, this.hasMore = false, this.total})
      : super._();

  final BM? netData;
  final bool hasMore;
  final int? total;
}

class AppResultFailure<BM> extends AppResult<BM> {
  AppResultFailure({required this.exception}) : super._();
  final AppException? exception;
}

class AppResultEmpty<BM> extends AppResult<BM> {
  AppResultEmpty() : super._();
}
