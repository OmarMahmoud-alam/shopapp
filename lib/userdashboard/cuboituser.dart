import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/shared/dio_H.dart';
import 'package:shopapp/shared/shareddata.dart';
import 'package:shopapp/userdashboard/cuboituserState.dart';
import 'package:shopapp/userdashboard/model/categro.dart';
import 'package:shopapp/userdashboard/model/module/favouritemodel.dart';
import 'model/module/usermodel.dart';

import './model/favourite.dart';
import './model/mainhome.dart';
import './model/setting.dart';

class Productcubit extends Cubit<UserShopState> {
  Productcubit() : super(InitUserShopState());
  Homedata? ourhome;
  Favouritedata? ourfav;
  List<BannerModel> banner = [];
  List<ProductModel> products = [];

  static Productcubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<Widget> widget = [MainProduct(), Categroy(), Favourite(), Setting()];
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
      ourhome = Homedata.fromjson(value.data);
      banner = ourhome!.banner;
      products = ourhome!.products;

      print(ourhome!.banner[0].image);
      emit(UserSucessShopState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(UserFailState());
    });
    loaddata2();
  }

  void loaddata2() {
    emit(UserFavouriteloadingShopState());
    DioHelper2.getData(
      url: 'favorites',
      token: Cachehelp.getdata(key: 'token'),
    ).then((value) {
      print(value.data.toString());
      ourfav = Favouritedata.fromjson(value.data);

      emit(UserFavouriteSucessShopState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(UserFavouriteFailState());
    });
  }

  void changefavourite({required int id, required index}) {
    emit(FavouriteloadingShopState());
    DioHelper2.postData(
            url: 'favorites',
            data: {'product_id': id},
            token: Cachehelp.getdata(key: 'token'))
        .then((value) {
      print(value.data.toString());
      ChangedFavoriproduct pp = ChangedFavoriproduct.fromjson(value.data);

      products[index].infav = !products[index].infav;
      if (pp.message == 'Deleted Successfully') {
        ourfav!.products.remove(pp.prodict!.id);
      } else {
        ourfav!.products.add(pp.prodict!);
      }
      emit(FavouriteSucessShopState());
    }).catchError((e) {
      print(e);
      emit(FavouriteFailState());
    });
  }
}
