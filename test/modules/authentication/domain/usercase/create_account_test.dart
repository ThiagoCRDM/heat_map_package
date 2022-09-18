import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:heat_map_package/app/core/domain/model/account.dart';
import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';
import 'package:heat_map_package/app/modules/authentication/domain/user_cases/create_account_implements.dart';
import 'package:heat_map_package/app/modules/authentication/domain/repositories/create_account_repository_interface.dart';
import 'package:mocktail/mocktail.dart';

class CreatAccountMock extends Mock implements ICreateAccountRepository {}

void main() {
  final repository = CreatAccountMock();
  final usecase = CreateAccount(repository);

  test("Create accunt success", () async {
    final account = Account(
      name: "Thiago",
      email: "thiagocesarmata@gmail.com",
      password: "32as1d3asasda231",
      access: Access.USER,
      isValid: false,
      posts: [],
    );
    when(() => repository.createAccount(account))
        .thenAnswer((_) async => right<Failure, Account>(account));

    var result = await usecase(account);
    expect(result.fold(id, id), isA<Account>());
  });

  test("Create accunt error when account email or password empty", () async {
    final accountError = Account(
      name: "Thiago",
      email: "",
      password: "",
      access: Access.USER,
      isValid: false,
      posts: [],
    );

    var result = await usecase(accountError);
    expect(result.fold(id, id), isA<CreateAccountError>());
  });

  test("Create accunt error when password less than 8", () async {
    final accountError = Account(
      name: "Thiago",
      email: "thiagocesarmata@gmail.com",
      password: "123",
      access: Access.USER,
      isValid: false,
      posts: [],
    );

    var result = await usecase(accountError);
    expect(result.fold(id, id), isA<CreateAccountPasswordError>());
  });
}
