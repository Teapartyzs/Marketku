import 'package:flutter/material.dart';
import 'package:marketku/models/category_sub.dart';

class CategorySubWidget extends StatefulWidget {
  const CategorySubWidget({super.key, required this.categorySubData});

  final Future<List<CategorySub>> categorySubData;

  @override
  State<CategorySubWidget> createState() => _CategorySubWidgetState();
}

class _CategorySubWidgetState extends State<CategorySubWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.categorySubData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${{snapshot.error}}"),
            );
          } else if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No data found",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            );
          } else {
            final data = snapshot.data;
            return GridView.builder(
                shrinkWrap: true,
                itemCount: data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.network(
                          data[index].image,
                          width: 150,
                          height: 150,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: Text(
                          data[index].subCategoryName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                });
          }
        });
  }
}
