import 'dart:io';

import 'package:adhd/Controllers/routin_controller.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Models/routin.dart';

part 'routine_event.dart';
part 'routine_state.dart';

class RoutineBloc extends Bloc<RoutineEvent, RoutineState> {
  RoutineBloc() : super(RoutineInitial()) {
    on<RoutineEvent>((event, emit) {
      // TODO: implement event handler
    });
     on<InitialRoutinEvent>((event, emit) async {
      // TODO: implement event handler
        try {
       var response = await RoutinController.get();
        emit(ListRoutinState(response));
      } on SocketException catch (error) {
        print(error);
        emit(FaildState(error.toString()));
      } catch (error) {
        print("error");
        emit(FaildState(error.toString()));
      }
    });
       on<GoRoutinDetailsEvent>((event, emit) async {
      // TODO: implement event handler
     
        emit(ShowRoutinDetailsState(event.routinModel));
    
    });
      on<AnswerRoutineeQueestion>((event, emit) async {
      // TODO: implement event handler
     
        emit(SelectedQuestionRoutineState(event.questionModel.done ?? false, event.index));
    
    });
  }
}
