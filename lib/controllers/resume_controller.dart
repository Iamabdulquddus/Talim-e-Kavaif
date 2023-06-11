import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../constants/sqflite_constants.dart';
import '../models/common_list_model.dart';
import '../models/education_list_model.dart';
import '../models/experience_list_model.dart';
import '../models/publication_lsit_model.dart';
import '../models/reference_list_model.dart';
import '../models/user_resume_list_model.dart';
import '../rep/sqflite_rep.dart';
import '../widgets/show_toast.dart';

class ResumeController extends GetxController{
  ///BIO
  TextEditingController bioUserName = TextEditingController();
  TextEditingController bioUserEmail = TextEditingController();
  TextEditingController bioUserDOB = TextEditingController();
  TextEditingController bioUserAddress = TextEditingController();
  TextEditingController bioUserPhoneNo = TextEditingController();
  TextEditingController bioUserWebsite = TextEditingController();

  ///Error String
  RxString errorMsg = "".obs;

  ///Controllers
  RxInt valueEducationController = 1.obs;
  RxInt valueExperienceController = 1.obs;
  RxInt valueSkillController = 1.obs;
  RxInt valueAwardController = 1.obs;
  RxInt valueInterestController = 1.obs;
  RxInt valueLanguageController = 1.obs;
  RxInt valueActivityController = 1.obs;
  RxInt valueReferenceController = 1.obs;
  RxInt valuePublicationController = 1.obs;
  RxInt valueProjectController = 1.obs;

  /// List Of Controllers
  /// 1). Education
  List listDegreeOrCourseController = [].obs ;
  List listUniOrSchoolController = [].obs ;
  List listGPAOrMarksController = [].obs ;
  List listJoinFromYearController = [].obs ;
  List listJoinToYearController = [].obs;
  /// 2). Experience
  List listCompanyNameController = [].obs ;
  List listJobTitleController = [].obs ;
  List listStartingYearController = [].obs ;
  List listEndYearController = [].obs ;
  List listExperienceDetailsController = [].obs;
  /// 3). Skills
  List listSkillController = [].obs ;
  /// 4). Objective
  TextEditingController objectiveController = TextEditingController();
  /// 5). Reference
  List referenceNameController = [].obs ;
  List referenceJobTileController = [].obs ;
  List referenceCompanyNameController = [].obs ;
  List referenceEmailController = [].obs ;
  List referencePhoneNoController = [].obs ;
  /// 6). Publication
  List publicationTitleController = [].obs ;
  List publicationDisController = [].obs ;
  /// 7). Project
  List projectTitleController = [].obs ;
  List projectDisController = [].obs ;
  /// 8). Interest
  List listInterestController = [].obs ;
  /// 9). Language
  List listLanguageController = [].obs ;
  /// 10). Award
  List listAwardController = [].obs ;
  /// 11). Activity
  List listActivityController = [].obs ;




  /// Resume ID
  RxInt resumeId = 0.obs;

  /// Check Already Save Or Not
  RxBool checkAlreadySaveOrNot = false.obs;

  addBio() async {
    try {
      var dbHelper =  DatabaseHelper.instance;
      int result;
      if(checkAlreadySaveOrNot.isFalse){
        result = await dbHelper.insertUserBoi(
            UserResumeListModel(
                id: resumeId.value,
                name: bioUserName.text,
                email: bioUserEmail.text,
                phoneNo: bioUserPhoneNo.text,
                dob: bioUserDOB.text,
                address: bioUserAddress.text,
                website: bioUserWebsite.text,
                objective: "objective"
            )
        );
      }else{
        result = await dbHelper.updateUserResumeListModel(
            UserResumeListModel(
                id: resumeId.value,
                name: bioUserName.text,
                email: bioUserEmail.text,
                phoneNo: bioUserPhoneNo.text,
                dob: bioUserDOB.text,
                address: bioUserAddress.text,
                website: bioUserWebsite.text,
                objective: "objective"
            )
        );
        print("record update");
      }

      if( result > 0 ){
        ShowToast(message: 'Save Bio');
        print("${dbHelper.getAll()}");
        errorMsg.value = "";
        checkAlreadySaveOrNot = true.obs;
      }

    }on DatabaseException catch(e){
      print("DatabaseException ${e.getResultCode()}");
      if(e.getResultCode()==1555){
        resumeId.value++;
        errorMsg.value = "already saved";
        print("already saved");
        addBio();
      }if(e.getResultCode()==1){
        errorMsg.value = "no such table found";
      }else{
        print("DatabaseException $e");
        errorMsg.value = "Personal Details Not Save";
      }
    }catch (e){
      print("SqfliteExecption: $e");
      errorMsg.value = "Personal Details Not Save";
    }
  }

  addObjective() async {
    String objective = objectiveController.text;
    if(objective.isNotEmpty){
      try{
        Map<String,dynamic> objectiveMap ={
          SQ_USER_OBJECTIVE: objective
        };
        print("object1");
        var dbHelper =  DatabaseHelper.instance;
        int result = await dbHelper.updateUserResumeObjective( objectiveMap,resumeId.value);
        if(result>0){
          ShowToast(message: "Objective Saved");
        }else{
          print("not saved");
        }
      }on DatabaseException catch(e){
        print("DatabaseException=> $e");
      }catch(e){
        print(e);
      }
    }else{
      print("object");
    }

  }


  addEducations() async {
    List<EducationListModel> list = [];
    for(int lop=0;lop<listGPAOrMarksController.length;lop++){
      String marksOrGPA = listGPAOrMarksController[lop].text;
      String joinFromYear = listJoinFromYearController[lop].text;
      String joinToYear = listJoinToYearController[lop].text;
      String uniOrSchool = listUniOrSchoolController[lop].text;
      String degreeOrCourse = listDegreeOrCourseController[lop].text;
      if(marksOrGPA.isEmpty || joinFromYear.isEmpty || joinToYear.isEmpty || uniOrSchool.isEmpty || degreeOrCourse.isEmpty){
      }else {
        list.add(
            EducationListModel(
                user_id: resumeId.value,
                gpa_or_marks: marksOrGPA,
                join_from_year: joinFromYear,
                end_to_year: joinToYear,
                uni_or_school: uniOrSchool,
                degree_or_course: degreeOrCourse
            )
        );
      }
    }
    try{
      var dbHelper =  DatabaseHelper.instance;
      List<EducationListModel> allEducation = await dbHelper.getAllEducation(resumeId.value);
      print("allEducation=> ${allEducation.length}");
      if(allEducation.isNotEmpty){
        await dbHelper.deleteAllEducationByID(resumeId.value);
      }
      int result = await dbHelper.insertEducation(list,resumeId.value);
      if(result>0){
        ShowToast(message: "Education Detail Saved");
      }
    }catch(e){
      print(e);
    }
  }

  addExperience() async {
    List<ExperienceListModel> list = [];
    for(int lop=0;lop<listCompanyNameController.length;lop++){
      String companyName = listCompanyNameController[lop].text;
      String jobTitle = listJobTitleController[lop].text;
      String startingYear = listStartingYearController[lop].text;
      String endYear = listEndYearController[lop].text;
      String experienceDetails = listExperienceDetailsController[lop].text;
      if(companyName.isEmpty || jobTitle.isEmpty || startingYear.isEmpty || endYear.isEmpty || experienceDetails.isEmpty){
      }else {
        list.add(
            ExperienceListModel(
              user_id: resumeId.value,
              company_name: companyName,
              job_tile: jobTitle,
              join_from_year: startingYear,
              end_to_year: endYear,
              details: experienceDetails,
            )
        );
      }
    }
    try{
      var dbHelper =  DatabaseHelper.instance;
      List<ExperienceListModel> allExperience = await dbHelper.getAllExperienceById(resumeId.value);
      print("allExperience=> ${allExperience.length}");
      if(allExperience.isNotEmpty){
        await dbHelper.deleteAllExperienceByID(resumeId.value);
      }
      int result = await dbHelper.insertExperience(list,resumeId.value);
      if(result>0){
        ShowToast(message: "Experience Detail Saved");
      }
    }catch(e){
      print(e);
    }
  }

  addCommon(String commonActivityType) async {
    List<CommonListModel> list = [];
    for(int lop=0;lop<listSkillController.length;lop++){
      String skill = listSkillController[lop].text;
      if( skill.isEmpty ){
      }else {
        list.add(
            CommonListModel(
              userId: resumeId.value,
              commonActivity: skill,
              commonActivityType: commonActivityType
            )
        );
      }
    }
    try{
      var dbHelper =  DatabaseHelper.instance;
      List<CommonListModel> allCommon = await dbHelper.getAllCommonListByIdAndType(resumeId.value,commonActivityType);
      print("all$commonActivityType=> ${allCommon.length}");
      if(allCommon.isNotEmpty){
        await dbHelper.deleteAllCommonListByIDAndType(resumeId.value,commonActivityType);
      }
      int result = await dbHelper.insertCommonList(list,resumeId.value);
      if(result>0){
        ShowToast(message: "$commonActivityType Saved");
      }
    }catch(e){
      print(e);
    }
  }


  addReference() async {
    List<ReferenceListModel> list = [];
    for(int lop=0;lop<referencePhoneNoController.length;lop++){
      String referencePhoneNo = referencePhoneNoController[lop].text;
      String referenceEmail = referenceEmailController[lop].text;
      String referenceJobTitle = referenceJobTileController[lop].text;
      String referenceCompanyName = referenceCompanyNameController[lop].text;
      String referenceName = referenceNameController[lop].text;
      if( referencePhoneNo.isNotEmpty || referenceEmail.isNotEmpty ||
          referenceJobTitle.isNotEmpty || referenceCompanyName.isNotEmpty ||  referenceName.isNotEmpty  ){
        list.add(
            ReferenceListModel(
              referenceCompanyName: referenceCompanyName,
              referenceName: referencePhoneNo,
              referenceEmail: referenceEmail,
              referenceJobTitle: referenceJobTitle,
              userId: resumeId.value,
            )
        );
      }
    }
    try{
      var dbHelper =  DatabaseHelper.instance;
      List<ReferenceListModel> allReference = await dbHelper.getAllReferenceById(resumeId.value);
      print("allReference=> ${allReference.length}");
      if(allReference.isNotEmpty){
        await dbHelper.deleteAllReferenceByID(resumeId.value);
      }
      int result = await dbHelper.insertReference(list,resumeId.value);
      if(result>0){
        ShowToast(message: "Reference Saved");
      }
    }catch(e){
      print(e);
    }
  }

  addPublish() async {
    List<PublicationListModel> list = [];
    for(int lop=0;lop<publicationTitleController.length;lop++){
      String title = publicationTitleController[lop].text;
      String dis = publicationDisController[lop].text;
      if( title.isNotEmpty || dis.isNotEmpty ){
        list.add(
            PublicationListModel(
              publicationDetail: dis,
              publicationTitle: title,
              userId: resumeId.value,
            )
        );
      }
    }
    try{
      var dbHelper =  DatabaseHelper.instance;
      List allPublishList = await dbHelper.getAllPublishListById(resumeId.value);
      print("allPublishList=> ${allPublishList.length}");
      if(allPublishList.isNotEmpty){
        await dbHelper.deleteAllPublishListByID(resumeId.value);
      }
      int result = await dbHelper.insertPublishList(list,resumeId.value);
      if(result>0){
        ShowToast(message: "Publish Saved");
      }
    }catch(e){
      print(e);
    }
  }









  Future<int> getResumeId() async {
    int? value;
    try{
      var dbHelper =  DatabaseHelper.instance;
      value = resumeId.value = 1 + await dbHelper.getLastId();
      print("resumeId=> ${ resumeId.value }");
      }catch(e){
      print("Exception: $e");
    }
    return value!;
  }







}


