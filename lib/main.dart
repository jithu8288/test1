import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test1/splashcreena.dart';
import 'firebase_options.dart';


var routes = <String, WidgetBuilder>{

};

void main()async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(new MaterialApp(
        theme:
        ThemeData(
            primaryColor: Colors.lightGreen, primarySwatch: Colors.lightGreen,
            primaryColorDark: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: SplashScreena(),
        routes: routes));
}