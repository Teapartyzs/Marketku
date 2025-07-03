import 'package:dio/dio.dart';
import 'package:marketku/models/category/category.dart';
import 'package:marketku/services/dio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CategoryController {
  Future<List<Category>> loadCategory() async {
    try {
      final category = await "/api/category"
          .getDataList<Category>((value) => Category.fromJson(value));
      return category;
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}

final categoryControllerProvider = Provider((ref) {
  return CategoryController();
});
