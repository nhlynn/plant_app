import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/plant.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    super.key,
    required this.plant,
  });

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 80,
      padding:
      const EdgeInsets.only(left: 10, top: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.8),
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(plant.imageURL),
                ),
              ),
              Positioned(
                top: 10,
                bottom: 0,
                left: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plant.category,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      plant.plantName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 2),
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
        ],
      ),
    );
  }
}