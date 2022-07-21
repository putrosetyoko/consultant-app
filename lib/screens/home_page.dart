// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:consultant_app/crud_doctors.dart';
import 'package:consultant_app/listDoctor.dart';
import 'package:consultant_app/screens/messaging/message.dart';
import 'package:consultant_app/doctors.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:provider/provider.dart';

import '../main.dart';

List<Doctor> data =
    navigatorKey.currentContext!.watch<DoctorOperations>().doctorList;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
  }

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 247, 252, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 44, left: 30, right: 30, bottom: 44),
        child: body(),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget body() {
    return Column(
      children: [
        header(),
        SizedBox(height: 32),
        stack(),
        SizedBox(height: 24),
        services(),
        SizedBox(height: 24),
        doctorList(),
      ],
    );
  }

  Widget bottomBar() {
    return Row(
      children: <Widget>[
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 5,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
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
          child: const Icon(
            Icons.home_rounded,
            color: Color.fromRGBO(15, 147, 158, 1),
            size: 35.0,
          ),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 5,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
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
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
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
          child: const Icon(
            Icons.photo_camera_rounded,
            color: Color.fromRGBO(216, 217, 218, 1),
            size: 35.0,
          ),
        ),
        Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 5,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
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
              child: const Icon(
                Icons.favorite_rounded,
                color: Color.fromRGBO(216, 217, 218, 1),
                size: 35.0,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListDoctor()));
              },
            )),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 5,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
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
          child: const Icon(
            Icons.account_circle_rounded,
            color: Color.fromRGBO(216, 217, 218, 1),
            size: 35.0,
          ),
        ),
      ],
    );
  }

  Widget header() {
    final userEmail = user.email!;
    return Row(
      children: [
        Container(
          // margin: const EdgeInsets.only(top: 10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.teal,
              image: const DecorationImage(
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
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    userEmail,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color.fromRGBO(55, 67, 103, 1),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "How are you today?",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Colors.teal,
              ),
            ),
          ],
        ),
        // const SizedBox(
        //   width: 10,
        // ),
        Spacer(),
        Icon(Icons.notifications_none_rounded),
      ],
    );
  }

  Widget stack() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          // height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(15, 147, 158, 1),
            boxShadow: const [
              BoxShadow(
                  //spreadRadius: 1,
                  blurRadius: 17,
                  color: Colors.blueGrey)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 208,
                child: Text(
                  "Let's get vaccinated to increase our body immunity",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  navigatorKey.currentState!.popUntil((route) => route.isFirst);
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  // final dataLogin = await SharedPreferences.getInstance();
                  // final out = await dataLogin.remove("id");
                },
                child: Text(
                  "Book Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  primary: const Color(0xFFDAB38C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          bottom: -10,
          left: 0,
          right: -230,
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                image: AssetImage("assets/image/ayo_vaksin.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget services() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Our Services",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(55, 67, 103, 1),
            ),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFFBEBFC1), width: 2.0),
                    boxShadow: [
                      BoxShadow(
                          //spreadRadius: 1,
                          //blurRadius: 10,
                          color: Colors.blueGrey)
                    ],
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      //color: Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/image/suntikan.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "General",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(15, 147, 158, 1),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFFBEBFC1), width: 2.0),
                    boxShadow: const [
                      BoxShadow(
                          //spreadRadius: 1,
                          //blurRadius: 10,
                          color: Colors.blueGrey)
                    ],
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      //color: Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/image/gigi.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Dentist",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(15, 147, 158, 1),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xFFBEBFC1), width: 2.0),
                      boxShadow: const [
                        BoxShadow(
                            //spreadRadius: 1,
                            //blurRadius: 10,
                            color: Colors.blueGrey)
                      ]),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        //color: Colors.redAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage("assets/image/hati.png"),
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Heart",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(15, 147, 158, 1),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFFBEBFC1), width: 2.0),
                    boxShadow: [
                      BoxShadow(
                          //spreadRadius: 1,
                          //blurRadius: 10,
                          color: Colors.blueGrey)
                    ],
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      //color: Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/image/lainnya.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Others",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(15, 147, 158, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget doctorList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Top Rated Doctors",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(55, 67, 103, 1),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CRUDOCTOR()));
              },
              child: Text(
                "See all",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(190, 191, 193, 1),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 125 * data.length.toDouble(),
          // color: Colors.blue,
          child: Consumer<DoctorOperations>(
            builder: (context, value, child) => SizedBox(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: data.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return buildDoctorList(data[index]);
                    }),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildDoctorList(Doctor doctor) {
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(15, 147, 158, 1),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(doctor.image.toString()),
                  )),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Text(
                      doctor.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(55, 67, 103, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      doctor.spesialis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(15, 147, 158, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: Row(
                  children: const [
                    Icon(
                      Icons.star_sharp,
                      color: Colors.yellow,
                      size: 25.0,
                    ),
                    Text(
                      "  4.8/5",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(55, 67, 103, 1),
                      ),
                    ),
                    Text(
                      "  (567 Reviews)",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(190, 191, 193, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: Row(
                  children: const [
                    SizedBox(width: 5),
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 10,
                    ),
                    Text(
                      " online",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.green,
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

  // void _awaitReturnValueFromSecondScreen(BuildContext context) async {
  //   // start the SecondScreen and wait for it to finish with a result
  //   final result = await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const PageTwo(),
  //       ));
  //
  //   // after the SecondScreen result comes back update the Text widget with it
  //   setState(() {
  //     text = result;
  //   });
  // }
}
