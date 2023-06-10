import 'package:flutter/material.dart';

import '../constants/style.dart';
class TextError extends StatelessWidget {
  TextError({Key? key,required this.errorMsg}) ;
  String errorMsg ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Center( child: Text(errorMsg,style: TextStyle(fontSize: 17,color: primary),)),
    );
  }
}
