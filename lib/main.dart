import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test123/const/const.dart';
import 'package:test123/loginPage/login2.dart';

import 'loginPage/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrinaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login2(),
    );
  }
}
