import 'package:dio/dio.dart';
import 'package:marketku/global_variables.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/services/dio_controller.dart';

DioController _dioController = DioController();

class ProductController {
  Future<List<Product>> getAllProduct() async {
    try {
      final response = await _dioController.getDataList(
          url: "$ip/api/popular-product",
          fromJson: (value) => Product.fromMap(value));
      return response;
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}
