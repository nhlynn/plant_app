import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/cart_page.dart';
import 'package:plant_app/screen/favorite_page.dart';
import 'package:plant_app/screen/home_page.dart';
import 'package:plant_app/screen/profile_page.dart';
import 'package:plant_app/screen/scan_page.dart';

import 'model/plant.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;
  List<Plant> favoritePlantList = [];
  List<Plant> addToCartPlantList = [];

  List<Widget> pageList() {
    return [
      const HomePage(),
      FavoritePage(
        plantList: favoritePlantList,
      ),
      CartPage(
        plantList: addToCartPlantList,
      ),
      const ProfilePage(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> titleList = ['Home', 'Favorite', 'Cart', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.notifications,
              size: 30,
              color: Constants.blackColor,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pageList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageTransition(
                child: const ScanPage(), type: PageTransitionType.bottomToTop),
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Constants.primaryColor,
        child: Image.asset(
          'images/code-scan-two.png',
          height: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        activeColor: Constants.primaryColor,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() {
          _bottomNavIndex = index;
          final List<Plant> favoriteList = Plant.getFavoritedPlants();
          final List<Plant> addToCartList = Plant.addedToCartPlants();

          favoritePlantList = favoriteList;
          addToCartPlantList = addToCartList;
        }),
        //other params
      ),
    );
  }
}
