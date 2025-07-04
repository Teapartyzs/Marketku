import 'package:marketku/controllers/auth/auth_controller.dart';
import 'package:marketku/models/user/user.dart';
import 'package:marketku/providers/error/error_provider_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  late AuthController _authController;
  @override
  Future<User?> build() async {
    _authController = AuthController();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");
    final userJson = preferences.getString("user");
    if (token != null && userJson != null) {
      return User.fromJson(userJson);
    } else {
      return null;
    }
  }

  void setUser(String sourceJson) {
    state = AsyncData(User.fromJson(sourceJson));
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    final response = await AsyncValue.guard(() async {
      final userJson = await _authController.login(email, password);
      return User.fromJson(userJson);
    });
    if (response.hasError) {
      ref.read(errorNotifierProvider.notifier).setError(response.error!);
    }
    state = response;
  }

  Future<void> register(String fullname, String email, String password) async {
    state = const AsyncLoading();
    final response = await AsyncValue.guard(() async {
      await _authController.register(fullname, email, password);
      return true;
    });
    if (response.hasError) {
      ref.read(errorNotifierProvider.notifier).setError(response.error!);
    }
  }

  Future<void> signOut() async {
    final response = await AsyncValue.guard(() async {
      await _authController.signOut();
      return true;
    });
    if (response.hasError) {
      ref.read(errorNotifierProvider.notifier).setError(response.error!);
    }
    state = const AsyncData(null);
  }
}
