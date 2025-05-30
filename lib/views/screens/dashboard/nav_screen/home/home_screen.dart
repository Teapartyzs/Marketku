import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:marketku/controllers/product/product_controller.dart';
import 'package:marketku/models/category/category.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/providers/banner/banner_provider.dart';
import 'package:marketku/providers/category/category_provider.dart';
import 'package:marketku/views/screens/category/category_all_screen.dart';
import 'package:marketku/views/screens/category/category_screen.dart';
import 'package:marketku/views/widgets/banner/banner_widget.dart';
import 'package:marketku/views/widgets/future_builder/future_builder_setup.dart';
import 'package:marketku/views/widgets/product/item_product.dart';
import 'package:marketku/views/widgets/title_text_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  final ProductController _productController = ProductController();
  late Future<List<Product>> productData;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    productData = _productController.getAllProduct();
    ref.read(onLoadBannersProvider.future);
    ref.read(onLoadCategoryProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categoryData = ref.watch(categoryNotifierProvider);
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
          loadData();
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
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              itemCount: categoryData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      Get.to(CategoryScreen(category: categoryData[index])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.network(
                            height: 50, width: 50, categoryData[index].image),
                      ),
                      Text(
                        categoryData[index].name,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              },
            ),
            TitleTextWidget(
                title: "Popular", subtitle: "View all", onClickSubTitle: () {}),
            FutureBuilderSetup<List<Product>>(
              data: productData,
              onSuccess: (products) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: ItemProduct(product: products[index]),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
