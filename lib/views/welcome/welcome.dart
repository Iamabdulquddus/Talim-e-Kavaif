import 'package:flutter/material.dart';
import 'components/onboarding.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            Expanded(child: OnBoarding()),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
