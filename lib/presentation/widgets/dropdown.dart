import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ponteareas_bus_finder/data/model/bus_stop.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key key, this.busStops, this.labelText, this.defaultValue})
      : super(key: key);

  final List<BusStop> busStops;
  final String labelText;
  final BusStop defaultValue;

  @override
  _DropdownState createState() =>
      _DropdownState(busStops, labelText, defaultValue);
}

/// This is the private State class that goes with Dropdown.
class _DropdownState extends State<Dropdown> {
  //String dropdownValue = 'One';
  BusStop busStopSelected;
  BusStop defaultBusStop;
  final List<BusStop> _busStops;
  String _labelText;

  _DropdownState(this._busStops, this._labelText, this.busStopSelected);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<BusStop>(
      value: busStopSelected,
      decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          filled: false,
          labelText: _labelText),
      iconSize: 0,
      elevation: 16,
      style: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      onChanged: (BusStop newValue) {
        setState(() {
          busStopSelected = newValue;
          //widget.valueReturned(newValue);
        });
      },
      items: _busStops.map<DropdownMenuItem<BusStop>>((BusStop value) {
        return DropdownMenuItem<BusStop>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
