import 'package:dartz/dartz.dart';
import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';
import 'package:heat_map_package/app/modules/authentication/domain/models/signin_models.dart';

abstract class ISignin {
  Future<Either<Failure, String>> call(SigninModel signinModel);
}
