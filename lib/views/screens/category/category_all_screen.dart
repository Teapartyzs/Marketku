import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketku/controllers/network/category/category_controller.dart';
import 'package:marketku/controllers/network/category_sub/category_sub_controller.dart';
import 'package:marketku/global_variables.dart';
import 'package:marketku/views/screens/product/product_screen.dart';
import 'package:marketku/views/widgets/category/category_text_widget.dart';
import 'package:marketku/views/widgets/category_sub/category_sub_widget.dart';

import '../../../models/category/category.dart';
import '../../../models/category_sub/category_sub.dart';

class CategoryAllScreen extends StatefulWidget {
  const CategoryAllScreen({super.key});

  @override
  State<CategoryAllScreen> createState() => _CategoryAllScreenState();
}

class _CategoryAllScreenState extends State<CategoryAllScreen> {
  final CategoryController _categoryController = CategoryController();
  late Future<List<Category>> categoryData;
  Category? selectedCategory;

  final CategorySubController _categorySubController = CategorySubController();
  late Future<List<CategorySub>> categorySubData;

  @override
  void initState() {
    super.initState();
    categoryData = _categoryController.loadCategory();
    categoryData.then(
      (categories) {
        for (int i = 0; i < categories.length; i++) {
          var category = categories[i];
          if (i == 0) {
            setState(
              () {
                selectedCategory = category;
                if (selectedCategory != null) {
                  categorySubData = _categorySubController
                      .onGetAllCategorySub(selectedCategory!.name);
                }
              },
            );
            break;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              child: CategoryTextWidget(
                categoryData: categoryData,
                onSelected: (value) async {
                  setState(() {
                    selectedCategory = value;
                    if (selectedCategory != null) {
                      categorySubData = _categorySubController
                          .onGetAllCategorySub(selectedCategory!.name);
                    }
                  });
                },
                currentSelectedValue: selectedCategory,
              ),
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
