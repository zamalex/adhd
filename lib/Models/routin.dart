import 'package:equatable/equatable.dart';

import '../Controllers/Utilites/urls.dart';

class RoutinResponse {
  int? code;
  String? message;
  List<RoutinModel>? data;

  RoutinResponse({
    this.message,
    this.code,
    this.data,
  });

  factory RoutinResponse.fromJson(Map<String, dynamic>? json) => RoutinResponse(
        code: json?["statusCode"] ?? 400,
        message: json?["message"] ?? URL.SERVER_ERROR,
        data: json!["data"] != null
            ? List<RoutinModel>.from(
                json["data"].map((x) => RoutinModel.fromJson(x)))
            : [],
      );
}

class RoutinModel extends Equatable {
  String? titleAr;
  String? titleEn;
  int? id;
  int? duration;
  String? image;
  bool isAvailable = true;
  List<RoutinQuestionModel>? questions;

  RoutinModel(
      {this.id,
      this.titleAr,
      this.titleEn,
      this.duration,
      this.image,
      this.questions});

  factory RoutinModel.fromJson(Map<String, dynamic>? json) => RoutinModel(
        id: json?["id"] ?? 0,
        titleAr: json?["titleAr"] ?? "",
        titleEn: json?["titleEn"] ?? "",
        duration: json?["taskDuration"] ?? 0,
        image: json?["image"] ?? "",
        questions: json!["routineList"] != null
            ? List<RoutinQuestionModel>.from(
                json["routineList"].map((x) => RoutinQuestionModel.fromJson(x)))
            : [],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RoutinQuestionModel extends Equatable {
  String? titleAr;
  String? titleEn;
  int? id;
  bool? done;


  
  RoutinQuestionModel({this.id, this.titleAr, this.titleEn});

  factory RoutinQuestionModel.fromJson(Map<String, dynamic>? json) =>
      RoutinQuestionModel(
        id: json?["id"] ?? 0,
        // titleAr: json?["titleAr"] ?? "",
        titleEn: json?["rouitnePoint"] ?? "",
      );
  Map<String, dynamic> toJson() => {
        "routinePointID": id,
        "done": done.toString(),
        "doneAr": done.toString(),
       
      };
  @override
  // TODO: implement props
  List<Object?> get props => [id, titleEn, titleAr];
}
