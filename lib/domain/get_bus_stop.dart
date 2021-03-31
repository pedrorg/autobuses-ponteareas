import 'package:ponteareas_bus_finder/data/model/bus_stop.dart';
import 'package:ponteareas_bus_finder/data/repository/busStopRepository.dart';

class GetBusStop {
  final BusStopRepository _busStopRepository;

  GetBusStop(this._busStopRepository) : assert(_busStopRepository != null);

  Future<List<BusStop>> call() async {
    var busStops = await _busStopRepository.getBusStops();
    return busStops;
  }

  Future<List<String>> getBusStopsNames() async {
    var busStopsNames;
    var busStops = await _busStopRepository.getBusStops();

    busStops.forEach((element) {
      busStopsNames.add(element.name);
    });

    return busStopsNames;
  }
}
