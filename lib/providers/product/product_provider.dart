import 'package:dio/dio.dart';
import 'package:marketku/global_variables.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/services/dio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  @override
  Future<List<Product>> build() async {
    return getAllProduct();
  }

  void clearProduct() {
    state = const AsyncData([]);
  }

  Future<void> refreshGetAllProduct() async {
    state = const AsyncLoading();
    try {
      state = AsyncData(await getAllProduct());
    } on DioException catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<List<Product>> getAllProduct() async {
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
