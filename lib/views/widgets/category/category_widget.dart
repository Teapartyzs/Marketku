import 'package:flutter/material.dart';

import '../../../models/category.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget(
      {super.key,
      required this.categoryData,
      required this.isNotSub,
      required this.onCategorySelect});
  final Future<List<Category>> categoryData;
  final bool isNotSub;
  final void Function(Category?) onCategorySelect;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  Category? selectedCategory;
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
            child: Text("Error: ${{snapshot.error}}"),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text("Category is empty"),
          );
        } else {
          final category = snapshot.data;
          return widget.isNotSub
              ? GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  itemCount: category!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => widget.onCategorySelect(category[index]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.network(
                                height: 50, width: 50, category[index].image),
                          ),
                          Text(
                            category[index].name,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  },
                )
              : DropdownButton<Category>(
                  value: selectedCategory,
                  hint: selectedCategory == null
                      ? const Text("Select category")
                      : Text(selectedCategory!.name),
                  items: snapshot.data!.map(
                    (Category data) {
                      return DropdownMenuItem(
                        value: data,
                        child: Text(data.name),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(
                      () {
                        selectedCategory = value;
                        widget.onCategorySelect(value);
                      },
                    );
                  },
                );
        }
      },
    );
  }
}
