//imports flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//imports local
import 'package:chameleon/screens/login/login.dart';
import 'package:chameleon/theme/constants.dart';
import 'package:chameleon/theme/theme_app.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title_app,
      theme: themeApp(),
      home: Builder(
        builder: (BuildContext context){
          var screenHeight = MediaQuery.of(context).size.height;
          return Login(screenHeight: screenHeight);
        },
      ),
    );
  }
}
