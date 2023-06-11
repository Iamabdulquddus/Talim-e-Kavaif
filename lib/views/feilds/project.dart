import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/style.dart';
import '../../../controllers/resume_controller.dart';
import '../../../widgets/textformfeild.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  ResumeController _resumeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Projects",
           style: MyTextStyles.sectionTitleSmallPrimary,),
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
                    Obx(() => ListView.builder(
                      itemCount: _resumeController.valueProjectController.value,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context,index){
                        _resumeController.projectTitleController.add(TextEditingController());
                        _resumeController.projectDisController.add(TextEditingController());
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Card(

                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Add Project",
                                        style: MyTextStyles.headingLargePrimary,
                                      ),

                                      IconButton(
                                        onPressed: () {
                                            _resumeController.valueProjectController.value--;
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
                                        controller: _resumeController.projectTitleController[index],
                                        maxLines: 1,
                                        labelText: 'Title',
                                        keyboardType: TextInputType.text,
                                      ),
                                      CustomTextFormFeild(
                                        controller: _resumeController.projectDisController[index],
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
                      },
                    )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton(
                    onPressed: () {
                      // _resumeController.addProject();
                      },
                    child: Text('Save'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                          _resumeController.valueProjectController.value++;
                      },

                      child: const Text('Add another'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
