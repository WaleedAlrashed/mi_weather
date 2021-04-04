// To parse this JSON data, do
//
//     final weatherData = weatherDataFromMap(jsonString);

import 'dart:convert';

class WeatherData {
  WeatherData({
    this.cod,
    this.message,
    this.cnt,
    this.forecastList,
    this.city,
  });

  final String cod;
  final int message;
  final int cnt;
  final List<Forecast> forecastList;
  final City city;
  bool isDay() => message == 0;
  factory WeatherData.fromJson(String str) =>
      WeatherData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherData.fromMap(Map<String, dynamic> json) => WeatherData(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        forecastList:
            List<Forecast>.from(json["list"].map((x) => Forecast.fromMap(x))),
        city: City.fromMap(json["city"]),
      );

  Map<String, dynamic> toMap() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(forecastList.map((x) => x.toMap())),
        "city": city.toMap(),
      };
}

class City {
  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromMap(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "coord": coord.toMap(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Coord {
  Coord({
    this.lat,
    this.lon,
  });

  final double lat;
  final double lon;

  factory Coord.fromJson(String str) => Coord.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Coord.fromMap(Map<String, dynamic> json) => Coord(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
      };
}

class Forecast {
  Forecast({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
  });

  final int dt;
  final MainClass main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Sys sys;
  final DateTime dtTxt;

  factory Forecast.fromJson(String str) => Forecast.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Forecast.fromMap(Map<String, dynamic> json) => Forecast(
        dt: json["dt"],
        main: MainClass.fromMap(json["main"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        clouds: Clouds.fromMap(json["clouds"]),
        wind: Wind.fromMap(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"].toDouble(),
        sys: Sys.fromMap(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
      );

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "main": main.toMap(),
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "clouds": clouds.toMap(),
        "wind": wind.toMap(),
        "visibility": visibility,
        "pop": pop,
        "sys": sys.toMap(),
        "dt_txt": dtTxt.toIso8601String(),
      };
}

class Clouds {
  Clouds({
    this.all,
  });

  final int all;

  factory Clouds.fromJson(String str) => Clouds.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toMap() => {
        "all": all,
      };
}

class MainClass {
  MainClass({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  factory MainClass.fromJson(String str) => MainClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MainClass.fromMap(Map<String, dynamic> json) => MainClass(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}

class Sys {
  Sys({
    this.pod,
  });

  final Pod pod;

  factory Sys.fromJson(String str) => Sys.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
        pod: podValues.map[json["pod"]],
      );

  Map<String, dynamic> toMap() => {
        "pod": podValues.reverse[pod],
      };
}

enum Pod { N, D }

final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  final int id;
  final MainEnum main;
  final Description description;
  final String icon;

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainEnumValues.map[json["main"]],
        description: descriptionValues.map[json["description"]],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "icon": icon,
      };
}

enum Description {
  FEW_CLOUDS,
  CLEAR_SKY,
  SCATTERED_CLOUDS,
  BROKEN_CLOUDS,
  OVERCAST_CLOUDS
}

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum MainEnum { CLOUDS, CLEAR }

final mainEnumValues =
    EnumValues({"Clear": MainEnum.CLEAR, "Clouds": MainEnum.CLOUDS});

class Wind {
  Wind({
    this.speed,
    this.deg,
  });

  final double speed;
  final int deg;

  factory Wind.fromJson(String str) => Wind.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
      );

  Map<String, dynamic> toMap() => {
        "speed": speed,
        "deg": deg,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
