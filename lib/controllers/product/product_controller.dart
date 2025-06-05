import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/global_variables.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/providers/product/product_provider.dart';
import 'package:marketku/services/dio_service.dart';

class ProductController {
  final Ref ref;
  ProductController({required this.ref});
  Future<List<Product>> getAllProduct() async {
    try {
      final response = await "$ip/api/popular-product"
          .getDataList<Product>((value) => Product.fromMap(value));
      ref.read(productNotifierProvider.notifier).setProduct(response);
      return response;
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }

  Future<List<Product>> getAllProductByCategory(String categoryName) async {
    try {
      final response = await "$ip/api/product-by-category/$categoryName"
          .getDataList<Product>((value) => Product.fromMap(value));
      ref.read(productNotifierProvider.notifier).setProduct(response);
      return response;
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}
