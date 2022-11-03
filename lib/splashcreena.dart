import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:test1/loginscreen.dart';

class SplashScreena extends StatefulWidget {


  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreena> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new LoginScreen() ,
        title: new Text("ShoppingCart",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold),
            ),
        image: new Image.asset('assets/image/asd.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 60.0,
        loaderColor: Colors.blue
    );
  }
}



