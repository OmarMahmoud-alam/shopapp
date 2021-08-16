import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:shopapp/shared/shareddata.dart';

import './cuboituser.dart';
import 'cuboituserState.dart';

class UserDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Productcubit shopcubit = Productcubit.get(context);
    return BlocProvider(
        create: (BuildContext context) => Productcubit()
          ..loaddata()
          ..loadcato(),
        child: BlocConsumer<Productcubit, UserShopState>(
          listener: (context, status) {},
          builder: (BuildContext context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.blue,
                currentIndex: Productcubit.get(context).currentindex,
                onTap: (index) {
                  Productcubit.get(context).changepage(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'home'),
                  BottomNavigationBarItem(
                      label: 'catogory', icon: Icon(Icons.compare)),
                  BottomNavigationBarItem(
                      label: 'favourite', icon: Icon(Icons.favorite_outline)),
                  BottomNavigationBarItem(
                      label: 'setting', icon: Icon(Icons.settings)),
                ],
              ),
              appBar: AppBar(
                title: Text('omar shop'),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search))
                ],
              ),
              body: Productcubit.get(context)
                  .widget[Productcubit.get(context).currentindex],
            );
          },
        ));
  }
}

Widget main() => Column();
