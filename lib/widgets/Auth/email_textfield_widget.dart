import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Utilities/static_functions.dart';
import 'auth_textfield_widget.dart';

class EmailTextFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;
    String? initialValue;


  EmailTextFieldWidget({
    Key? key,
    this.textFieldFocusNode,
    this.nextTextFieldFocusNode,
    this.initialValue,
    required this.returnValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AuthTextFieldWidget(
      Title: "email".tr(),
      textFieldFocusNode: textFieldFocusNode,
      type: TextInputType.emailAddress,
      nextTextFieldFocusNode: nextTextFieldFocusNode,
      initialValue: initialValue,
      // suffixText: "+966  ",
      postFix: Image.asset("assets/images/mdi_email.png", height: 20, width: 20,),
      hintText: "Email".tr(),
           returnValue: (value) => returnValue(value),

      validator: (value) {
        if (value.toString().isEmpty) {
          return "enter your email".tr();
        } else if (!StaticFunctions.checkValidEmail(value)) {
          return "enter right email".tr();
        } else {
          return null;
        }
      },
    );
  }
}
