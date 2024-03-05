import 'package:adhd/Models/sub_user.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/daily_notes_questions.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../widgets/Daily Notes Quitiions/daily_notes_questions_widget.dart';

class DailyNotesSubUsersScreen extends StatelessWidget {
  static const String id = "daily_notes_sub_users_screen";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "Daily Notes sub Users",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _dailyNotesSubUsersList(),
      ),
    );
  }
}

class _dailyNotesSubUsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => SubUserWidget(),
      // scrollDirection: Axis.horizontal,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20,
      ),
    );
  }
}

class SubUserWidget extends StatelessWidget {
  SubUserWidget({super.key, this.subUser});
  SubUser? subUser;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('username'),
      subtitle: Text('username sub username'),
      onTap: () {
        Navigator.pushNamed(context, DailyNotesQuestionsScreen.id);
      },
    );
  }
}
