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
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: wWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(1, 2),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset(name, width: 35, height: 35, fit: BoxFit.cover,),
            SizedBox(height: 3,),
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
