import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:heat_map_package/app/modules/authentication/domain/models/signin_models.dart';
import 'package:heat_map_package/app/modules/authentication/external/http/http_client_interface.dart';
import 'package:heat_map_package/app/modules/authentication/external/signin/signin_datasource_implements.dart';
import 'package:mocktail/mocktail.dart';

class HttpMock extends Mock implements IHttpClient {}

void main() {
  final client = HttpMock();
  final datasource = SiginDataSource(client);
  test("Signin data source", () async {
    final signin = SigninModel(email: "asda", password: "asdasd");
    when(() => client.post(any(),
            data: {"email": signin.email, "password": signin.password}))
        .thenAnswer((_) async => jsonDecode(responseAPI));
    var result = await datasource.signin(signin);

    expect(result, "asdlkjasl;kndl;asnd");
    expect(result, isA<String>());
  });
}

const responseAPI = r'''
{
 "token": "asdlkjasl;kndl;asnd"
}
''';
