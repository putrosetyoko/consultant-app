// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:consultant_app/main.dart';
import 'package:consultant_app/screens/auth/forgot_password.dart';
import 'package:consultant_app/screens/auth/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailCon.dispose();
    passCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: body(),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(30, 44, 30, 0),
      child: Column(
        children: [
          header(),
          loginForm(),
        ],
      ),
    );
  }

  Widget header() {
    return Column(
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
        SizedBox(
          height: 250,
          // color: Colors.black,
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/consultantapp-firebase.appspot.com/o/app%2Flogin_image.jpg?alt=media&token=6ad646f6-fc07-49ea-ba25-a4874ee3b117'),
        ),
      ],
    );
  }

  Widget loginForm() {
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
        SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(247, 247, 247, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: passCon,
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
        SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Text(
              "Lupa Password?",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                color: Colors.teal,
              ),
            ),
            onTap: () {
              navigatorKey.currentState!.push(
                MaterialPageRoute(
                  builder: (context) => ForgotPasswordPage(),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 139, vertical: 15),
                primary: const Color(0xFF008080),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: login,
            ),
            const SizedBox(height: 15),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                primary: Color.fromARGB(20, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () => navigatorKey.currentState!.push(
                  MaterialPageRoute(builder: (context) => RegisterPage())),
            ),
          ],
        ),
      ],
    );
  }

  Future login() async {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCon.text.trim(),
        password: passCon.text.trim(),
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
