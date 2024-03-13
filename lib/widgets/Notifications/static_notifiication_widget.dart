import 'package:adhd/Models/notifications_response.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_message_package/voice_message_package.dart';

import '../../Controllers/Utilites/urls.dart';
import '../../Screens/SideMenu/Notification/bloc/notification_bloc.dart';

class StaticNotificationWidget extends StatelessWidget {
  NotificationItem notificationItem;

  StaticNotificationWidget({required this.notificationItem});

  sendNotification(BuildContext context){

      Map<String,dynamic> body={
        'TitleAr':notificationItem.titleAr,
        'TitleEn':notificationItem.titleEn,
        'VoiceNotification':null,
        'TaskDuration':20,
        'SendAt':DateTime.now().toString(),
        'HasSound':false,
        'PatientID':URL.selectedChild!.id,
      };

      context.read<NotificationCubit>().sendNotification(body);


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  notificationItem.titleEn??'',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                width: 10,
              ),

              InkWell(
                onTap: (){
                  sendNotification(context);
                },
                child: Image.asset(Constants.LOCAL_IMAGE_PATH + "HeroIcon (TailWind)-2.png",  height: 30,
                  width: 20,),
              ),
           
            ],
          ),
        ],
      ),
    );
  }
}
