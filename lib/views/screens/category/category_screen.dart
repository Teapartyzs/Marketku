import 'dart:math';

import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/controllers/category_sub/category_sub_controller.dart';
import 'package:marketku/models/category/category.dart';
import 'package:marketku/models/category_sub/category_sub.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/providers/product/product_provider.dart';
import 'package:marketku/views/screens/product/product_screen.dart';
import 'package:marketku/views/widgets/category_sub/category_sub_widget.dart';
import 'package:marketku/views/widgets/product/list_product.dart';
import 'package:marketku/views/widgets/title_text_widget.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key, required this.category});

  final Category category;

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  final _categorySubController = CategorySubController();
  late Future<List<CategorySub>> _categorySub;
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    try {
      setState(() {
        isLoading = true;
      });
      _categorySub =
          _categorySubController.onGetAllCategorySub(widget.category.name);
      // ref.read(onLoadProductByCategoryProvider(widget.category.name).future);
    } catch (_) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // List<Product> productData = ref.watch(productNotifierProvider);
    return Scaffold(
      appBar: AppBarWithSearchSwitch(
          onChanged: (value) {},
          appBarBuilder: (context) {
            return AppBar(
              title: Text(widget.category.name),
              actions: const [AppBarSearchButton()],
            );
          }),
      body: RefreshIndicator(
        key: _refreshKey,
        onRefresh: () async {
          loadData();
          await Future.delayed(const Duration(seconds: 2));
        },
        child:
            ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
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
                categorySubData: _categorySub,
                onClick: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductScreen(categorySubData: value)),
                  );
                },
              ),
              TitleTextWidget(
                  title: "Popular Product",
                  subtitle: "View all",
                  onClickSubTitle: () => {}),
              // ListProduct(isLoading: isLoading, productData: productData)
            ],
          ),
        ]),
      ),
    );
  }
}
