import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/shared/dio_H.dart';
import 'package:shopapp/shared/shareddata.dart';
import 'package:shopapp/userdashboard/model/favcubitstate.dart';

import 'module/favouritemodel.dart';

class FavProductcubit extends Cubit<FavouriteShopState> {
  FavProductcubit() : super(InitFavouriteShopState());
  Favouritedata? ourfav;
  static FavProductcubit get(context) => BlocProvider.of(context);

  void loaddata() {
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
      ourfav!.products.removeAt(index);

      emit(FavouriteSucessShopState());
    }).catchError((e) {
      print(e);
      emit(FavouriteFailState());
    });
  }
}
