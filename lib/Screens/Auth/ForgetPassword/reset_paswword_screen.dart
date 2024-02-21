import 'package:adhd/Screens/Auth/ForgetPassword/forget_password_email_screen.dart';
import 'package:adhd/Screens/Auth/ForgetPassword/forget_password_phone_screen.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Auth/password_textfiekd_widget.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utilities/static_functions.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';
import '../bloc/auth_bloc.dart';

class ResetPassword extends StatelessWidget {
  static const String id = "reset_passwoord";
  final _form = GlobalKey<FormState>();

  String email='';
  String password = '';
  String token = '';


  Future<void> _saveForm(BuildContext context) async {
    _form.currentState!.validate();
    _form.currentState!.save();

    Map m= ModalRoute.of(context)!.settings.arguments as Map;

    email = m['email'];
    token = m['code'];

    final isValid = _form.currentState!.validate();

    if (!isValid) {
      StaticFunctions.showErrorNote(context, "enter_missing_fields".tr());

      return;
    } else {
      try {
        print("login");
        context.read<AuthBloc>().add(resetPassWithEmailEvent(email, password,token));
      } catch (error) {
        StaticFunctions.showErrorNote(
            context, Constants.NO_INTERNET_CONNECTION);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "ٌReset a New Password",
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "${Constants.LOCAL_IMAGE_PATH}6333054 1.png",
                      height: 262,
                      width: 262,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "Specify the contact details we should use to reset your password"),
                    const SizedBox(
                      height: 16,
                    ),
                      PasswordTextFieldWidget(returnValue: (v){
                        password=v;
                    
                  }),
                    const SizedBox(
                      height: 16,
                    ),
                  PasswordTextFieldWidget(returnValue: (v){
            password=v;
                  })
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ButtonWidget(
                  title: "Login with passwoord",
                  action: () {_saveForm(context);},
                  borderRadius: 24,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
