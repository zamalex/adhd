import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'auth_textfield_widget.dart';

class NameTextFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;
  String? initialValue;

  NameTextFieldWidget({
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
      Title: "Full Name".tr(),
      textFieldFocusNode: textFieldFocusNode,
      type: TextInputType.name,
      nextTextFieldFocusNode: nextTextFieldFocusNode,
      // suffixText: "+966  ",
      initialValue: initialValue,
      hintText: "enter_your_name".tr(),
           returnValue: (value) => returnValue(value),

      validator: (value) {
        if (value.toString().isEmpty) {
          return "enter_your_name".tr();
        } else {
          return null;
        }
      },
    );
  }
}
