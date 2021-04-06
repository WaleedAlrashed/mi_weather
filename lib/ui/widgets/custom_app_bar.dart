import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_weather/theme/styles.dart';
import 'package:mi_weather/utils/time_detector.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key key,
    @required this.text,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final String text;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(text),
      leading: GestureDetector(
        onTap: () => _scaffoldKey.currentState.openDrawer(),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.alignLeft,
            size: 16,
          ),
        ),
      ),
      flexibleSpace: Container(
        decoration: TimeDetector.isNight()
            ? nightAppBarDecoration
            : mainAppBarDecoration,
      ),
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
