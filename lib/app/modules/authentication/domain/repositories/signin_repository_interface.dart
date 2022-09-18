import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../models/signin_models.dart';

abstract class ISigninRepository {
  Future<Either<Failure, String>> signin(SigninModel signinModel);
}
