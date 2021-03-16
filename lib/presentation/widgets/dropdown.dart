import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ponteareas_bus_finder/data/model/bus_stop.dart';
import 'package:provider/provider.dart';

class Dropdown extends StatefulWidget {
  final String _labelText;
  final String _defaultValue;
  final List<BusStop> _busStops;

  final Function(String) valueReturned;

  Dropdown(
      {Key key,
      String labelText,
      this.valueReturned,
      String defaultValue,
      List<BusStop> busStops})
      : _labelText = labelText,
        _defaultValue = defaultValue,
        _busStops = busStops,
        super(key: key);

  @override
  _DropdownState createState() => _DropdownState(
      dropdownLabelText: _labelText,
      defaultValue: _defaultValue,
      busStops: _busStops);
}

class _DropdownState extends State<Dropdown> {
  String _dropdownValue;
  String _dropdownlabelText;
  String dropdownItem;
  String _defaultValue;
  List<BusStop> _busStops;

  _DropdownState(
      {@required String dropdownLabelText,
      @required String defaultValue,
      @required List<BusStop> busStops}) {
    //_currentSubscription = data.loadAllStops().listen(_updateStops);
    _dropdownlabelText = dropdownLabelText;
    _defaultValue = defaultValue;
    _busStops = busStops;
  }

  StreamSubscription<QuerySnapshot> _currentSubscription;
  bool _isLoading = true;
  List<BusStop> _stops;
  List<String> stops;
  //Filter _filter;

  List<String> getBusStopsNames(List<BusStop> busStops) {
    List<String> _busStopsNames = <String>[];

    for (int i = 0; i < busStops.length; i++) {
      _busStopsNames.add(busStops[i].name);
    }

    return _busStopsNames;
  }

  void getDropDownItem() {
    dropdownItem = _dropdownValue;
  }

  void _updateStops(QuerySnapshot snapshot) {
    setState(() {
      _isLoading = false;
      //_stops = data.getStopsFromQuery(snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    stops = getBusStopsNames(_stops);
    return DropdownButtonFormField<String>(
      value: _defaultValue,
      //icon: Icon(Icons.arrow_downward),
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          filled: false,
          labelText: _dropdownlabelText),
      iconSize: 0,
      elevation: 16,
      style: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      onChanged: (String newValue) {
        setState(() {
          _dropdownValue = newValue;
          widget.valueReturned(newValue);
        });
      },
      items: _isLoading && stops == null && stops.isNotEmpty
          ? <String>['Ponteareas', 'Porriño', 'Vigo', 'Meixoeiro']
              .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()
          : stops.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
    );
  }
}
