import '../../domain/models/signin_models.dart';

abstract class ISigninDataSource {
  Future<String> signin(SigninModel signin);
}
