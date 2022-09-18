import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';
import 'package:heat_map_package/app/modules/authentication/domain/models/signin_models.dart';
import 'package:heat_map_package/app/modules/authentication/infra/datasources/signin_datasource.dart';
import 'package:heat_map_package/app/modules/authentication/infra/repositories/signin_implements.dart';
import 'package:mocktail/mocktail.dart';

class SigninDataSourceyMock extends Mock implements ISigninDataSource {}

void main() {
  final datasource = SigninDataSourceyMock();
  final repository = SigninRepository(datasource);

  test("Signin", () async {
    var signin = SigninModel(
      email: "thiagocesarmata@gmail.com",
      password: "asdasdasdasdasdasda",
    );

    when(() => datasource.signin(signin)).thenAnswer(
      (_) async => "asdasdasdada",
    );

    var result = await repository.signin(signin);
    expect(result.fold(id, id), isA<String>());
  });

  test("Signin return execption", () async {
    var signin = SigninModel(
      email: "thiagocesarmata@gmail.com",
      password: "asdasdasdasdasdasda",
    );
    when(() => datasource.signin(signin)).thenThrow(
      (_) async => Exception(),
    );

    var result = await repository.signin(signin);
    expect(result.fold(id, id), isA<Failure>());
  });
}
