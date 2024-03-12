import 'package:adhd/Controllers/media_controller.dart';
import 'package:adhd/Models/media_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'behavioral_problems_files_status.dart';

class BehavioralProblemsCubit extends Cubit<BehavioralProblemsState> {
  BehavioralProblemsCubit() : super(BehavioralProblemsInitial());

  void getBegavioralFiles() async {
    emit(BehavioralProblemsLoading());

    try {
      List<Video> files = await MediaController.getBehavioralProblemsFiles();



      emit(BehavioralProblemsLoaded(files));
    } catch (e) {
      emit(BehavioralProblemsError('Failed to fetch files. Error: $e'));
    }
  }
}
