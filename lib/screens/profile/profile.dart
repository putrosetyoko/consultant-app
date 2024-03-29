// ignore_for_file: preferructors, prefer_literals_to_create_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:consultant_app/main.dart';
import 'package:consultant_app/screens/home_page.dart';
import 'package:consultant_app/screens/messaging/message.dart';
import 'package:consultant_app/screens/profile/help/help_page.dart';
import 'package:consultant_app/screens/profile/legal_information/legal_page.dart';
import 'package:consultant_app/screens/profile/settings/settings_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 243, 252),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 44, left: 30, right: 30, bottom: 44),
        child: body(),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget body() {
    return Center(
      child: Column(
        children: [
          header(),
          SizedBox(height: 24),
          hr(),
          SizedBox(height: 16),
          card(),
          // SizedBox(height: 24),
          // services(),
          // SizedBox(height: 24),
          // doctors(),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Row(
      children: <Widget>[
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  14.0, // Move to right 10  horizontally
                  -1.0, // Move to bottom 10 Vertically
                ),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () => navigatorKey.currentState!.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false),
            child: Icon(
              Icons.home_rounded,
              color: Color.fromRGBO(216, 217, 218, 1),
              size: 35.0,
            ),
          ),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  23.0, // Move to right 10  horizontally
                  -1.0, // Move to bottom 10 Vertically
                ),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () => navigatorKey.currentState!
                .push(MaterialPageRoute(builder: (context) => Messaging())),
            child: Icon(
              Icons.mark_chat_unread_rounded,
              color: Color.fromRGBO(216, 217, 218, 1),
              size: 35.0,
            ),
          ),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  26.0, // Move to right 10  horizontally
                  -1.0, // Move to bottom 10 Vertically
                ),
              ),
            ],
          ),
          child: Icon(
            Icons.account_circle_rounded,
            color: Color.fromRGBO(15, 147, 158, 1),
            size: 35.0,
          ),
        ),
      ],
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.teal,
          ),
        ),
        SizedBox(height: 24),
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.teal,
            image: DecorationImage(
              image: NetworkImage(user.photoURL.toString()),
            ),
          ),
        ),
        SizedBox(height: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(55, 67, 103, 1),
              ),
            ),
            Text(
              user.email,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w100,
                color: Color.fromARGB(82, 90, 90, 90),
              ),
            ),
          ],
        ),
        SizedBox(width: 50),

        // SizedBox(
        //   width: 10,
        // ),
        // Spacer(),
        // Icon(Icons.notifications_none_rounded),
      ],
    );
  }

  Widget hr() {
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 1,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(131, 216, 216, 216),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget card() {
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                // height: 300,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(55, 255, 255, 255),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => navigatorKey.currentState!.push(
                          MaterialPageRoute(
                              builder: (context) => SettingsPage())),
                      child: Container(
                        // color: Colors.amberAccent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // margin: EdgeInsets.only(top: 20, left: 20),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color.fromARGB(247, 241, 242, 255),
                              ),
                              child: Icon(
                                Icons.settings,
                                color: Color.fromRGBO(55, 67, 103, 1),
                                size: 25,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              // margin: EdgeInsets.only(top: 20, left: 10),
                              // color: Colors.amber,
                              child: Text(
                                'Settings',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w100,
                                  color: Color.fromRGBO(55, 67, 103, 1),
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Color.fromRGBO(55, 67, 103, 1),
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => navigatorKey.currentState!.push(
                          MaterialPageRoute(builder: (context) => HelpPage())),
                      child: Container(
                        // color: Colors.amberAccent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // margin: EdgeInsets.only(top: 20, left: 20),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color.fromARGB(247, 241, 242, 255),
                              ),
                              child: Icon(
                                Icons.help_center_rounded,
                                color: Color.fromRGBO(55, 67, 103, 1),
                                size: 25,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              // margin: EdgeInsets.only(top: 20, left: 10),
                              // color: Colors.amber,
                              child: Text(
                                'Help',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w100,
                                  color: Color.fromRGBO(55, 67, 103, 1),
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Color.fromRGBO(55, 67, 103, 1),
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => navigatorKey.currentState!.push(
                          MaterialPageRoute(builder: (context) => LegalPage())),
                      child: Container(
                        // color: Colors.amberAccent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // margin: EdgeInsets.only(top: 20, left: 20),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color.fromARGB(247, 241, 242, 255),
                              ),
                              child: Icon(
                                Icons.list_alt_rounded,
                                color: Color.fromRGBO(55, 67, 103, 1),
                                size: 25,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              // margin: EdgeInsets.only(top: 20, left: 10),
                              // color: Colors.amber,
                              child: Text(
                                'Legal Informatian',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w100,
                                  color: Color.fromRGBO(55, 67, 103, 1),
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Color.fromRGBO(55, 67, 103, 1),
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: navigatorKey.currentContext!,
                          barrierDismissible: false,
                          builder: (context) => Center(
                            child: CircularProgressIndicator(),
                          ),
                        );

                        Timer(Duration(seconds: 1), () => logOut());
                      },
                      // color: Colors.amberAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // margin: EdgeInsets.only(top: 20, left: 20),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Color.fromARGB(247, 241, 242, 255),
                            ),
                            child: Icon(
                              Icons.logout_rounded,
                              color: Color.fromRGBO(55, 67, 103, 1),
                              size: 25,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Log out',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                              color: Color.fromRGBO(55, 67, 103, 1),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Color.fromRGBO(55, 67, 103, 1),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('Log out berhasil.'),
        ),
      );
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('Gagal log out! ${e.message}'),
        ),
      );

      navigatorKey.currentState!.pop();
    }
  }
}
