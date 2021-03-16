import 'package:ponteareas_bus_finder/data/model/bus_stop.dart';

abstract class BusStopRepository {
  Future<List<BusStop>> getBusStops();
}
