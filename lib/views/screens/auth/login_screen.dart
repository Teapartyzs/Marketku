import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: GoogleFonts.lato(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 0.2),
            ),
            Text(
              "Come and join us!",
              style: GoogleFonts.lato(color: Colors.grey, fontSize: 12),
            ),
            Image.asset(
              'assets/images/Illustration.png',
              width: 150,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
