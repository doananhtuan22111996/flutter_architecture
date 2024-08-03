import 'package:flutter/cupertino.dart';

import '../../domain.dart';

part 'app_use_case.dart';

part 'login_use_case.dart';

part 'paging_remote_use_case.dart';

part 'paging_remote_remove_item_use_case.dart';

part 'paging_local_use_case.dart';

part 'paging_local_remove_item_use_case.dart';

abstract class BaseUseCase<Request extends BaseParam, Result> {
  Future<Result> execute(Request request);
}
