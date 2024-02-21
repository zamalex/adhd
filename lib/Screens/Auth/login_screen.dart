import 'dart:io';

import 'package:adhd/Screens/Auth/ForgetPassword/forger_password_code_screen.dart';
import 'package:adhd/Screens/Auth/ForgetPassword/forget_password_receiver_screen.dart';
import 'package:adhd/Screens/Routine/routine_list_screen.dart';
import 'package:adhd/widgets/Auth/email_textfield_widget.dart';
import 'package:adhd/widgets/Auth/password_textfiekd_widget.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Utilities/constants.dart';
import '../../Utilities/static_functions.dart';
import '../../widgets/Utilities/custom_appbar_widget.dart';
import 'bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "login";
  final _form = GlobalKey<FormState>();

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwoordFocusNode = FocusNode();
  var email = "";
  var passwoord = "";

  // @override
  // void initState() {
  //   emailFocusNode.addListener(() {
  //     setState(() {});
  //   });
  //     passwoordFocusNode.addListener(() {
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  Future<void> _saveForm(BuildContext context) async {
    _form.currentState!.validate();
    _form.currentState!.save();

    final isValid = _form.currentState!.validate();

    if (!isValid) {
      StaticFunctions.showErrorNote(context, "enter_missing_fields".tr());

      return;
    } else {
      try {
        print("login");
        context.read<AuthBloc>().add(loginEvent(email, passwoord));
      } catch (error) {
        StaticFunctions.showErrorNote(
            context, Constants.NO_INTERNET_CONNECTION);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is UserLoggedinState) {
          Navigator.pushNamed(context, RoutineListScreen.id);
        }else if(state is GoCodeState){
          Navigator.pushNamed(context, ForgetPasswordCodeScreen.id,arguments: {'email':state.email,'code':state.code});

        }

        else if (state is FaildState) {

          StaticFunctions.showErrorNote(context, state.msg);
                  //  Navigator.pushNamed(context, RoutineListScreen.id);

        }
        // else if (state is GoForgetState){

        // }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: CustomAppBar(
              title: "",
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(25),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Login to your\nAccount",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: Constants.FONT_FAMILY_NAME),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      EmailTextFieldWidget(
                          textFieldFocusNode: emailFocusNode,
                          nextTextFieldFocusNode: passwoordFocusNode,
                          returnValue: (value) {
                            email = value;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextFieldWidget(
                          textFieldFocusNode: passwoordFocusNode,
                          returnValue: (value) {
                            passwoord = value;
                          }),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Constants.LIGHT_MAIN_COLOR,
                              blurRadius: 20,
                              offset: Offset(0, 10), // Shadow position
                            ),
                          ],
                        ),
                        child: ButtonWidget(
                            title: "Sign in".tr(),
                            borderRadius: 50,
                            height: 50,
                            action: () {
                              _saveForm(context);
                            }),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ForgetPassword.id);
                        },
                        child: Text(
                          "Forget password",
                          style: TextStyle(color: Constants.MAIN_COLOR),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /*Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset("assets/images/4916639-01 2.png"),
              ),*/
            ],
          ),
        );
      },
    );
  }
}
