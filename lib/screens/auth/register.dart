// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consultant_app/main.dart';

import 'package:consultant_app/model/user.dart' as user_model;

import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String errorMessage = '';
  bool isPasswordVisible = false;
  // String nama = '';

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(top: 44, left: 30, right: 30, bottom: 20),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Selamat Datang",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins",
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.waving_hand_rounded,
                          color: Color.fromRGBO(255, 221, 103, 1),
                          size: 25.0,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Senang bertemu dengan anda kembali. Silakan login untuk mengakses aplikasi.',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        color: Color.fromRGBO(170, 170, 170, 1),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/image/login.jpg',
                      height: 250,
                      width: 330,
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(247, 247, 247, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _name,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person_outline_rounded),
                      hintText: "Nama",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(247, 247, 247, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _email,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person_outline_rounded),
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(247, 247, 247, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _password,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: isPasswordVisible
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        color: Color.fromRGBO(170, 170, 170, 1),
                      ),
                      hintText: "Password",
                      border: InputBorder.none,
                    ),
                    obscureText: !isPasswordVisible,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      errorMessage,
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                      child: const Text(
                        " Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90 + .0, vertical: 20.0),
                        primary: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: register,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => navigatorKey.currentState!.pop(),
                          child: Text(
                            "Back to Login Page",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              color: Colors.teal,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Future register() async {
    String name = _name.text.trim();
    String email = _email.text.trim();
    String password = _password.text.trim();

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final auth.FirebaseAuth loginSession = auth.FirebaseAuth.instance;

      final auth.User? user = loginSession.currentUser;
      final uid = user!.uid;

      final docUser = FirebaseFirestore.instance.collection('users').doc(uid);

      final newUser = user_model.User(
        id: uid,
        name: name,
        email: email,
      );

      final json = newUser.toJson();
      await docUser.set(json);

      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on auth.FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
      print(e);
    }
  }
}
