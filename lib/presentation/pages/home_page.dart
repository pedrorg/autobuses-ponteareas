import 'package:flutter/material.dart';
import 'package:ponteareas_bus_finder/presentation/providers/bus_stop_provider.dart';
import 'package:ponteareas_bus_finder/presentation/widgets/date_selector.dart';
import 'package:ponteareas_bus_finder/presentation/widgets/route_selector.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stops = context.watch<BusStopProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Image(
                image: AssetImage('./assets/logo.png'),
              ),
            ),
            RouteSelector(key: UniqueKey(), busStops: stops.busStops),
            DateSelector(key: UniqueKey()),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 48),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Color(int.parse("0xFF4b34f9")),
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(12.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      /*Navigator.pushNamed(
                                  context, SearchResultPage.route,
                                  arguments: SearchResultPageArguments(
                                      id: '',
                                      from:
                                          dropdownFromValueSelected, // 'Ponteareas',
                                      to: dropdownToValueSelected,
                                      date: datepickerValueSelcted));*/
                    },
                    child: Text(
                      "Buscar",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
