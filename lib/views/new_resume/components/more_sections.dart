import 'package:flutter/material.dart';
import '../../../../constants/style.dart';


class MoreSections extends StatelessWidget {
  const MoreSections({Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);
  final Widget icon;
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconTheme(
                  data: IconThemeData(
                    color: Theme.of(context).brightness == Brightness.light ?Theme.of(context).primaryColor : Theme.of(context).indicatorColor,
                  ),
                  child: icon,
                ),

               const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    text,
                    style: MyTextStyles.subHeadingBoldPrimary,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
