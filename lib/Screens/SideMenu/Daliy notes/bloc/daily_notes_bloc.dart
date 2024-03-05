import 'package:adhd/Controllers/media_controller.dart';
import 'package:adhd/Controllers/routin_controller.dart';
import 'package:adhd/Models/sub_user.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/bloc/daily_notes_states.dart';
import 'package:adhd/Screens/SideMenu/Video_Screens/bloc/video_list_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Models/media_response.dart';

class DailyNotesCubit extends Cubit<DailyNotesState> {
  DailyNotesCubit() : super(DailyNotesInit());

  void getSubUsersList() async {
    emit(DailyNotesLoadingState());

    try {
      Map result  = await RoutinController.getSubUsersList();

      List<SubUser> subUsers = result['data'];


      emit(ListSubUsersState(subUsers));
    } catch (e) {
      emit(FaildState('Failed to fetch videos. Error: $e'));
    }
  }
}
