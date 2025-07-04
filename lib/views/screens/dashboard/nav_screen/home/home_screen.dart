import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/providers/banner/banner_provider.dart';
import 'package:marketku/providers/category/category_provider.dart';
import 'package:marketku/providers/category/category_selected_provider.dart';
import 'package:marketku/providers/product/product_provider.dart';
import 'package:marketku/views/screens/category/category_all_screen.dart';
import 'package:marketku/views/screens/category/category_screen.dart';
import 'package:marketku/views/widgets/banner/banner_widget.dart';
import 'package:marketku/views/widgets/product/item_product.dart';
import 'package:marketku/views/widgets/title_text_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  late Future<List<Product>> productData;
  var isLoading = false;

  void loadData(bool isRefresh) async {
    try {
      if (!isRefresh) {
        setState(() {
          isLoading = true;
        });
      }
      ref
          .read(productNotifierProvider.notifier)
          .refreshFetchAllPopularProduct();
      ref.read(categoryNotifierProvider.notifier).refreshFetchAllCategory();
      ref.read(bannerNotifierProvider.notifier).fetchBanners();
    } catch (_) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(categoryNotifierProvider, (previous, next) {
      if (next is AsyncData) {
        final categories = next.value!;
        if (categories.isNotEmpty) {
          ref.read(categorySelectedProvider.notifier).state = categories.first;
        }
      }
    });
    final productData = ref.watch(productNotifierProvider);
    final categoryData = ref.watch(categoryNotifierProvider);
    final bannerData = ref.watch(bannerNotifierProvider);
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
          loadData(true);
          await Future.delayed(const Duration(seconds: 2));
        },
        color: Colors.blueAccent,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            bannerData.when(
                data: (banners) => BannerWidget(bannerData: banners),
                loading: () => const Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                error: (error, stack) =>
                    const Text("Something went wrong with banner")),
            TitleTextWidget(
              title: "Categories",
              subtitle: "View all",
              onClickSubTitle: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryAllScreen(),
                  ),
                );
              },
            ),
            categoryData.when(
              loading: () => const Center(
                  child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              )),
              data: (category) => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                itemCount: category.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryScreen(category: category[index])),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Image.network(
                              height: 50, width: 50, category[index].image),
                        ),
                        Text(
                          category[index].name,
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
              error: (Object error, StackTrace stackTrace) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(error.toString()),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ),
            TitleTextWidget(
                title: "Popular", subtitle: "View all", onClickSubTitle: () {}),
            productData.when(
              loading: () => const Center(
                  child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              )),
              data: (product) => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                itemCount: product.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return ItemProduct(product: product[index]);
                },
              ),
              error: (Object error, StackTrace stackTrace) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(error.toString()),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
