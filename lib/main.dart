import 'package:flutter/material.dart';
import 'package:mi_weather/ui/views/select_location_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Weather',
      theme: ThemeData(
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
        ),
      ),
      home: SelectLocationView(),
    );
  }
}
