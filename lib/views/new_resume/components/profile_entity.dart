import 'package:flutter/material.dart';

import '../../../../constants/style.dart';

class ProfileEntity extends StatelessWidget {
  const ProfileEntity({Key? key, required this.name, required this.text, required this.onTap})
      : super(key: key);
  final String name;
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset(name, width: 35, height: 35, fit: BoxFit.cover,),
            SizedBox(height: 5,),
            Text(
              text,
              style: MyTextStyles.subHeadingBoldPrimary,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
