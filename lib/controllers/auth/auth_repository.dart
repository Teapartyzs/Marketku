import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/providers/auth/auth_provider.dart';
import 'package:marketku/services/dio_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global_variables.dart';

class AuthRepository {
  final Ref ref;
  AuthRepository(this.ref);
  Future<void> login(String email, String password) async {
    await '$ip/api/signin'.postData(
      {"email": email, "password": password},
      (data, message) async {
        final encode = jsonEncode(data);
        final decode = jsonDecode(encode);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        final token = decode['token'];
        await preferences.setString("token", token);
        final userJson = jsonEncode(decode['user']);
        ref.read(userNotifierProvider.notifier).setUser(userJson);
        await preferences.setString("user", userJson);
      },
    );
  }

  Future<void> register(String fullname, String email, String password) async {
    await "$ip/api/signup".postData(
        {"fullname": fullname, "email": email, "password": password},
        (data, message) async {});
  }

  Future<void> signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("token");
    sharedPreferences.remove("user");
    ref.read(userNotifierProvider.notifier).signOut();
  }
}
