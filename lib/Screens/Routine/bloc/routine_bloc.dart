import 'dart:io';

import 'package:adhd/Controllers/Utilites/urls.dart';
import 'package:adhd/Controllers/routin_controller.dart';
import 'package:adhd/Models/sub_user.dart';
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
       var response = await RoutinController.get(subUser: event.subUser);
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
     
        emit(ShowRoutinDetailsState(event.routinModel, event.id));
    
    });
      on<AnswerRoutineeQueestion>((event, emit) async {
      // TODO: implement event handler
     
        emit(SelectedQuestionRoutineState(event.questionModel.done ?? false, event.index));
    
    });

      on<SubmitRoutineAnswersEvent>((event, emit) async {
      // TODO: implement event handler

        // emit(RoutineLoadingState());
        Map<String,dynamic> body={};
        List<Map>answersList=[];
        bool answered = true;
        event.answers.questions!.forEach((element) {
          if(element.done==null){

            answered = false;

          }
        });

        if(!answered){
          emit(RoutineDoneState('You should answer all questions'));
          return;
        }

        event.answers.questions!.forEach((element) {

          answersList.add({'done':element.done,'doneAr':element.done,'routinePointID':element.id});

        });


        SubUser? subUser;
        if(URL.userType=='Parent'){
          subUser = URL.selectedChild;
        }
        body.putIfAbsent('notificationID', () => event.answers.id);
        body.putIfAbsent('routineID', () => event.answers.id);
        body.putIfAbsent('patientID', () =>URL.userType=='Parent'?subUser!.id: URL.userID);
        body.putIfAbsent('parentID', () =>URL.userType=='Parent'?URL.userID: null);
        body.putIfAbsent('routinePoints', () => answersList);

        var response = URL.userType=='Child'?await RoutinController.submitChildAnswers(body):await RoutinController.submitAnswers(body,subUser);

        emit(RoutineDoneState(response['message']));

    });
  }
}
