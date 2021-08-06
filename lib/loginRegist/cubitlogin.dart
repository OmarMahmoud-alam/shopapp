import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopapp/loginRegist/loginState.dart';
import 'package:shopapp/shared/dio_H.dart';

import 'loginModel.dart';

class CubitLogin extends Cubit<LoginState> {
  CubitLogin() : super(InitLogState());
  late ShopLogin user;
  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(ShopLoginLoadingState());

    DioHelper2.postData(
      url: 'login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print('success');
      user = ShopLogin.fromjson(value.data);
      // print(user.message);
      //loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(user));
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginFailState(error.toString()));
    });
  }

//eng.omar.control@gmail.com
  static CubitLogin get(context) => BlocProvider.of(context);
  bool ispassword = false;
  void changevisiblepassword() {
    ispassword = !ispassword;
    emit(ChangepasswordState());
  }
}
