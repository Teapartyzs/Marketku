import 'package:flutter/material.dart';
import 'package:marketku/models/category_sub/category_sub.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, this.categorySubData});
  final CategorySub? categorySubData;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.categorySubData != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(widget.categorySubData!.subCategoryName),
            ),
          )
        : const Scaffold();
  }
}
