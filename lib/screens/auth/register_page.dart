// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:consultant_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:consultant_app/screens/home_page.dart';
// import 'package:consultant_app/register_page.dart';

// List<Map<String, dynamic>> dataAkun = DummyData.data;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String errorMessage = '';
  bool isPasswordVisible = false;
  // String nama = '';
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Selamat Datang",
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
              Row(
                children: const [
                  Text(
                    "Senang bertemu dengan Anda kembali. Silakan",
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
                children: const [
                  Text(
                    "Registrasi akun baru untuk masuk ke sistem",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Color.fromRGBO(170, 170, 170, 1),
                    ),
                  )
                ],
              ),
              Row(
                children: const [
                  Text(
                    "aplikasi.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Color.fromRGBO(170, 170, 170, 1),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
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
              // const SizedBox(height:500,),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
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
              Text(errorMessage),
              const SizedBox(
                height: 1,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                  SizedBox(height: 10),
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
    );
  }

  Future register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
      print(e);
    }
  }
}
