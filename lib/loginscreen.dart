

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/Component.dart';
import 'package:test1/Toast.dart';
import 'package:test1/signupscreen.dart';

import 'forgetpassword.dart';
import 'homescreen.dart';

void main() {
  runApp(LoginScreen());
  String email;

}

class LoginScreen extends StatefulWidget {

//  const LoginScreen({super.key});
  const LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<LoginScreen> {
  bool loading = false;
  final emailcon = TextEditingController();
  final passwordcon = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                color: bcolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "ShoppingCart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.4,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Enter Email';
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailcon,
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                    )),
                                TextFormField(
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Enter Password';
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                  keyboardType: TextInputType.emailAddress,
                                  controller: passwordcon,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 55,
                          ),
                          roundbutton(
                              title: "Login",
                              tapfun: () {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                    email: emailcon.text.toString(),
                                    password: passwordcon.text.toString())
                                    .then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen(name: '')));
                                }).onError((error, stackTrace) {
                                  toastmessage(error.toString());
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingUpScreen()));
                      },
                      child: Text("Sign Up")

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
