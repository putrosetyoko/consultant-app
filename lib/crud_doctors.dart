import 'package:consultant_app/add_doctors.dart';
import 'package:consultant_app/delete_doctors.dart';
import 'package:consultant_app/screens/home_page.dart';
import 'package:consultant_app/pageTwo.dart';
import 'package:consultant_app/update_doctors.dart';
import 'package:flutter/material.dart';
import 'package:consultant_app/screens/auth/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:consultant_app/dummy_doctor.dart';
import 'package:consultant_app/main.dart';

class CRUDOCTOR extends StatefulWidget {
  const CRUDOCTOR({Key? key}) : super(key: key);

  @override
  State<CRUDOCTOR> createState() => _CRUDOCTORState();
}

class _CRUDOCTORState extends State<CRUDOCTOR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 247, 252, 1),
        appBar: AppBar(
            title: const Text("Manajemen Dokter"),
            backgroundColor: Colors.teal,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                })),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          child: Column(
            children: [
              ElevatedButton(
                child: const Text(
                  "Add Data",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100 + .0, vertical: 20.0),
                  primary: const Color(0xFF008080),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () => navigatorKey.currentState!.push(
                    MaterialPageRoute(builder: (context) => AddDoctors())),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text(
                  "Update Data",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100 + .0, vertical: 20.0),
                  primary: const Color(0xFF008080),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () => navigatorKey.currentState!.push(
                    MaterialPageRoute(builder: (context) => UpdateDoctors())),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text(
                  "Delete Data",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100 + .0, vertical: 20.0),
                  primary: const Color(0xFF008080),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () => navigatorKey.currentState!.push(
                    MaterialPageRoute(builder: (context) => DeleteDoctor())),
              ),
            ],
          ),
        ));
  }
}
