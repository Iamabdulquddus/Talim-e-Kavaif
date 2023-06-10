import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class OnBoardingPicture extends StatelessWidget {
  const OnBoardingPicture({Key? key, required this.image, required this.text}) : super(key: key);
 final String image, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            text,
            style: MyTextStyles.sectionTitleSmallPrimary,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
