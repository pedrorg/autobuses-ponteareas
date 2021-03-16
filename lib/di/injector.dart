import 'package:get_it/get_it.dart';
import 'package:ponteareas_bus_finder/data/firestore/firestore_service.dart';
import 'package:ponteareas_bus_finder/data/repository/busStopRepository.dart';
import 'package:ponteareas_bus_finder/data/repository/busStopRepositoryImpl.dart';
import 'package:ponteareas_bus_finder/domain/get_bus_stop.dart';
import 'package:ponteareas_bus_finder/presentation/providers/bus_stop_provider.dart';

final _injector = GetIt.instance;

void setUp() {
  _injector.registerLazySingleton<FirestoreService>(() => FirestoreService());
  _injector.registerLazySingleton<BusStopRepository>(
      () => BusStopRepositoryImpl(_injector<FirestoreService>()));

  //Provider
  _injector.registerLazySingleton<BusStopProvider>(
      () => BusStopProvider(_injector<GetBusStop>()));

  //Use cases
  _injector.registerLazySingleton<GetBusStop>(
      () => GetBusStop(_injector<BusStopRepository>()));
}
