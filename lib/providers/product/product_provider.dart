import 'package:marketku/controllers/product/product_controller.dart';
import 'package:marketku/models/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class ProductNotifier extends _$ProductNotifier {
  late ProductController _productController;
  @override
  Future<List<Product>> build() async {
    _productController = ref.read(productControllerProvider);
    return _productController.fetchAllPopularProduct();
  }

  Future<void> refreshFetchAllPopularProduct() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _productController.fetchAllPopularProduct();
    });
  }
}
