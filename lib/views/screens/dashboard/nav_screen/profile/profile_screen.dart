import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketku/controllers/network/auth_controller.dart';
import 'package:marketku/views/screens/auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FilledButton(
            onPressed: () {
              _authController.signOut(onSuccess: () {
                Get.offAll(const LoginScreen());
              }, onFailed: (e) {
                Get.snackbar("Error", e.toString());
              });
            },
            child: const Text("Logout")),
      ),
    );
  }
}
