import 'package:adhd/Screens/Auth/ForgetPassword/reset_paswword_screen.dart';
import 'package:adhd/widgets/Auth/verification_code_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utilities/constants.dart';
import '../../../Utilities/static_functions.dart';
import '../../../widgets/Utilities/button_widget.dart';
import '../bloc/auth_bloc.dart';
import 'forget_password_receiver_screen.dart';

class ForgetPasswordCodeScreen extends StatelessWidget {
  String code = "";
  String? originalCode;
  static const String id = "code_screen";

  final _form = GlobalKey<FormState>();

  Future<void> _saveForm(BuildContext context) async {
    _form.currentState!.validate();
    _form.currentState!.save();

    final isValid = _form.currentState!.validate();
    originalCode = ((ModalRoute.of(context)!.settings.arguments! as Map)['code'])as String;

    if (!isValid) {
      StaticFunctions.showErrorNote(context, "enter_missing_fields".tr());

      return;
    } else {
    if(originalCode==code)
    Navigator.pushNamed(context, ResetPassword.id,arguments: {'email':((ModalRoute.of(context)!.settings.arguments! as Map)['email'])as String,'code':code});
   else
      StaticFunctions.showErrorNote(context, "invalid_code".tr());

    }
  }

  final _codeFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final String email = ((ModalRoute.of(context)!.settings.arguments! as Map)['email'])as String;

    print('email is ${email}');
    // TODO: implement build
    return Dialog(
      backgroundColor: Constants.WHITE_BACKGROUND,
      surfaceTintColor: Constants.WHITE_BACKGROUND,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        width: 322,
        height: 386,
        padding: EdgeInsets.all(15),
        child: Stack(
          children: [
            Positioned(
              top: 120,
              left: 10,
              right: 10,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _form,
                child: VereificationCodeTextFieldWidget(returnValue: (v) {
                  code=v;
                }),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      title: "Send",
                      action: (){
                        _saveForm(context);
                      },
                      width: 135,
                    ),
                  ),
                 const SizedBox(width: 5,),
                 Expanded(child:  ButtonWidget(
                   width: 135,
                   title: "Canncel",
                   action: () {
                     Navigator.popUntil(
                         context, ModalRoute.withName(ForgetPassword.id));
                   },
                   color: Colors.red,
                 ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
