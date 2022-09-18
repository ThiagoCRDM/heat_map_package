import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heat_map_package/app/core/domain/model/account.dart';
import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';
import 'package:heat_map_package/app/modules/authentication/infra/datasources/createaccount_datasource.dart';
import 'package:heat_map_package/app/modules/authentication/infra/models/account_model.dart';
import 'package:heat_map_package/app/modules/authentication/infra/repositories/create_account_implements.dart';
import 'package:mocktail/mocktail.dart';

class CreateAccountDartasourceMock extends Mock
    implements ICreateAccountDataSource {}

void main() {
  final dataSource = CreateAccountDartasourceMock();
  final repository = CreateAccontRepository(dataSource);

  test("Create accont repository implements", () async {
    var account = Account(
      name: "Thiago",
      email: "thiagocesarmata@gmail.com",
      password: "32as1d3asasda231",
      access: Access.USER,
      isValid: false,
      posts: [],
    );

    var accountModel = AccountModel(
      id: "asdasda",
      name: "Thiago",
      email: "thiagocesarmata@gmail.com",
      password: "32as1d3asasda231",
    );

    when(() => dataSource.createAccount(account))
        .thenAnswer((_) async => accountModel);

    var result = await repository.createAccount(account);
    expect(result.fold(id, id), isA<AccountModel>());
  });

  test("Create account exception", () async {
    var account = Account(
      name: "Thiago",
      email: "thiagocesarmata@gmail.com",
      password: "32as1d3asasda231",
      access: Access.USER,
      isValid: false,
      posts: [],
    );
    when(() => dataSource.createAccount(account)).thenThrow(Exception());

    var resutl = await repository.createAccount(account);
    expect(resutl.fold(id, id), isA<Failure>());
  });
}
