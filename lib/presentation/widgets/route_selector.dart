import 'package:flutter/material.dart';
import 'package:ponteareas_bus_finder/data/model/bus_stop.dart';
import 'package:ponteareas_bus_finder/presentation/providers/bus_stop_provider.dart';
import 'package:ponteareas_bus_finder/presentation/widgets/dropdown.dart';
import 'package:provider/provider.dart';

class RouteSelector extends StatefulWidget {
  List<BusStop> busStops;

  RouteSelector({Key key, @required this.busStops}) : super(key: key);

  @override
  _RouteSelectorState createState() => _RouteSelectorState(busStops: busStops);
}

class _RouteSelectorState extends State<RouteSelector> {
  List<BusStop> _busStops;
  _RouteSelectorState({@required List<BusStop> busStops}) {
    _busStops = busStops;
  }

  @override
  Widget build(BuildContext context) {
    String dropdownFromValueSelected; // = 'Ponteareas';
    String dropdownToValueSelected; // = 'Vigo';
    DateTime datepickerValueSelcted = DateTime.now();

    _handleFromValueReturned(String value) {
      dropdownFromValueSelected = value;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: _busStops != null
          ? Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              margin: EdgeInsets.all(8.0),
              height: 170.0,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 32.0, top: 16, right: 16),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: Icon(Icons.trip_origin,
                              color: Colors.blue, size: 18),
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
                          child: Icon(Icons.trip_origin,
                              color: Colors.pink, size: 18),
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
                          //Text('Hola'),
                          Container(
                            //height: 60.0,
                            child: Dropdown(
                              key: UniqueKey(),
                              labelText: 'Origen',
                              valueReturned: _handleFromValueReturned,
                              busStops: _busStops,
                              defaultValue:
                                  'Ponteareas', //dropdownFromValueSelected,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          // Container(
                          //   //height: 60.0,
                          //   child: Dropdown(
                          //     key: UniqueKey(),
                          //     labelText: 'Destino',
                          //     valueReturned: _handleToValueReturned,
                          //     /*defaultValue:
                          //         'Vigo', //dropdownToValueSelected,*/
                          //   ),
                          // ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
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
            )
          : CircularProgressIndicator(),
    );
  }
}
