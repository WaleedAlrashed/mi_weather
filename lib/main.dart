import 'package:flutter/material.dart';
import 'package:mi_weather/services/services_locator.dart';
import 'package:mi_weather/ui/views/main_location_view.dart';
import 'package:mi_weather/ui/views/select_location_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServicesLocator();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Weather',
      theme: ThemeData(
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
        ),
      ),
      home: MainLocationView(),
    );
  }
}
