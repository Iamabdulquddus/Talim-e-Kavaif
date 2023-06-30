import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../constants/images.dart';
import '../../../constants/sqflite_constants.dart';
import '../../../constants/style.dart';
import '../../../routes/routes.dart';
import '../feilds/skills_interest_activites.dart';
import 'components/more_sections.dart';
import 'components/profile_entity.dart';

class NewResume extends StatefulWidget {
  const NewResume({Key? key}) : super(key: key);

  @override
  State<NewResume> createState() => _NewResumeState();
}

class _NewResumeState extends State<NewResume> {
  // ResumeController resumeController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(resumeController.resumeId.value);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
         title: Text("New Resume", style: MyTextStyles.sectionTitleSmallPrimary,),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: [
                  ProfileEntity(
                    name: personal,
                    text: 'BASICS',
                    onTap: () {
                      Get.toNamed(MyRoutes.getPersonalDetailsRoute());
                    },
                  ),
                  ProfileEntity(
                   name: education,
                    text: 'EDUCATION',
                    onTap: () {
                      Get.toNamed(MyRoutes.getEducationRoute());
                    },
                  ),
                  ProfileEntity(
                   name: experience,
                    text: 'EXPERIENCE',
                    onTap: () {
                      Get.toNamed(MyRoutes.getExperienceRoute());
                    },
                  ),
                  ProfileEntity(
                    name: skills,
                    text: 'SKILLS',
                    onTap: () {
                      Get.toNamed(
                          MyRoutes.getSkillsInterestActivitiesRoute(),
                          arguments: {SQ_USER_COMMON_ACTIVITY_TYPE:"Skills"});
                      // Get.toNamed( SkillsInterestActivities(
                      //   field: 'Skill',
                      // ));
                    },
                  ),
                  ProfileEntity(
                   name: objectives,
                    text: 'OBJECTIVES',
                    onTap: () {
                      Get.toNamed(MyRoutes.getObjectivesRoute());
                    },
                  ),
                  ProfileEntity(
                    name: reference,
                    text: 'REFERENCE',
                    onTap: () {
                      Get.toNamed(MyRoutes.getReferenceRoute());
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'More Sections',
                  style: MyTextStyles.headingSmallPrimary,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      MoreSections(
                        icon: const FaIcon(
                          FontAwesomeIcons.thumbsUp,
                          // color: Colors.grey.shade700,
                          size: 25,
                        ),
                        text: 'Interests',
                        onTap: () {
                          Get.toNamed(
                              MyRoutes.getSkillsInterestActivitiesRoute(),
                              arguments: {SQ_USER_COMMON_ACTIVITY_TYPE:"Interests"});
                        },
                      ),
                      MoreSections(
                        icon: const FaIcon(
                          FontAwesomeIcons.diagramProject,
                          // color: Colors.grey.shade700,
                          size: 25,
                        ),
                        text: 'Projects',
                        onTap: () {
                          Get.toNamed(MyRoutes.getProjectsRoute());
                        },
                      ),
                      MoreSections(
                        icon: const FaIcon(
                          FontAwesomeIcons.language,
                          // color: Colors.grey.shade700,
                          size: 25,
                        ),
                        text: 'Language',
                        onTap: () {
                          Get.toNamed(
                              MyRoutes.getSkillsInterestActivitiesRoute(),
                              arguments: {SQ_USER_COMMON_ACTIVITY_TYPE:"Languages"});

                        },
                      ),
                      MoreSections(
                        icon: const FaIcon(
                          FontAwesomeIcons.trophy,
                          // color: Colors.grey.shade700,
                          size: 25,
                        ),
                        text: 'Achievements & Awards',
                        onTap: () {
                          Get.toNamed(
                              MyRoutes.getSkillsInterestActivitiesRoute(),
                              arguments: {SQ_USER_COMMON_ACTIVITY_TYPE:"Achievements & Awards"});

                        },
                      ),
                      MoreSections(
                        icon: const FaIcon(
                          FontAwesomeIcons.personRunning,
                          size: 25,
                        ),
                        text: 'Activities',
                        onTap: () {
                          Get.toNamed(
                              MyRoutes.getSkillsInterestActivitiesRoute(),
                              arguments: {SQ_USER_COMMON_ACTIVITY_TYPE:"Activities"});
                        },
                      ),
                      MoreSections(
                        icon: const FaIcon(
                          FontAwesomeIcons.graduationCap,
                          // color: Colors.grey.shade700,
                          size: 25,
                        ),
                        text: 'Publication',
                        onTap: () {
                          Get.toNamed(MyRoutes.getPublicationRoute());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [

                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () {
                          Get.toNamed(MyRoutes.getSelectResumeTemplateRoute());
                        },

                        icon:  const Icon(
                          Icons.school,
                        ),
                        label: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "  Select Template",
                            style: MyTextStyles.headingSmallPrimary,
                          ),
                        ),
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
