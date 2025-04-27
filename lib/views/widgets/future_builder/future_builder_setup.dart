import 'package:flutter/material.dart';

class FutureBuilderSetup<T> extends StatelessWidget {
  const FutureBuilderSetup(
      {super.key, required this.data, required this.onSuccess});

  final Future<T> data;
  final Widget Function(T) onSuccess;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Failed to fetch data"));
          } else if (snapshot.hasData) {
            return onSuccess(
                snapshot.data as T); // force unwrapping snapshot.data!
          } else {
            return const Center(child: Text("No data available"));
          }
        });
  }
}
