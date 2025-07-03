import 'package:marketku/controllers/category_sub/category_sub_controller.dart';
import 'package:marketku/models/category_sub/category_sub.dart';
import 'package:marketku/providers/category/category_provider.dart';
import 'package:marketku/providers/category/category_selected_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'category_sub_provider.g.dart';

@riverpod
class CategorySubNotifier extends _$CategorySubNotifier {
  late CategorySubController _categorySubController;
  @override
  Future<List<CategorySub>> build() async {
    _categorySubController = ref.read(categorySubControllerProvider);
    final categoryData = ref.read(categoryNotifierProvider);
    final selectedCategory = ref.watch(categorySelectedProvider.notifier);
    return categoryData.when(
        data: (categories) {
          if (categories.isEmpty) {
            return [];
          }
          final firstCategory = categories.first;

          //default value buat category all screen
          selectedCategory.state = firstCategory;

          return _categorySubController.onGetAllCategorySub(firstCategory.name);
        },
        error: (error, stack) => throw error,
        loading: () => []);
  }

  Future<void> fetchCategorySub(String name) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _categorySubController.onGetAllCategorySub(name);
    });
  }
}
