import 'package:dio/dio.dart';
import 'package:marketku/global_variables.dart';
import 'package:marketku/models/category_sub/category_sub.dart';
import 'package:marketku/services/dio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

DioController _dioController = DioController();

class CategorySubController {
  Future<List<CategorySub>> onGetAllCategorySub(String name) async {
    try {
      return _dioController.getDataList(
          url: "$ip/api/category/$name/categorysub",
          fromJson: (value) => CategorySub.fromJson(value));
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}

final categorySubControllerProvider = Provider((ref) {
  return CategorySubController();
});
