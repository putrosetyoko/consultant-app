// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:consultant_app/main.dart';
import 'package:consultant_app/screens/home_page.dart';
import 'package:consultant_app/screens/profile/profile.dart';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:iconify_flutter/icons/ri.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key? key}) : super(key: key);

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      backgroundColor: Color.fromRGBO(244, 247, 252, 1),
      body: body(),
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
          child: GestureDetector(
            onTap: () => navigatorKey.currentState!
                .push(MaterialPageRoute(builder: (context) => HomePage())),
            child: Icon(
              Icons.home_rounded,
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
                23.0, // Move to right 10  horizontally
                -1.0, // Move to bottom 10 Vertically
              ),
            ),
          ]),
          child: const Icon(
            Icons.mark_chat_unread_rounded,
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
              onTap: () {},
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
          child: GestureDetector(
              onTap: () => navigatorKey.currentState!
                  .push(MaterialPageRoute(builder: (context) => ProfilePage())),
              child: const Icon(
                Icons.account_circle_rounded,
                color: Color.fromRGBO(216, 217, 218, 1),
                size: 35.0,
              )),
        ),
      ],
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 60, left: 30, right: 30),
      child: Column(
        children: [
          header(),
          SizedBox(height: 20),
          messageList(),
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        findMessage(),
        Spacer(),
        newMessage(),
      ],
    );
  }

  Widget findMessage() {
    return Container(
      height: 60,
      width: 250,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Iconify(Ri.search_fill, color: Color.fromARGB(255, 190, 191, 193)),
            SizedBox(width: 10),
            Text(
              'Search message...',
              style: TextStyle(
                color: Color.fromARGB(255, 190, 191, 193),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
    );
  }

  Widget newMessage() {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.all(16),
      child: Iconify(
        Fluent.compose_24_filled,
        color: Color.fromARGB(255, 190, 191, 193),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
    );
  }

  Widget messageList() {
    return SizedBox(
      height: 500,
      // color: Colors.amber,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return buildMessageList();
        },
        itemCount: 7,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget buildMessageList() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 80,
        width: 330,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
