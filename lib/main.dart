import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ponteareas_bus_finder/di/injector.dart';
import 'package:ponteareas_bus_finder/presentation/pages/home_page.dart';
import 'package:ponteareas_bus_finder/presentation/providers/bus_stop_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUp();
  runApp(App());
}

class App extends StatelessWidget {
  //final Future<FirebaseApp> _initialization = await Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetIt.I<BusStopProvider>()..getBusStops(),
        ),
      ],
      child: MaterialApp(
        title: 'Autobuses Ponteareas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
