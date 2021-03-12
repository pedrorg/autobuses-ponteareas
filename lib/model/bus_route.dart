import 'package:cloud_firestore/cloud_firestore.dart';

typedef BusRoutePressedCallback = void Function(String routeId);

class BusRoute {
  final String id;
  final String comment;
  final String companyName;
  final String from;
  final String to;
  final Timestamp startHour;
  final Timestamp endHour;
  final Map<String, Timestamp> stops;
  final Map<String, bool> weekDays;

  BusRoute.fromSnapshot(DocumentSnapshot snapshot)
      : assert(snapshot != null),
        id = snapshot.id,
        comment = snapshot.data()['comment'],
        companyName = snapshot.data()['companyName'],
        from = snapshot.data()['from'],
        to = snapshot.data()['to'],
        startHour = snapshot.data()['startHour'],
        endHour = snapshot.data()['endHour'],
        stops = new Map<String, Timestamp>.from(snapshot.data()['stops']),
        weekDays = new Map<String, bool>.from(snapshot.data()['weekDays']);
}
