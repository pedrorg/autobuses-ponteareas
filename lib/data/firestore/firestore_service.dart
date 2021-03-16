import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/bus_route.dart';
import '../model/bus_stop.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BusStop>> getStops() async {
    List<BusStop> busStops = <BusStop>[];

    await _db
        .collection('busStop')
        .get()
        .then((querySnapshot) => querySnapshot.docs.forEach((element) {
              busStops.add(BusStop.fromMap(element.data()));
            }));

    for (int i = 0; i < busStops.length; i++) print(busStops[i].name);

    print("Adios");

    return busStops;
  }

  // Stream<QuerySnapshot> getStops() {
  //   return FirebaseFirestore.instance.collection('Stops').limit(1).snapshots();
  // }

  // List<Stops> getStopsFromQuery(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((DocumentSnapshot doc) {
  //     return Stops.fromSnapshot(doc);
  //   }).toList();
  // }

  // Future<List<BusRoute>> getRoutes(
  //     String from, String to, String dayOfWeek) async {
  //   List<BusRoute> busRoutes = [];
  //   BusRoute busRoute;

  //   await FirebaseFirestore.instance
  //       .collection('Routes')
  //       //FIXME: Este where está dando problemas para obtener las rutas.
  //       // .where('weekDays.' + dayOfWeek,
  //       //     isEqualTo:
  //       //         true)
  //       .get()
  //       .then((value) => {
  //             value.docs.forEach((element) {
  //               busRoute = BusRoute.fromSnapshot(element);
  //               print(busRoute);
  //               if (busRoute.stops.containsKey(from) &&
  //                   busRoute.stops.containsKey(to)) busRoutes.add(busRoute);
  //             }),
  //             busRoutes.sort((a, b) => a.startHour.compareTo(b.startHour))
  //           });

  //   return Future.value(busRoutes);
  // }
}
