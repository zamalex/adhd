import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/image_neetwork_widget.dart';
import 'package:flutter/material.dart';

class ReportWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () async {
        print("fdsfs");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "${Constants.LOCAL_IMAGE_PATH}—Pngtree—pdf file icon png_7965915 1.png",
            height: 40,
            width: 40,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "27-8-2023",
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
