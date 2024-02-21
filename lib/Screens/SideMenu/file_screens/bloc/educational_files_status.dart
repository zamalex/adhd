import 'package:adhd/Models/media_response.dart';

abstract class EducationalFileState {}

class EducationalFileInitial extends EducationalFileState {}

class EducationalFileLoading extends EducationalFileState {}

class EducationalFileLoaded extends EducationalFileState {
  final List<Video> files;

  EducationalFileLoaded(this.files);
}

class EducationalFileError extends EducationalFileState {
  final String errorMessage;

  EducationalFileError(this.errorMessage);
}

