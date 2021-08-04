import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopapp/layout/boarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleSpacing: 20.0,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              //statusBarIconBrightness: Brightness.dark,
            ),
          ),
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white),
      home: SafeArea(
        child: Mains(),
      ),
    );
  }
}
