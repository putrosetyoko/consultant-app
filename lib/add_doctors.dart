// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:consultant_app/doctors.dart';
import 'package:consultant_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:consultant_app/screens/home_page.dart';
import 'package:provider/provider.dart';
// import 'package:consultant_app/register_page.dart';

// List<Map<String, dynamic>> dataAkun = DummyData.data;

class AddDoctors extends StatefulWidget {
  const AddDoctors({Key? key}) : super(key: key);

  @override
  State<AddDoctors> createState() => _AddDoctorsState();
}

class _AddDoctorsState extends State<AddDoctors> {
  String errorMessage = '';
  bool isPasswordVisible = false;
  // String nama = '';
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _spesialis = TextEditingController();
  final TextEditingController _image = TextEditingController();

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
                    "Halaman Tambah Dokter",
                    style: TextStyle(
                      fontSize: 20,
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
              const SizedBox(
                height: 10,
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
                  controller: _nama,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.person_outline_rounded),
                    hintText: "Nama Dokter",
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
                  controller: _spesialis,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.person_outline_rounded),
                    hintText: "Spesialis",
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
                  controller: _image,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.lock_outline_rounded),
                    hintText: "Image",
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
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70 + .0, vertical: 15.0),
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      navigatorKey.currentContext!
                          .read<DoctorOperations>()
                          .AddDoctors(_nama.text.trim(), _spesialis.text.trim(),
                              _image.text.trim());
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => navigatorKey.currentState!.pop(),
                        child: Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 15,
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

  // Future register() async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _email.text.trim(),
  //       password: _password.text.trim(),
  //     );
  //     navigatorKey.currentState!.popUntil((route) => route.isFirst);
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message!;
  //     });
  //     print(e);
  //   }
  // }
}
