import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopapp/loginRegist/loginState.dart';

class CubitLogin extends Cubit<LoginState> {
  CubitLogin() : super(InitLogState());
  static CubitLogin get(context) => BlocProvider.of(context);
  bool ispassword = false;
  void changevisiblepassword() {
    ispassword = !ispassword;
    emit(ChangepasswordState());
  }
}
