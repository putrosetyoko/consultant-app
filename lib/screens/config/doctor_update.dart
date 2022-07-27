// ignore_for_file: prefer__literals_to_create_immutables, prefer__ructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:consultant_app/main.dart';
import 'package:consultant_app/model/doctor.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class DoctorUpdate extends StatefulWidget {
  const DoctorUpdate({Key? key}) : super(key: key);

  @override
  State<DoctorUpdate> createState() => _DoctorUpdateState();
}

class _DoctorUpdateState extends State<DoctorUpdate> {
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController specCon = TextEditingController();
  String errorMessage = '';
  String doctorToUpdate = '';
  String newName = '';
  String newSpecialist = '';
  String imageURL = '';

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
        SizedBox(height: 24),
        doctorList(),
        SizedBox(height: 24),
        form(),
        Text(errorMessage),
        SizedBox(height: 32),
        updateButton(),
        SizedBox(height: 16),
        backButton(),
      ],
    );
  }

  Widget header() {
    return Row(
      children: [
        Text(
          "Halaman Update Dokter",
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
        specCon.text = doctor.specialist;
        doctorToUpdate = doctor.id;
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

  Widget form() {
    return Column(
      children: [
        nameField(),
        SizedBox(height: 16),
        specialistField(),
      ],
    );
  }

  Widget nameField() {
    return Container(
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
    );
  }

  Widget specialistField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: specCon,
        decoration: InputDecoration(
          // icon: Icon(Icons.person_outline_rounded),
          hintText: "Specialist",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget updateButton() {
    return ElevatedButton(
      child: Text(
        "Update",
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
        newName = nameCon.text.trim();
        newSpecialist = specCon.text.trim();

        updateDoctor(
          name: newName,
          specialist: newSpecialist,
        );
      },
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

  Stream<List<Doctor>> readDoctors() => FirebaseFirestore.instance
      .collection('doctors')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Doctor.fromJson(doc.data())).toList());

  Future updateDoctor({
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
    final doc =
        FirebaseFirestore.instance.collection('doctors').doc(doctorToUpdate);

    final doctor = Doctor(
        id: doctorToUpdate,
        name: name,
        specialist: specialist,
        imageURL: imageURL);

    final json = doctor.toJson();

    await doc
        .update(json)
        .then((value) => print("Doctor updated!"))
        .catchError((error) => print("Failed to update doctor: $error"));
    navigatorKey.currentState!.pop();
  }
}
