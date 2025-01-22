import 'dart:convert';

import 'package:marketku/global_variables.dart';
import 'package:marketku/models/banner_model.dart';
import 'package:http/http.dart' as http;

class BannerController {
  Future<List<BannerModel>> loadBanners() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$ip/api/banner'),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> dataDecode = jsonDecode(response.body);
        List<BannerModel> result =
            dataDecode.map((banner) => BannerModel.fromJson(banner)).toList();
        return result;
      } else {
        throw Exception("failed to fetch data");
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
