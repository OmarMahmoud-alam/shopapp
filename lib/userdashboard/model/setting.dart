import 'package:flutter/material.dart';
import 'package:shopapp/layout/boarding.dart';
import 'package:shopapp/loginRegist/login.dart';
import 'package:shopapp/shared/dio_H.dart';
import 'package:shopapp/shared/shareddata.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Cachehelp.removedata(key: 'token');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                  (route) => false);
            },
            child: Text('LOGOUT')),
        ElevatedButton(
            onPressed: () {
              Cachehelp.removedata(key: 'token');
              Cachehelp.removedata(key: 'board');

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Mains(),
                  ),
                  (route) => false);
            },
            child: Text('LOGOUT and staet from beginning ')),
      ],
    );
  }
}
