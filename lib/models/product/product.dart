import 'dart:convert';

class Product {
  final String id;
  final String productName;
  final int productPrice;
  final String vendorId;
  final String fullname;
  final int quantity;
  final String category;
  final String subCategory;
  final List<String> images;
  final bool popular;
  final bool recommend;

  Product(
      {required this.id,
      required this.productName,
      required this.productPrice,
      required this.vendorId,
      required this.fullname,
      required this.quantity,
      required this.category,
      required this.subCategory,
      required this.images,
      required this.popular,
      required this.recommend});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "_id": id,
      "productName": productName,
      "productPrice": productPrice,
      "vendorId": vendorId,
      "fillname": fullname,
      "quantity": quantity,
      "category": category,
      "subCategory": subCategory,
      "images": images,
      "popular": popular,
      "recommend": recommend
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['_id'],
        productName: map['productName'],
        productPrice: map['productPrice'],
        vendorId: map['vendorId'],
        fullname: map['fullname'],
        quantity: map['quantity'],
        category: map['category'],
        subCategory: map['subCategory'],
        images: map['images'],
        popular: map['popular'],
        recommend: map['recommend']);
  }
}
