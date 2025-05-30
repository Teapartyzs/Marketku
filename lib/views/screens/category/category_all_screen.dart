import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:marketku/controllers/category_sub/category_sub_controller.dart';
import 'package:marketku/providers/category/category_provider.dart';
import 'package:marketku/views/screens/product/product_screen.dart';
import 'package:marketku/views/widgets/category_sub/category_sub_widget.dart';

import '../../../models/category/category.dart';
import '../../../models/category_sub/category_sub.dart';

class CategoryAllScreen extends ConsumerStatefulWidget {
  const CategoryAllScreen({super.key});

  @override
  ConsumerState<CategoryAllScreen> createState() => _CategoryAllScreenState();
}

class _CategoryAllScreenState extends ConsumerState<CategoryAllScreen> {
  late List<Category> categoryData;
  Category? selectedCategory;
  late Future<List<CategorySub>> categorySubData;
  final CategorySubController _categorySubController = CategorySubController();

  @override
  void initState() {
    super.initState();
    ref.read(onLoadCategoryProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    categoryData = ref.watch(categoryNotifierProvider);
    selectedCategory = categoryData.first;
    if (selectedCategory != null) {
      categorySubData =
          _categorySubController.onGetAllCategorySub(selectedCategory!.name);
    }
    return Scaffold(
      appBar: AppBarWithSearchSwitch(
        onChanged: (value) {},
        appBarBuilder: (context) {
          return AppBar(
              title: const Text("All Category"),
              actions: const [AppBarSearchButton()]);
        },
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.shade200,
              child: ListView.builder(
                  itemCount: categoryData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          selectedCategory = categoryData[index];
                          if (selectedCategory != null) {
                            categorySubData = _categorySubController
                                .onGetAllCategorySub(selectedCategory!.name);
                          }
                        });
                      },
                      title: Text(
                        categoryData[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: selectedCategory == categoryData[index]
                                ? Colors.blueAccent
                                : Colors.black),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: selectedCategory != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedCategory!.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(selectedCategory!.banner),
                                  fit: BoxFit.scaleDown),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CategorySubWidget(
                            categorySubData: categorySubData,
                            onClick: (value) {
                              Get.to(
                                ProductScreen(
                                  categorySubData: value,
                                ),
                              );
                            },
                          )
                        ],
                      )
                    : Container(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
