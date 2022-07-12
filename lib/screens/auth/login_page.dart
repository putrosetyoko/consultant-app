// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:consultant_app/main.dart';
import 'package:consultant_app/screens/auth/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:consultant_app/screens/home_page.dart';
// import 'package:consultant_app/register_page.dart';

// List<Map<String, dynamic>> dataAkun = DummyData.data;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMessage = '';
  bool isPasswordVisible = false;
  // String nama = '';
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void deactive() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

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
                    "masukkan Email dan Password untuk mengakses",
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Colors.teal,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  ElevatedButton(
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 139 + .0, vertical: 20.0),
                      primary: const Color(0xFF008080),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: login,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 130 + .0, vertical: 20.0),
                      primary: Colors.white10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () => navigatorKey.currentState!.push(
                        MaterialPageRoute(
                            builder: (context) => RegisterPage())),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Future login() async {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
      navigatorKey.currentState!.pop();
      print(e);
    }
  }
}
