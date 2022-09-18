import 'package:heat_map_package/app/core/domain/model/account.dart';

import '../models/account_model.dart';

abstract class ICreateAccountDataSource {
  Future<AccountModel> createAccount(Account account);
}
