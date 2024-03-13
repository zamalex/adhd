import 'package:adhd/Models/notifications_response.dart';
import 'package:adhd/Screens/SideMenu/Notification/bloc/notification_bloc.dart';
import 'package:adhd/Screens/SideMenu/Notification/bloc/notification_status.dart';
import 'package:adhd/Screens/SideMenu/Notification/new_message_screen.dart';
import 'package:adhd/Utilities/static_functions.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utilities/constants.dart';
import '../../../widgets/Notifications/static_notifiication_widget.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';

class NotificationsListScreen extends StatelessWidget {
  static const String id = "notification_list";

  @override
  Widget build(BuildContext context) {

    context.read<NotificationCubit>().fetchStaticNotifications();
    // TODO: implement build
    return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "",
        ),
      ),
      body: BlocConsumer<NotificationCubit,NotificationState>(
        builder:(context, state) => Padding(
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
              state is NotificationLoading?Center(child: CircularProgressIndicator(),):state is NotificationLoaded?Expanded(child: _NotificationList(notifications: state.files,)):Container(),
            ],
          ),
        ), listener: (BuildContext context, NotificationState state) {
          if(state is NotificationSuccess){
            StaticFunctions.showSuccessNote(context, state.message, null);
          }else if (state is NotificationError){
            StaticFunctions.showErrorNote(context, state.errorMessage,);

          }
      },
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {

  _NotificationList({required this.notifications});
  List<NotificationItem> notifications;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => StaticNotificationWidget(notificationItem: notifications[index],),
      scrollDirection: Axis.vertical,
      itemCount: notifications.length,
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
