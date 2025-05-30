import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/models/user/user.dart';

class UserProvider extends StateNotifier<User?> {
  UserProvider()
      : super(
          User(
              id: '',
              fullname: '',
              email: '',
              password: '',
              city: '',
              fullAddress: '',
              token: ''),
        );
  User? get user => state;

  void setUser(String sourceJson) {
    state = User.fromJson(sourceJson);
  }

  void signOut() {
    state = null;
  }
}

final userProvider =
    StateNotifierProvider<UserProvider, User?>((ref) => UserProvider());
