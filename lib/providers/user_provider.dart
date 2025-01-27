import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/models/user.dart';

class UserProvider extends StateNotifier<User> {
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
  //extract value from object
  User? get user => state;
  //update state from json string
  void setUser(String sourceJson) {
    state = User.fromJson(sourceJson);
  }
}

//make data accessable in the app
final userProvider =
    StateNotifierProvider<UserProvider, User?>((ref) => UserProvider());
