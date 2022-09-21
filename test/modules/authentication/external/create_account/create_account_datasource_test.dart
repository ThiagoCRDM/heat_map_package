import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:heat_map_package/app/core/domain/model/account.dart';
import 'package:heat_map_package/app/modules/authentication/external/create_account/create_account_datasource_implements.dart';
import 'package:heat_map_package/app/modules/authentication/external/http/http_client_interface.dart';
import 'package:heat_map_package/app/modules/authentication/infra/models/account_model.dart';
import 'package:mocktail/mocktail.dart';

class HttpMock extends Mock implements IHttpClient {}

void main() {
  final client = HttpMock();

  test("Create account data source", () async {
    final account = Account(
      access: Access.USER,
      isValid: false,
      posts: [],
      name: "tiago",
      email: "thiagocesarmata@gmail.com",
      password: "Asdasdasdasdas",
    );

    when(() => client.post(
          any(),
          data: {
            "name": account.name,
            "email": account.email,
            "password": account.password,
          },
        )).thenAnswer(
      (_) async => await jsonDecode(responseAPI),
    );

    final datasource = CreateAccountDataSource(client);
    var result = await datasource.createAccount(account);
    expect(result.name, "Thiago");
    expect(result, isA<AccountModel>());
  });
}

const responseAPI = r'''
{
  "name": "Thiago",
  "email": "thiagohs619@gmail.com",
  "password": "1BVfREu2Lnu6EGOa",
  "id": "6319fa71f3b7be288da7b74c"
}
''';
