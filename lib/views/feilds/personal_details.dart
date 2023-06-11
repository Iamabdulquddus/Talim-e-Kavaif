import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../constants/style.dart';
import '../../../controllers/resume_controller.dart';
import '../../../widgets/date_picker.dart';
import '../../../widgets/pick_image.dart';
import '../../../widgets/text_error.dart';
import '../../../widgets/textformfeild.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({Key? key}) : super(key: key);

  final ResumeController resumeController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Personal Details",
          style: MyTextStyles.sectionTitleSmallPrimary,),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Text('   Profile Picture', style: MyTextStyles.headingxSmallBoldPrimary,),
            PickImage(),
            CustomTextFormFeild(
              controller: resumeController.bioUserName,
              keyboardType: TextInputType.name,
              icon: Icons.person,
              labelText: 'Name',
              maxLines: 1,
            ),

            CustomTextFormFeild(
              controller: resumeController.bioUserEmail,
              keyboardType: TextInputType.emailAddress,
              icon: Icons.email_rounded,
              labelText: 'Email',
              maxLines: 1,
            ),
            CustomTextFormFeild(
              controller: resumeController.bioUserPhoneNo,
              keyboardType: TextInputType.number,
              icon: Icons.call,
              labelText: 'Phone',
              maxLines: 1,
              maxLenght: 11,
            ),
            DatePicker(labelText: 'Date of Birth',controller: resumeController.bioUserDOB,),
            CustomTextFormFeild(
              controller: resumeController.bioUserWebsite,
              keyboardType: TextInputType.url,
              icon: Icons.laptop_chromebook,
              labelText: 'Website',
              maxLines: 1,
              maxLenght: 11,
            ),
            CustomTextFormFeild(
              controller: resumeController.bioUserAddress,
              keyboardType: TextInputType.text,
              icon: Icons.house,
              labelText: 'Address',
              maxLines: 2,
            ),
            SizedBox(height: 10,),
            FilledButton(onPressed: (){
              resumeController.addBio();
            }, child: Text("Save", style: MyTextStyles.headingxSmallPrimary,)),
            Obx(() => TextError(errorMsg: resumeController.errorMsg.value,)),
          ],
        ),
      ),
    );
  }
}
