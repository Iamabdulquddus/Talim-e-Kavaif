import 'package:flutter/material.dart';
import '../../../../constants/images.dart';
import '../../../../constants/style.dart';

class ResumeCardHomeListItem extends StatelessWidget {
  const ResumeCardHomeListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: lightColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(2, 2),
              ),
              const BoxShadow(
                color: Colors.white,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(-2, -2),
              ),
            ],
          ),
          // elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        resumeBro,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Muhammad Abdul Quddus',
                            style: MyTextStyles.headingLargePrimary,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Angelayu@gmail.com',
                            style: MyTextStyles.headingxSmallGrey,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('03004400443',
                              style: MyTextStyles.headingxSmallGrey),
                          Text('Oct 25, 2022 02:18 pm',
                              style: MyTextStyles.headingxSmallGrey),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: secondary.withOpacity(0.3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                          ),
                          label: const Text(
                            "Edit",
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: primary,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
