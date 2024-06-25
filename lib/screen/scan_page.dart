import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.share,
                      color: Constants.primaryColor,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/code-scan.png',
                      height: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tap to Scan',
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
