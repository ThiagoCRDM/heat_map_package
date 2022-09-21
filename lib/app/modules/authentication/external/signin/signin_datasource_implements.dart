import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';
import 'package:heat_map_package/app/modules/authentication/domain/models/signin_models.dart';
import 'package:heat_map_package/app/modules/authentication/infra/datasources/signin_datasource.dart';

import '../errors/http_errors.dart';
import '../http/http_client_interface.dart';

class SiginDataSource implements ISigninDataSource {
  final IHttpClient _client;

  SiginDataSource(this._client);

  String get _apiURL => "http://localhost:5050/api/signin";
  @override
  Future<String> signin(SigninModel signin) async {
    try {
      final response = await _client.post(_apiURL,
          data: {"email": signin.email, "password": signin.password});

      return response!["token"];
    } on HttpError {
      rethrow;
    } catch (e) {
      throw const SigninError(message: "error trying to login");
    }
  }
}
