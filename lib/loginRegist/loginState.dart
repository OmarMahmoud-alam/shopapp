abstract class LoginState {}

class InitLogState extends LoginState {}

class ChangepasswordState extends LoginState {}

class ShopLoginLoadingState extends LoginState {}

class ShopLoginSuccessState extends LoginState {
  final String data;

  ShopLoginSuccessState(this.data);
}

class ShopLoginFailState extends LoginState {
  final String error;

  ShopLoginFailState(this.error);
}
