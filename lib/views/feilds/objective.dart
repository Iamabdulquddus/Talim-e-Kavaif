import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import 'package:get/get.dart';
import '../../../controllers/resume_controller.dart';
import '../../../widgets/textformfeild.dart';

class Objectives extends StatefulWidget {
  const Objectives({Key? key}) : super(key: key);

  @override
  State<Objectives> createState() => _ObjectivesState();
}

class _ObjectivesState extends State<Objectives> {
  final ResumeController _resumeController = Get.find();
  int numberOfTextFields = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Objective",
          style: MyTextStyles.sectionTitleSmallPrimary,),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Card(

              child: Column(
                children: [
                  Padding(

                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 8),

                    child: Row(
                      children: [
                        Text(
                          "Add Objective",
                          style: MyTextStyles.headingLargePrimary,
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 5),
                    child: Column(
                      children: [
                        CustomTextFormFeild(
                          controller: _resumeController.objectiveController,
                          maxLines: 3,
                          labelText: 'Objective',
                          keyboardType: TextInputType.text,
                          maxLenght: 150,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      _resumeController.addObjective();
                    },
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
