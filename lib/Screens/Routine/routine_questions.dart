import 'package:adhd/Models/routin.dart';
import 'package:adhd/Screens/Routine/bloc/routine_bloc.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Routine/routine_question_widget.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutineQuestiionsScreen extends StatelessWidget {
  static const String id = "question_screen";
  RoutinModel routin = RoutinModel();
  var isLoaded = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<RoutineBloc, RoutineState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is SelectedQuestionRoutineState) {
          routin.questions?[state.index].done = state.isDone;
        }
      },
      builder: (context, state) {
        if (state is ShowRoutinDetailsState) {
          routin = state.routine;
        }
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
            child: _routineQuestionsList(routin.questions ?? []),
          ),
        );
      },
    );
  }
}

class _routineQuestionsList extends StatelessWidget {
  List<RoutinQuestionModel> questions = [];
  _routineQuestionsList(this.questions);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => RoutineQuestionWidget(
        question: questions[index],
        onTap: (value) {
          // questions[index] = value;
          context
              .read<RoutineBloc>()
              .add(AnswerRoutineeQueestion(value, index));
        },
      ),
      // scrollDirection: Axis.horizontal,
      itemCount: questions.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
