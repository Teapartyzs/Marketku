import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/global_variables.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/services/dio_service.dart';

class ProductController {
  Future<List<Product>> fetchAllPopularProduct() async {
    try {
      final response = await "$ip/api/popular-product"
          .getDataList<Product>((value) => Product.fromMap(value));
      return response;
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }

  Future<List<Product>> getAllProductByCategory(String categoryName) async {
    try {
      final response = await "$ip/api/product-by-category/$categoryName"
          .getDataList<Product>((value) => Product.fromMap(value));
      return response;
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}

final productControllerProvider = Provider<ProductController>((ref) {
  return ProductController();
});
