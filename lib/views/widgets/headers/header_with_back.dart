import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketku/utils/custom_colors.dart';

class HeaderWithBack extends StatelessWidget {
  const HeaderWithBack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Stack(
        children: [
          Image.asset(
            './assets/icons/searchBanner.jpeg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 16,
            top: 78,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Ink(
                width: 31,
                height: 31,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Positioned(
            left: 58,
            top: 68,
            child: SizedBox(
              width: 250,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: CustomColors.primary,
                    suffixIcon: Icon(Icons.camera),
                    suffixIconColor: CustomColors.primary,
                    fillColor: Colors.white,
                    filled: true,
                    focusColor: Colors.grey),
              ),
            ),
          ),
          Positioned(
            left: 311,
            top: 78,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  width: 31,
                  height: 31,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/bell.png"),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 354,
            top: 78,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  width: 31,
                  height: 31,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/message.png"),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
