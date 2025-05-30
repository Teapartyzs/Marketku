import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/controllers/auth/auth_repository.dart';
import 'package:marketku/models/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(ref);
}

@riverpod
Future<void> onLogin(Ref ref, String email, String password) async {
  final authRepository = ref.read(authRepositoryProvider);
  await authRepository.login(email, password);
}

@riverpod
Future<void> onRegister(
    Ref ref, String fullname, String email, String password) async {
  final authRepository = ref.read(authRepositoryProvider);
  await authRepository.register(fullname, email, password);
}

@riverpod
Future<void> onSignOut(Ref ref) async {
  final authRepository = ref.read(authRepositoryProvider);
  await authRepository.signOut();
}

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  User? build() {
    return User(
      id: '',
      fullname: '',
      email: '',
      password: '',
      city: '',
      fullAddress: '',
      token: '',
    );
  }

  void setUser(String sourceJson) {
    state = User.fromJson(sourceJson);
  }

  void signOut() {
    state = null;
  }
}
