import 'package:dartz/dartz.dart';
import 'package:heat_map_package/app/core/domain/model/account.dart';

import '../errors/errors.dart';

abstract class ICreateAccountRepository {
  Future<Either<Failure, Account>> createAccount(Account account);
}
