import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/userdashboard/cuboituser.dart';

import '../cuboituserState.dart';

class Categroy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Productcubit, UserShopState>(
      listener: (context, index) {},
      builder: (context, index) {
        if (Productcubit.get(context).cate != null) {
          return SingleChildScrollView(
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 200,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'categories',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => lovelyitem(
                          Productcubit.get(context).cate!.items[index],
                        ),
                    separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 2.0,
                          color: Colors.grey,
                        ),
                    itemCount: Productcubit.get(context).cate!.items.length),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  lovelyitem(
    prodict,
  ) =>
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                width: 100,
                height: 100,
                image: NetworkImage(prodict.image ?? '')),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                ],
              ),
            ),
            Spacer(),
            CircleAvatar(
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
      );
}
