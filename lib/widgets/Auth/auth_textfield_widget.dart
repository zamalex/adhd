import 'dart:convert';

// import 'package:auto_bubbles/widgets/Auth/auth_text_widget.dart';
import 'package:flutter/material.dart';

import '../../Utilities/constants.dart';
import 'auth_text_widget.dart';

class AuthTextFieldWidget extends StatefulWidget {
  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  Widget? suffix;
  Widget? postFix;

  String? hintText;
  final Function returnValue;
  final Function validator;
  String? imageIcon;
  bool isHidden;
  TextInputType type;
  int? minLines;
  int? maxLines;
  int? minLine;
  String? initialValue;
  bool? enabled;
  bool isPassword;
  String? Title;
  Color? bgColor;

  // final ValueGetter<String> onPressedn;
  AuthTextFieldWidget(
      {Key? key,
      this.maxLines,
      this.minLines,
      this.textFieldFocusNode,
      this.nextTextFieldFocusNode,
      required this.returnValue,
      required this.validator,
      this.suffix,
      this.postFix,
      this.hintText,
      this.isHidden = false,
      this.type = TextInputType.text,
      this.imageIcon,
      this.initialValue,
      this.enabled = true,
      this.isPassword = false,
      this.Title,
      this.bgColor})
      : super(key: key);
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  Color borderColor = Constants.LIGHT_GRAY;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (widget.Title != null &&  widget.Title != "")
        //   AuthTextTitleWidget(title: widget.Title ?? ""),
        // if (widget.Title != null &&  widget.Title != "")
        //   const SizedBox(
        //     height: 10,
        //   ),
        TextFormField(
          keyboardType: widget.type,
          obscureText: widget.isHidden,
          initialValue: widget.initialValue ?? "",
          enabled: widget.enabled,
          maxLines: widget.minLines ?? 1,
          minLines: widget.maxLines ?? 1,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(widget.nextTextFieldFocusNode);
          },
          focusNode: widget.textFieldFocusNode,
          decoration: InputDecoration(
            suffixIcon:
            // widget.suffix,
             widget.isPassword
                ? IconButton(
                    icon: Icon(
                        // Based on passwordVisible state choose the icon
                        widget.isHidden
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        widget.isHidden = !widget.isHidden;
                      });
                    },
                  )
                : widget.suffix,

            prefixIcon: widget.postFix,
            // prefixText: widget.suffixText ?? "",
            // prefixStyle: TextStyle(color: Constants.DARK_GREY),

            // suffixText: widget.suffixText ?? "",
            filled: true,

            fillColor: widget.textFieldFocusNode != null
                ? widget.textFieldFocusNode!.hasFocus
                    ? Constants.LIGHT_MAIN_COLOR
                    : Constants.LIGHT_GRAY
                : Constants.LIGHT_GRAY,
            hintText: widget.hintText ?? "",
            hintStyle: TextStyle(color: Constants.DARK_GRAY, fontSize: 14),

            // errorBorder: OutlineInputBorder(
            //   borderSide: const BorderSide(
            //     color: Colors.red,
            //   ),
            //   borderRadius: BorderRadius.circular(5),
            // ),
            // fillColor: widget.bgColor ?? Constants.WHITE_BACKGROUND,
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: borderColor,
            //   ),
            //   borderRadius: BorderRadius.circular(5),
            // ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onSaved: (value) => widget.returnValue(value),
          validator: (value) => widget.validator(value),
        ),
        // Container(height: 1, color: Constants.LIGHT_GRAY,)
      ],
    );
  }
}

///////
class AuthTextFieldWithControllerWidget extends StatefulWidget {
  @override
  State<AuthTextFieldWithControllerWidget> createState() =>
      _AuthTextFieldWithControllerWidgetState();
  FocusNode? textFieldFocusNode;
  FocusNode? nextTextFieldFocusNode;
  String? suffixText;
  String? hintText;
  final Function returnValue;
  final Function validator;
  String? imageIcon;
  bool isHidden;
  TextInputType type;
  int? minLines;
  int? maxLines;
  int? minLine;
  bool? enabled;
  TextEditingController? controller;

  // final ValueGetter<String> onPressedn;
  AuthTextFieldWithControllerWidget(
      {Key? key,
      this.maxLines,
      this.minLines,
      this.textFieldFocusNode,
      this.nextTextFieldFocusNode,
      required this.returnValue,
      required this.validator,
      this.suffixText,
      this.hintText,
      this.isHidden = false,
      this.type = TextInputType.text,
      this.imageIcon,
      this.enabled = true,
      this.controller})
      : super(key: key);
}

class _AuthTextFieldWithControllerWidgetState
    extends State<AuthTextFieldWithControllerWidget> {
  Color borderColor = Constants.LIGHT_GRAY;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return TextFormField(
      keyboardType: widget.type,
      obscureText: widget.isHidden,
      enabled: widget.enabled,
      maxLines: widget.minLines ?? 1,
      minLines: widget.maxLines ?? 1,
      controller: widget.controller,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(widget.nextTextFieldFocusNode);
      },
      focusNode: widget.textFieldFocusNode,
      decoration: InputDecoration(
        prefixIcon: widget.imageIcon != null
            ? SizedBox(
                width: widget.suffixText == null ? 50 : 90,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      widget.suffixText ?? "",
                      style: TextStyle(color: Constants.DARK_GRAY),
                    ),
                  ],
                ),
              )
            : null,
        // prefixText: widget.suffixText ?? "",
        // prefixStyle: TextStyle(color: Constants.DARK_GREY),

        // suffixText: widget.suffixText ?? "",
        filled: true,

        fillColor: Constants.LIGHT_GRAY,
        hintText: widget.hintText ?? "",
        hintStyle: TextStyle(color: Constants.DARK_GRAY),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onSaved: (value) => widget.returnValue(value),
      validator: (value) => widget.validator(value),
    );
  }
}
