import 'package:adhd/Models/daily_notes_questions_response.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Screens/SideMenu/Daliy notes/bloc/daily_notes_bloc.dart';

class DailyNotesQuestionWidget extends StatefulWidget {

  DailyNotesQuestionWidget({required this.index,required this.question});
  DailyNotesQuestion question;
  int index;

  @override
  State<DailyNotesQuestionWidget> createState() => _DailyNotesQuestionWidgetState();
}

class _DailyNotesQuestionWidgetState extends State<DailyNotesQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(widget.question.questionEn??'', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        const SizedBox(
          height: 5,
        ),
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _choiceButtonWidget(
              onSelect: (){
                context.read<DailyNotesCubit>().selectAnswer(widget.question..selectedIndex=0, widget.index);
                setState(() {
                  widget.question.selectedIndex=0;
                });
                },
              title: "Often",
              isSelected: widget.question.selectedIndex==0,
            ),
            const SizedBox(
              height: 10,
            ),
            _choiceButtonWidget(
              onSelect: (){
                context.read<DailyNotesCubit>().selectAnswer(widget.question..selectedIndex=1, widget.index);
                setState(() {
                  widget.question.selectedIndex=1;
                });
                },
              title: "Sometimes",
              isSelected: widget.question.selectedIndex==1,
            ),
             const SizedBox(
              height: 10,
            ),
            _choiceButtonWidget(
              onSelect: (){
                context.read<DailyNotesCubit>().selectAnswer(widget.question..selectedIndex=2, widget.index);
                setState(() {
                  widget.question.selectedIndex=2;
                });
                },
              title: "Rarely",
              isSelected: widget.question.selectedIndex==2,
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
  Function onSelect;
  _choiceButtonWidget({required this.title, required this.isSelected,required this.onSelect});
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
          onTap: () {
            onSelect();
          },
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: isSelected ? Constants.WHITE_BACKGROUND : Constants.MAIN_COLOR),
          ))),
    );
  }
}
