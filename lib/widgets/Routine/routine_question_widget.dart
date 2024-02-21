import 'package:adhd/Models/routin.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class RoutineQuestionWidget extends StatelessWidget {
  RoutinQuestionModel question;
  Function onTap;
  RoutineQuestionWidget({required this.question, required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(question.titleEn ?? ""),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _choiceButtonWidget(
              image: "assets/images/Vector 1.png",
              isSelected: question.done ?? false,
              onTap: (value) {
                question.done = true;
                onTap(question);
              },
            ),
            const SizedBox(
              width: 10,
            ),
            _choiceButtonWidget(
              image: "assets/images/Vector-2.png",
              isSelected: !(question.done ?? true),
              onTap: (value) {
                question.done = false;
                                onTap(question);

              },
            ),
          ],
        )
      ],
    );
  }
}

class _choiceButtonWidget extends StatelessWidget {
  String image;
  var isSelected = false;
  Function onTap;
  _choiceButtonWidget(
      {required this.image, required this.isSelected, required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        onTap(true);
      },
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: isSelected ? Colors.green : Colors.black),
          color: isSelected ? Colors.green : Constants.WHITE_BACKGROUND,
        ),
        // child: ElevatedButton(
        //   onPressed: () => {},
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: isSelected ? Colors.green : Colors.white,
        //     foregroundColor: isSelected ? Colors.green : Constants.WHITE_BACKGROUND,
        //     surfaceTintColor: isSelected ? Colors.green : Constants.WHITE_BACKGROUND,
        //     side: BorderSide(
        //       width: 1,
        //       color: isSelected ? Colors.green : Colors.black,
        //     ),
        //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        //   ),
        child: Center(
          child: Image.asset(
            image,
            height: 7,
            width: 7,
          ),
        ),
        // ),
      ),
    );
  }
}
