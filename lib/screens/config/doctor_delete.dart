// ignore_for_file: prefer__literals_to_create_immutables, prefer__ructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:consultant_app/model/doctor.dart';
import 'package:consultant_app/main.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

class DoctorDelete extends StatefulWidget {
  const DoctorDelete({Key? key}) : super(key: key);

  @override
  State<DoctorDelete> createState() => _DoctorDeleteState();
}

class _DoctorDeleteState extends State<DoctorDelete> {
  String errorMessage = '';
  bool isPasswordVisible = false;
  final TextEditingController nameCon = TextEditingController();
  UploadTask? task;
  File? file;
  late String imageURL;
  String doctorToDelete = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 44, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  "Halaman Hapus Dokter",
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
            ),
            SizedBox(height: 24),
            doctorList(),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 247, 247, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: nameCon,
                decoration: InputDecoration(
                  // icon: Icon(Icons.person_outline_rounded),
                  hintText: "Nama Dokter",
                  border: InputBorder.none,
                  enabled: false,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(errorMessage),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text(
                "Delete",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                primary: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () => deleteDoctor(),
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
                      color: Colors.teal,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget doctorList() {
    return StreamBuilder<List<Doctor>>(
      stream: readDoctors(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final doctors = snapshot.data!;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            height: 300,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: doctors.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return buildDoctorList(doctors[index]);
                },
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(247, 247, 247, 1),
              // boxShadow: [
              //   BoxShadow(color: Colors.green, spreadRadius: 3),
              // ],
            ),
          );
        } else if (!snapshot.hasData) {
          return Center(child: Text('No data was found!'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Widget buildDoctorList(Doctor doctor) {
    return GestureDetector(
      onTap: () {
        nameCon.text = doctor.name;
        doctorToDelete = doctor.id;
      },
      child: SizedBox(
        height: 50,
        // color: Colors.orange,
        // crossAxisAlignment: CrossAxisAlignment.center,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            doctor.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }

  Stream<List<Doctor>> readDoctors() => FirebaseFirestore.instance
      .collection('doctors')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Doctor.fromJson(doc.data())).toList());

  Future deleteDoctor() async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    final docDoctor = FirebaseFirestore.instance.collection('doctors');

    await docDoctor
        .doc(doctorToDelete)
        .delete()
        .then((value) => print("Doctor deleted"))
        .catchError((error) => print("Failed to delete doctor: $error"));

    nameCon.clear();
    navigatorKey.currentState!.pop();
  }
}
