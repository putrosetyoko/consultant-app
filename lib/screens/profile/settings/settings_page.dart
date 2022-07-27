import 'package:consultant_app/screens/profile/settings/edit_profile.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
    return Center(
      child: Column(
        children: [
          header(),
          SizedBox(height: 20),
          listSetting(),
        ],
      ),
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.teal,
          ),
        ),
      ],
    );
  }

  Widget listSetting() {
    return Column(
      children: [
        GestureDetector(
          onTap: () => navigatorKey.currentState!
              .push(MaterialPageRoute(builder: (context) => EditProfile())),
          child: Container(
            // margin: EdgeInsets.only(top: 50),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
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
                    Icons.mode_edit_rounded,
                    color: Color.fromRGBO(55, 67, 103, 1),
                    size: 25,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  // margin: EdgeInsets.only(top: 20, left: 10),
                  // color: Colors.amber,
                  child: Text(
                    'Edit Profile',
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

        // SizedBox(height: ),

        Container(
          // margin: EdgeInsets.only(top: 50),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
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
                  Icons.key_rounded,
                  color: Color.fromRGBO(55, 67, 103, 1),
                  size: 25,
                ),
              ),
              SizedBox(width: 10),
              Container(
                // margin: EdgeInsets.only(top: 20, left: 10),
                // color: Colors.amber,
                child: Text(
                  'Change Password',
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
      ],
    );
  }
}
