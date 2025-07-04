// file: providers/auth/auth_provider.dart

import 'package:marketku/controllers/auth/auth_controller.dart';
import 'package:marketku/models/user/user.dart';
import 'package:marketku/providers/error/error_provider_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_provider.g.dart';

final authControllerProvider = Provider((ref) => AuthController());

@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  Future<User?> build() async {
    final preferences = await SharedPreferences.getInstance();
    final userJson = preferences.getString("user");

    if (userJson != null) {
      try {
        return User.fromJson(userJson);
      } catch (e) {
        return null;
      }
    }

    return null;
  }

  void setUser(String sourceJson) {
    state = AsyncData(User.fromJson(sourceJson));
  }

  Future<void> signIn(String email, String password) async {
    final authController = ref.read(authControllerProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() {
      return authController.login(email, password);
    });

    if (state.hasError) {
      ref.read(errorNotifierProvider.notifier).setError(state.error!);
    }
  }

  Future<void> register(String fullname, String email, String password) async {
    final authController = ref.read(authControllerProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authController.register(fullname, email, password);
      return null;
    });

    if (state.hasError) {
      ref.read(errorNotifierProvider.notifier).setError(state.error!);
    }
  }

  Future<void> signOut() async {
    final authController = ref.read(authControllerProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await authController.signOut();
      return null;
    });
  }
}
