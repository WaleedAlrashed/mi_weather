import 'package:flutter/material.dart';
import 'package:mi_weather/services/services_locator.dart';
import 'package:mi_weather/ui/views/select_location_view.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServicesLocator();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Mi Weather',
        theme: ThemeData(
          textTheme: TextTheme(
            button: TextStyle(color: Colors.white),
          ),
        ),
        home: SelectLocationView(),
      ),
    );
  }
}
