import 'package:adhd/Screens/SideMenu/Audio_Screens/audio_list_screen.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/daily_notes_questions.dart';
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
          // sideMenuRow(
          //   title: "Daily notes",
          //   visable: true,
          //   isFirst: false,
          //   image: "${Constants.LOCAL_IMAGE_PATH}HeroIcon (TailWind).png",
          //   onTap: () {
          //     Navigator.pushNamed(context, DailyNotesQuestionsScreen.id);
          //   },
          // ),

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
              visable: true,
              image: "${Constants.LOCAL_IMAGE_PATH}carbon_help-2.png",
              onTap: () {

                Navigator.pushNamed(context, AudioListScreen.id);

              }),

          sideMenuRow(
              title: "Notifications",
              visable: true,
              image: "${Constants.LOCAL_IMAGE_PATH}Vector-3.png",
              onTap: () {
                Navigator.pushNamed(context, MyNotificationsScreen.id);
              }),

          sideMenuRow(
              title: "Log out",
              image: "${Constants.LOCAL_IMAGE_PATH}tabler_logout.png",
              onTap: () {}),
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
