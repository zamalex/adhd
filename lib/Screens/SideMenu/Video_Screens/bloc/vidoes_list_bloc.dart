import 'package:adhd/Controllers/media_controller.dart';
import 'package:adhd/Screens/SideMenu/Video_Screens/bloc/video_list_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Models/media_response.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  void fetchVideos() async {
    emit(VideoLoading());

    try {
      // Simulate fetching data from an API
      List<Video> videos = await MediaController.getVideosList();

      // Replace this with your actual API call to get videos

      emit(VideoLoaded(videos));
    } catch (e) {
      emit(VideoError('Failed to fetch videos. Error: $e'));
    }
  }
}
