import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/userdashboard/cuboituser.dart';
import 'package:shopapp/userdashboard/model/favcubit.dart';
import 'package:shopapp/userdashboard/model/favcubitstate.dart';
import 'package:shopapp/userdashboard/model/module/favouritemodel.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FavProductcubit()..loaddata(),
      child: BlocConsumer<FavProductcubit, FavouriteShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (FavProductcubit.get(context).ourfav != null) {
            return ListView.separated(
                itemBuilder: (context, index) => lovelyitem(
                    FavProductcubit.get(context).ourfav!.products[index],
                    index,
                    context),
                separatorBuilder: (context, index) => Container(
                      width: double.infinity,
                      height: 2.0,
                      color: Colors.grey,
                    ),
                itemCount:
                    FavProductcubit.get(context).ourfav!.products.length);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

lovelyitem(ProductModel2 prodict, index, context) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            width: 100, height: 100, image: NetworkImage(prodict.image ?? '')),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 180,
                child: Text(
                  prodict.name ?? 'name',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${prodict.price.round()}',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          height: 90,
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  FavProductcubit.get(context)
                      .changefavourite(id: prodict.id, index: index);
                  Productcubit.get(context)
                      .changefavourite(id: prodict.id, index: index);
                },
                child: Text('delete')),
          ),
        )
      ],
    );
