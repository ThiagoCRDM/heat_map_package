import 'package:dartz/dartz.dart';
import 'package:heat_map_package/app/modules/authentication/infra/datasources/signin_datasource.dart';

import '../../domain/errors/errors.dart';
import '../../domain/models/signin_models.dart';
import '../../domain/repositories/signin_repository_interface.dart';

class SigninRepository implements ISigninRepository {
  final ISigninDataSource _dataSource;

  SigninRepository(this._dataSource);
  @override
  Future<Either<Failure, String>> signin(SigninModel signinModel) async {
    try {
      var result = await _dataSource.signin(signinModel);
      return Right(result);
    } on SigninError {
      return const Left(SigninError(message: ""));
    } catch (e) {
      return const Left(Failure(message: ""));
    }
  }
}
