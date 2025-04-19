import 'package:get/get.dart';
import 'package:marketku/controllers/network/category_sub/category_sub_controller.dart';
import 'package:marketku/models/category/category.dart';
import 'package:marketku/models/category_sub/category_sub.dart';

class UseCategorySub extends GetxController {
  Future<List<CategorySub>>? categorySub;
  void onGetCategorySub(Category selectedCategory) {
    CategorySubController _categorySubController = CategorySubController();
    categorySub =
        _categorySubController.onGetAllCategorySub(selectedCategory.name);
  }
}
