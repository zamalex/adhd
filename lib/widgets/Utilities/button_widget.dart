import 'package:flutter/material.dart';

import '../../Utilities/constants.dart';

class ButtonWidget extends StatelessWidget {
  var title = "";
  String? image;
  double height;
  double? width;
  double borderRadius;
  final Function action;
  Color? color;
    Color? borderColor;

  Color? textColor;

  ButtonWidget(
      {Key? key,
      required this.title,
      this.height = 48,
      required this.action,
      this.width,
      this.borderRadius = 5,
      this.color,
      this.textColor,
      this.image, this.borderColor})
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
          backgroundColor: color ?? Constants.MAIN_COLOR,
          foregroundColor: color ?? Constants.MAIN_COLOR,
          surfaceTintColor: color ?? Constants.MAIN_COLOR,
          side: BorderSide(
            width: 1,
            color: borderColor ?? color ?? Constants.MAIN_COLOR,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (image != null)
              Center(
                child: Image.asset(
                  image ?? "",
                  height: 5,
                  width: 5,
                ),
              ),
            if (image != null && title != "")
              const SizedBox(
                width: 10,
              ),
               if ( title != "")
            Text(
              title,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
