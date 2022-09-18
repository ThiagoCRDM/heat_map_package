import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heat_map_package/app/core/domain/model/account.dart';
import 'package:heat_map_package/app/modules/authentication/external/create_account/create_account_datasource_implements.dart';
import 'package:heat_map_package/app/modules/authentication/infra/models/account_model.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  test("Create account data source", () async {
    final dioMock = DioMock();
    final datasource = CreateAccountDataSource(dioMock);
    final response = Response(
      data: jsonDecode(responseAPI),
      statusCode: 200,
      requestOptions: RequestOptions(
        path: '',
      ),
    );

    when(() => dioMock.post(
          "http://localhost:5050/api/signup",
          data: {
            "name": "Thiago",
            "email": "thiagocesarmata@gmail.com",
            "password": "asdasdasdas",
          },
        )).thenAnswer((_) async => response);

    var result = await datasource.createAccount(
      Account(
        access: Access.USER,
        isValid: false,
        posts: [],
        name: "tiago",
        email: "thiagocesarmata@gmail.com",
        password: "Asdasdasdasdas",
      ),
    );

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


/*
dioMock.post(
          any(),
          data: {
            "name": "name",
            "email": "email",
            "password": "password",
          },
        )).thenAnswer(
      (_) async => Response(
        data: jsonDecode(response),
        statusCode: 200,
        requestOptions: RequestOptions(
          path: '',
        ),
      ),


*/