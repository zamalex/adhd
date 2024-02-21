import 'package:adhd/Models/media_response.dart';

abstract class AudioState {}

class AudioInitial extends AudioState {}

class AudioLoading extends AudioState {}

class AudioLoaded extends AudioState {
  final List<Video> Audios;

  AudioLoaded(this.Audios);
}

class AudioError extends AudioState {
  final String errorMessage;

  AudioError(this.errorMessage);
}

