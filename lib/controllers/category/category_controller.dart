import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/models/category/category.dart';
import 'package:marketku/providers/category/category_provider.dart';
import 'package:marketku/services/dio_service.dart';

class CategoryController {
  final Ref ref;
  CategoryController({required this.ref});
  Future<void> loadCategory() async {
    try {
      final category = await "/api/category"
          .getDataList<Category>((value) => Category.fromJson(value));
      ref.read(categoryNotifierProvider.notifier).setCategory(category);
    } catch (e) {
      throw Exception(e);
    }
  }
}
