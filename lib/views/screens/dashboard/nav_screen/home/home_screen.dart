import 'package:flutter/material.dart';
import 'package:marketku/views/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [Header()],
        ),
      ),
    );
  }
}
