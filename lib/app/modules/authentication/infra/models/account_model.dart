import 'dart:convert';

import 'package:heat_map_package/app/core/domain/model/account.dart';

class AccountModel extends Account {
  final String? id;

  AccountModel({
    this.id,
    required super.name,
    required super.email,
    required super.password,
    super.access = Access.USER,
    super.isValid = false,
    super.posts = const [],
  });

  static AccountModel fromMap(Map<String, dynamic> json) {
    return AccountModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "access": access.name,
      "isValid": isValid,
    };
  }

  String toJson() => json.encode(toMap());
  static AccountModel fromJson(String source) => fromMap(json.decode(source));
}
