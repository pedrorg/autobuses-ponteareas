import 'package:flutter/material.dart';
import 'package:ponteareas_bus_finder/data/model/bus_stop.dart';
import 'package:ponteareas_bus_finder/domain/get_bus_stop.dart';

class BusStopProvider with ChangeNotifier {
  final GetBusStop _getBusStop;

  List<BusStop> _busStops;
  String _errorMessage;

  BusStopProvider(this._getBusStop) : assert(_getBusStop != null);

  //Getter
  List<BusStop> get busStops => _busStops;
  String get errorMessage => _errorMessage;

  void getBusStops() async {
    try {
      _busStops = await _getBusStop();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}
