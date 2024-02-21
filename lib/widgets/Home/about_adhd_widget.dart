import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/image_neetwork_widget.dart';
import 'package:flutter/material.dart';

class AboutADHDWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        RoundedImageeNetworkWidget(
          height: 286,
          width: 260,
          
          image:
              "https://epe.brightspotcdn.com/d5/8b/827913334eb5af8201910afbfc8b/adhd.jpg",
        ),
        Positioned(
            left: 15,
            right: 15,
            bottom: 15,
            child: Text(
              "Self Help",
              style: TextStyle(fontSize: 24, color: Constants.WHITE_BACKGROUND),
            )),
      ],
    );
  }
}
