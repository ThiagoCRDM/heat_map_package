// ignore_for_file: overridden_fields

class HttpError implements Exception {
  final String? message;
  const HttpError({this.message});
}

class HttpNotFound extends HttpError {
  @override
  final String? message;
  const HttpNotFound({this.message});
}

class HttpServerError extends HttpError {
  @override
  final String? message;
  const HttpServerError({this.message});
}
