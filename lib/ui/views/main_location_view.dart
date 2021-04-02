import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_weather/theme/styles.dart';

class MainLocationView extends StatefulWidget {
  @override
  _MainLocationViewState createState() => _MainLocationViewState();
}

class _MainLocationViewState extends State<MainLocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget"),
        leading: Center(
            child: FaIcon(
          FontAwesomeIcons.alignLeft,
          size: 16,
        )),
        flexibleSpace: Container(
          decoration: mainContainerDecoration,
        ),
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: mainContainerDecoration,
      ),
    );
  }
}
