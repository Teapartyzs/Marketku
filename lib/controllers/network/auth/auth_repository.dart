import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/providers/user/user_provider.dart';
import 'package:marketku/services/dio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../global_variables.dart';

part 'auth_repository.g.dart';

final providerContainer = ProviderContainer();

class AuthRepository {
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
        providerContainer.read(userProvider.notifier).setUser(userJson);
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
    providerContainer.read(userProvider.notifier).signOut();
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}

@riverpod
Future<void> login(Ref ref, String email, String password) async {
  final authRepository = ref.read(authRepositoryProvider);
  await authRepository.login(email, password);
}

@riverpod
Future<void> register(
    Ref ref, String fullname, String email, String password) async {
  final authRepository = ref.read(authRepositoryProvider);
  await authRepository.register(fullname, email, password);
}

@riverpod
Future<void> signOut(Ref ref) async {
  final authRepository = ref.read(authRepositoryProvider);
  await authRepository.signOut();
}
