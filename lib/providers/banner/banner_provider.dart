import 'package:marketku/controllers/banner/banner_controller.dart';
import 'package:marketku/models/banner/banner_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'banner_provider.g.dart';

@riverpod
class BannerNotifier extends _$BannerNotifier {
  late BannerController _bannerController;
  @override
  Future<List<BannerModel>> build() async {
    _bannerController = BannerController();
    return await _bannerController.loadBanners();
  }

  Future<void> fetchBanners() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await _bannerController.loadBanners();
    });
  }
}
