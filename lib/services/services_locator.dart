import 'package:get_it/get_it.dart';
import 'package:mi_weather/services/index.dart';

GetIt locator = GetIt.instance;

///
///sets up [services]
///
Future setupServicesLocator() async {
  locator.registerLazySingleton(() => NetworkService());
  locator.registerLazySingleton(() => LogService());
}
