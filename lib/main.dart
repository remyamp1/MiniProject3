import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/Payment.dart';
import 'package:hive_app/firstscreen.dart';
import 'package:hive_app/splash.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {
  await Hive.initFlutter();
  var box=await Hive.openBox('mybox'); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ScreenFirst()
    );
  }
}
     