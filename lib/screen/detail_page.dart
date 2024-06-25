import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

import '../model/plant.dart';
import '../widget/plant_feature.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.plant,
  });

  final Plant plant;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleFavorite(bool isFavorite) {
    return !isFavorite;
  }

  bool toggleAddToCart(bool isAddToCart) {
    return !isAddToCart;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Plant> plantList = Plant.plantList;

    var plant = widget.plant;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.4),
                        shape: BoxShape.circle),
                    child: const Icon(Icons.close),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      plantList[plant.plantId].isFavorite =
                          toggleFavorite(plant.isFavorite);
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.4),
                        shape: BoxShape.circle),
                    child: Icon(plant.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(
                        plant.imageURL,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(title: 'Size', feature: plant.size),
                          PlantFeature(
                              title: 'Humidity',
                              feature: plant.humidity.toString()),
                          PlantFeature(
                              title: 'Temperature', feature: plant.temperature),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * .5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.4),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plant.plantName,
                            style: TextStyle(
                              fontSize: 30,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$${plant.price}',
                            style: TextStyle(
                              color: Constants.blackColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            plant.rating.toString(),
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Constants.primaryColor,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Constants.primaryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      plant.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 18,
                        color: Constants.blackColor.withOpacity(.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color:
                      plant.isSelected ? Constants.primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(.3),
                    ),
                  ]),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    setState(() {
                      plantList[plant.plantId].isSelected =
                          toggleAddToCart(plant.isSelected);
                    });
                  });
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color:
                      plant.isSelected ? Colors.white : Constants.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.primaryColor.withOpacity(.3),
                      )
                    ]),
                child: const Center(
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
