import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopapp/loginRegist/loginState.dart';
import 'package:shopapp/shared/dio_H.dart';

class CubitLogin extends Cubit<LoginState> {
  CubitLogin() : super(InitLogState());

  void userLogin({
    required String email,
    required String password,
  }) async {
    print('5');
    emit(ShopLoginLoadingState());

    DioHelper2.postData(
      url: 'login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print('success');
      print(value.data.toString());
      //loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(value.data));
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginFailState(error.toString()));
    });
  }

  static CubitLogin get(context) => BlocProvider.of(context);
  bool ispassword = false;
  void changevisiblepassword() {
    ispassword = !ispassword;
    emit(ChangepasswordState());
  }
}
