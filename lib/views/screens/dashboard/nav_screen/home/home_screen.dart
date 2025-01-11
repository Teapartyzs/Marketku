import 'package:flutter/material.dart';
import 'package:marketku/controllers/category_controller.dart';
import 'package:marketku/views/widgets/banner_widget.dart';
import 'package:marketku/views/widgets/category_widget.dart';
import 'package:marketku/views/widgets/header.dart';
import 'package:marketku/views/widgets/title_text_widget.dart';

import '../../../../../models/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoryController _categoryController = CategoryController();
  late Future<List<Category>> categoryData;

  @override
  void initState() {
    super.initState();
    categoryData = _categoryController.loadCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const BannerWidget(),
            const TitleTextWidget(title: "Categories", subtitle: "View all"),
            CategoryWidget(
                categoryData: categoryData,
                isNotSub: true,
                onCategorySelect: (categorySelected) {})
          ],
        ),
      ),
    );
  }
}
