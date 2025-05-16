import 'package:dio/dio.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:marketku/global_variables.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/services/dio_controller.dart';

DioController _dioController = DioController();

class ProductController {
  Future<List<Product>> getAllProduct() async {
    try {
      final response = await "$ip/api/popular-product"
          .getDataList<Product>((value) => Product.fromMap(value));
      return response;
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }

  Future<List<Product>> getAllProductByCategory(categoryName: String) async {
    try {
      final response = await "$ip/api/product-by-category/$categoryName".getDataList<Product>((value) => Product.fromMap(value));
      return response;
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}
