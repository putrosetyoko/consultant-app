import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consultant_app/screens/config/doctor_config.dart';
import 'package:consultant_app/screens/home_page.dart';
import 'package:consultant_app/screens/messaging/message.dart';
import 'package:consultant_app/model/doctor.dart';
import 'package:consultant_app/screens/profile/profile.dart';
import 'package:consultant_app/screens/profile/settings/settings_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../main.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

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
          SizedBox(height: 20),
          hr(),
          SizedBox(height: 10),
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
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  14.0, // Move to right 10  horizontally
                  -1.0, // Move to bottom 10 Vertically
                ),
              ),
            ]),
            child: GestureDetector(
              onTap: () => navigatorKey.currentState!
                  .push(MaterialPageRoute(builder: (context) => HomePage())),
              child: Icon(
                Icons.home_rounded,
                color: Color.fromRGBO(216, 217, 218, 1),
                size: 35.0,
              ),
            )),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                23.0, // Move to right 10  horizontally
                -1.0, // Move to bottom 10 Vertically
              ),
            ),
          ]),
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
          width: MediaQuery.of(context).size.width / 5,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                24.0, // Move to right 10  horizontally
                -1.0, // Move to bottom 10 Vertically
              ),
            ),
          ]),
          child: Icon(
            Icons.photo_camera_rounded,
            color: Color.fromRGBO(216, 217, 218, 1),
            size: 35.0,
          ),
        ),
        Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  26.0, // Move to right 10  horizontally
                  -1.0, // Move to bottom 10 Vertically
                ),
              ),
            ]),
            child: GestureDetector(
              child: Icon(
                Icons.favorite_rounded,
                color: Color.fromRGBO(216, 217, 218, 1),
                size: 35.0,
              ),
              onTap: () {},
            )),
        Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  26.0, // Move to right 10  horizontally
                  -1.0, // Move to bottom 10 Vertically
                ),
              ),
            ]),
            child: GestureDetector(
              onTap: () => navigatorKey.currentState!
                  .push(MaterialPageRoute(builder: (context) => ProfilePage())),
              child: Icon(
                Icons.account_circle_rounded,
                color: Color.fromRGBO(15, 147, 158, 1),
                size: 35.0,
              ),
            )),
      ],
    );
  }

  Widget header() {
    final userEmail = user.email!;
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
        Container(
          margin: EdgeInsets.only(top: 50),
          height: 180,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.teal,
              image: DecorationImage(
                image: AssetImage("assets/image/man.jpg"),
              )),
          // child: ClipRRect(
          //   borderRadius: BorderRadius.circular(30),
          //   child: Image.network(
          //     'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
          //     fit: BoxFit.cover,
          //   ),
          // )),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Azka Faza Dzulqarnain",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(55, 67, 103, 1),
                ),
              ),
              Text(
                userEmail,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(82, 90, 90, 90),
                ),
              ),
            ],
          ),
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
              child: Column(children: [
                GestureDetector(
                  onTap: () => navigatorKey.currentState!.push(
                      MaterialPageRoute(builder: (context) => SettingsPage())),
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
                Container(
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
                SizedBox(height: 10),
                Container(
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
                SizedBox(height: 10),
                Container(
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
                      GestureDetector(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          navigatorKey.currentState!
                              .popUntil((route) => route.isFirst);
                        },
                        child: Container(
                          // margin: EdgeInsets.only(top: 20, left: 10),
                          // color: Colors.amber,
                          child: Text(
                            'Log out',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w100,
                              color: Color.fromRGBO(55, 67, 103, 1),
                            ),
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
              ]),
            ),
          ],
        ),
      ],
    ),
  );
}
