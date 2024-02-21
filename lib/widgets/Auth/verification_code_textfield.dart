import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Utilities/constants.dart';
import 'auth_textfield_widget.dart';

class VereificationCodeTextFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;


  VereificationCodeTextFieldWidget({
    Key? key,
    this.textFieldFocusNode,
    this.nextTextFieldFocusNode,
    required this.returnValue,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AuthTextFieldWidget(
      Title: "".tr(),
      textFieldFocusNode: textFieldFocusNode,
      type: TextInputType.phone,
      nextTextFieldFocusNode: nextTextFieldFocusNode,
      suffix: SizedBox(
        width: 60,
        child: Row(
          children: [
            const SizedBox(width: 10),
            Text(
             "33 sec",
              style: TextStyle(color: Constants.MAIN_COLOR),
            ),
          ],
        ),
      ),
      // postFix:  Container(
      //   width: 20,
      //   child: Center(
      //     child: Image.asset(
      //     "assets/images/Group 4717@3x.png",
      //       height: 20,
      //       width: 20,
      //     ),
      //   ),
      // ),
      
      hintText: "enter verification code".tr(),
      //AppLocalizations.of(context)!.enter,
           returnValue: (value) => returnValue(value),
          //  imageIcon: "assets/images/Group 4717@3x.png",

      validator: (value) {
        if (value == null) {
          return "enter verification code".tr();
        }  else {
          return null;
        }
      },
    );
    
  }
}
