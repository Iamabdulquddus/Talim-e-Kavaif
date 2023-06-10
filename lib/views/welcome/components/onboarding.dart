import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'onboarding_picture.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

final controller = PageController(
  initialPage: 0,
);
int currentPage = 0;
List<Widget> pages = [
  // OnBoardingPicture(image: onboarding1, text: '',),
  // OnBoardingPicture(image: onboarding2, text: '',),
  // OnBoardingPicture(image: onboarding3, text: '',),
];

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            children: pages,
            onPageChanged: (index){
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: DotsIndicator(
            dotsCount: pages.length,
            position: currentPage.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),
      ],
    );
  }
}
