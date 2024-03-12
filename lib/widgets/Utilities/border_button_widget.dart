import 'package:flutter/material.dart';

import '../../Utilities/constants.dart';

class BorderButtonWidget extends StatelessWidget {
  var title = "";
  double height;
  final Function action;
  String? image;
  Color? color;
  double borderRadius;
  Color? bgColor;

  double? width;

  BorderButtonWidget(
      {Key? key,
      required this.title,
      this.height = 48,
      required this.action,
      this.width,
      this.color,
      this.borderRadius = 5,
      this.bgColor,
      this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: () => {action()},
        style: ElevatedButton.styleFrom(
          //primary: bgColor ?? Colors.white,
          backgroundColor: bgColor ?? Colors.white,
          side: BorderSide(
            width: 1,
            color: color ?? Constants.MAIN_COLOR,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null)
              Image.asset(
                image ?? "",
                height: 20,
                width: 20,
              ),
            if (image != null)
              SizedBox(
                width: 10,
              ),
            Text(
              title,
              style: TextStyle(
                  color: color ?? Constants.MAIN_COLOR ,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
