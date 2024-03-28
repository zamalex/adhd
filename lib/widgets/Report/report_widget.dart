import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:adhd/Models/media_response.dart';
import 'package:adhd/Screens/SideMenu/media_webview.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/image_neetwork_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Models/reports_response.dart';

class ReportWidget extends StatefulWidget {
  Report report;
  ReportWidget({required this.report});

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  /*createPdf() async {
    var bytes = base64Decode(widget.report.fileContents.replaceAll('\n', ''));
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/report.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List());

    print("${output.path}/report.pdf");
    await OpenFile.open("${output.path}/report.pdf");
    setState(() {});
  }*/



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () async {
        launchUrl(Uri.parse(widget.report.reportUrl!),
            /*mode: LaunchMode.externalNonBrowserApplication*/);
        },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "${Constants.LOCAL_IMAGE_PATH}Pngtree pdf file icon png_7965915 1.png",
            height: 40,
            width: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            widget.report.reportCategory??'',
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
