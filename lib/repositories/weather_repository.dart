import 'package:mi_weather/models/weather.dart';
import 'package:mi_weather/services/index.dart';
import 'package:mi_weather/services/services_locator.dart';

class WeatherRepository {
  final _networkService = locator<NetworkService>();

  ///
  ///Get Weather data for a specified [city]
  ///
  Future<WeatherData> getWeatherForCity(String city) async {
    final response = await _networkService.get(city);
    WeatherData weatherData = WeatherData.fromJson(response);
    return weatherData;
  }
}
