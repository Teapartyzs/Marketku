import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketku/repository/auth/auth_repository.dart';
import 'package:marketku/providers/loading/loading_provider.dart';
import 'package:marketku/views/helpers/custom_colors.dart';
import 'package:marketku/views/screens/auth/register_screen.dart';
import 'package:marketku/views/screens/dashboard/dashboard_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    late String email;
    late String password;
    bool isLoading = ref.watch(isLoadingProvider);
    void submitSignIn() async {
      if (formKey.currentState!.validate()) {
        ref.read(isLoadingProvider.notifier).state = true;

        try {
          await ref.read(loginProvider(email, password).future);
          if (!context.mounted) return;
          ref.read(isLoadingProvider.notifier).state = false;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Login success!")),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        } catch (e) {
          ref.read(isLoadingProvider.notifier).state = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login failed: ${e.toString()}")),
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: CustomColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                  Text(
                    "Welcome back friend!",
                    style: GoogleFonts.lato(color: Colors.grey, fontSize: 16),
                  ),
                  Image.asset(
                    'assets/images/shopping.png',
                    width: 250,
                    height: 300,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email",
                      style: GoogleFonts.nunitoSans(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    onChanged: (value) => email = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      if (!value.contains("@")) {
                        return "Email is not valid";
                      }
                      return null;
                    },
                    style: GoogleFonts.nunitoSans(
                        color: Colors.black, fontSize: 16),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: CustomColors.secondary),
                      ),
                      enabledBorder: InputBorder.none,
                      labelText: "Enter your email",
                      labelStyle: GoogleFonts.nunitoSans(fontSize: 14),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          "assets/icons/ic_email.svg",
                          width: 5,
                          height: 5,
                        ),
                      ),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: GoogleFonts.nunitoSans(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: (value) => password = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return null;
                    },
                    style: GoogleFonts.nunitoSans(
                        color: Colors.black, fontSize: 16),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: CustomColors.secondary),
                      ),
                      enabledBorder: InputBorder.none,
                      labelText: "Enter your password",
                      labelStyle: GoogleFonts.nunitoSans(fontSize: 14),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          "assets/icons/ic_password.svg",
                          width: 5,
                          height: 5,
                        ),
                      ),
                      suffixIcon: const Icon(Icons.visibility),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              submitSignIn();
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: CustomColors.primary,
                            ),
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have acccount?",
                        style: GoogleFonts.nunitoSans(
                            color: Colors.black, fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Create new account",
                          style: GoogleFonts.nunitoSans(
                              color: CustomColors.primary, fontSize: 12),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
