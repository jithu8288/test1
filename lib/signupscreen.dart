import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test1/Toast.dart';
import 'package:test1/homescreen.dart';
import 'package:test1/loginscreen.dart';

import 'Component.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<SingUpScreen> {
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    final emailcon = TextEditingController();
    final passwordcon = TextEditingController();
    final _formkey = GlobalKey<FormState>();
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
                    "ShippingCart",
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
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          TextFormField(
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'First Enter Email';
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
                            //     return 'First Enter Password';
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
                          SizedBox(
                            height: 55,
                          ),
                          roundbutton(
                              title: "Sign Up.",
                              tapfun: () {
                                // if (_formkey.currentState!.validate()) {
                                print("press signup");
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                    email: emailcon.text.toString(),
                                    password: passwordcon.text.toString())
                                    .then((value) {
                                  print("suc");

                                  print("suc next scren");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen(name: '')));
                                }).onError((error, stackTrace) {
                                  print("error");

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
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text("Login")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
