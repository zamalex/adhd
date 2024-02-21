import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'auth_textfield_widget.dart';

class SubjectTextFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;
  String? initialValue;

  SubjectTextFieldWidget({
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
      Title: "Subject".tr(),
      textFieldFocusNode: textFieldFocusNode,
      type: TextInputType.name,
      nextTextFieldFocusNode: nextTextFieldFocusNode,
      // suffixText: "+966  ",
      initialValue: initialValue,
      hintText: "enter_your_subject".tr(),
           returnValue: (value) => returnValue(value),

      validator: (value) {
        if (value.toString().isEmpty) {
          return "enter_your_subject".tr();
        } else {
          return null;
        }
      },
    );
  }
}
