import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../constants/sqflite_constants.dart';
import '../models/common_list_model.dart';
import '../models/education_list_model.dart';
import '../models/experience_list_model.dart';
import '../models/publication_lsit_model.dart';
import '../models/reference_list_model.dart';
import '../models/user_resume_list_model.dart';

class DatabaseHelper {
  // database
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter for database

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/$USERS_INFO_DB';

    // open/ create database at a given path
    var studentsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return studentsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE $USER_BIO_TABLE (
                  $SQ_USER_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_NAME $SQ_KEY_TEXT,
                  $SQ_USER_EMAIL $SQ_KEY_TEXT, 
                  $SQ_USER_PHONE_NO $SQ_KEY_TEXT, 
                  $SQ_USER_DOB $SQ_KEY_TEXT, 
                  $SQ_USER_ADDRESS $SQ_KEY_TEXT, 
                  $SQ_USER_WEBSITE $SQ_KEY_TEXT,
                  $SQ_USER_OBJECTIVE $SQ_KEY_TEXT
                  )
                  ''');

    await db.execute('''Create TABLE $USER_EDUCATION_TABLE (
                  $SQ_EDUCATION_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_USER_GPA_OR_MARKS $SQ_KEY_TEXT,
                  $SQ_USER_JOIN_FROM_YEAR $SQ_KEY_TEXT,
                  $SQ_USER_END_TO_YEAR $SQ_KEY_TEXT,
                  $SQ_USER_UNI_OR_SCHOOL $SQ_KEY_TEXT,
                  $SQ_USER_DEGREE_OR_COURSE $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_EXPERIENCE_TABLE (
                  $SQ_EXPERIENCE_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_USER_COMPANY_NAME $SQ_KEY_TEXT,
                  $SQ_USER_JOB_TITLE $SQ_KEY_TEXT,
                  $SQ_USER_COMPANY_JOIN_FROM_YEAR $SQ_KEY_TEXT,
                  $SQ_USER_COMPANY_LEVE_TO_YEAR $SQ_KEY_TEXT,
                  $SQ_USER_DETAILS $SQ_KEY_TEXT
                   )
                  ''');

    await db.execute('''Create TABLE $USER_REFERENC_TABLE (
                  $SQ_REFERENC_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_REFERENC_NAME $SQ_KEY_TEXT,
                  $SQ_REFERENC_JOB_TITLE $SQ_KEY_TEXT,
                  $SQ_REFERENC_COMPANY_NAME $SQ_KEY_TEXT,
                  $SQ_REFERENC_EMAIL $SQ_KEY_TEXT,
                  $SQ_REFERENC_PHONE_NO $SQ_KEY_TEXT
                   )
                  ''');

    await db.execute('''Create TABLE $USER_PROJECTS_TABLE (
                  $SQ_PROJECTS_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_USER_PROJECTS_TITLE $SQ_KEY_TEXT,
                  $SQ_USER_PROJECTS_DETAILS $SQ_KEY_TEXT
                   )
                  ''');

    await db.execute('''Create TABLE $USER_PUBLICATION_TABLE (
                  $SQ_PUBLICATION_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_PUBLICATION_TITLE $SQ_KEY_TEXT,
                  $SQ_PUBLICATION_DETAILS $SQ_KEY_TEXT
                   )
                  ''');

    await db.execute('''Create TABLE $USER_COMMON_TABLE (
                  $SQ_USER_COMMON_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_USER_COMMON_ACTIVITY $SQ_KEY_TEXT,
                  $SQ_USER_COMMON_ACTIVITY_TYPE $SQ_KEY_TEXT
                   )
                  ''');
  }

  /// Get Last Resume Id
  Future<int> getLastId() async {
    List<UserResumeListModel> userList = [];
    Database db = await instance.database;
    var lastItem =
        await db.query(USER_BIO_TABLE, orderBy: "$SQ_USER_ID DESC", limit: 1);
    for (var userResumeListModel in lastItem) {
      userList.add(UserResumeListModel.fromJson(userResumeListModel));
    }
    return userList.isNotEmpty ? int.parse(userList[0].id.toString()) : 0;
  }

  /// Insert UserResumeListModel
  Future<int> insertUserBoi(UserResumeListModel userResumeListModel) async  {
    Database db = await instance.database;
    int result = await db.insert(USER_BIO_TABLE, userResumeListModel.toJson());
    return result;
  }

  /// Update UserResumeListModel
  Future<int> updateUserResumeListModel(
      UserResumeListModel userResumeListModel) async  {
    Database db = await instance.database;
    int result = await db.update(USER_BIO_TABLE, userResumeListModel.toJson(),
        where: 'id=?', whereArgs: [userResumeListModel.id]);
    return result;
  }

  /// Get All UserResumeListModel
  Future<List<UserResumeListModel>> getAll() async {
    List<UserResumeListModel> userlist = [];
    Database db = await instance.database;
    // read data from table
    List<Map<String, dynamic>> listMap = await db.query(USER_BIO_TABLE);
    for (var userResumeListModel in listMap) {
      userlist.add(UserResumeListModel.fromJson(userResumeListModel));
    }
    return userlist;
  }

  ///Update User Objective
  Future<int> updateUserResumeObjective(
      Map<String, dynamic> objectiveMap, int id) async {
    Database db = await instance.database;
    print(objectiveMap);
    int result = await db
        .update(USER_BIO_TABLE, objectiveMap, where: 'id=?', whereArgs: [id]);
    if (result == 0) {
      result = await db.insert(
        USER_BIO_TABLE,
        objectiveMap,
      );
    }
    return result;
  }

  /// Insert Education
  insertEducation(List<EducationListModel> list, int value) async {
    Database db = await instance.database;
    int? result;
    for (var educationListModel in list) {
      result =
          await db.insert(USER_EDUCATION_TABLE, educationListModel.toJson());
    }
    return result;
  }

  /// Get All Education
  Future<List<EducationListModel>> getAllEducation(int value) async {
    List<EducationListModel> userlist = [];
    Database db = await instance.database;
    // read data from table
    List<Map<String, dynamic>> listMap = await db.rawQuery(
        'SELECT * FROM $USER_EDUCATION_TABLE WHERE $SQ_USER_ID2 = $value'); //db.query(USER_EDUCATION);
    for (var educationListModel in listMap) {
      userlist.add(EducationListModel.fromJson(educationListModel));
    }
    print(userlist);
    return userlist;
  }

  /// Del Education Record By ID
  Future<int> deleteAllEducationByID(int id) async {
    Database db = await instance.database;
    int result = await db
        .delete(USER_EDUCATION_TABLE, where: '$SQ_USER_ID2=?', whereArgs: [id]);
    return result;
  }

  ///Experience Insertion
  insertExperience(List<ExperienceListModel> list, int value) async {
    Database db = await instance.database;
    int? result;
    for (var experienceListModel in list) {
      result =
          await db.insert(USER_EXPERIENCE_TABLE, experienceListModel.toJson());
    }
    return result;
  }

  /// Get All Experience
  Future<List<ExperienceListModel>> getAllExperienceById(int value) async {
    List<ExperienceListModel> userList = [];
    Database db = await instance.database;
    List<Map<String, dynamic>> listMap = await db.query(USER_EXPERIENCE_TABLE,
        where: '$SQ_USER_ID2=?', whereArgs: [value]);
    for (var educationListModel in listMap) {
      userList.add(ExperienceListModel.fromJson(educationListModel));
    }
    return userList;
  }

  /// Del Experience Record By ID
  Future<int> deleteAllExperienceByID(int id) async {
    Database db = await instance.database;
    int result = await db.delete(USER_EXPERIENCE_TABLE,
        where: '$SQ_USER_ID2=?', whereArgs: [id]);
    return result;
  }

  ///Reference Insertion
  insertReference(List<ReferenceListModel> list, int value) async {
    Database db = await instance.database;
    int? result;
    for (var referenceListModel in list) {
      result =
          await db.insert(USER_REFERENC_TABLE, referenceListModel.toJson());
    }
    return result;
  }

  /// Get All Reference
  Future<List<ReferenceListModel>> getAllReferenceById(int value) async {
    List<ReferenceListModel> userList = [];
    Database db = await instance.database;
    List<Map<String, dynamic>> listMap = await db.query(USER_REFERENC_TABLE,
        where: '$SQ_USER_ID2=?', whereArgs: [value]);
    for (var referenceListModel in listMap) {
      userList.add(ReferenceListModel.fromJson(referenceListModel));
    }
    return userList;
  }

  /// Del Reference Record By ID
  Future<int> deleteAllReferenceByID(int id) async {
    Database db = await instance.database;
    int result = await db
        .delete(USER_REFERENC_TABLE, where: '$SQ_USER_ID2=?', whereArgs: [id]);
    return result;
  }

  ///Publish List Insertion
  insertPublishList(List<PublicationListModel> list, int value) async {
    Database db = await instance.database;
    int? result;
    for (var publicationListModel in list) {
      result = await db.insert(
          USER_PUBLICATION_TABLE, publicationListModel.toJson());
    }
    return result;
  }

  /// Get All Publish
  Future<List<PublicationListModel>> getAllPublishListById(int value) async {
    List<PublicationListModel> userList = [];
    Database db = await instance.database;
    List<Map<String, dynamic>> listMap = await db.query(USER_PUBLICATION_TABLE,
        where: '$SQ_USER_ID2=?', whereArgs: [value]);
    for (var publicationListModel in listMap) {
      userList.add(PublicationListModel.fromJson(publicationListModel));
    }
    return userList;
  }

  /// Del Publish Record By ID
  Future<int> deleteAllPublishListByID(int id) async {
    Database db = await instance.database;
    int result = await db.delete(USER_PUBLICATION_TABLE,
        where: '$SQ_USER_ID2=?', whereArgs: [id]);
    return result;
  }

  ///USER COMMON List Insertion
  insertCommonList(List<CommonListModel> list, int value) async {
    Database db = await instance.database;
    int? result;
    for (var commonListModel in list) {
      result = await db.insert(USER_COMMON_TABLE, commonListModel.toJson());
    }
    return result;
  }

  /// Get All COMMON
  Future<List<CommonListModel>> getAllCommonListByIdAndType(
      int value, String activityType) async {
    List<CommonListModel> userList = [];
    Database db = await instance.database;
    List<Map<String, dynamic>> listMap = await db.rawQuery(
        'SELECT * FROM $USER_COMMON_TABLE WHERE ($SQ_USER_ID2 = $value AND $SQ_USER_COMMON_ACTIVITY_TYPE="$activityType" )');
    print(listMap);
    for (var commonListModel in listMap) {
      userList.add(CommonListModel.fromJson(commonListModel));
    }
    return userList;
  }

  /// Del COMMON Record By ID
  Future<int> deleteAllCommonListByIDAndType(
      int id, String activityType) async {
    Database db = await instance.database;
    int result = await db.rawDelete(
        'DELETE FROM $USER_COMMON_TABLE WHERE $SQ_USER_ID2 = $id AND $SQ_USER_COMMON_ACTIVITY_TYPE="$activityType" ');
    return result;
  }
}
