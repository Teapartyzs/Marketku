import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/controllers/banner/banner_controller.dart';
import 'package:marketku/models/banner/banner_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'banner_provider.g.dart';

@riverpod
Future<BannerController> bannerController(Ref ref) async {
  return BannerController(ref);
}

@riverpod
Future<void> onLoadBanners(Ref ref) async {
  final bannerController = await ref.read(bannerControllerProvider.future);
  await bannerController.loadBanners();
}

@riverpod
class BannerNotifier extends _$BannerNotifier {
  @override
  List<BannerModel> build() {
    return [];
  }

  void setBanners(List<BannerModel> banners) {
    clearBanners();
    state = banners;
  }

  void clearBanners() {
    state = [];
  }
}
