import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketku/controllers/category_controller.dart';
import 'package:marketku/controllers/dio_controller.dart';
import 'package:marketku/global_variables.dart';
import 'package:marketku/views/screens/product/product_screen.dart';
import 'package:marketku/views/widgets/category/category_text_widget.dart';
import 'package:marketku/views/widgets/category_sub/category_sub_widget.dart';
import 'package:marketku/views/widgets/header_with_back.dart';

import '../../../models/category.dart';
import '../../../models/category_sub.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController _categoryController = CategoryController();
  late Future<List<Category>> categoryData;
  Category? selectedCategory;

  final DioController _dioController = DioController();
  late Future<List<CategorySub>> categorySubData;

  @override
  void initState() {
    super.initState();
    categoryData = _categoryController.loadCategory();
    categoryData.then((categories) {
      for (int i = 0; i < categories.length; i++) {
        var category = categories[i];
        if (i == 0) {
          setState(() {
            selectedCategory = category;
            categorySubData = _dioController.getDataList(
                url: "$ip/api/category/${selectedCategory!.name}/categorysub",
                fromJson: (value) => CategorySub.fromJson(value));
          });
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 20),
          child: const HeaderWithBack()),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.shade200,
              child: CategoryTextWidget(
                categoryData: categoryData,
                onSelected: (value) {
                  setState(() {
                    selectedCategory = value;
                    categorySubData = _dioController.getDataList<CategorySub>(
                        url:
                            "$ip/api/category/${selectedCategory!.name}/categorysub",
                        fromJson: (json) => CategorySub.fromJson(json));
                  });
                },
                currentSelectedValue: selectedCategory,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: selectedCategory != null
                    ? Column(
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
                            height: 16,
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
              ))
        ],
      ),
    );
  }
}
