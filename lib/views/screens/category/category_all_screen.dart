import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/providers/category/category_provider.dart';
import 'package:marketku/providers/category/category_selected_provider.dart';
import 'package:marketku/providers/category_sub/category_sub_provider.dart';
import 'package:marketku/views/screens/product/product_screen.dart';

class CategoryAllScreen extends ConsumerStatefulWidget {
  const CategoryAllScreen({super.key});

  @override
  ConsumerState<CategoryAllScreen> createState() => _CategoryAllScreenState();
}

class _CategoryAllScreenState extends ConsumerState<CategoryAllScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryData = ref.watch(categoryNotifierProvider);
    final categorySubData = ref.watch(categorySubNotifierProvider);
    final selectedCategory = ref.watch(categorySelectedProvider);
    return Scaffold(
      appBar: AppBarWithSearchSwitch(
        onChanged: (value) {},
        appBarBuilder: (context) {
          return AppBar(
              title: const Text("All Category"),
              actions: const [AppBarSearchButton()]);
        },
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.shade200,
              child: categoryData.when(
                data: (categories) => ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          ref.read(categorySelectedProvider.notifier).state =
                              categories[index];
                        },
                        title: Text(
                          categories[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: selectedCategory == categories[index]
                                  ? Colors.blueAccent
                                  : Colors.black),
                        ),
                      );
                    }),
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
                loading: () => const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: selectedCategory != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedCategory.name,
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
                                  image: NetworkImage(selectedCategory.banner),
                                  fit: BoxFit.scaleDown),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          categorySubData.when(
                            data: (value) => value.isNotEmpty
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: value.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 3,
                                            mainAxisSpacing: 3),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductScreen(
                                                        categorySubData:
                                                            value[index])),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                  value[index].image,
                                                  width: 45,
                                                  height: 45,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  maxWidth: 150),
                                              child: Text(
                                                value[index].subCategoryName,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox(),
                            error: (Object error, StackTrace stackTrace) {
                              return const SizedBox.shrink();
                            },
                            loading: () => const Center(
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
