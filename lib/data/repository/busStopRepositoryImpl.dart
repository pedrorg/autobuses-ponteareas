import 'package:ponteareas_bus_finder/data/firestore/firestore_service.dart';
import 'package:ponteareas_bus_finder/data/model/bus_stop.dart';
import 'package:ponteareas_bus_finder/data/repository/busStopRepository.dart';

class BusStopRepositoryImpl extends BusStopRepository {
  final FirestoreService _firestoreService;

  BusStopRepositoryImpl(this._firestoreService)
      : assert(_firestoreService != null);

  Future<List<BusStop>> getBusStops() async {
    return _firestoreService.getStops();
  }
}
