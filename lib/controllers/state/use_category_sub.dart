import 'package:get/get.dart';
import 'package:marketku/controllers/network/dio_controller.dart';
import 'package:marketku/global_variables.dart';
import 'package:marketku/models/category.dart';
import 'package:marketku/models/category_sub.dart';

class UseCategorySub extends GetxController {
  Future<List<CategorySub>>? categorySub;
  void onGetCategorySub(Category selectedCategory) {
    final DioController dioController = DioController();
    categorySub = dioController.getDataList(
        url: "$ip/api/category/${selectedCategory.name}/categorysub",
        fromJson: (value) => CategorySub.fromJson(value));
  }
}
