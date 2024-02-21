import 'package:adhd/Screens/Auth/ForgetPassword/forget_password_email_screen.dart';
import 'package:adhd/Screens/Auth/ForgetPassword/forget_password_phone_screen.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:flutter/material.dart';

import '../../../widgets/Utilities/custom_appbar_widget.dart';

class ForgetPassword extends StatelessWidget {
  static const String id = "forget_reciver";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "Forget password",
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "${Constants.LOCAL_IMAGE_PATH}3275434 1.png",
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
                    _tab(
                      title: "Message via mobile phone",
                      image: "Frame 56.png",
                      isSelected: true,
                      onTap: () async {
                        await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) =>
                              ForgetPasswordPhoneScreen(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _tab(
                      title: "Message via e-mail",
                      image: "Frame 56-2.png",
                      isSelected: false,
                      onTap: () async {
                        await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) =>
                              ForgetPasswordEmailScreen(),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ButtonWidget(
                  title: "Login with passwoord",
                  action: () {},
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

class _tab extends StatelessWidget {
  var isSelected = false;
  String title;
  String image;
  Function onTap;

  _tab(
      {required this.title,
      required this.image,
      required this.isSelected,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 92,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isSelected ? Constants.MAIN_COLOR : Constants.LIGHT_GRAY),
        color: Constants.WHITE_BACKGROUND,
      ),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            "${Constants.LOCAL_IMAGE_PATH}$image",
            height: 60,
            width: 60,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    );
  }
}
