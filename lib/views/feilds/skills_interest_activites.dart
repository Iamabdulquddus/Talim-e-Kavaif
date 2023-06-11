import 'package:flutter/material.dart';
import '../../../constants/sqflite_constants.dart';
import '../../../constants/style.dart';
import '../../../controllers/resume_controller.dart';
import '../../../widgets/textformfeild.dart';
import 'package:get/get.dart';

class SkillsInterestActivities extends StatefulWidget {
  const SkillsInterestActivities({Key? key})
      : super(key: key);
  @override
  State<SkillsInterestActivities> createState() =>
      _SkillsInterestActivitiesState();
}

class _SkillsInterestActivitiesState extends State<SkillsInterestActivities> {
  ResumeController _resumeController = Get.find();
  String field = Get.arguments[SQ_USER_COMMON_ACTIVITY_TYPE];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          field,
          style: MyTextStyles.sectionTitleSmallPrimary,),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

          child: Column(
            children: [
              Form(
                child: Obx(
                  ()=> ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount:  field=="Skills" ? _resumeController.valueSkillController.value :
                      field=="Interests" ? _resumeController.valueInterestController.value :
                      field=="Languages" ? _resumeController.valueLanguageController.value :
                      field=="Achievements & Awards" ? _resumeController.valueAwardController.value :
                      _resumeController.valueActivityController.value  ,
                      itemBuilder: (context,index){
                        field=="Skills" ? _resumeController.listSkillController.add(TextEditingController()) :
                        field=="Interests" ? _resumeController.listInterestController.add(TextEditingController()) :
                        field=="Languages" ? _resumeController.listLanguageController.add(TextEditingController()) :
                        field=="Achievements & Awards" ? _resumeController.listAwardController.add(TextEditingController()) :
                        _resumeController.listActivityController.add(TextEditingController());
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Card(

                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),

                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        field,
                                        style: MyTextStyles.headingLargePrimary,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          field=="Skills" ? _resumeController.valueSkillController-- :
                                          field=="Interests" ? _resumeController.valueInterestController-- :
                                          field=="Languages" ? _resumeController.valueLanguageController-- :
                                          field=="Achievements & Awards" ? _resumeController.valueAwardController-- :
                                          _resumeController.valueActivityController--;
                                        },
                                        icon:  IconTheme(
                                          data: IconThemeData(
                                            color: Theme.of(context).brightness == Brightness.light ?Theme.of(context).primaryColor : Theme.of(context).indicatorColor,
                                          ),
                                          child:  const Icon(
                                            Icons.delete,
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
                                    children: [
                                      CustomTextFormFeild(
                                        controller: field=="Skills" ? _resumeController.listSkillController[index] :
                                        field=="Interests" ? _resumeController.listInterestController[index] :
                                        field=="Languages" ? _resumeController.listLanguageController[index] :
                                        field=="Achievements & Awards" ? _resumeController.listAwardController[index] :
                                        _resumeController.listActivityController[index] ,
                                        maxLines: 1,
                                        labelText: "${field}",
                                        keyboardType: TextInputType.text,
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
                      onPressed:  (){
                        _resumeController.addCommon(field);
                      },
                      child: Text('Save'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                          field=="Skills" ? _resumeController.valueSkillController++ :
                          field=="Interests" ? _resumeController.valueInterestController++ :
                          field=="Languages" ? _resumeController.valueLanguageController++ :
                          field=="Achievements & Awards" ? _resumeController.valueAwardController++ :
                          _resumeController.valueActivityController++;
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
