import 'package:dartz/dartz.dart';
import 'package:heat_map_package/app/core/domain/model/account.dart';
import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';

abstract class ICreateAccount {
  Future<Either<Failure, Account>> call(Account account);
}
