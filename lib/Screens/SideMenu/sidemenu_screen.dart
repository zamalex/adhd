import 'package:adhd/Screens/SideMenu/Audio_Screens/audio_list_screen.dart';
import 'package:adhd/Screens/SideMenu/Chat/chat_screen.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/daily_notes_questions.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/daily_notes_sub_users.dart';
import 'package:adhd/Screens/SideMenu/Notification/my_notifications_screen.dart';
import 'package:adhd/Screens/SideMenu/Notification/notifications_list_screen.dart';
import 'package:adhd/Screens/SideMenu/Reports/report_list.dart';
import 'package:adhd/Screens/SideMenu/Video_Screens/video_list_screen.dart';
import 'package:adhd/Screens/SideMenu/file_screens/file_list_screen.dart';
import 'package:adhd/Screens/SideMenu/followup_forms/followup_forms_screen.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Routine/routine_question_widget.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../Controllers/Utilites/urls.dart';
import '../../Utilities/static_functions.dart';
import '../Auth/login_screen.dart';

class SideMenuScreen extends StatelessWidget {
  static const String id = "side_menu";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(children: [
          sideMenuRow(
            title: "Daily notes",
            visable:
                URL.userType == 'Trainer' || URL.userType == 'ADHDAppPsycho',
            isFirst: false,
            image: "${Constants.LOCAL_IMAGE_PATH}HeroIcon (TailWind).png",
            onTap: () {
              Navigator.pushNamed(context, DailyNotesSubUsersScreen.id);
            },
          ),

          sideMenuRow(
            title: "Educational videos",
            isFirst: true,
            image: "${Constants.LOCAL_IMAGE_PATH}ri_user-line.png",
            onTap: () {
              Navigator.pushNamed(context, VideoListScreen.id);
            },
          ),
          sideMenuRow(
              title: "Interesting tips",
              image: "${Constants.LOCAL_IMAGE_PATH}carbon_security.png",
              onTap: () {
                Navigator.pushNamed(context, FileListScreen.id);
              }),
          sideMenuRow(
              title: "Follow-up forms",
              visable: false,
              image: "${Constants.LOCAL_IMAGE_PATH}carbon_security.png",
              onTap: () {
                Navigator.pushNamed(context, FollowupFromsScreen.id);
              }),
          sideMenuRow(
              title: "Behavioral problems solutions",
              visable: false,
              image: "${Constants.LOCAL_IMAGE_PATH}magic.png",
              onTap: () {
                Navigator.pushNamed(context, FileListScreen.id);
              }),

          sideMenuRow(
              title: "Praise your child",
              visable: false,
              image: "${Constants.LOCAL_IMAGE_PATH}Frame.png",
              onTap: () {
                Navigator.pushNamed(context, NotificationsListScreen.id);
              }),

          sideMenuRow(
              title: "Reports",
              visable: false,
              image: "${Constants.LOCAL_IMAGE_PATH}tabler_logout-2.png",
              onTap: () {
                Navigator.pushNamed(context, ReportListScreen.id);
              }),

          //
          /* sideMenuRow(
              title: "Self help",
              visable: true,
              image: "${Constants.LOCAL_IMAGE_PATH}carbon_help.png",
              onTap: () {}),
*/
          sideMenuRow(
              title: "Mindfulness",
              visable: URL.userType == 'Child',
              image: "${Constants.LOCAL_IMAGE_PATH}carbon_help-2.png",
              onTap: () {
                Navigator.pushNamed(context, AudioListScreen.id);
              }),
          sideMenuRow(
              title: "Chat",
              visable: true,
              image: "${Constants.LOCAL_IMAGE_PATH}messenger.png",
              onTap: () {
                Navigator.pushNamed(context, ChatScreeen.id);
              }),
          sideMenuRow(
              title: "Notifications",
              visable: URL.userType == 'Child',
              image: "${Constants.LOCAL_IMAGE_PATH}Vector-3.png",
              onTap: () {
                Navigator.pushNamed(context, MyNotificationsScreen.id);
              }),

          sideMenuRow(
              title: "Log out",
              image: "${Constants.LOCAL_IMAGE_PATH}tabler_logout.png",
              onTap: () {
                print("logout");
                URL.USER_TOKEN = "";
                URL.userID = '';
                URL.userType = '';
                URL.selectedChild = null;
                StaticFunctions.removeToken();
                StaticFunctions.saveChild(null);
                Navigator.of(context)
    .pushNamedAndRemoveUntil(LoginScreen.id, (Route<dynamic> route) => false);
              
              }),
        ]),
      ),
    );
  }
}

class sideMenuRow extends StatelessWidget {
  String title;
  String image;
  bool? visable;
  Function onTap;
  bool? isFirst;
  sideMenuRow(
      {required this.title,
      required this.image,
      required this.onTap,
      this.isFirst,
      this.visable});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visable ?? true,
      child: Column(
        children: [
          Visibility(
            visible: isFirst ?? true,
            child: const SizedBox(
              height: 50,
            ),
          ),
          InkWell(
            onTap: () {
              onTap();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
