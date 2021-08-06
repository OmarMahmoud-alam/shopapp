import 'loginModel.dart';

abstract class LoginState {}

class InitLogState extends LoginState {}

class ChangepasswordState extends LoginState {}

class ShopLoginLoadingState extends LoginState {}

class ShopLoginSuccessState extends LoginState {
  final ShopLogin userdata;

  ShopLoginSuccessState(this.userdata);
}

class ShopLoginFailState extends LoginState {
  final String error;

  ShopLoginFailState(this.error);
}
