import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:marketku/global_variables.dart';

Dio getDio() {
  Dio dio;
  BaseOptions options = BaseOptions(
    baseUrl: ip,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );
  dio = Dio(options);

  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    },
  );

  return dio;
}

//NEW
extension DioServiceExtension on String {
  Future<void> postData<T>(
      Map map, void Function(T data, String message) onSuccess) async {
    try {
      final response = await getDio().post(this, data: map);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        onSuccess(response.data, response.statusMessage!);
      }
    } on DioException catch (e) {
      throw Exception(e.message ?? "Failed to send data, try again");
    }
  }

  Future<List<T>> getDataList<T>(
      T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await getDio().get(this);
      final List<dynamic> rawData = response.data;
      final List<T> result = rawData.map((value) => fromJson(value)).toList();
      return result;
    } on DioException catch (e) {
      throw Exception(
          e.response?.data.toString() ?? "Failed to get data, try again");
    }
  }
}

//OLD
class DioController {
  Future<List<T>> getDataList<T>(
      {required String url,
      required T Function(Map<String, dynamic>) fromJson}) async {
    try {
      final response = await getDio().get(url);
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
