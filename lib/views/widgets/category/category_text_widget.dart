import 'package:flutter/material.dart';

import '../../../models/category/category.dart';

class CategoryTextWidget extends StatefulWidget {
  const CategoryTextWidget(
      {super.key,
      required this.categoryData,
      required this.onSelected,
      required this.currentSelectedValue});

  final Future<List<Category>> categoryData;
  final void Function(Category?) onSelected;
  final Category? currentSelectedValue;

  @override
  State<CategoryTextWidget> createState() => _CategoryTextWidgetState();
}

class _CategoryTextWidgetState extends State<CategoryTextWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.categoryData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      widget.onSelected(snapshot.data![index]);
                    },
                    title: Text(
                      snapshot.data![index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: widget.currentSelectedValue ==
                                  snapshot.data![index]
                              ? Colors.blueAccent
                              : Colors.black),
                    ),
                  );
                });
          }
        });
  }
}
