import 'package:marketku/controllers/category_sub/category_sub_controller.dart';
import 'package:marketku/models/category_sub/category_sub.dart';
import 'package:marketku/providers/category/category_selected_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'category_sub_provider.g.dart';

@riverpod
class CategorySubNotifier extends _$CategorySubNotifier {
  late CategorySubController _categorySubController;
  @override
  Future<List<CategorySub>> build() async {
    _categorySubController = ref.read(categorySubControllerProvider);
    final selectedCategory = ref.watch(categorySelectedProvider);
    if (selectedCategory == null) return [];
    return _categorySubController.onGetAllCategorySub(selectedCategory.name);
  }

  Future<void> fetchCategorySub(String name) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _categorySubController.onGetAllCategorySub(name);
    });
  }
}
