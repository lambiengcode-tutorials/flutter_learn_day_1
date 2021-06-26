import 'package:bai_1/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  bool? isLoading;
  List<dynamic> dataFromApis = [];

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // trung voi mau nen cua screen do
        statusBarIconBrightness:
            Brightness.dark, // set icon tren status bar co mau den
        statusBarBrightness:
            Brightness.dark, // set text tren status bar co mau den
      ),
    );
    super.initState();
    dataFromApis.add('huidasuid');
    isLoading = true;
  }

  @override
  void dispose() {
    super.dispose();
    isLoading = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
