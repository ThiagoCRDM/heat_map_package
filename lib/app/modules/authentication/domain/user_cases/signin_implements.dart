import 'package:heat_map_package/app/modules/authentication/domain/models/signin_models.dart';

import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';

import 'package:dartz/dartz.dart';
import 'package:heat_map_package/app/modules/authentication/domain/repositories/signin_repository_interface.dart';
import 'package:string_validator/string_validator.dart';

import 'interfaces/signin_interface.dart';

class Signin implements ISignin {
  final ISigninRepository _repository;

  Signin(this._repository);

  @override
  Future<Either<Failure, String>> call(SigninModel signinModel) async {
    if (signinModel.email.isEmpty || signinModel.password.isEmpty) {
      return const Left(
          SigninError(message: "E-mail or password should not be empty"));
    }

    if (!isEmail(signinModel.email)) {
      return const Left(SigninEmailError(message: "E-mail invalid"));
    }

    var result = await _repository.signin(signinModel);
    return result.fold((l) => left(l), (r) => right(r));
  }
}
