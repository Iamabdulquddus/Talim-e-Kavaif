import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/style.dart';
import '../../../controllers/resume_controller.dart';
import '../../../widgets/textformfeild.dart';

class Reference extends StatefulWidget {
  const Reference({Key? key}) : super(key: key);

  @override
  State<Reference> createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> {
  ResumeController resumeController = Get.find();
  int numberOfTextFields = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Reference",
          style: MyTextStyles.sectionTitleSmallPrimary,),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Form(
                child: Obx(
                  ()=> ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: resumeController.valueReferenceController.value,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        resumeController.referenceCompanyNameController.add(TextEditingController());
                        resumeController.referenceJobTileController.add(TextEditingController());
                        resumeController.referencePhoneNoController.add(TextEditingController());
                        resumeController.referenceNameController.add(TextEditingController());
                        resumeController.referenceEmailController.add(TextEditingController());
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
                                        "Add Reference",
                                        style: MyTextStyles.headingLargePrimary,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          resumeController.valueReferenceController.value--;
                                        },
                                        icon:  IconTheme(
                                          data: IconThemeData(
                                            color: Theme.of(context).brightness == Brightness.light ?Theme.of(context).primaryColor : Theme.of(context).indicatorColor,
                                          ),
                                          child:  const Icon(
                                            Icons.delete,
                                          ),
                                        ),),
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
                                        controller: resumeController.referenceNameController[index],
                                        maxLines: 1,
                                        labelText: 'Reference Name',
                                        keyboardType: TextInputType.name,
                                      ),
                                      CustomTextFormFeild(
                                        controller: resumeController.referenceJobTileController[index],
                                        maxLines: 1,
                                        labelText: 'Job Title',
                                        keyboardType: TextInputType.text,
                                      ),
                                      CustomTextFormFeild(
                                        controller: resumeController.referenceCompanyNameController[index],
                                        maxLines: 1,
                                        labelText: 'Company Name',
                                        keyboardType: TextInputType.name,
                                      ),
                                      CustomTextFormFeild(
                                        controller: resumeController.referenceEmailController[index],
                                        maxLines: 1,
                                        labelText: 'Email',
                                        keyboardType: TextInputType.emailAddress,

                                      ),
                                      CustomTextFormFeild(
                                        controller: resumeController.referencePhoneNoController[index],
                                        maxLines: 1,
                                        labelText: 'Phone',
                                        keyboardType: TextInputType.phone,
                                        maxLenght: 11,
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
                      onPressed: () {},
                      child: Text('Save'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                            resumeController.valueReferenceController.value++;
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
