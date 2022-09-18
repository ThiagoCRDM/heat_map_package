import 'package:dartz/dartz.dart';
import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';
import 'package:heat_map_package/app/core/domain/model/account.dart';
import 'package:heat_map_package/app/modules/authentication/domain/repositories/create_account_repository_interface.dart';
import 'package:heat_map_package/app/modules/authentication/domain/user_cases/interfaces/create_account_interface.dart';

class CreateAccount implements ICreateAccount {
  final ICreateAccountRepository _repository;

  CreateAccount(this._repository);

  @override
  Future<Either<Failure, Account>> call(Account account) async {
    if (account.email.isEmpty ||
        account.password.isEmpty ||
        account.name.isEmpty) {
      return const Left<Failure, Account>(CreateAccountError(
        message: "Name , e-mail or password should not be empty",
      ));
    }

    if (account.password.length < 8) {
      return const Left<Failure, Account>(
          CreateAccountPasswordError(message: "short password"));
    }

    var result = await _repository.createAccount(account);
    return result.fold((l) => left(l), (r) => right(r));
  }
}
