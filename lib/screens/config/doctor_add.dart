// ignore_for_file: prefer__literals_to_create_immutables, prefer__ructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:consultant_app/api/firebase_api.dart';
import 'package:consultant_app/model/doctor.dart';
import 'package:consultant_app/main.dart';

import 'package:path/path.dart' as path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

class DoctorAdd extends StatefulWidget {
  @override
  State<DoctorAdd> createState() => _DoctorAddState();
}

class _DoctorAddState extends State<DoctorAdd> {
  String errorMessage = '';
  bool isPasswordVisible = false;
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController specialistCon = TextEditingController();
  UploadTask? task;
  File? file;
  String? imageURL;

  @override
  Widget build(BuildContext context) {
    final fileName =
        file != null ? path.basename(file!.path) : 'No file selected!';

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 44, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
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
              ),
              SizedBox(height: 24),
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
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(247, 247, 247, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: specialistCon,
                  decoration: InputDecoration(
                    // icon: Icon(Icons.person_outline_rounded),
                    hintText: "Spesialis",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => selectFile(),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Avatar Image',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.attach_file),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        fileName,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(errorMessage),
              SizedBox(height: 32),
              ElevatedButton(
                child: Text(
                  "Add",
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
                onPressed: () {
                  final name = nameCon.text.trim();
                  final specialist = specialistCon.text.trim();

                  createDoctor(
                    name: name,
                    specialist: specialist,
                  );
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
                        color: Colors.teal,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = path.basename(file!.path);
    final destination = 'doctors/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    imageURL = await snapshot.ref.getDownloadURL();
  }

  Future createDoctor({
    required String name,
    required String specialist,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    final doc = FirebaseFirestore.instance.collection('doctors').doc();

    await uploadFile();

    final doctor = Doctor(
        id: doc.id,
        name: name,
        specialist: specialist,
        imageURL: imageURL.toString());

    final json = doctor.toJson();
    await doc
        .set(json)
        .then((value) => print("New data merged with existing data!"))
        .catchError((error) => print("Failed to merge data: $error"));

    navigatorKey.currentState!.popUntil(ModalRoute.withName("/DoctorConfig"));
  }
}
