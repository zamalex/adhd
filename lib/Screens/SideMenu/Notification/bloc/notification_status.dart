import 'package:adhd/Models/notifications_response.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationItem> files;

  NotificationLoaded(this.files);
}

class NotificationError extends NotificationState {
  final String errorMessage;

  NotificationError(this.errorMessage);
}


class NotificationSuccess extends NotificationState {
  final String message;

  NotificationSuccess(this.message);
}

