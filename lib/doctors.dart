// ignore_for_file: prefer_final_fields
import 'package:consultant_app/add_doctors.dart';
import 'package:consultant_app/dummy_doctor.dart';
import 'package:consultant_app/screens/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Doctor {
  String name;
  String spesialis;
  String? image;

  Doctor({required this.name, required this.spesialis, this.image}) {
    image ??= 'assets/image/man.jpg';
  }
}

class DoctorOperations with ChangeNotifier {
  List<Doctor> _list = [
    Doctor(
        name: "Dr. Bruno Rodrigues",
        spesialis: "Orthopedic Spesialis",
        image: 'assets/image/bruno.png'),
    Doctor(
        name: "Dr. Dalton Ngangi",
        spesialis: "Orthopedic Spesialis",
        image: 'assets/image/dalton.png'),
  ];

  List<Doctor> get doctorList => _list;

  dynamic checkDoctorForDuplicate(String doctor) {
    for (var i = 0; i < data.length; i++) {
      if (data[i].name.contains(doctor)) {
        return 'Doctor is already added.';
      }
    }
    return null;
  }

  void AddDoctors(String name, String spesialis, String image) {
    if (image == ' ' || image == '') {
      data.add(Doctor(image: null, name: name, spesialis: spesialis));
      print('condition fulfilled');
    } else {
      data.add(Doctor(image: image, name: name, spesialis: spesialis));
      print('condition not fulfilled');
    }
    notifyListeners();
  }

  void updateDoctor(String spesialis, String spesialis2) {
    for (var i = 0; i < data.length; i++) {
      if (spesialis == data[i].spesialis) {
        data[i].spesialis = spesialis2;
        break;
      }
    }
    notifyListeners();
  }

  void deleteDoctor(String name) {
    data.removeWhere((element) => element.name == name);
    notifyListeners();
  }
}
