import 'package:adhd/Screens/SideMenu/Notification/new_message_screen.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:flutter/material.dart';

import '../../../Utilities/constants.dart';
import '../../../widgets/Notifications/static_notifiication_widget.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';

class NotificationsListScreen extends StatelessWidget {
  static const String id = "notification_list";

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
        child: Column(
          children: [
            ButtonWidget(
                title: "Send your own message",
                action: () {
                  Navigator.pushNamed(context, NewMessageScreen.id);
                }),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: _NotificationList()),
          ],
        ),
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => StaticNotificationWidget(),
      scrollDirection: Axis.vertical,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => Container(
        height: 50,
        child: Center(
          child: Container(
            height: 1,
            width: double.infinity,
            color: Constants.LIGHT_GRAY,
          ),
        ),
      ),
    );
  }
}
