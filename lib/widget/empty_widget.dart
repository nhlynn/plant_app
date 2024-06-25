import 'package:flutter/material.dart';

import '../constants.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.imageUrl,
    required this.message,
  });

  final String imageUrl;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            height: 100,
          ),
          Text(
            message,
            style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}