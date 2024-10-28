
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_app/reg.dart';
import 'package:lottie/lottie.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    Timer(const Duration(seconds: 5),(){
      Navigator.push(context,
      MaterialPageRoute(builder: (context)=>RegistrationExample()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/backgroun.jpeg"),
        fit: BoxFit.cover)),
        child: Center(
          child: Lottie.asset('assets/image/lottie2.json',
          width: 250,
          height: 250,
          fit: BoxFit.fill),
          
        ),
      ),
    );
  }
}