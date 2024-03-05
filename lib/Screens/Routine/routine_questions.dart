import 'package:adhd/Models/routin.dart';
import 'package:adhd/Screens/Routine/bloc/routine_bloc.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Routine/routine_question_widget.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:confetti/confetti.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutineQuestiionsScreen extends StatelessWidget {
  static const String id = "question_screen";
  RoutinModel routin = RoutinModel();
  var isLoaded = false;
  late ConfettiController _controllerCenter;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<RoutineBloc, RoutineState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is SelectedQuestionRoutineState) {
          routin.questions?[state.index].done = state.isDone;
        } else if (state is RoutineDoneState) {
          _controllerCenter.play();

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          context.read<RoutineBloc>().add(InitialRoutinEvent());
        }
      },
      builder: (context, state) {
        if (state is ShowRoutinDetailsState) {
          routin.id = state.id;
          routin = state.routine;
          _controllerCenter =
              ConfettiController(duration: const Duration(seconds: 2));
        }
        return Scaffold(
          backgroundColor: Constants.WHITE_BACKGROUND,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: CustomAppBar(
              title: "",
            ),
          ),
          body: state is RoutineLoadingState
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ConfettiWidget(
                        confettiController: _controllerCenter,
                        blastDirectionality: BlastDirectionality.explosive,
                        particleDrag: 0.05,
                        emissionFrequency: 0.05,
                        numberOfParticles: 50,
                        gravity: 0.05,
                        shouldLoop: false,
                        colors: [
                          Constants.MAIN_COLOR
                        ], // manually specify the colors to be used
                      ),
                      Expanded(
                          child: _routineQuestionsList(routin.questions ?? [])),
                      ButtonWidget(
                          title: "Submit".tr(),
                          action: () {
                            context
                                .read<RoutineBloc>()
                                .add(SubmitRoutineAnswersEvent(routin));
                          }),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
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
