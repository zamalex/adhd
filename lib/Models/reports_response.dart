class Report {
  late String fileContents;
  late String contentType;
  late String fileDownloadName;

  Report({
    required this.fileContents,
    required this.contentType,
    required this.fileDownloadName,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      fileContents: json['fileContents'] ?? "",
      contentType: json['contentType'] ?? "",
      fileDownloadName: json['fileDownloadName'] ?? "",
    );
  }
}
