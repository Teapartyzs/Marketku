import 'package:marketku/global_variables.dart';
import 'package:marketku/models/category_sub/category_sub.dart';
import 'package:marketku/services/dio_controller.dart';

DioController _dioController = DioController();

class CategorySubController {
  Future<List<CategorySub>> onGetAllCategorySub(String name) async {
    try {
      return _dioController.getDataList(
          url: "$ip/api/category/$name/categorysub",
          fromJson: (value) => CategorySub.fromJson(value));
    } catch (e) {
      rethrow;
    }
  }
}
