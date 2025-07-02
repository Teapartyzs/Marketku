import 'package:flutter/material.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/views/widgets/product/item_product.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key, required this.productData});
  final List<Product> productData;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      itemCount: productData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 16),
      itemBuilder: (context, index) {
        return ItemProduct(product: productData[index]);
      },
    );
  }
}
