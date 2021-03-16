import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

typedef StopPressedCallback = void Function(String stopId);

class BusStop {
  String name;
  String location;
  String description;

  BusStop(
      {@required this.name,
      @required this.location,
      @required this.description});

  factory BusStop.fromMap(Map<String, dynamic> json) => BusStop(
      name: json['name'],
      location: json['location'],
      description: json['description']);

  factory BusStop.fromFirestore(DocumentSnapshot documentSnapshot) {
    return BusStop.fromMap(documentSnapshot.data());
  }
}
