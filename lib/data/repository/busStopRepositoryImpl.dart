import 'package:ponteareas_bus_finder/data/firestore/firestore_service.dart';
import 'package:ponteareas_bus_finder/data/model/bus_stop.dart';
import 'package:ponteareas_bus_finder/data/repository/busStopRepository.dart';

class BusStopRepositoryImpl extends BusStopRepository {
  final FirestoreService _firestoreService;

  BusStopRepositoryImpl(this._firestoreService)
      : assert(_firestoreService != null);

  @override
  Future<List<BusStop>> getBusStops() async {
    var stops = await _firestoreService.getStops();
    return stops;
  }

  @override
  Future<List<String>> getBusStopsNames() async {
    var stopsNames;
    var stops = await _firestoreService.getStops();

    stops.forEach((element) {
      stopsNames.add(element.name);
    });

    return stopsNames;
  }
}
