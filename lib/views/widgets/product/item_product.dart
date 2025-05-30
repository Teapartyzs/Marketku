import 'package:flutter/material.dart';
import 'package:marketku/models/product/product.dart';
import 'package:marketku/utils/custom_colors.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: CustomColors.secondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(children: [
              Image.network(height: 160, width: 160, product.images[0]),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border_outlined),
              ),
            ]),
          ),
          Text(product.productName)
        ],
      ),
    );
  }
}
