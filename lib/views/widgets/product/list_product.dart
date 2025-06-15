import 'package:flutter/material.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/views/widgets/product/item_product.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListProduct extends StatelessWidget {
  const ListProduct(
      {super.key, required this.isLoading, required this.productData});
  final bool isLoading;
  final List<Product> productData;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        itemCount: isLoading ? 4 : productData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 16),
        itemBuilder: (context, index) {
          if (isLoading) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 12,
                          width: 100,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 12,
                          width: 60,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return ItemProduct(product: productData[index]);
        },
      ),
    );
  }
}
