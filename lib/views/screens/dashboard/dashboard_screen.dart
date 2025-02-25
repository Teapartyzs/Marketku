import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:marketku/views/helpers/custom_colors.dart';
import 'package:marketku/views/screens/dashboard/nav_screen/cart/cart_screen.dart';
import 'package:marketku/views/screens/dashboard/nav_screen/favorite/favorite_screen.dart';
import 'package:marketku/views/screens/dashboard/nav_screen/home/home_screen.dart';
import 'package:marketku/views/screens/dashboard/nav_screen/profile/profile_screen.dart';
import 'package:marketku/views/screens/dashboard/nav_screen/stores/stores_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  int _pageIndex = 0;
  final List<Widget> pages = const [
    HomeScreen(),
    FavoriteScreen(),
    StoresScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: CustomColors.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Iconify(
              Zondicons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Iconify(
                Zondicons.heart,
              ),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Iconify(
                Zondicons.explore,
              ),
              label: "Stores"),
          BottomNavigationBarItem(
              icon: Iconify(
                Zondicons.shopping_cart,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Iconify(
                Zondicons.user,
              ),
              label: "Profile")
        ],
      ),
      body: pages[_pageIndex],
    );
  }
}
