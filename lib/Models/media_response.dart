class MediaResponse {
  int? statusCode;
  bool? succeeded;
  String? message;
  List<Video>? videos;

  MediaResponse({this.statusCode, this.succeeded, this.message, this.videos});

  MediaResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    if (json['data'] != null) {
      videos = <Video>[];
      json['data'].forEach((v) {
        videos!.add(new Video.fromJson(v));
      });
    }
  }


}

class Video {
  int? id;
  String? titleAr;
  String? titleEn;
  String? image;
  String? imageOriginalName;
  String? video;

  Video(
      {this.id,
        this.titleAr,
        this.titleEn,
        this.image,
        this.imageOriginalName,
        this.video});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['titleAr'];
    titleEn = json['titleEn'];
    image = json['image'];
    imageOriginalName = json['imageOriginalName'];
    video = json['video']??json['file'];
  }


}