import 'package:flutter/cupertino.dart';

class DummyDoctor {
  final String name;

  DummyDoctor({required this.name});
}

class doctorList {
  List<DummyDoctor> getDoctor() {
    return <DummyDoctor>[
      DummyDoctor(name: 'Dr. Putro'),
      DummyDoctor(name: 'Dr. Putro 2'),
      DummyDoctor(name: 'Dr. Furqhon'),
    ];
  }
}
