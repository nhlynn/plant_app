import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/screen/detail_page.dart';

import '../constants.dart';
import '../model/plant.dart';
import '../widget/empty_widget.dart';
import '../widget/plant_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.plantList});

  final List<Plant> plantList;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalAmount() {
    int sum = 0;
    for (var plant in widget.plantList) {
      sum += plant.price;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.plantList.isEmpty
          ? const EmptyWidget(
              imageUrl: 'images/add-cart.png',
              message: 'Your cart is empty.',
            )
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
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
                  Column(
                    children: [
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${totalAmount()}',
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
