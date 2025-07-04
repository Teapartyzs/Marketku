import 'package:marketku/controllers/category/category_controller.dart';
import 'package:marketku/models/category/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  late CategoryController _categoryController;
  @override
  Future<List<Category>> build() async {
    _categoryController = ref.watch(categoryControllerProvider);
    return _categoryController.loadCategory();
  }

  Future<void> refreshFetchAllCategory() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _categoryController.loadCategory();
    });
  }
}
