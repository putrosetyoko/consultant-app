import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 243, 252),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 44, left: 30, right: 30, bottom: 44),
          child: body(),
        ));
  }

  Widget body() {
    return Column(
      children: [header(), SizedBox(height: 20), changeName()],
    );
  }

  Widget header() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Edit Profile",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  Widget changeName() {
    var navigatorKey;
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
            decoration: InputDecoration(
              // icon: Icon(Icons.person_outline_rounded),
              hintText: "New Name",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: Container(
            child: Row(
              children: [
                Spacer(),
                Container(
                  height: 35,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.teal),
                  child: Icon(
                    Icons.done_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
