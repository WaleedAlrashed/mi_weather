import 'package:flutter/material.dart';
import 'package:mi_weather/constants/routes_constants.dart';
import 'package:mi_weather/router/routes.dart';
import 'package:mi_weather/services/services_locator.dart';
import 'package:mi_weather/theme/theme.dart';
import 'package:mi_weather/ui/views/main_location_view.dart';
import 'package:mi_weather/ui/views/select_location_view.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServicesLocator(); //setting up service locator before [runApp()]
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Mi Weather',
        theme: mainTheme,
        initialRoute: INITIAL__VIEW_ROUTE,
        onGenerateRoute: RoutesGenerator.generateRoute,
      ),
    );
  }
}
