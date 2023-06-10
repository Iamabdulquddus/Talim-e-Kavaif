import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../constants/style.dart';
import '../new_resume/new_resume.dart';
import 'components/resume_home_list_item.dart';



class ResumeCardHome extends StatefulWidget {
  const ResumeCardHome({Key? key}) : super(key: key);

  @override
  State<ResumeCardHome> createState() => _ResumeCardHomeState();
}

class _ResumeCardHomeState extends State<ResumeCardHome> {
  // ResumeController resumeController = Get.find();
  // List<Widget> tabItems = [
  //   ResumeCardHomeListItem(),
  //   ResumeCardGeneratedPDF(),
  //   ResumeCardAbout(),
  // ];

  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Maker'),
      ),
      body: ResumeCardHomeListItem(),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  primary,
        onPressed: () async {
          // await resumeController.getResumeId();
          Get.to(const NewResume());
        },
        child: const Icon(Icons.add, color: wWhiteColor,),
      ),
    );
  }
}