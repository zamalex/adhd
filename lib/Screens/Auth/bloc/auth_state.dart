part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class UserLoggedinState extends AuthState {
  final UserModel user;
  const UserLoggedinState(this.user);

  @override
  List<Object> get props => [user];
}
class GoForgetState extends AuthState {
  const GoForgetState();

  @override
  List<Object> get props => [];
}
class ForgetPasswordState extends AuthState {
  
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {


  @override
  List<Object> get props => [];
}
class FaildAuthState extends AuthState {
  final String msg;
  const FaildAuthState(this.msg);

  @override
  List<Object> get props => [msg];
}

class GoCodeState extends AuthState{
  String email;
  String code;
  GoCodeState(this.email,this.code);

}