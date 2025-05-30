import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketku/providers/banner/banner_provider.dart';
import 'package:marketku/utils/custom_colors.dart';

class BannerWidget extends ConsumerWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerData = ref.watch(bannerNotifierProvider);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: const BoxDecoration(color: CustomColors.secondary),
      child: bannerData.isNotEmpty
          ? PageView.builder(
              itemCount: bannerData.length,
              itemBuilder: (context, index) {
                return Image.network(
                  bannerData[index].image,
                  fit: BoxFit.fill,
                );
              },
            )
          : const Center(
              child: Text(
                "No banners available",
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
