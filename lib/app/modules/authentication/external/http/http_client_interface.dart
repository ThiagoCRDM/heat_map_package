abstract class IHttpClient {
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters});
  Future<Map<String, dynamic>>? post(String url,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<dynamic> put(String url,
      {dynamic data, Map<String, dynamic>? queryParameters});
}
