import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/detail_page.dart';

import '../model/plant.dart';
import '../widget/plant_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<String> plantType = [
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
    'Supplement',
  ];

  bool toggleFavorite(bool isFavorite) {
    return !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade400,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black54.withOpacity(.6),
                  ),
                  const Expanded(
                    child: TextField(
                      showCursor: false,
                      decoration: InputDecoration(
                        hintText: 'Search Plant',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.mic,
                    color: Colors.black54.withOpacity(.6),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: plantType.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Text(
                        plantType[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: _selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * .3,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: plantList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  var plant = plantList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                plant: plant,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    plantList[index].isFavorite =
                                        toggleFavorite(plant.isFavorite);
                                  });
                                },
                                icon: Icon(
                                  plant.isFavorite == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Constants.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            left: 50,
                            right: 50,
                            bottom: 50,
                            child: Image.asset(plant.imageURL),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  plant.category,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  plant.plantName,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '\$${plant.price}',
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                'New Plants',
                style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: size.height * .5,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: plantList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  var plant = plantList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                plant: plant,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: PlantWidget(plant: plant),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
