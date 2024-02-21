import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:flutter/material.dart';

class DailyNotesQuestionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("question 1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        const SizedBox(
          height: 5,
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _choiceButtonWidget(
              title: "Often",
              isSelected: false,
            ),
            const SizedBox(
              height: 10,
            ),
            _choiceButtonWidget(
              title: "Sometimes",
              isSelected: true,
            ),
             const SizedBox(
              height: 10,
            ),
            _choiceButtonWidget(
              title: "Rarely",
              isSelected: false,
            ),
          ],
        )
      ],
    );
  }
}

class _choiceButtonWidget extends StatelessWidget {
  var isSelected = false;
  var title;
  _choiceButtonWidget({required this.title, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: Constants.MAIN_COLOR ),
            color:  isSelected ? Constants.MAIN_COLOR : Constants.WHITE_BACKGROUND,
      ),
      child: InkWell(
          onTap: () {},
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: isSelected ? Constants.WHITE_BACKGROUND : Constants.MAIN_COLOR),
          ))),
    );
  }
}
