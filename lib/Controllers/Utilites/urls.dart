import 'dart:io';
import 'dart:ui' as ui;

import '../../Models/sub_user.dart';


class URL {
  //static const DOMAIN = "http://flowserver-001-site1.ctempurl.com/api/";
  static const DOMAIN = "https://arabtesting.org:50144/api/";
  static const PARTITION = "MobileApp/";
  static const DOMAIN_WITH_PARTITION = DOMAIN + PARTITION;

  //Auth Apis
  static String LOGIN_URL = DOMAIN + "Account/Login";
  static String AUDIO_URL = DOMAIN_WITH_PARTITION + "Media/Audios/Mindfulness";
  static String VIDEO_URL = DOMAIN_WITH_PARTITION + "Media/Videos/Educational";
  static String FILES_URL = DOMAIN_WITH_PARTITION + "Media/Files/Educational";
  static String PARENT_REPORTS_URL = DOMAIN_WITH_PARTITION + "ParentAllReportsForAuser";
  static String TEACHER_REPORTS_URL = DOMAIN_WITH_PARTITION + "TeacherAllReportsForAuser";
  static String TRAINER_REPORTS_URL = DOMAIN_WITH_PARTITION + "TrainerAllReportsForAuser";
  static String PSYCHO_REPORTS_URL = DOMAIN_WITH_PARTITION + "ParentAllReportsForAuser";
  static String BEHAVIORAL_PROBLEMS_FILES_URL = DOMAIN_WITH_PARTITION + "Media/Files/BehavioralProblems";
  static String NOTIFICATIONS_URL = DOMAIN_WITH_PARTITION + "NotificationPatient";
  static String STATIC_NOTIFICATIONS_URL = DOMAIN_WITH_PARTITION + "Notification";
  static String FORGET_PASSWORD_EMAIL_URL = DOMAIN + "Account/ForgetPassword";
  static String PASSWORD_RESET_EMAIL_URL = DOMAIN + "Account/ResetPassword";
  static String DELETE_ACCOUNT_URL = DOMAIN + "Account/DeactivateUser/";


//Account/DeactivateUser/55
  //Profile Apis
   static String PROFILE_URL = DOMAIN + "Account/Profile";
  // static String CHANGE_PASSWORD_URL =
  //     DOMAIN_WITH_API + "Account/ChangePassword";

//Routin Apis
  static String GET_ROUTIN_URL = DOMAIN_WITH_PARTITION + "PatientRoutines";
  static String POST_ROUTIN_URL = DOMAIN_WITH_PARTITION + "RouitnePointAnswer";
  static String POST_CHILD_ROUTIN_URL = DOMAIN_WITH_PARTITION + "PatientRoutineAnswer";
  static String GET_SUB_URL = DOMAIN_WITH_PARTITION + "Sub";
  static String GET_DAILY_NOTES_QUESTIONS_URL = DOMAIN_WITH_PARTITION + "AllReports";
  static String SUBMIT_SUB_USER_ANSWER_URL = DOMAIN_WITH_PARTITION + "ReportAnswer";


  static String SEND_NOTIFICATION = DOMAIN_WITH_PARTITION + "NotificationParent";

  static String userID='';
  static String userType = '';
  static SubUser? selectedChild;



  static var NO_INTERNET_CONNECTION =
      'Failed to fetch data. is your device online?';
  static var SERVER_ERROR = 'server error ... try again later';

  static String USER_TOKEN = "";

  static Map<String, String> HEADER() {
    return {
      "Authorization": "Bearer ${URL.USER_TOKEN}",
      "Accept-Language":  "en",
      // 'Content-Type': 'application/json',
      // HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
      "Content-Type": "application/json; charset=utf-8",
      'Accept': 'text/plain',

      // "Accept": 'application/json'
    };
  }

  static Map<String, String> MULTIPART_HEADER() {
    return {
      "Authorization": "Bearer ${URL.USER_TOKEN}",

    };
  }
  static Map<String, String> HEADERWithoutCharset() {
    return {
      "Authorization": "Bearer " + URL.USER_TOKEN,
      "Accept-Language": "en",
      // 'Content-Type': 'application/json',
      // HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
      'Accept': 'text/plain',


      // "Accept": 'application/json'
    };
  }
}
