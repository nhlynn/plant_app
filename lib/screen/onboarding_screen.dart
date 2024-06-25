import 'package:flutter/material.dart';
import 'package:plant_app/screen/login_screen.dart';

import '../constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: null,
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              PageWidget(
                image: 'images/plant-one.png',
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              PageWidget(
                image: 'images/plant-two.png',
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
              PageWidget(
                image: 'images/plant-three.png',
                title: Constants.titleThree,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(currentIndex),
            ),
          ),
          Positioned(
              bottom: 60,
              right: 30,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        pageController.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeIn);
                      }
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (route) => const LoginScreen()));
                    }
                  });
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Constants.primaryColor,
                ),
              ))
        ],
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  const PageWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 350,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _buildIndicator(int currentIndex) {
  List<Widget> indicators = [];
  for (int i = 0; i < 3; i++) {
    if (i == currentIndex) {
      indicators.add(_indicator(true));
    } else {
      indicators.add(_indicator(false));
    }
  }
  return indicators;
}

Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(microseconds: 300),
    height: 10,
    width: isActive ? 20 : 8,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      color: Constants.primaryColor,
      borderRadius: BorderRadius.circular(5),
    ),
  );
}
