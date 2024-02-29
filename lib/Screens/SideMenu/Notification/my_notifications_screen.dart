import 'package:adhd/Screens/SideMenu/Notification/bloc/notification_bloc.dart';
import 'package:adhd/Screens/SideMenu/Notification/bloc/notification_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utilities/constants.dart';
import '../../../widgets/Notifications/notificatiion_widget.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';

class MyNotificationsScreen extends StatelessWidget{
    static const String id = "my_notification_list";


  //NotificationWidget
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
        child: _NotificationList(),
      ),
    );
  }

}
class _NotificationList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    context.read<NotificationCubit>().fetchNotifications();
    // TODO: implement build
    return BlocConsumer<NotificationCubit,NotificationState>(
      builder: (context,state) {

        return state is NotificationLoading?Center(child: CircularProgressIndicator(),):state is NotificationLoaded?ListView.separated(
          itemBuilder: (context, index) => NotificationWidget(notificationItem: state.files[index],),
          scrollDirection: Axis.vertical,
          itemCount: state.files.length,
          separatorBuilder: (BuildContext context, int index) =>  Container(
            height: 23,
            child: Center(child: Container(height: 1, width: double.infinity, color: Constants.LIGHT_GRAY,),),
          ),
        ):Container();
      }, listener: (BuildContext context, state) {  },
    );
  }
}