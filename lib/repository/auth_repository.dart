import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/controllers/network/dio_controller.dart';
import 'package:marketku/models/user.dart';
import 'package:marketku/repository/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global_variables.dart';

part 'auth_repository.g.dart';

final providerContainer = ProviderContainer();

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
        ref.read(userProvider.notifier).setUser(userJson);
        await preferences.setString("user", userJson);
      },
    );
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(ref);
}

@riverpod
Future<void> login(Ref ref, String email, String password) async {
  ref.keepAlive();
  final authRepository = ref.read(authRepositoryProvider);
  await authRepository.login(email, password);
}
