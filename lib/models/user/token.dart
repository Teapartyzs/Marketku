import 'dart:convert';

class Token {
  final String token;

  Token({required this.token});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{"token": token};
  }

  String toJson() => jsonEncode(toMap());
  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(token: map['token'] as String? ?? '');
  }

  factory Token.fromJson(String source) =>
      Token.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
