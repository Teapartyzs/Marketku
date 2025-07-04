import 'package:marketku/models/banner/banner_model.dart';
import 'package:marketku/services/dio_service.dart';

class BannerController {
  Future<List<BannerModel>> loadBanners() async {
    try {
      final response = await "/api/banner"
          .getDataList<BannerModel>((value) => BannerModel.fromJson(value));
      return response;
    } catch (err) {
      throw Exception(err);
    }
  }
}
