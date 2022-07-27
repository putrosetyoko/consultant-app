// ignore_for_file: prefer__literals_to_create_immutables, prefer__ructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:consultant_app/main.dart';
import 'package:consultant_app/screens/config/doctor_add.dart';
import 'package:consultant_app/screens/config/doctor_delete.dart';
import 'package:consultant_app/screens/config/doctor_update.dart';

import 'package:flutter/material.dart';

class DoctorConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 247, 252, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 44, left: 30, right: 30),
        child: body(),
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        header(),
        SizedBox(height: 24),
        addButton(),
        SizedBox(height: 16),
        updateButton(),
        SizedBox(height: 16),
        deleteButton(),
        SizedBox(height: 24),
        backButton(),
      ],
    );
  }

  Widget header() {
    return Row(
      children: [
        Text(
          "Halaman Tambah Dokter",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
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
    );
  }

  Widget addButton() {
    return ElevatedButton(
      child: Text(
        "Add Data",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        primary: Color(0xFF008080),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () => navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => DoctorAdd(),
        ),
      ),
    );
  }

  Widget updateButton() {
    return ElevatedButton(
      child: Text(
        "Update Data",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        primary: Color(0xFF008080),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () => navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => DoctorUpdate(),
        ),
      ),
    );
  }

  Widget deleteButton() {
    return ElevatedButton(
      child: Text(
        "Delete Data",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        primary: Color(0xFF008080),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () => navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => DoctorDelete(),
        ),
      ),
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
}
