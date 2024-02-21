import 'package:adhd/Controllers/media_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Models/media_response.dart';
import 'audio_list_status.dart';


class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioInitial());

  void fetchAudios() async {
    emit(AudioLoading());

    try {
      // Simulate fetching data from an API
      List<Video> Audios=await MediaController.getAudioList();

      // Replace this with your actual API call to get Audios


      emit(AudioLoaded(Audios));
    } catch (e) {
      emit(AudioError('Failed to fetch Audios. Error: $e'));
    }
  }
}
