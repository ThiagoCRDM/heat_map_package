import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';
import 'package:heat_map_package/app/modules/authentication/domain/models/signin_models.dart';
import 'package:heat_map_package/app/modules/authentication/domain/repositories/signin_repository_interface.dart';
import 'package:heat_map_package/app/modules/authentication/domain/user_cases/signin_implements.dart';

import 'package:mocktail/mocktail.dart';

class SigninRepositoryMock extends Mock implements ISigninRepository {}

void main() {
  final repository = SigninRepositoryMock();
  final usecase = Signin(repository);

  test("Signin with success", () async {
    var signin = SigninModel(
        email: 'thiagocesarmata@gmail.com', password: '32as1d3asasda231');
    when(() => repository.signin(signin)).thenAnswer(
        (_) async => right<Failure, String>("SDASDASASDNAJKSNJDANSDJNASJ"));

    var result = await usecase(signin);
    expect(result.fold(id, id), isA<String>());
  });

  test("Signin email invalid", () async {
    var signin =
        SigninModel(email: 'thiagocesarmata.com', password: '32as1d3asasda231');
    var result = await usecase(signin);
    expect(result.fold(id, id), isA<SigninEmailError>());
  });

  test("Signin data invalid", () async {
    var signin = SigninModel(email: '', password: '');
    var result = await usecase(signin);
    expect(result.fold(id, id), isA<SigninError>());
  });
}
