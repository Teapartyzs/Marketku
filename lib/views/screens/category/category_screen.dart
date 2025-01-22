import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketku/controllers/state/use_category_sub.dart';
import 'package:marketku/models/category.dart';
import 'package:marketku/views/screens/product/product_screen.dart';
import 'package:marketku/views/widgets/category_sub/category_sub_widget.dart';
import 'package:marketku/views/widgets/header_with_back.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});

  final Category category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final UseCategorySub _useCategorySub = UseCategorySub();

  @override
  void initState() {
    super.initState();
    _useCategorySub.onGetCategorySub(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 20),
          child: const HeaderWithBack()),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.category.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.category.banner),
                      fit: BoxFit.scaleDown),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CategorySubWidget(
                categorySubData: _useCategorySub.categorySub!,
                onClick: (value) {
                  Get.to(
                    ProductScreen(
                      categorySubData: value,
                    ),
                  );
                },
              )
            ],
          )),
    );
  }
}
