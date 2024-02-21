import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'auth_textfield_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;
  String? initialValue;

  bool? enabled;

  PasswordTextFieldWidget({
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
      isPassword: true,
      isHidden: true,
      textFieldFocusNode: textFieldFocusNode,
      nextTextFieldFocusNode: nextTextFieldFocusNode,
      hintText: "Password".tr(),
      returnValue: (value) => returnValue(value),
      postFix: Image.asset(
        "assets/images/mdi_password.png",
        height: 20,
        width: 20,
      ),
    
      validator: (value) {
        if (value == null) {
          return "enter your password".tr();
        } else if (value.length < 6) {
          return "enter right password".tr();
        } else {
          return null;
        }
      },
    );
  }
}
