import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/screen/detail_page.dart';

import '../model/plant.dart';
import '../widget/empty_widget.dart';
import '../widget/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key, required this.plantList});

  final List<Plant> plantList;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.plantList.isEmpty
          ? const EmptyWidget(
              imageUrl: 'images/favorited.png',
              message: 'No Favorite Plant',
            )
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: widget.plantList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  var plant = widget.plantList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: DetailPage(plant: plant),
                            type: PageTransitionType.bottomToTop),
                      );
                    },
                    child: PlantWidget(plant: plant),
                  );
                },
              ),
            ),
    );
  }
}