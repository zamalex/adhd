import 'package:adhd/Models/sub_user.dart';
import 'package:equatable/equatable.dart';

sealed class DailyNotesState extends Equatable {
  const DailyNotesState();

  @override
  List<Object> get props => [];
}

final class DailyNotesInit extends DailyNotesState {}

class ListSubUsersState extends DailyNotesState {
  final List<SubUser> subUsers;
  const ListSubUsersState(this.subUsers);

  @override
  List<Object> get props => [subUsers];
}



class FaildState extends DailyNotesState {
  final String msg;
  const FaildState(this.msg);

  @override
  List<Object> get props => [msg];
}

class SelectedQuestionDailyNotesState extends DailyNotesState {
  final bool isDone;
  final int index;

  const SelectedQuestionDailyNotesState(this.isDone, this.index);

  @override
  List<Object> get props => [isDone, index];
}

class DailyNotesDoneState extends DailyNotesState {
  final String message;

  const DailyNotesDoneState(this.message);

  @override
  List<Object> get props => [message];
}


class DailyNotesLoadingState extends DailyNotesState {

  const DailyNotesLoadingState();

  @override
  List<Object> get props => [''];
}
