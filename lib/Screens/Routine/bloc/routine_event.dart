part of 'routine_bloc.dart';

sealed class RoutineEvent extends Equatable {
  const RoutineEvent();

  @override
  List<Object> get props => [];
}
class InitialRoutinEvent extends RoutineEvent {
  @override
  List<Object> get props => [""];
}
class GoRoutinDetailsEvent extends RoutineEvent {
  final RoutinModel routinModel;
  const GoRoutinDetailsEvent(this.routinModel);
  @override
  List<Object> get props => [routinModel];
}
class AnswerRoutineeQueestion extends RoutineEvent {
  final RoutinQuestionModel questionModel;
  final int index;
  const AnswerRoutineeQueestion(this.questionModel, this.index);
  @override
  List<Object> get props => [questionModel, index];
}