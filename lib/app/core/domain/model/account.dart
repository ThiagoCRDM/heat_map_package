// ignore_for_file: constant_identifier_names
import 'post.dart';

enum Access { ADMIN, USER }

class Account {
  final String name;
  final String email;
  final String password;
  List<Post> posts;
  final Access access;
  final bool isValid;

  Account({
    required this.access,
    required this.isValid,
    required this.posts,
    required this.name,
    required this.email,
    required this.password,
  });
}
