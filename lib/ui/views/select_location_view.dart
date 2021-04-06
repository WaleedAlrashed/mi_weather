import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_weather/constants/routes_constants.dart';
import 'package:mi_weather/repositories/weather_repository.dart';
import 'package:mi_weather/theme/styles.dart';
import 'package:mi_weather/ui/views/main_location_view.dart';
import 'package:oktoast/oktoast.dart';

class SelectLocationView extends StatefulWidget {
  @override
  _SelectLocationViewState createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  final cityController =
      TextEditingController(text: "Damascus"); //initial value
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0x001B76FF),
        appBar: _buildSelectLocationViewAppBar(),
        body: SelectLocationViewBody(cityController: cityController),
      ),
    );
  }

  ///
  /// returns [AppBar] taken in no arguments
  /// made only for this [SelectlocationView],
  ///
  AppBar _buildSelectLocationViewAppBar() {
    return AppBar(
      leading: Center(
        child: FaIcon(
          FontAwesomeIcons.angleLeft,
          size: 40,
        ),
      ),
      backgroundColor: Color.fromRGBO(27, 118, 255, 1),
      elevation: 0.0,
    );
  }
}

class SelectLocationViewBody extends StatelessWidget {
  const SelectLocationViewBody({
    Key key,
    @required this.cityController,
  }) : super(key: key);

  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color.fromRGBO(27, 118, 255, 1),
      child: ListView(
        padding: EdgeInsets.all(15.0),
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Mi Weather',
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 300),
                  ),
                ],
                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 500),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Choose Your Location:", style: mainTextStyle),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 44.0,
                  vertical: 30.0,
                ),
                child: TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    filled: true,
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    hintText: 'Search Location Manually',
                    suffixIcon: Icon(
                      Icons.search,
                      color: blueColor,
                    ),
                  ),
                ),
              ),
              Text(
                "Or",
                style: mainTextStyle,
              ),
              SizedBox(height: 53.0),
              Container(
                width: 280,
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: Color.fromRGBO(255, 113, 113, 1),
                ),
                child: Center(
                  child: Text(
                    "Identify Your Location\n       Automatically",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 170.0),
              InkWell(
                splashColor: Colors.red,
                onTap: () {
                  showToast(
                    "Loading...",
                    backgroundColor: Colors.green,
                    position: ToastPosition.bottom,
                  );
                  final _weatherRepository = WeatherRepository();
                  _weatherRepository
                      .getWeatherForCity(cityController.text)
                      .then(
                        (data) => Navigator.pushNamed(
                          context,
                          Main_LOCATION_VIEW_ROUTE,
                          arguments: data,
                        ),
                      );
                },
                child: SizedBox(
                  width: 144,
                  height: 56,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromRGBO(135, 67, 255, 1),
                          Color.fromRGBO(11, 82, 248, 1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text('NEXT', style: mainTextStyle),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
