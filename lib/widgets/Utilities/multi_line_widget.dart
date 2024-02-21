import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Utilities/constants.dart';

class MultiTextFieldWidget extends StatelessWidget {
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  final Function returnValue;
  String? initialValue;

  MultiTextFieldWidget({
    Key? key,
    this.textFieldFocusNode,
    this.initialValue,
    this.nextTextFieldFocusNode,
    required this.returnValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      keyboardType: TextInputType.multiline,
      // focusNode: FocusNode,
      minLines: 7,
      maxLines: 7,
      decoration: InputDecoration(
       
        hintText: "Enter your comment",
        border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),

          borderSide: BorderSide(
            color: Constants.MAIN_COLOR,

          ),
        ),
        focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),

          borderSide: BorderSide(
                
            color: Constants.MAIN_COLOR,
                   

          ),
        ),
      ),
      onSaved: (value) => returnValue(value),
      validator: (value) {
        return null;
      },
    );
  }
}
/*
 TextFormField(
                    keyboardType: TextInputType.multiline,
                    focusNode: _otheersFocusNode,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(219, 226, 237, 1),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(213, 242, 237, 1),
                        ),
                      ),
                    ),
                    onSaved: (value) {
                      others = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "ادخل نص الرسالة";
                      } else {
                        return null;
                      }
                    },
                  ),
                ]),
*/