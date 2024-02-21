import 'package:adhd/Controllers/media_controller.dart';
import 'package:adhd/Models/notifications_response.dart';
import 'package:adhd/Screens/SideMenu/Notification/bloc/notification_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Models/media_response.dart';


class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  void fetchNotifications() async {
    emit(NotificationLoading());

    try {
      // Simulate fetching data from an API
      List<NotificationItem> files = await MediaController.getNotificationsList();

      // Replace this with your actual API call to get educational files


      emit(NotificationLoaded(files));
    } catch (e) {
      emit(NotificationError('Failed to fetch notifications. Error: $e'));
    }
  }
}
