import 'package:dio/dio.dart';
import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';

import '../../../../core/domain/model/account.dart';
import '../../infra/datasources/createaccount_datasource.dart';
import '../../infra/models/account_model.dart';

class CreateAccountDataSource implements ICreateAccountDataSource {
  final Dio _dio;

  CreateAccountDataSource(this._dio);
  String get _apiURL => "http://localhost:5050/api/signup";

  @override
  Future<AccountModel> createAccount(Account account) async {
    try {
      final response = await _dio.post(
        _apiURL,
        data: {
          "name": account.name,
          "email": account.email,
          "password": account.password,
        },
      );
      if (response.statusCode != 200) {
        throw const CreateAccountError(message: "Error on create account");
      }

      return AccountModel.fromJson(response.data);
    } on DioError {
      throw Exception("error unexpected");
    } catch (e) {
      rethrow;
    }
  }
}
