import 'package:dio/dio.dart';
import 'package:heat_map_package/app/modules/authentication/external/errors/http_errors.dart';
import 'package:heat_map_package/app/modules/authentication/external/http/http_client_interface.dart';

class DioClient implements IHttpClient {
  final _dio = Dio();
  @override
  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.get(url);
    return response.data ?? {};
  }

  @override
  Future<Map<String, dynamic>> post(String url,
      {data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.post<Map<String, dynamic>>(url, data: data ?? {});

      if (response.statusCode == 404) {
        throw const HttpNotFound(message: "Not found");
      }

      if (response.statusCode != null && response.statusCode! >= 500) {
        throw const HttpServerError(message: "Internal server error");
      }

      if (response.data == null) {
        throw const HttpError(message: "Error on create account");
      }

      return response.data!;
    } catch (e) {
      throw HttpError(message: e.toString());
    }
  }

  @override
  Future<dynamic> put(String url,
      {data, Map<String, dynamic>? queryParameters}) async {
    final response = await _dio.put(url, data: data);
    return response.data ?? {};
  }
}
