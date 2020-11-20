import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String password;
  //a room reference
  CollectionReference courseCollection =
      FirebaseFirestore.instance.collection('courses');

  //KEYS
  final String mCourseName = 'courseName';
  final String mCourseKey = 'courseKey';
  // final String mCourseExamsStartDate = 'courseExamsStartDate';
  // final String mCourseExamsEndDate = 'courseExamsEndDate';
  // final String mCourseExamsStartTime = 'courseExamsStartTime';
  // final String mCourseExamsEndTime = 'courseExamsEndTime';
  // final String mCourseExamsTimeLimit = 'courseExamsTimeLimit';
  // final String mShowResults = 'showResults';
  // final String mViewRightAnswers = 'course';

  DatabaseService({this.password});

  Future createNewCourse(String name, String password) async {
    return await courseCollection.doc(password).set({
      mCourseName: name,
      mCourseKey: password,
    });
  }

  // //create course
  // Future createNewCourse(
  //     {@required String name,
  //     @required String key,
  //     @required String examsStartDate,
  //     @required String examsEndDate,
  //     @required String examsStartTime,
  //     @required String examsEndTime,
  //     @required String examsTimeLimit,
  //     @required bool showResults,
  //     @required bool viewRightAnswers}) async {

  // }
}
