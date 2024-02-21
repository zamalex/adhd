part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends AuthEvent {
  @override
  List<Object> get props => [""];
}

class forgetEmailBtnEvent extends AuthEvent {
  final String email;
  const forgetEmailBtnEvent(this.email);
  @override
  List<Object> get props => [email];
}
class forgetPhoneBtnEvent extends AuthEvent {
  final String phone;
  const forgetPhoneBtnEvent(this.phone);
  @override
  List<Object> get props => [phone];
}

class loginEvent extends AuthEvent {
  final String email;
  final String password;

  const loginEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class resetPassWithEmailEvent extends AuthEvent{
  String email;
  String password;
  String token;
  resetPassWithEmailEvent(this.email,this.password,this.token);
}