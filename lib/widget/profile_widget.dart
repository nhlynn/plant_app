import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: Colors.black.withOpacity(.7),
              ),
              const SizedBox(width: 8,),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.8),
                  fontSize: 16,
                ),
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: Colors.black.withOpacity(.7),
          )
        ],
      ),
    );
  }
}
