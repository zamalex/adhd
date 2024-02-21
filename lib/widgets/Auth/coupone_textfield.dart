import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Utilities/constants.dart';
import 'auth_textfield_widget.dart';

class CouponFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;
  String? initialValue;

  CouponFieldWidget({
    Key? key,
    this.textFieldFocusNode,
    this.initialValue,
    this.nextTextFieldFocusNode,
    required this.returnValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AuthTextFieldWidget(
      Title: "",
      textFieldFocusNode: textFieldFocusNode,
      type: TextInputType.name,
      nextTextFieldFocusNode: nextTextFieldFocusNode,
      // suffixText: "+966  ",
      bgColor: Constants.LIGHT_GRAY,
      initialValue: initialValue,
      hintText: "enter_your_coupon".tr(),
           returnValue: (value) => returnValue(value),

      validator: (value) {
        if (value.toString().isEmpty) {
          return "enter_your_coupone".tr();
        } else {
          return null;
        }
      },
    );
  }
}
