import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                tileMode: TileMode.clamp,
                colors: [Colors.white, Colors.blue],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
            backgroundBlendMode: BlendMode.color),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Marketku",
                  style: GoogleFonts.lato(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      letterSpacing: 0.2),
                ),
                Text(
                  "Come and join us!",
                  style: GoogleFonts.lato(color: Colors.grey, fontSize: 16),
                ),
                Image.asset(
                  'assets/images/Illustration.png',
                  width: 150,
                  height: 200,
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
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                      enabledBorder: InputBorder.none,
                      labelText: "Enter your email",
                      labelStyle: GoogleFonts.nunitoSans(fontSize: 14),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          "assets/icons/email.png",
                          width: 5,
                          height: 5,
                        ),
                      )
                      // focusedBorder: InputBorder.none,
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
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                      enabledBorder: InputBorder.none,
                      labelText: "Enter your password",
                      labelStyle: GoogleFonts.nunitoSans(fontSize: 14),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          "assets/icons/password.png",
                          width: 5,
                          height: 5,
                        ),
                      ),
                      suffixIcon: const Icon(Icons.visibility)
                      // focusedBorder: InputBorder.none,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
