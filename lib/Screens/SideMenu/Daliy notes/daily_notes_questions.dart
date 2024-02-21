import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../widgets/Daily Notes Quitiions/daily_notes_questions_widget.dart';

class DailyNotesQuestionsScreen extends StatelessWidget{
    static const String id = "daily_notes_question_screen";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "Daily Notes Questions",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _dailyNotesQuestionsList(),
      ),
    );
  }

}

class _dailyNotesQuestionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => DailyNotesQuestionWidget(
      ),
      // scrollDirection: Axis.horizontal,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) =>  SizedBox(
        height: 20,
        
      ),
    );
  }
}
