import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'auth_textfield_widget.dart';

class RichTextFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;
  String? initialValue;

  RichTextFieldWidget({
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
      Title: "Your message".tr(),
      textFieldFocusNode: textFieldFocusNode,
      type: TextInputType.multiline,
      nextTextFieldFocusNode: nextTextFieldFocusNode,
      maxLines: 5,
      minLines: 5,
      initialValue: initialValue,
      hintText: "enter your msg".tr(),
      returnValue: (value) => returnValue(value),
      validator: (value) {
        if (value.toString().isEmpty) {
          return "enter your msg".tr();
        } else {
          return null;
        }
      },
    );
  }
}
