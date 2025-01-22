import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketku/controllers/state/use_category.dart';
import 'package:marketku/views/screens/category/category_all_screen.dart';
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
  final UseCategory _useCategory = UseCategory();
  late Future<List<Category>> categoryData;

  @override
  void initState() {
    super.initState();
    _useCategory.onGetCategory();
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
                Get.to(() => const CategoryAllScreen());
              },
            ),
            CategoryWidget(
              categoryData: _useCategory.category!,
              isNotSub: true,
              onCategorySelect: (categorySelected) {
                Get.to(CategoryScreen(category: categorySelected!));
              },
            )
          ],
        ),
      ),
    );
  }
}
