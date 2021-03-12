import 'package:cloud_firestore/cloud_firestore.dart';

typedef StopPressedCallback = void Function(String stopId);

class Stops {
  final String id;
  final List<String> stops;

  Stops.fromSnapshot(DocumentSnapshot snapshot)
      : assert(snapshot != null),
        id = snapshot.id,
        stops = List.from(snapshot.data()['stops']);
}
