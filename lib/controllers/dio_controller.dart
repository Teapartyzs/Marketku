import 'package:dio/dio.dart';

class DioController {
  Future<List<T>> getDataList<T>(
      {required String url,
      required T Function(Map<String, dynamic>) fromJson}) async {
    try {
      final dio = Dio();
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        if (response.data != null) {
          List<dynamic> decodeData = response.data;
          List<T> result = decodeData.map((value) => fromJson(value)).toList();
          return result;
        } else {
          return List.empty();
        }
      } else {
        throw Exception("failed to fetch data");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
