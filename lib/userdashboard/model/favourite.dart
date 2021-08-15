import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/userdashboard/model/module/favouritemodel.dart';

import '../cuboituser.dart';
import '../cuboituserState.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Productcubit, UserShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) =>
                lovelyitem(Productcubit.get(context).ourfav!.products, index),
            separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 2.0,
                  color: Colors.grey,
                ),
            itemCount: Productcubit.get(context).ourfav!.products.length);
      },
    );
  }
}

lovelyitem(List<ProductModel2> prodict, index) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            width: 100,
            height: 100,
            image: NetworkImage(prodict[index].image ?? '')),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 180,
                child: Text(
                  prodict[index].name ?? ' Name',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${prodict[index].price.round()}',
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
                  prodict.removeAt(index);
                },
                child: Text('delete')),
          ),
        )
      ],
    );
