import 'package:flutter/material.dart';
import 'package:mi_weather/constants/routes_constants.dart';
import 'package:mi_weather/ui/views/main_location_view.dart';
import 'package:mi_weather/ui/views/select_location_view.dart';

class RoutesGenerator {
  ///
  ///generate [Route] according to [RouteName]
  ///
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argumnets = settings.arguments;
    switch (settings.name) {
      case INITIAL__VIEW_ROUTE:
        return MaterialPageRoute(
          builder: (context) => SelectLocationView(),
        );
      case Main_LOCATION_VIEW_ROUTE:
        return MaterialPageRoute(
          builder: (context) => MainLocationView(
            weatherData: argumnets,
          ),
        );
      default:
        return _errorRoute();
    }
  }

  ///
  ///error [route] in case no route found
  ///
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Error :/"),
          centerTitle: true,
        ),
        body: Center(
          child: Text("404 Page Not found"),
        ),
      ),
    );
  }
}
