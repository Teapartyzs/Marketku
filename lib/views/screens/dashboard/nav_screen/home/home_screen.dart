import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:get/get.dart';
import 'package:marketku/controllers/network/category/category_controller.dart';
import 'package:marketku/controllers/network/product/product_controller.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/views/screens/category/category_all_screen.dart';
import 'package:marketku/views/screens/category/category_screen.dart';
import 'package:marketku/views/widgets/banner_widget.dart';
import 'package:marketku/views/widgets/category/category_widget.dart';
import 'package:marketku/views/widgets/future_builder/future_builder_setup.dart';
import 'package:marketku/views/widgets/list/grid_builder.dart';
import 'package:marketku/views/widgets/product/item_product.dart';
import 'package:marketku/views/widgets/title_text_widget.dart';
import '../../../../../models/category/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  final CategoryController _categoryController = CategoryController();
  final ProductController _productController = ProductController();
  late Future<List<Category>> categoryData;
  late Future<List<Product>> productData;

  @override
  void initState() {
    super.initState();
    categoryData = _categoryController.loadCategory();
    productData = _productController.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithSearchSwitch(
          onChanged: (value) {},
          appBarBuilder: (context) {
            return AppBar(
              actions: const [
                Row(
                  children: [
                    AppBarSearchButton(),
                    Icon(Icons.notifications),
                    SizedBox(
                      width: 16,
                    )
                  ],
                )
              ],
            );
          }),
      body: RefreshIndicator(
        key: _refreshKey,
        onRefresh: () async {
          categoryData = _categoryController.loadCategory();
          productData = _productController.getAllProduct();
          await Future.delayed(const Duration(seconds: 2));
        },
        color: Colors.blueAccent,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            const BannerWidget(),
            TitleTextWidget(
              title: "Categories",
              subtitle: "View all",
              onClickSubTitle: () {
                Get.to(() => const CategoryAllScreen());
              },
            ),
            CategoryWidget(
              categoryData: categoryData,
              isNotSub: true,
              onCategorySelect: (categorySelected) {
                Get.to(CategoryScreen(category: categorySelected!));
              },
            ),
            TitleTextWidget(
                title: "Popular", subtitle: "View all", onClickSubTitle: () {}),
            FutureBuilderSetup<List<Product>>(
              data: productData,
              onSuccess: (products) {
                return GridBuilder(
                  data: products,
                  onTapAction: (product) {},
                  onBuild: (product) {
                    return ItemProduct(product: product);
                  },
                  isScroolDirection: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
