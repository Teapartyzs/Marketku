import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:marketku/controllers/category_controller.dart';
import 'package:marketku/views/screens/category/category_screen.dart';
import 'package:marketku/views/widgets/banner_widget.dart';
import 'package:marketku/views/widgets/category/category_widget.dart';
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
            TitleTextWidget(
              title: "Categories",
              subtitle: "View all",
              onClickSubTitle: () {
                Get.to(() => const CategoryScreen());
              },
            ),
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
