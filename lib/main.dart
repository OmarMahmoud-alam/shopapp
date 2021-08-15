import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/boarding.dart';
import 'package:shopapp/loginRegist/login.dart';
import 'package:shopapp/shared/dio_H.dart';
import 'package:shopapp/shared/shareddata.dart';
import 'package:shopapp/userdashboard/userdashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper2.init();
  await Cachehelp.init();
  bool board = Cachehelp.getdata(key: 'onboarding') ?? false;
  String token = Cachehelp.getdata(key: 'token') ?? 'null';
  Widget? startwidget = Mains();
  print(token);
  if (board) {
    if (token == 'null')
      startwidget = Login();
    else
      startwidget = UserDash();
  }
  print(board);
  runApp(MyApp(
    startwidget: startwidget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;
  MyApp({required this.startwidget, bool? board});

  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleSpacing: 20.0,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          //iconTheme: IconThemeData(color: Colors.blue),
          //  bottomAppBarTheme:ThemeData.bottomAppBarTheme ,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white),
      home: SafeArea(
        child: startwidget,
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
