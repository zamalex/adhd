import 'package:flutter/material.dart';
// import 'package:tarea_hospital/Provider/city_model.dart';
// import 'package:tarea_hospital/Provider/user_model.dart';
import 'package:easy_localization/easy_localization.dart';

// import '../Providers/user.dart';

class Constants {
  // static Constants? _instance;
  // Constants._();

  // factory Constants() => _instance ??= new Constants._();

  // static const DOMAIN = "https://restaurants.badee.com.sa/api/";

  // //Auth Apis
  // static String CHECK_PHONE_URL = DOMAIN + "auth/verifyMobile";

  //Global colors
  static Color MAIN_COLOR = Color.fromRGBO(147, 70, 159, 1);
    static Color LIGHT_MAIN_COLOR = Color.fromRGBO(228, 207, 232, 1);
    static Color SHADOW_MAIN_COLOR = Color.fromRGBO(147, 70, 159, 0.25);
  static Color DARK_MAIN_COLOR = Color.fromRGBO(147, 70, 159, 1);

  static Color LIGHT_GRAY = Color.fromRGBO(241, 241, 241, 1);
  static Color DARK_GRAY = Color.fromRGBO(148, 147, 147, 1);

  static Color MAIN_TEXT_COLOR = Colors.black;
  static Color WHITE_BACKGROUND = Colors.white;
  static String FONT_FAMILY_NAME = "Audiowide";


  static String LOCAL_IMAGE_PATH = "assets/images/";

  //Audiowide

  // static UserModel CURRENT_USER = UserModel();

  // static String PLAYER_ID = "";
  // static Map<String, String> HEADER() {
  //   return {
  //     "Authorization": "Bearer " + Constants.USER_TOKEN,
  //     "Accept_Language": ui.window.locale.languageCode,
  //     "Content-Type": 'application/json',
  //     // "Accept": 'application/json'
  //   };
  // }

  static var NO_INTERNET_CONNECTION =
      'Failed to fetch data. is your device online?'.tr();
  static var SERVER_ERROR = 'server error ... try again later'.tr();
}
