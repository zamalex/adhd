class DailyNotesQuestionsResponse {
  int? statusCode;
  bool? succeeded;
  String? message;
  List<DailyNotesQuestion>? data;

  DailyNotesQuestionsResponse(
      {this.statusCode, this.succeeded, this.message, this.data});

  DailyNotesQuestionsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DailyNotesQuestion>[];
      json['data'].forEach((v) {
        data!.add(new DailyNotesQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DailyNotesQuestion {
  int? id;
  String? questionAr;
  String? questionEn;
  String? trainerType;
  String? reportQuestionType;

  DailyNotesQuestion(
      {this.id,
        this.questionAr,
        this.questionEn,
        this.trainerType,
        this.reportQuestionType});

  DailyNotesQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionAr = json['questionAr'];
    questionEn = json['questionEn'];
    trainerType = json['trainerType'];
    reportQuestionType = json['reportQuestionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionAr'] = this.questionAr;
    data['questionEn'] = this.questionEn;
    data['trainerType'] = this.trainerType;
    data['reportQuestionType'] = this.reportQuestionType;
    return data;
  }
}