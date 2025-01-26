import 'package:flutter/material.dart';
import 'package:marketku/models/category_sub.dart';

class CategorySubWidget extends StatefulWidget {
  const CategorySubWidget(
      {super.key, required this.categorySubData, required this.onClick});

  final Future<List<CategorySub>> categorySubData;
  final void Function(CategorySub?) onClick;

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
                  return InkWell(
                    onTap: () {
                      widget.onClick(snapshot.data![index]);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              data[index].image,
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
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
                                fontWeight: FontWeight.w600, fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
        });
  }
}
