import 'package:flutter/material.dart';
import 'package:ponteareas_bus_finder/presentation/providers/bus_stop_provider.dart';
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
          ],
        ),
      ),
    );
  }
}
