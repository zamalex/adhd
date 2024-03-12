part of 'routine_bloc.dart';

sealed class RoutineEvent extends Equatable {
  const RoutineEvent();

  @override
  List<Object> get props => [];
}
class InitialRoutinEvent extends RoutineEvent {

  InitialRoutinEvent({this.subUser});
  SubUser? subUser;

  @override
  List<Object> get props => [""];
}



class GoRoutinDetailsEvent extends RoutineEvent {
  final RoutinModel routinModel;
  final int id ;
  const GoRoutinDetailsEvent(this.routinModel, this.id);
  @override
  List<Object> get props => [routinModel, id];
}

class SubmitRoutineAnswersEvent extends RoutineEvent {
  final RoutinModel answers;
  const SubmitRoutineAnswersEvent(this.answers);
  @override
  List<Object> get props => [answers];
}
class AnswerRoutineeQueestion extends RoutineEvent {
  final RoutinQuestionModel questionModel;
  final int index;
  const AnswerRoutineeQueestion(this.questionModel, this.index);
  @override
  List<Object> get props => [questionModel, index];
}