import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/controllers/category/category_controller.dart';
import 'package:marketku/models/category/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
CategoryController categoryController(Ref ref) {
  return CategoryController(ref: ref);
}

@riverpod
Future<void> onLoadCategory(Ref ref) async {
  final categoryController = ref.read(categoryControllerProvider);
  await categoryController.loadCategory();
}

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  @override
  List<Category> build() {
    return [];
  }

  void setCategory(List<Category> category) {
    clearCategory();
    state = category;
  }

  void clearCategory() {
    state = [];
  }
}
