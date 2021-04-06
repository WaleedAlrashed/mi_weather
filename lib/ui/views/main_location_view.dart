import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mi_weather/models/weather.dart';
import 'package:mi_weather/theme/styles.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:mi_weather/ui/widgets/custom_app_bar.dart';
import 'package:mi_weather/ui/widgets/main_drawer.dart';
import 'package:mi_weather/utils/time_detector.dart';

class MainLocationView extends StatefulWidget {
  WeatherData weatherData;

  MainLocationView({this.weatherData});
  @override
  _MainLocationViewState createState() => _MainLocationViewState();
}

class _MainLocationViewState extends State<MainLocationView> {
  WeatherData get weatherData => widget.weatherData;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: mainDrawer,
      appBar: CustomAppBar(
        text: weatherData.forecastList[0].dtTxt
            .format(DateFormats.europeanDayOfWeek),
        scaffoldKey: _scaffoldKey,
      ),
      body: MainLocationViewBody(
        weatherData: weatherData,
        screenSize: screenSize,
      ),
    );
  }
}

class MainLocationViewBody extends StatelessWidget {
  const MainLocationViewBody({
    Key key,
    @required this.weatherData,
    @required this.screenSize,
  }) : super(key: key);

  final WeatherData weatherData;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      alignment: Alignment.center,
      decoration: TimeDetector.isNight()
          ? nightContainerDecoration
          : mainContainerDecoration,
      child: ListView(
        children: [
          //---------------CITY NAME----------------
          Padding(
            padding: const EdgeInsets.only(left: 45.0),
            child: Text(
              weatherData.city.name,
              style: TextStyle(fontSize: 30),
            ),
          ),
          //-----------------CUURENT WEATHER VALUE -------------------
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              weatherData.forecastList[0].main.temp.toInt().toString(),
              style: TextStyle(fontSize: 100),
            ),
          ),

          //----------------CUURENT DESCRIPTION ----------------
          Padding(
            padding: const EdgeInsets.only(left: 60.0, bottom: 40.0),
            child: Text(
              weatherData.forecastList[0].weather[0].description
                  .toString()
                  .split('.')
                  .last,
              style: TextStyle(fontSize: 18.0),
            ),
          ),

          SizedBox(
            height: 2,
            width: screenSize.width * 0.1,
            child: Container(
              width: screenSize.width * 0.2,
              color: Color.fromRGBO(255, 255, 255, 0.5),
            ),
          ),
          //--------------HORIZONTAL LIST------
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
              left: 10.0,
              right: 10.0,
            ),
            child: SizedBox(
              height: 50.0,
              width: screenSize.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: weatherData.forecastList
                    .map<Widget>(
                      (forecast) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0.0),
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
          ),
          SizedBox(
            height: 2,
            width: screenSize.width * 0.1,
            child: Container(
              width: screenSize.width * 0.2,
              color: Color.fromRGBO(255, 255, 255, 0.5),
            ),
          ),

          Text(
            "Next 5 Days:",
            style: mainTextStyle,
          ),
          SizedBox.fromSize(
            size: screenSize,
            child: ListView.builder(
              itemCount: weatherData.cnt,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    DateFormat('EEEE').format(
                      weatherData.forecastList[index].dtTxt,
                    ),
                  ),
                  title: Center(
                    child: FaIcon(
                      index.isOdd
                          ? FontAwesomeIcons.sun
                          : FontAwesomeIcons.cloud,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    weatherData.forecastList[index].weather[0].description
                        .toString()
                        .split('.')
                        .last,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
