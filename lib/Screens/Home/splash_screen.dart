import 'dart:io';

import 'package:adhd/Screens/Auth/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../Controllers/Utilites/urls.dart';
import '../../Controllers/profile_controller.dart';
import '../../Utilities/constants.dart';
import '../../Utilities/static_functions.dart';
import '../Onboarding/onboarding.dart';
import '../Routine/routine_list_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getProfile() async {
    print("profile");
    String token = await StaticFunctions.getToken();
    print(token);
    if (token != "") {
      URL.USER_TOKEN = token;
      // }
      //   print(token);
      //   //  await NotificationsController.updateDeviceToken();

      try {
        var response = await ProfileController.getProfile();
        // if (Constants.PLAYER_ID != "") {
        //   // NotificationController.subscribe(Constants.PLAYER_ID);
        // }
        Navigator.pushReplacementNamed(context, RoutineListScreen.id);
      } on SocketException catch (error) {
      Navigator.pushReplacementNamed(context, OnboardingScreen.id);
      } catch (error) {
      Navigator.pushReplacementNamed(context, OnboardingScreen.id);
      }
    } else {
      Navigator.pushReplacementNamed(context, OnboardingScreen.id);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => initPlugin());
    //  AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
    //   _appLifecycleReactor = AppLifecycleReactor(
    //     appOpenAdManager: appOpenAdManager);
    getProfile();
  }

  Future<void> initPlugin() async {
//if you have any conditions, you can add a if loop here
    var _authStatus;

    // try {
    //   final TrackingStatus status =
    //       await AppTrackingTransparency.trackingAuthorizationStatus;
    //   setState(() => _authStatus = '$status');
    //   // If the system can show an authorization request dialog
    //   if (status == TrackingStatus.notDetermined) {
    //     // Show a custom explainer dialog before the system dialog
    //     if (await showCustomTrackingDialog(context)) {
    //       // Wait for dialog popping animation
    //       await Future.delayed(const Duration(milliseconds: 200));
    //       // Request system's tracking authorization dialog
    //       final TrackingStatus status =
    //           await AppTrackingTransparency.requestTrackingAuthorization();
    //       setState(() => _authStatus = '$status');
    //     }
    //   }
    // } on PlatformException {
    //   setState(() => _authStatus = 'PlatformException was thrown');
    // }

    // final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    // print("UUID: $uuid");

    // Platform messages may fail, so we use a try/catch PlatformException.
  }

  // Future<bool> showCustomTrackingDialog(BuildContext context) async =>
  //     await showDialog<bool>(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: const Text('Dear User'),
  //         content: const Text(
  //           'We care about your privacy and data security. We keep this app free by showing ads. '
  //           'Can we continue to use your data to tailor ads for you?\n\nYou can change your choice anytime in the app settings. '
  //           'Our partners will collect data and use a unique identifier on your device to show you ads.',
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context, true),
  //             child: const Text('Continue'),
  //           ),
  //         ],
  //       ),
  //     ) ??
  //     false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo adhd-02.png",
              height: 250,
              width: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "ADHD".tr(),
              maxLines: 2,
              style: TextStyle(
                  color: Constants.MAIN_COLOR,
                  fontSize: 20,
                  fontFamily: Constants.FONT_FAMILY_NAME),
            ),
          ],
        ),
      )),
    );
  }
}
