class ReportsResponse {
  int? statusCode;
  bool? succeeded;
  String? message;
  Null? errors;
  List<Report>? reports;

  ReportsResponse(
      {this.statusCode, this.succeeded, this.message, this.errors, this.reports});

  ReportsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    if (json['data'] != null) {
      reports = <Report>[];
      json['data'].forEach((v) {
        reports!.add(new Report.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    data['errors'] = this.errors;
    if (this.reports != null) {
      data['data'] = this.reports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Report {
  int? id;
  String? questionAr;
  String? questionEn;

  Report({this.id, this.questionAr, this.questionEn});

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionAr = json['questionAr'];
    questionEn = json['questionEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionAr'] = this.questionAr;
    data['questionEn'] = this.questionEn;
    return data;
  }
}