import 'package:ponteareas_bus_finder/data/model/bus_stop.dart';
import 'package:ponteareas_bus_finder/data/repository/busStopRepository.dart';

class GetBusStop {
  final BusStopRepository _busStopRepository;

  GetBusStop(this._busStopRepository) : assert(_busStopRepository != null);

  Future<List<BusStop>> call() async {
    return await _busStopRepository.getBusStops();
  }
}
