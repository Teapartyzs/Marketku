import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/models/banner/banner_model.dart';
import 'package:marketku/providers/banner/banner_provider.dart';
import 'package:marketku/services/dio_service.dart';

class BannerController {
  final Ref ref;
  BannerController(this.ref);
  Future<void> loadBanners() async {
    try {
      final response = await "/api/banner"
          .getDataList<BannerModel>((value) => BannerModel.fromJson(value));
      ref.read(bannerNotifierProvider.notifier).setBanners(response);
    } catch (err) {
      throw Exception(err);
    }
  }
}
