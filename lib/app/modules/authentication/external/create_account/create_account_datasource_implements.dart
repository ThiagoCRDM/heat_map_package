import 'package:heat_map_package/app/modules/authentication/domain/errors/errors.dart';
import 'package:heat_map_package/app/modules/authentication/external/errors/http_errors.dart';

import '../../../../core/domain/model/account.dart';
import '../../infra/datasources/createaccount_datasource.dart';
import '../../infra/models/account_model.dart';
import '../http/http_client_interface.dart';

class CreateAccountDataSource implements ICreateAccountDataSource {
  final IHttpClient _client;

  CreateAccountDataSource(this._client);
  String get _apiURL => "http://localhost:5050/api/signup";

  @override
  Future<AccountModel> createAccount(Account account) async {
    try {
      final response = await _client.post(
        _apiURL,
        data: {
          "name": account.name,
          "email": account.email,
          "password": account.password,
        },
      );
      return AccountModel.fromMap(response!);
    } on HttpError {
      rethrow;
    } catch (e) {
      throw const CreateAccountError(message: "");
    }
  }
}
