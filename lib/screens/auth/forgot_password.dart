// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:consultant_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailCon = TextEditingController();
  String errorMessage = '';

  @override
  void dispose() {
    // TODO: implement dispose
    emailCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 44, left: 30, right: 30),
          child: body(),
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        header(),
        form(),
        SizedBox(height: 16),
        backButton(),
      ],
    );
  }

  Widget header() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Lupa Password",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                fontFamily: "Poppins",
                color: Colors.teal,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.waving_hand_rounded,
              color: Color.fromRGBO(255, 221, 103, 1),
              size: 25.0,
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Silahkan masukkan email yang terhubung dengan akun anda.',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            color: Color.fromRGBO(170, 170, 170, 1),
          ),
        ),
        SizedBox(
          height: 250,
          // color: Colors.black,
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/consultantapp-firebase.appspot.com/o/app%2Flogin_image.jpg?alt=media&token=6ad646f6-fc07-49ea-ba25-a4874ee3b117'),
        ),
      ],
    );
  }

  Widget backButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => navigatorKey.currentState!.pop(),
          child: Text(
            "Back",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.teal,
            ),
          ),
        )
      ],
    );
  }

  Widget form() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(247, 247, 247, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: emailCon,
            decoration: const InputDecoration(
              icon: Icon(Icons.person_outline_rounded),
              hintText: "Email",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              SizedBox(width: 12),
              Text(
                errorMessage,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        ElevatedButton(
          child: const Text(
            "Submit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 133, vertical: 15),
            primary: const Color(0xFF008080),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: resetPassword,
        ),
      ],
    );
  }

  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      final email = emailCon.text.trim();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Silahkan cek email anda untuk mengubah password.'),
        ),
      );
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
      navigatorKey.currentState!.pop();
    }
  }
}
