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
  final int id ;
  const ShowRoutinDetailsState(this.routine, this.id);

  @override
  List<Object> get props => [routine, id];
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

class RoutineDoneState extends RoutineState {
  final String message;

  const RoutineDoneState(this.message);

  @override
  List<Object> get props => [message];
}


class RoutineLoadingState extends RoutineState {

  const RoutineLoadingState();

  @override
  List<Object> get props => [''];
}
