import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controllers/Utilites/urls.dart';
import 'constants.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef MyIntCallback(int);
typedef MyCategeoryCallback(dynamic, int);

class StaticFunctions {
  static void showNotification(BuildContext conx, String? note) {
   
// Flushbar(
//   message: note ?? "",
//   flushbarPosition: FlushbarPosition.TOP,

//   backgroundColor: Constants.PRIMARY_COLOR,
//   margin: EdgeInsets.all(8),
//   // borderRadius: 8,
// ).show(conx);

 }

  static void showSuccessNote(BuildContext context, String? note, Function? onOk ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: "",
      desc: note ?? "",
      // btnCancelOnPress: () {},
      btnOkOnPress: () {
        if (onOk != null){
          onOk();
        }
      },
    ).show();

    // showDialog(
    //     context: conx,
    //     barrierDismissible: false,
    //     builder: (context) {
    //       Future.delayed(const Duration(seconds: 1), () {
    //         Navigator.of(context).pop(true);
    //       });
    //       return AlertDialog(
    //         title: Text(
    //           note  ?? "" ,
    //           //?? AppLocalizations.of(context)!.done_succ,
    //           textAlign: TextAlign.center,
    //           style: const TextStyle(
    //             fontFamily: "Almarai",
    //             fontWeight: FontWeight.bold,
    //             fontSize: 12,
    //             color: Colors.green,
    //           ),
    //         ),
    //       );
    //     });
  }

  static bool checkValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static void showErrorNote(BuildContext context, String? note) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: "",
      desc: note ?? "",

      // btnCancelOnPress: () {},
      btnOkOnPress: () {},
      //  btnOkIcon: Icons.cancel,
      btnOkColor: Colors.red,
      // showCloseIcon: true,

      // headerAnimationLoop: false,

      // btnCancel: const SizedBox(width: 0, height: 0,),
    ).show();
    // showDialog(
    //     context: conx,
    //     barrierDismissible: false,
    //     builder: (context) {
    //       Future.delayed(const Duration(seconds: 2), () {
    //         Navigator.of(context).pop(true);
    //       });
    //       return AlertDialog(
    //         title: Text(
    //           note ?? Constants.SERVER_ERROR,
    //           textAlign: TextAlign.center,
    //           style: const TextStyle(
    //             fontFamily: "Almarai",
    //             fontWeight: FontWeight.bold,
    //             fontSize: 12,
    //             color: Colors.red,
    //           ),
    //         ),
    //       );
    //     });
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', token);
  }
static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('access_token');
    print(token);
    if (token != "" || token != null) {
      URL.USER_TOKEN = token ?? "";
    }
    return token ?? "";
  }

  // static Future<void> setFirstInstall() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('first_install', "true");
  // }

  // static Future<bool> checkFirstInstall() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('first_install');
  //   if (token != null) {
  //     return false;
  //   }
  //   return true;
  // }

  static Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('access_token');
  }

  static String addParamToLink(Map<String, Object> param, String link) {
    var index = 0;
    for (String key in param.keys) {
      if (index == 0) {
        if (param[key] != "" && param[key] != null) {
          index += 1;
          link += "?$key=${param[key]}";
        }
      } else {
        if (param[key] != "" && param[key] != null) {
          link += "&$key=${param[key]}";
        }
      }
    }
    return link;
  }

  // static Future<void> saveplayerId(String playerId) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.setString('playerId', playerId);
  // }

  // static Future<String> getplayerId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var playerId = prefs.getString('playerId');

  //   if (playerId != "") {
  //     Constants.PLAYER_ID = playerId ?? "";
  //   }
  //   return playerId ?? "";
  // }

  // static Future<void> removeplayerId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   prefs.remove('playerId');
  // }
}

extension StringValidators on String {
  passwortContianCapitalLetter() {
    RegExp regEx = RegExp(r"(?=.*[A-Z])\w+");
    return regEx.hasMatch(this);
  }

  passwortContianSmallLetter() {
    RegExp regEx = RegExp(r"(?=.*[a-z])\w+");
    return regEx.hasMatch(this);
  }

  passwortContianSpecialLetter() {
    RegExp regEx = RegExp(r"(?=.*?[!@#\$&*~])\w+");
    return regEx.hasMatch(this);
  }

  passwortContianNumber() {
    RegExp regEx = RegExp(r"(?=.*?[0-9])\w+");
    return regEx.hasMatch(this);
  }
  //(?=.*?[0-9])
}
