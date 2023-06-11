import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../controllers/resume_controller.dart';
import '../../../widgets/textformfeild.dart';
import 'package:get/get.dart';

class Education extends StatefulWidget {

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  ResumeController resumeController = Get.find();

  int numberOfTextFields = 1;

  CleanController(){
    resumeController.listUniOrSchoolController.clear();
    resumeController.listDegreeOrCourseController.clear();
    resumeController.listGPAOrMarksController.clear();
    resumeController.listJoinToYearController.clear();
    resumeController.listJoinFromYearController.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(resumeController.resumeId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Education", style: MyTextStyles.sectionTitleSmallPrimary,),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

          child: Column(
            children: [

              Form(
                child:  Obx(
                      ()=> ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: resumeController.valueEducationController.value,
                          itemBuilder: (context,index){
                            resumeController.listJoinFromYearController.add(TextEditingController());
                            resumeController.listJoinToYearController.add(TextEditingController());
                            resumeController.listDegreeOrCourseController.add(TextEditingController());
                            resumeController.listUniOrSchoolController.add(TextEditingController());
                            resumeController.listGPAOrMarksController.add(TextEditingController());
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Add Education",
                                            style: MyTextStyles.headingLargePrimary,
                                          ),

                                          IconButton(
                                            onPressed: () {
                                              CleanController();
                                              resumeController.valueEducationController.value--;
                                            },
                                            icon: IconTheme(
                                              data: IconThemeData(
                                                color: Theme.of(context).brightness == Brightness.light ?Theme.of(context).primaryColor : Theme.of(context).indicatorColor,
                                              ),
                                              child:   const Icon(
                                                Icons.delete,
                                              ),
                                            ),

                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: Column(
                                        children: [
                                          CustomTextFormFeild(
                                            controller: resumeController.listDegreeOrCourseController[index],
                                            maxLines: 1,
                                            labelText: 'Degree / Course',
                                            keyboardType: TextInputType.text,
                                          ),
                                          CustomTextFormFeild(
                                            controller: resumeController.listUniOrSchoolController[index],
                                            maxLines: 1,
                                            labelText: 'School / Universiy',
                                            keyboardType: TextInputType.text,
                                          ),
                                          CustomTextFormFeild(
                                            controller: resumeController.listGPAOrMarksController[index],
                                            maxLines: 1,
                                            labelText: 'Marks / CGPA',
                                            keyboardType: TextInputType.text,
                                          ),
                                          CustomTextFormFeild(
                                            controller: resumeController.listJoinFromYearController[index],
                                            maxLines: 1,
                                            labelText: 'From (year)',
                                            keyboardType: TextInputType.text,
                                            maxLenght: 4,
                                          ),
                                          CustomTextFormFeild(
                                            controller: resumeController.listJoinToYearController[index],
                                            maxLines: 1,
                                            labelText: 'To (year)',
                                            keyboardType: TextInputType.text,
                                            maxLenght: 4,
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

              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton(
                      onPressed: () {
                        resumeController.addEducations();
                      },
                      child: Text('Save'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // setState(() {
                          //   numberOfTextFields++;
                          // });
                          resumeController.valueEducationController.value++;
                        },

                        child: const Text('Add another'),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
