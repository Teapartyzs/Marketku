import 'package:flutter/material.dart';
import 'package:marketku/controllers/network/banner/banner_controller.dart';
import 'package:marketku/models/banner/banner_model.dart';
import 'package:marketku/views/helpers/custom_colors.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late Future<List<BannerModel>> bannerData;
  final BannerController _bannerController = BannerController();

  @override
  void initState() {
    super.initState();
    bannerData = _bannerController.loadBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: const BoxDecoration(color: CustomColors.secondary),
      child: FutureBuilder(
        future: bannerData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                "No banner data",
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return PageView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    snapshot.data![index].image,
                    fit: BoxFit.fill,
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  "No banners available",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
