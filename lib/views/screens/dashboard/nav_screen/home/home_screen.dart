import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/models/category/category.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/providers/banner/banner_provider.dart';
import 'package:marketku/providers/category/category_provider.dart';
import 'package:marketku/providers/product/product_provider.dart';
import 'package:marketku/views/screens/category/category_all_screen.dart';
import 'package:marketku/views/screens/category/category_screen.dart';
import 'package:marketku/views/widgets/banner/banner_widget.dart';
import 'package:marketku/views/widgets/product/list_product.dart';
import 'package:marketku/views/widgets/title_text_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  late Future<List<Product>> productData;
  var isLoading = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    loadData(false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      loadData(true);
    }
  }

  void loadData(bool isRefresh) async {
    try {
      if (!isRefresh) {
        setState(() {
          isLoading = true;
        });
      }
      await Future.wait([
        ref.read(onLoadBannersProvider.future),
        ref.read(onLoadCategoryProvider.future),
        ref.read(onLoadProductProvider.future),
      ]);
    } catch (_) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Category> categoryData = ref.watch(categoryNotifierProvider);
    List<Product> productData = ref.watch(productNotifierProvider);
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
            Skeletonizer(
              enabled: isLoading,
              child: const BannerWidget(),
            ),
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
            Skeletonizer(
              enabled: isLoading,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                itemCount: isLoading ? 4 : categoryData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  if (isLoading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 12,
                          width: 40,
                          color: Colors.grey[300],
                        )
                      ],
                    );
                  }
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CategoryScreen(category: categoryData[index])),
                    ),
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
            ),
            TitleTextWidget(
                title: "Popular", subtitle: "View all", onClickSubTitle: () {}),
            ListProduct(isLoading: isLoading, productData: productData)
          ],
        ),
      ),
    );
  }
}
