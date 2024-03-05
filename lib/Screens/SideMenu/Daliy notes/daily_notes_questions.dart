import 'package:adhd/Models/daily_notes_questions_response.dart';
import 'package:adhd/Models/sub_user.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/bloc/daily_notes_states.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/Daily Notes Quitiions/daily_notes_questions_widget.dart';
import 'bloc/daily_notes_bloc.dart';

class DailyNotesQuestionsScreen extends StatefulWidget{
    static const String id = "daily_notes_question_screen";

  @override
  State<DailyNotesQuestionsScreen> createState() => _DailyNotesQuestionsScreenState();
}

class _DailyNotesQuestionsScreenState extends State<DailyNotesQuestionsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero).then((value) {
      context.read<DailyNotesCubit>().getDailyNotesQuestionsList();
    });
  }


  @override
  Widget build(BuildContext context) {
    SubUser subUser =  ModalRoute.of(context)!.settings.arguments as SubUser;

    // TODO: implement build
 return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "Daily Notes Questions",
        ),
      ),
      body: BlocBuilder<DailyNotesCubit,DailyNotesState>(
        builder:(c,state){
          return state is DailyNotesLoadingState?Center(child: CircularProgressIndicator(),):state is ListDailyNotesQuestionsState? Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(child: _dailyNotesQuestionsList(questions: state.questions,)),
                TextButton(onPressed: (){
                  context.read<DailyNotesCubit>().submitAnswers(subUser.id!);
                }, child:Text('Submit'))
              ]
              ,
            ),
          ):Container();
      }
      ),
    );
  }


}

class _dailyNotesQuestionsList extends StatelessWidget {
  _dailyNotesQuestionsList({required this.questions});
  List<DailyNotesQuestion> questions = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => DailyNotesQuestionWidget(
        index: index,
        question: questions[index],
      ),
      // scrollDirection: Axis.horizontal,
      itemCount: questions.length,
      separatorBuilder: (BuildContext context, int index) =>  SizedBox(
        height: 20,
        
      ),
    );
  }
}
