class Report {
   String? reportDate;
   String? reportType;
   String? reportCategory;
   String? createdAt;
   String? reportUrl;


  Report({
     this.reportCategory,
     this.reportDate,
     this.createdAt,
     this.reportType,
     this.reportUrl,

  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      reportType: json['reportType'] ?? "",
      reportCategory: json['reportCategory'] ?? "",
      createdAt: json['createdAt'] ?? "",
      reportUrl: json['reportUrl'] ?? "",
      reportDate: json['reportDate'] ?? "",

    );
  }
}
