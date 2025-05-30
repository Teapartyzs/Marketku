import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/controllers/product/product_controller.dart';
import 'package:marketku/models/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
ProductController productController(Ref ref) {
  return ProductController(ref: ref);
}

@riverpod
Future<void> onLoadProduct(Ref ref) async {
  await ref.read(productControllerProvider).getAllProduct();
}

@riverpod
Future<void> onLoadProductByCategory(Ref ref, String categoryName) async {
  await ref
      .read(productControllerProvider)
      .getAllProductByCategory(categoryName);
}

@riverpod
class ProductNotifier extends _$ProductNotifier {
  @override
  List<Product> build() {
    return [];
  }

  void setProduct(List<Product> products) {
    clearProduct();
    state = products;
  }

  void clearProduct() {
    state = [];
  }
}
