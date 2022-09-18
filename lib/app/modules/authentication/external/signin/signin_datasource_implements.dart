import 'package:dio/dio.dart';
import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';
import 'package:heat_map_package/app/modules/authentication/domain/models/signin_models.dart';
import 'package:heat_map_package/app/modules/authentication/infra/datasources/signin_datasource.dart';

class SiginDataSource implements ISigninDataSource {
  final Dio _dio;

  SiginDataSource(this._dio);

  String get _apiURL => "http://localhost:5050/api/signin";
  @override
  Future<String> signin(SigninModel signin) async {
    try {
      final response = await _dio.post<String>(_apiURL,
          data: {"email": signin.email, "password": signin.password});

      if (response.statusCode != 200) {
        throw Exception("error unexpected");
      }

      if (response.data == null) {
        throw const SigninError(message: "error trying to login");
      }

      return response.data!;
    } catch (e) {
      throw const SigninError(message: "error trying to login");
    }
  }
}
