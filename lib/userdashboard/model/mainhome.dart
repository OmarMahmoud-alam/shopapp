import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
//import 'package:shopapp/shared/component.dart';
import 'package:shopapp/userdashboard/cuboituserState.dart';

import '../cuboituser.dart';
import 'module/usermodel.dart';

class MainProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Productcubit shopcubit = Productcubit.get(context);

    return BlocConsumer<Productcubit, UserShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                anas(shopcubit.banner, context),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsetsDirectional.all(10.0),
                  child: Text(
                    'cateogrey',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Productcubit.get(context).cate == null
                    ? CircularProgressIndicator()
                    : SizedBox(
                        height: 110,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => cattt(
                                Productcubit.get(context).cate!.items[index]),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 5,
                                ),
                            itemCount:
                                Productcubit.get(context).cate!.items.length),
                      ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsetsDirectional.all(10.0),
                  child: Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Container(
                    color: Colors.grey,
                    child: anas2m(context, shopcubit.ourhome))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget anas(List<BannerModel> banner, context) => Conditional.single(
      context: context,
      conditionBuilder: (BuildContext context) => banner.length > 0,
      widgetBuilder: (context) => CarouselSlider(
            items: banner
                .map((item) => Container(
                      child: Center(
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(item.image.toString()),
                        ),
                      ),
                      color: Colors.blue,
                    ))
                .toList(),
            options: CarouselOptions(
              height: 250.0,
              viewportFraction: 1.0,
              autoPlay: true,
            ),
          ),
      fallbackBuilder: (BuildContext context) =>
          Center(child: CircularProgressIndicator()));
  Widget anas2m(context, ourhome) => Conditional.single(
      context: context,
      conditionBuilder: (context) => ourhome != null,
      widgetBuilder: (context) => GridView.count(
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 1 / 1.3,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: List.generate(ourhome!.products.length,
                (index) => anas2p(ourhome!.products[index], index, context)),
          ),
      fallbackBuilder: (BuildContext context) =>
          Center(child: CircularProgressIndicator()));
  Widget anas2p(ourhome, index, context) => Conditional.single(
      context: context,
      conditionBuilder: (BuildContext context) => ourhome != null,
      widgetBuilder: (
        context,
      ) =>
          Container(
            child: Container(
              color: Colors.white,
              padding: EdgeInsetsDirectional.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(alignment: AlignmentDirectional.bottomStart, children: [
                    Center(
                        child: Image(
                      image: NetworkImage(ourhome.image),
                      width: 150,
                      height: 140,
                      fit: BoxFit.fill,
                    )),
                    Container(
                      child: Text(
                        'Discount',
                        style: TextStyle(
                            backgroundColor: Colors.red,
                            fontSize: 14.0,
                            color: Colors.white),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${ourhome.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text('${ourhome.price.round()}',
                          style: TextStyle(color: Colors.blue)),
                      SizedBox(width: 10.0),
                      Text(
                        '${ourhome.oldprice.round()}',
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Productcubit.get(context)
                                .changefavourite(id: ourhome.id, index: index);
                          },
                          icon: State is FavouriteloadingShopState
                              ? CircularProgressIndicator()
                              : CircleAvatar(
                                  child: Icon(
                                    Icons.favorite_outline,
                                    color: Colors.white60,
                                  ),
                                  backgroundColor: ourhome.infav
                                      ? Colors.blue
                                      : Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
          ),
      fallbackBuilder: (BuildContext context) =>
          Center(child: CircularProgressIndicator()));
  Widget cattt(item) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(item.image),
            width: 150,
            height: 100,
          ),
          Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.6),
              ),
              width: 150,
              height: 30,
              child: Center(child: Text(item.name)))
        ],
      );
}
