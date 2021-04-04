import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_weather/models/weather.dart';
import 'package:mi_weather/theme/styles.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:mi_weather/utils/time_detector.dart';

class MainLocationView extends StatefulWidget {
  WeatherData weatherData;

  MainLocationView({this.weatherData});
  @override
  _MainLocationViewState createState() => _MainLocationViewState();
}

class _MainLocationViewState extends State<MainLocationView> {
  WeatherData get weatherData => widget.weatherData;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          weatherData.forecastList[0].dtTxt
              .format(DateFormats.europeanDayOfWeek),
        ),
        leading: Center(
            child: FaIcon(
          FontAwesomeIcons.alignLeft,
          size: 16,
        )),
        flexibleSpace: Container(
          decoration: TimeDetector.isNight()
              ? nightAppBarDecoration
              : mainAppBarDecoration,
        ),
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: TimeDetector.isNight()
            ? nightContainerDecoration
            : mainContainerDecoration,
        child: ListView(
          children: [
            Text(weatherData.city.name),
            Text(weatherData.forecastList[0].main.temp.toString()),
            Text(weatherData.forecastList[0].weather[0].description.toString()),
            SizedBox(
              height: 5,
              width: screenSize.width * 0.2,
              child: Container(
                width: screenSize.width * 0.2,
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ),
            ),
            SizedBox(
              height: 40.0,
              width: screenSize.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: weatherData.forecastList
                    .map<Widget>(
                      (forecast) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Text(forecast.dtTxt.hour.toString()),
                            SizedBox(height: 5.0),
                            Text(forecast.main.temp.toString()),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
