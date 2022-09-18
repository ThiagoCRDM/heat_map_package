import 'package:dartz/dartz.dart';

import '../../../../core/domain/model/account.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/create_account_repository_interface.dart';
import '../datasources/createaccount_datasource.dart';

class CreateAccontRepository implements ICreateAccountRepository {
  final ICreateAccountDataSource _dataSource;

  CreateAccontRepository(this._dataSource);
  @override
  Future<Either<Failure, Account>> createAccount(Account account) async {
    try {
      final accountResult = await _dataSource.createAccount(account);
      return right(accountResult);
    } on Failure {
      return left(const CreateAccountError(message: ""));
    } catch (ex) {
      return left(const Failure(message: ""));
    }
  }
}
