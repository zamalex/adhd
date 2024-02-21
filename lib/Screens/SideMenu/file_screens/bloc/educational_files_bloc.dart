import 'package:adhd/Controllers/media_controller.dart';
import 'package:adhd/Models/media_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'educational_files_status.dart';

class EducationalFileCubit extends Cubit<EducationalFileState> {
  EducationalFileCubit() : super(EducationalFileInitial());

  void fetchEducationalFiles() async {
    emit(EducationalFileLoading());

    try {
      // Simulate fetching data from an API
      List<Video> files = await MediaController.getFilesList();

      // Replace this with your actual API call to get educational files


      emit(EducationalFileLoaded(files));
    } catch (e) {
      emit(EducationalFileError('Failed to fetch educational files. Error: $e'));
    }
  }
}
