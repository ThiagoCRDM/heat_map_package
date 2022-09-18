// ignore_for_file: overridden_fields

class Failure implements Exception {
  final String? message;
  const Failure({this.message});
}

class CreateAccountError extends Failure {
  @override
  final String? message;
  const CreateAccountError({this.message});
}

class CreateAccountPasswordError extends Failure {
  @override
  final String? message;
  const CreateAccountPasswordError({this.message});
}

class SigninError extends Failure {
  @override
  final String? message;
  const SigninError({this.message});
}

class SigninEmailError extends Failure {
  @override
  final String? message;
  const SigninEmailError({this.message});
}
