import 'package:adhd/Models/routin.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Routine/routine_question_widget.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:flutter/material.dart';

class FollowupFromsScreen extends StatelessWidget{
    static const String id = "followup_screen";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
 return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _followupFromsScreenList(),
      ),
    );
  }

}

class _followupFromsScreenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => RoutineQuestionWidget(question: RoutinQuestionModel(),onTap: (){},
      ),
      // scrollDirection: Axis.horizontal,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
