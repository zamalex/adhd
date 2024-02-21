import 'package:adhd/Screens/SideMenu/Notification/my_notifications_screen.dart';
import 'package:adhd/Screens/SideMenu/Video_Screens/video_list_screen.dart';
import 'package:adhd/Screens/SideMenu/file_screens/file_list_screen.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Routine/routine_question_widget.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class SideMenuParentScreen extends StatelessWidget {
  static const String id = "side_menu_parent";

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
            title: "Educational videos",
            image: "${Constants.LOCAL_IMAGE_PATH}ri_user-line.png",
            onTap: () {
              Navigator.pushNamed(context, VideoListScreen.id);
            },
          ),
          const SizedBox(
            height: 50,
          ),
          sideMenuRow(
              title: "Interesting tips",
              image: "${Constants.LOCAL_IMAGE_PATH}carbon_security.png",
              onTap: () {

              Navigator.pushNamed(context, FileListScreen.id);


              }),
          const SizedBox(
            height: 50,
          ),
          sideMenuRow(
              title: "Self help",
              image: "${Constants.LOCAL_IMAGE_PATH}carbon_help.png",
              onTap: () {}),
          const SizedBox(
            height: 50,
          ),
          sideMenuRow(
              title: "Mindfulness",
              image: "${Constants.LOCAL_IMAGE_PATH}carbon_help-2.png",
              onTap: () {}),
          const SizedBox(
            height: 50,
          ),
          sideMenuRow(
              title: "Notifications",
              image: "${Constants.LOCAL_IMAGE_PATH}Vector-3.png",
              onTap: () {
                Navigator.pushNamed(context, MyNotificationsScreen.id);
              }),
          const SizedBox(
            height: 50,
          ),
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
  Function onTap;
  sideMenuRow({required this.title, required this.image, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
