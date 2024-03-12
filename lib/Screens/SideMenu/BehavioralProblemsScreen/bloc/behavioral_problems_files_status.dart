import 'package:adhd/Models/media_response.dart';

abstract class BehavioralProblemsState {}

class BehavioralProblemsInitial extends BehavioralProblemsState {}

class BehavioralProblemsLoading extends BehavioralProblemsState {}

class BehavioralProblemsLoaded extends BehavioralProblemsState {
  final List<Video> files;

  BehavioralProblemsLoaded(this.files);
}

class BehavioralProblemsError extends BehavioralProblemsState {
  final String errorMessage;

  BehavioralProblemsError(this.errorMessage);
}

