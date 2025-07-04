import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketku/providers/auth/auth_provider.dart';
import 'package:marketku/providers/error/error_provider_user.dart';
import 'package:marketku/utils/custom_colors.dart';
import 'package:marketku/views/screens/auth/login_screen.dart';
import 'package:marketku/views/screens/dashboard/dashboard_screen.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LandingConsumerState();
  }
}

class _LandingConsumerState extends ConsumerState<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(errorNotifierProvider, (_, state) {
      if (state != null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(state.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Close"),
              ),
            ],
          ),
        );
      }
    });
    final userAsync = ref.watch(userNotifierProvider);

    if (userAsync.hasValue) {
      final user = userAsync.value;
      return user != null ? const DashboardScreen() : const LoginScreen();
    }
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Marketku",
            style: GoogleFonts.lato(
                color: CustomColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: 0.2),
          ),
          const SizedBox(
            height: 32,
          ),
          const CircularProgressIndicator()
        ],
      )),
    );
  }
}
