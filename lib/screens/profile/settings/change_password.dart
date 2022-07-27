import 'package:consultant_app/main.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
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
      children: [header(), SizedBox(height: 20), changePassword()],
    );
  }

  Widget header() {
    return Center(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
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
          ),
          SizedBox(width: 75),
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

  Widget changePassword() {
    var navigatorKey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'Current Password',
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
              hintText: "Current Password",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'New Password',
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
              hintText: "New Password",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 15),
        SubmitPassword()
      ],
    );
  }
}

class SubmitPassword extends StatelessWidget {
  const SubmitPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
