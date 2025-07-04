import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marketku/providers/error/error_provider.dart';
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
    ref.listen(errorProvider, (previous, next) {
      if (next != null && next != previous) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: SingleChildScrollView(child: Text(next.toString())),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Close"))
            ],
          ),
        );
      }
    });
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

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:marketku/providers/auth/auth_provider.dart';
// import 'package:marketku/views/screens/auth/login_screen.dart';
// import 'package:marketku/views/screens/dashboard/dashboard_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// void main() async {
//   await dotenv.load(fileName: '.env');
//   runApp(const ProviderScope(child: MyApp()));
// }

// //use consumer widget to use state from riverpod
// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});

//   Future<void> _checkUserData(WidgetRef ref) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     final token = preferences.getString("token");
//     final userJson = preferences.getString("user");

//     if (token != null && userJson != null) {
//       ref.read(userNotifierProvider.notifier).setUser(userJson);
//     } else {
//       ref.read(userNotifierProvider.notifier).signOut();
//     }
//   }

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//         ref.listen(errorProvider, (previous, next) {
//       if (next != null && next != previous) {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text("Error"),
//             content: SingleChildScrollView(child: Text(next.toString())),
//             actions: [
//               TextButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   child: const Text("Close"))
//             ],
//           ),
//         );
//       }
//     });
//     return MaterialApp(
//       title: 'Marketku',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: FutureBuilder(
//           future: _checkUserData(ref),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             final user = ref.watch(userNotifierProvider);
//             return user != null ? const DashboardScreen() : const LoginScreen();
//           }),
//     );
//   }
// }
