import 'package:cloud_firestore/cloud_firestore.dart';
import 'bus_route.dart';
import './stops.dart';

Stream<QuerySnapshot> fetchStops() {
  return FirebaseFirestore.instance.collection('NewStops').limit(1).snapshots();
}

List<Stops> getStopsFromQuery(QuerySnapshot snapshot) {
  return snapshot.docs.map((DocumentSnapshot doc) {
    return Stops.fromSnapshot(doc);
  }).toList();
}

Future<List<BusRoute>> getRoutes(
    String from, String to, String dayOfWeek) async {
  List<BusRoute> busRoutes = [];
  BusRoute busRoute;

  print("Buscando paradas desde: " +
      from +
      " hasta: " +
      to +
      " el dia de la semana: " +
      dayOfWeek);

  await FirebaseFirestore.instance
      .collection('Routes')
      //FIXME: Este where está dando problemas para obtener las rutas.
      // .where('weekDays.' + dayOfWeek,
      //     isEqualTo:
      //         true)
      .get()
      .then((value) => {
            value.docs.forEach((element) {
              busRoute = BusRoute.fromSnapshot(element);
              print(busRoute);
              if (busRoute.stops.containsKey(from) &&
                  busRoute.stops.containsKey(to)) busRoutes.add(busRoute);
            }),
            busRoutes.sort((a, b) => a.startHour.compareTo(b.startHour))
          });

  return Future.value(busRoutes);
}
