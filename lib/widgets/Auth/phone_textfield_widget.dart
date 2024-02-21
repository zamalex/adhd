import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Utilities/constants.dart';
import 'auth_textfield_widget.dart';

class PhoneTextFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;
  String? initialValue;

  bool? enabled;

  PhoneTextFieldWidget({
    Key? key,
    this.textFieldFocusNode,
    this.nextTextFieldFocusNode,
    this.initialValue,
    required this.returnValue,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AuthTextFieldWidget(
      Title: "phone number".tr(),
      textFieldFocusNode: textFieldFocusNode,
      type: TextInputType.phone,
      initialValue: initialValue,
      nextTextFieldFocusNode: nextTextFieldFocusNode,
      // suffix:  Container(
      //   width: 20,
      //   child: Center(
      //     child: Image.asset(
      //       "assets/images/Call@3x.png",
      //       height: 20,
      //       width: 20,
      //     ),
      //   ),
      // ),
      postFix: SizedBox(
        width: 60,
        child: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              "+966  ",
              style: TextStyle(color: Constants.MAIN_COLOR),
            ),
            Container(width: 1,
            color: Constants.LIGHT_GRAY,
            height: 30,)
          ],
        ),
      ),
      hintText: "enter_phone_number".tr(),
      returnValue: (value) => returnValue(value),
      validator: (value) {
        if (value == null) {
          return "enter_phone_number".tr();
        } else if (value.length != 9) {
          return "enter_right_phone_number".tr();
        } else {
          return null;
        }
      },
    );
  }
}
