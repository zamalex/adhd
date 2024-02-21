class NotificationResponse {
  int? statusCode;
  bool? succeeded;
  String? message;
  List<NotificationItem>? notifications;

  NotificationResponse({this.statusCode, this.succeeded, this.message, this.notifications});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    if (json['data'] != null) {
      notifications = <NotificationItem>[];
      json['data'].forEach((v) {
        notifications!.add(new NotificationItem.fromJson(v));
      });
    }
  }


}

class NotificationItem {
  int? id;
  String? titleAr;
  String? titleEn;
  String? image;
  String? imageOriginalName;
  String? notification;

  NotificationItem(
      {this.id,
        this.titleAr,
        this.titleEn,
        this.image,
        this.imageOriginalName,
        this.notification});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['titleAr'];
    titleEn = json['titleEn'];
    image = json['image'];
    imageOriginalName = json['imageOriginalName'];
    notification = json['video']??json['file'];
  }


}