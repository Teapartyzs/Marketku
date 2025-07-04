import 'dart:convert';
import 'package:marketku/models/user/auth.dart';
import 'package:marketku/services/dio_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global_variables.dart';

class AuthController {
  Future<String> login(String email, String password) async {
    final response = await '$ip/api/signin'.postData<Auth>(
      {"email": email, "password": password},
    );
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = response.token;
    await preferences.setString("token", token);
    final userJson = jsonEncode(response.user);
    await preferences.setString("user", userJson);
    return userJson;
  }

  Future<void> register(String fullname, String email, String password) async {
    await "$ip/api/signup"
        .postData({"fullname": fullname, "email": email, "password": password});
  }

  Future<void> signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("token");
    sharedPreferences.remove("user");
  }
}
