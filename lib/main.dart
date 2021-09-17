import 'package:flutter/material.dart';
import 'package:neurosms/routes/Routes.dart';
import 'package:neurosms/screens/HomeScreen.dart';
import 'package:neurosms/screens/login/LoginScreen.dart';
import 'package:neurosms/screens/splash/splash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'loader/CustomAnimation.dart';


void main() {
  runApp(MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.red.withOpacity(0.5)
    ..userInteractions = true
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      routes: {
        '/': (context) => Splash(),
        Routes.login: (context) => LoginScreen(),
        Routes.home: (context) => HomeScreen(),
        //Routes.timesheet: (context) => TimesheetPage(),
        //Routes.patentreport: (context) => PaitentreportPage(),
        //Routes.timerecordlist: (context) => TimerecordlistPage(),
        //Routes.trademarkreport: (context) => TrademarkReportPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      builder: EasyLoading.init(),
    );
  }
}
