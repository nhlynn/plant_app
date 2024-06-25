import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class PlantFeature extends StatelessWidget {
  const PlantFeature({super.key, required this.title, required this.feature});

  final String title;
  final String feature;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Constants.blackColor,
          ),
        ),
        Text(
          feature,
          style: TextStyle(
            fontSize: 18,
            color: Constants.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
