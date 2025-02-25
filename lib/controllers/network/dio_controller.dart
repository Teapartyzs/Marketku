import 'package:dio/dio.dart';

final dio = Dio();

extension DioControllerExtension on String {
  Future<void> postData<T>(
      Map map, void Function(T data, String message) onSuccess) async {
    try {
      final response = await dio.post(this, data: map);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        onSuccess(response.data, response.statusMessage!);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data.toString() ?? "Failed to send data");
    }
  }
}

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
