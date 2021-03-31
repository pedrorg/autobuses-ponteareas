import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ponteareas_bus_finder/data/model/bus_stop.dart';
import 'package:ponteareas_bus_finder/presentation/widgets/dropdown.dart';

class RouteSelector extends StatefulWidget {
  const RouteSelector({Key key, this.busStops}) : super(key: key);

  final List<BusStop> busStops;

  @override
  _RouteSelectorState createState() => _RouteSelectorState(busStops);
}

class _RouteSelectorState extends State<RouteSelector> {
  BusStop busStopValue;
  final List<BusStop> _busStops;

  _RouteSelectorState(this._busStops);

  @override
  Widget build(BuildContext context) {
    BusStop defaultFromStop; // = 'Ponteareas';
    BusStop defaultToStop;
    // String dropdownToValueSelected; // = 'Vigo';
    // DateTime datepickerValueSelcted = DateTime.now();

    // _handleFromValueReturned(String value) {
    //   dropdownFromValueSelected = value;
    // }

    if (_busStops != null && _busStops.isNotEmpty) {
      defaultFromStop = _busStops
          .firstWhere((element) => element.name.contains('Ponteareas'));
      defaultToStop =
          _busStops.firstWhere((element) => element.name.contains('Vigo'));

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          margin: EdgeInsets.all(8.0),
          height: 170.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child:
                          Icon(Icons.trip_origin, color: Colors.blue, size: 18),
                    ),
                    Icon(Icons.fiber_manual_record,
                        color: Colors.grey[400], size: 10),
                    Icon(Icons.fiber_manual_record,
                        color: Colors.grey[400], size: 10),
                    Icon(Icons.fiber_manual_record,
                        color: Colors.grey[400], size: 10),
                    Icon(Icons.fiber_manual_record,
                        color: Colors.grey[400], size: 10),
                    Icon(Icons.fiber_manual_record,
                        color: Colors.grey[400], size: 10),
                    Icon(Icons.fiber_manual_record,
                        color: Colors.grey[400], size: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child:
                          Icon(Icons.trip_origin, color: Colors.pink, size: 18),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Dropdown(
                        key: UniqueKey(),
                        busStops: _busStops,
                        labelText: 'Origen',
                        defaultValue: defaultFromStop,
                        /*valueReturned: _handleFromValueReturned,                       
                            defaultValue: 'Ponteareas', //dropdownFromValueSelected,*/
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Dropdown(
                        key: UniqueKey(),
                        busStops: _busStops,
                        labelText: 'Destino',
                        defaultValue: defaultToStop,
                        /*valueReturned: _handleFromValueReturned,                       
                            defaultValue: 'Ponteareas', //dropdownFromValueSelected,*/
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: GestureDetector(
                        child: Icon(
                          Icons.swap_vert,
                          color: Colors.grey[600],
                          size: 30,
                        ),
                        onTap: () {
                          //_swapStops();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else
      return CircularProgressIndicator();
  }
}
