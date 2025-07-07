import 'package:marketku/models/user/auth.dart';
import 'package:marketku/models/user/user.dart';
import 'package:marketku/services/dio_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global_variables.dart';

class AuthController {
  Future<User> login(String email, String password) async {
    // Panggil API dan dapatkan data Map
    final responseMap = await '$ip/api/signin'.postData<Map<String, dynamic>>(
      {"email": email, "password": password},
    );

    final authData = Auth.fromMap(responseMap);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("token", authData.token);
    final userJson = authData.user.toJson();
    await preferences.setString("user", userJson);

    return authData.user;
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
