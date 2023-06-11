import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../controllers/resume_controller.dart';
import '../../../widgets/textformfeild.dart';
import 'package:get/get.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  ResumeController _resumeController = Get.find();
  int numberOfTextFields = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Education",style: MyTextStyles.sectionTitleSmallPrimary,),
        elevation: 1,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                   // for (int i = 0; i < numberOfTextFields; i++)
                      Obx(
                        ()=> ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: _resumeController.valueExperienceController.value,
                            itemBuilder: (context,index){
                              _resumeController.listCompanyNameController.add(TextEditingController());
                              _resumeController.listStartingYearController.add(TextEditingController());
                              _resumeController.listEndYearController.add(TextEditingController());
                              _resumeController.listExperienceDetailsController.add(TextEditingController());
                              _resumeController.listJobTitleController.add(TextEditingController());
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, ),

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Add Experience",
                                              style: MyTextStyles.headingLargePrimary,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                // CleanController();
                                                _resumeController.valueExperienceController.value--;
                                              },
                                              icon: IconTheme(
                                                data: IconThemeData(
                                                  color: Theme.of(context).brightness == Brightness.light ?Theme.of(context).primaryColor : Theme.of(context).indicatorColor,
                                                ),
                                                child:   const Icon(
                                                  Icons.delete,
                                                  // color: primary,
                                                ),
                                              ),

                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(thickness: 1,),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 5),
                                        child: Column(
                                          children:  [
                                            CustomTextFormFeild(
                                              controller: _resumeController.listCompanyNameController[index],
                                              maxLines: 1,
                                              labelText: 'Company Name',
                                              keyboardType: TextInputType.text,
                                            ),
                                            CustomTextFormFeild(
                                              controller: _resumeController.listJobTitleController[index],
                                              maxLines: 1,
                                              labelText: 'Job Title',
                                              keyboardType: TextInputType.text,
                                            ),
                                            CustomTextFormFeild(
                                              controller: _resumeController.listStartingYearController[index],
                                              maxLines: 1,
                                              labelText: 'Start (year)',
                                              keyboardType: TextInputType.number,
                                              maxLenght: 4,
                                            ),
                                            CustomTextFormFeild(
                                              maxLines: 1,
                                              controller: _resumeController.listEndYearController[index],
                                              labelText: 'End (year)',
                                              keyboardType: TextInputType.number,
                                              maxLenght: 4,
                                            ),
                                            CustomTextFormFeild(
                                              controller: _resumeController.listExperienceDetailsController[index],
                                              maxLines: 3,
                                              labelText: 'Details',
                                              keyboardType: TextInputType.text,
                                              maxLenght: 120,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),

                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton(
                      onPressed: () {
                        _resumeController.addExperience();
                      },
                      child: Text('Save'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                            _resumeController.valueExperienceController.value++;
                        },

                        child: const Text('Add another'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
