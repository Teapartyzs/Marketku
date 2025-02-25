import 'dart:convert';

import 'package:marketku/global_variables.dart';
import 'package:marketku/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryController {
  Future<List<Category>> loadCategory() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$ip/api/category'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> dataDecode = jsonDecode(response.body);
        List<Category> result =
            dataDecode.map((category) => Category.fromJson(category)).toList();
        return result;
      } else {
        throw Exception("Failed to fetch category");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
