import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/style.dart';
import '../../../controllers/resume_controller.dart';
import '../../../widgets/textformfeild.dart';

class Publication extends StatefulWidget {
  const Publication({Key? key}) : super(key: key);

  @override
  State<Publication> createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  ResumeController _resumeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Publication",
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
                    Obx(
                      ()=> ListView.builder(
                          itemCount: _resumeController.valuePublicationController.value,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            _resumeController.publicationTitleController.add(TextEditingController());
                            _resumeController.publicationDisController.add(TextEditingController());
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Card(

                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10,),

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Add Publication",
                                            style: MyTextStyles.headingLargePrimary,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                                _resumeController.valuePublicationController.value--;
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
                                            controller: _resumeController.publicationTitleController[index],
                                            maxLines: 1,
                                            labelText: 'Title',
                                            keyboardType: TextInputType.text,
                                          ),
                                          CustomTextFormFeild(
                                            controller: _resumeController.publicationDisController[index],
                                            maxLines: 1,
                                            labelText: 'Description',
                                            keyboardType: TextInputType.text,
                                            maxLenght: 50,
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
                        _resumeController.addPublish();
                      },
                      child: Text('Save'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {
                            _resumeController.valuePublicationController.value++;
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
