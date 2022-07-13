import 'package:consultant_app/pageTwo.dart';
import 'package:flutter/material.dart';
import 'package:consultant_app/screens/auth/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:consultant_app/dummy_doctor.dart';

class ListDoctor extends StatefulWidget {
  const ListDoctor({Key? key}) : super(key: key);

  @override
  State<ListDoctor> createState() => _ListDoctorState();
}

class _ListDoctorState extends State<ListDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 247, 252, 1),
        appBar: AppBar(
            title: const Text("List Dokter Favorit"),
            backgroundColor: Colors.teal,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                })),
        body: SingleChildScrollView(
          child: Column(
            children: [artistList()],
          ),
        ));
  }

  Widget artistList() {
    List<DummyDoctor> data = doctorList().getDoctor();
    return SizedBox(
      height: 215,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return buildArtistList(data[index]);
        },
        itemCount: data.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget buildArtistList(DummyDoctor doctor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 150,
          margin: const EdgeInsets.only(bottom: 8, left: 20),
          child: Text(
            doctor.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
