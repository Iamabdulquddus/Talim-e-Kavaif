import 'package:get/get.dart';

import '../views/feilds/education.dart';
import '../views/feilds/experience.dart';
import '../views/feilds/objective.dart';
import '../views/feilds/personal_details.dart';
import '../views/feilds/project.dart';
import '../views/feilds/publication.dart';
import '../views/feilds/reference.dart';
import '../views/feilds/skills_interest_activites.dart';
import '../views/new_resume/new_resume.dart';
import '../views/resume_home/resume_home.dart';
import '../views/templates/select_template.dart';
import '../views/welcome/welcome.dart';

class MyRoutes {
  /// welcome screen comes first as initial route
  /// these are all the basic routes
  static String welcome = '/welcome'; //Welcome()/FeatureSelection()

  ///Now all the routes of the Resume
  //this ResumeCardHome is the home page for resume side of the app
  static String resumeCardHome = '/resume_card_home'; //ResumeCardHome()
  //this NewResume is added on the floating action button form first tab of resume home
  static String newResume = '/new_resume'; //NewResume()

  ///Now all the text Fields of the Resume builder
  ///
  static String personalDetails = '/personal_details'; //PersonalDetails()
  static String education = '/education'; //Education()
  static String experience = '/experience'; //Experience()
  static String objectives = '/objectives'; //Objectives()
  static String projects = '/projects'; //Projects()
  static String publication = '/publication'; //Publication()
  static String reference = '/reference'; //Reference()
  static String skillsInterestActivities =
      '/skills_interest_activities'; //SkillsInterestActivities()

  /// this route to preview the resume resumetemplate
  static String preview = '/preview'; //Preview()

  /// this route to preview the resume resumetemplate
  static String selectResumeTemplate =
      '/select_resume_template'; //SelectResumeTemplate()


  static String getWelcome() => welcome;


  static String getResumeCardHomeRoute() => resumeCardHome;
  static String getNewResumeRoute() => newResume;

  static String getPersonalDetailsRoute() => personalDetails;
  static String getEducationRoute() => education;
  static String getExperienceRoute() => experience;
  static String getObjectivesRoute() => objectives;
  static String getProjectsRoute() => projects;
  static String getPublicationRoute() => publication;
  static String getReferenceRoute() => reference;
  static String getSkillsInterestActivitiesRoute() => skillsInterestActivities;

  static String getSelectResumeTemplateRoute() => selectResumeTemplate;
  static String getPreviewRoute() => preview;


  static List<GetPage> appRoutes() => [

    GetPage(
        name: getWelcome(),

        transition: Transition.topLevel,
        page: ()=> const Welcome()
    ),



    ///Now all the routes of the Resume
    ///Resume Home page
    GetPage(
        name: getResumeCardHomeRoute(),
        transition: Transition.circularReveal,
        page: ()=> const ResumeCardHome(),
    ),
    GetPage(
        name: getNewResumeRoute(),
        transition: Transition.circularReveal,
        page: ()=> const NewResume()
    ),
    GetPage(
        name: getPersonalDetailsRoute(),
        transition: Transition.circularReveal,
        page: ()=> PersonalDetails()
    ),
    GetPage(
        name: getEducationRoute(),
        transition: Transition.circularReveal,
        page: ()=> Education()
    ),
    GetPage(
        name: getExperienceRoute(),
        transition: Transition.circularReveal,
        page: ()=> const Experience()
    ),
    GetPage(
        name: getObjectivesRoute(),
        transition: Transition.circularReveal,
        page: ()=> const Objectives()
    ),
    GetPage(
        name: getProjectsRoute(),
        transition: Transition.circularReveal,
        page: ()=> const Projects()
    ),
    GetPage(
        name: getPublicationRoute(),
        transition: Transition.circularReveal,
        page: ()=> const Publication()
    ),
    GetPage(
        name: getReferenceRoute(),
        transition: Transition.circularReveal,
        page: ()=> const Reference()
    ),
    GetPage(
        name: getSkillsInterestActivitiesRoute(),
        transition: Transition.circularReveal,
        page: ()=> SkillsInterestActivities()
    ),

    GetPage(
        name: getSelectResumeTemplateRoute(),
        transition: Transition.circularReveal,
        page: ()=> const SelectResumeTemplate()
    ),

  ];
}

