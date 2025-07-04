import 'dart:convert';

import 'package:marketku/models/user/user.dart';

class Auth {
  final String token;
  final User user;

  Auth({required this.token, required this.user});

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      token: map['token'] as String? ?? '',
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'user': user.toJson()};
  }

  factory Auth.fromJson(String source) =>
      Auth.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
