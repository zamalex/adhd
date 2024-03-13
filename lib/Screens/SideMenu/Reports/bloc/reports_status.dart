import 'package:adhd/Models/media_response.dart';
import 'package:adhd/Models/reports_response.dart';

abstract class ReportsState {}

class ReportsInitial extends ReportsState {}

class ReportsLoading extends ReportsState {}

class ReportsLoaded extends ReportsState {
  final List<Report> reports;

  ReportsLoaded(this.reports);
}

class ReportsError extends ReportsState {
  final String errorMessage;

  ReportsError(this.errorMessage);
}

