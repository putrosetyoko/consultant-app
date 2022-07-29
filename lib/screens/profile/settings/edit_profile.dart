// ignore_for_file: preferructors, prefer_literals_to_create_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consultant_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameCon = TextEditingController();
  String newName = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 243, 252),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 44, left: 30, right: 30, bottom: 44),
          child: body(),
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [header(), SizedBox(height: 20), changeName()],
    );
  }

  Widget header() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 38,
          child: GestureDetector(
            onTap: () => navigatorKey.currentState!.pop(),
            child: Text(
              "Back",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
              ),
            ),
          ),
        ),
        Spacer(),
        Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.teal,
          ),
        ),
        Spacer(),
        SizedBox(width: 38),
      ],
    );
  }

  Widget changeName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'Change Your Name',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w100,
              color: Color.fromRGBO(55, 67, 103, 1),
            ),
          ),
        ),
        SizedBox(height: 10),
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
              hintText: "New Name",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 15),
        submit(),
      ],
    );
  }

  Widget submit() {
    return GestureDetector(
      onTap: () {
        newName = nameCon.text.trim();
        updateName(name: newName);
      },
      child: Row(
        children: [
          Spacer(),
          Container(
            height: 35,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.teal),
            child: Icon(
              Icons.done_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Future updateName({required String name}) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    print(name);

    final user = FirebaseAuth.instance.currentUser!;

    final doc = FirebaseFirestore.instance.collection('users').doc(user.uid);

    await doc
        .update(
          {'name': name},
        )
        .then(
          (value) => print("User updated!"),
        )
        .catchError(
          (error) => print("Failed to update user! $error"),
        );

    navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => loadPage(),
        ),
        (route) => false);
  }
}
