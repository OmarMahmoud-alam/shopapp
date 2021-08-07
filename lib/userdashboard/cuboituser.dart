import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/shared/dio_H.dart';
import 'package:shopapp/shared/shareddata.dart';

import 'package:shopapp/userdashboard/cuboituserState.dart';
import 'package:shopapp/userdashboard/usermodel.dart';

class Productcubit extends Cubit<UserShopState> {
  Productcubit() : super(InitUserShopState());
  Homedata? ourhome;
  static Productcubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<Widget> widget = [M(), Categroy(), Favourite(), Setting()];
  void changepage(index) {
    this.currentindex = index;
    emit(ChangeDashstate());
  }

  void loaddata() {
    emit(UserloadingShopState());
    DioHelper2.getData(
      url: 'home',
      token: Cachehelp.getdata(key: 'token'),
    ).then((value) {
      ourhome = value.data;
      emit(UserSucessShopState());
    }).onError((error, stackTrace) {
      emit(UserFailState());
    });
  }
}
