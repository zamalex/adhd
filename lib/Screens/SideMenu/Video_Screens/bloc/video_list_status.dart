import '../../../../Models/media_response.dart';

abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final List<Video> videos;

  VideoLoaded(this.videos);
}

class VideoError extends VideoState {
  final String errorMessage;

  VideoError(this.errorMessage);
}

