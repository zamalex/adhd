part of 'routine_bloc.dart';

sealed class RoutineState extends Equatable {
  const RoutineState();
  
  @override
  List<Object> get props => [];
}

final class RoutineInitial extends RoutineState {}

class ListRoutinState extends RoutineState {
  final List<RoutinModel> routines;
  const ListRoutinState(this.routines);

  @override
  List<Object> get props => [routines];
}

class ShowRoutinDetailsState extends RoutineState {
  final RoutinModel routine;
  const ShowRoutinDetailsState(this.routine);

  @override
  List<Object> get props => [routine];
}

class FaildState extends RoutineState {
  final String msg;
  const FaildState(this.msg);

  @override
  List<Object> get props => [msg];
}

class SelectedQuestionRoutineState extends RoutineState {
  final bool isDone;
    final int index;

  const SelectedQuestionRoutineState(this.isDone, this.index);

  @override
  List<Object> get props => [isDone, index];
}