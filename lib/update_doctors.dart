// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:consultant_app/doctors.dart';
import 'package:consultant_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:consultant_app/home_page.dart';
import 'package:provider/provider.dart';
// import 'package:consultant_app/register_page.dart';

// List<Map<String, dynamic>> dataAkun = DummyData.data;

class UpdateDoctors extends StatefulWidget {
  const UpdateDoctors({Key? key}) : super(key: key);

  @override
  State<UpdateDoctors> createState() => _UpdateDoctorsState();
}

class _UpdateDoctorsState extends State<UpdateDoctors> {
  String errorMessage = '';
  bool isPasswordVisible = false;
  // String nama = '';
  final TextEditingController _spesialis = TextEditingController();
  final TextEditingController _spesialis2 = TextEditingController();

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
                    "Halaman Update Dokter",
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
                  controller: _spesialis,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.person_outline_rounded),
                    hintText: "Spesialis Lama",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Text(errorMessage),
              const SizedBox(
                height: 1,
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
                  controller: _spesialis2,
                  decoration: const InputDecoration(
                    // icon: Icon(Icons.person_outline_rounded),
                    hintText: "Spesialis Baru",
                    border: InputBorder.none,
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text(
                      "Update",
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
                          .updateDoctor(
                              _spesialis.text.trim(), _spesialis2.text.trim());
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
}
