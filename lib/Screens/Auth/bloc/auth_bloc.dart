import 'dart:io';

import 'package:adhd/Controllers/auth_controller.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
            emit(AuthInitial());

    });
  on<loginEvent>((event, emit) async {
      try {
         await AuthCoontroller.login(event.email, event.password);
        emit(UserLoggedinState(UserModel(email: event.email)));
      } on SocketException catch (error) {
        print(error);
        emit(FaildAuthState(error.toString()));
      } catch (error) {
        print("error");
        emit(FaildAuthState(error.toString()));
      }
    });

 on<forgetEmailBtnEvent>((event, emit) async {
      try {
        emit(AuthLoadingState());

        var code =   await AuthCoontroller.forgetPasswordEmail(event.email);
        emit(GoCodeState(event.email,code));
      } on SocketException catch (error) {
        print(error);
        emit(FaildAuthState(error.toString()));
      } catch (error) {
        print("error");
        emit(FaildAuthState(error.toString()));
      }
    });

 on<forgetPhoneBtnEvent>((event, emit) async {
      try {
         var code = await AuthCoontroller.forgetPasswordPhone(event.phone);
        emit(GoCodeState(event.phone,code));
      } on SocketException catch (error) {
        print(error);
        emit(FaildAuthState(error.toString()));
      } catch (error) {
        print("error");
        emit(FaildAuthState(error.toString()));
      }
    });

 on<resetPassWithEmailEvent>((event, emit) async {
      try {
         await AuthCoontroller.resetPasswordEmail(event.email,event.password,event.token);

         await AuthCoontroller.login(event.email, event.password);
         emit(UserLoggedinState(UserModel(email: event.email)));
      } on SocketException catch (error) {
        print(error);
        emit(FaildAuthState(error.toString()));
      } catch (error) {
        print("error");
        emit(FaildAuthState(error.toString()));
      }
    });
  }
}
