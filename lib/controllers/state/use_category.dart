import 'package:get/get.dart';
import 'package:marketku/controllers/network/category/category_controller.dart';

import '../../models/category/category.dart';

class UseCategory extends GetxController {
  Future<List<Category>>? category;
  void onGetCategory() {
    final CategoryController categoryController = CategoryController();
    category = categoryController.loadCategory();
  }
}
