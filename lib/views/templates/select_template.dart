import 'package:flutter/material.dart';
import 'package:talim_e_kavaif/views/templates/template_name.dart';
import '../../../constants/images.dart';
import '../../constants/style.dart';
import '../preview/preview.dart';

class SelectResumeTemplate extends StatelessWidget {
  const SelectResumeTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: List.generate(
            templateName.length,
            (index) {
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        primary.withOpacity(0.1),
                        Colors.white,
                        tertiary.withOpacity(0.3)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Preview(
                          template: templateName[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 180,
                    color: Colors.black12,
                    child: Image.asset(
                      'assets/images/resumetemplate/template${index + 1}.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}