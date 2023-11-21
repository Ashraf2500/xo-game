import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/services.dart';

import 'package:xo/pages/homePage.dart';
import 'package:xo/pages/playPage.dart';
void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[400],

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: 'HomePage',
      routes: <String ,WidgetBuilder>{

        'HomePage' : (context)=> HomePage(),
        'PlayPage' : (context)=> PlayPage(),

      },

    );
  }
}
