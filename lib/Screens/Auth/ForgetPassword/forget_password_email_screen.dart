import 'package:adhd/Screens/Auth/ForgetPassword/forget_password_receiver_screen.dart';
import 'package:adhd/Screens/Auth/bloc/auth_bloc.dart';
import 'package:adhd/Screens/Auth/login_screen.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/Utilities/static_functions.dart';
import 'package:adhd/widgets/Auth/email_textfield_widget.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordEmailScreen extends StatelessWidget {
  String email = "";

  final _form = GlobalKey<FormState>();

  final _emailFocusNode = FocusNode();

  Future<void> _saveForm(BuildContext context) async {
    _form.currentState!.validate();
    _form.currentState!.save();

    final isValid = _form.currentState!.validate();

    if (!isValid) {
      StaticFunctions.showErrorNote(context, "enter_missing_fields".tr());

      return;
    } else {
      try {
        print("login ${email}");
        context.read<AuthBloc>().add(forgetEmailBtnEvent(email));
      } catch (error) {
        StaticFunctions.showErrorNote(
            context, Constants.NO_INTERNET_CONNECTION);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AuthBloc,AuthState>(
      builder:(context, state) => Dialog(
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
                  child: EmailTextFieldWidget(
                    returnValue: (v) {
                      email =v;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: state is AuthLoadingState?Center(child: CircularProgressIndicator()):Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        title: "Send",
                        action: () {
                          _saveForm(context);
                        },
                        width: 135,
                      ),
                    ),
                   const SizedBox(width: 5,),
                    Expanded(child: ButtonWidget(
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
      ),
      listener: (c,e){},
    );
  }
}
