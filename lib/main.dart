import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/providers/auth/auth_provider.dart';
import 'package:marketku/providers/error/error_provider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marketku/providers/error/error_provider_user.dart';
import 'package:marketku/views/screens/landing/landing_screen.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(errorProvider, (previous, next) {
    //   if (next != null && next != previous) {
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         title: const Text("Error"),
    //         content: SingleChildScrollView(child: Text(next.toString())),
    //         actions: [
    //           TextButton(
    //               onPressed: () => Navigator.of(context).pop(),
    //               child: const Text("Close"))
    //         ],
    //       ),
    //     );
    //   }
    // });
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

    return MaterialApp(
        title: 'Marketku',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LandingScreen());
  }
}
