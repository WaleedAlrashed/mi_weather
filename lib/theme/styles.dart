import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_weather/theme/assets.dart';

final mainTextStyle = GoogleFonts.poppins(
  fontSize: 19,
  color: Colors.white,
);

const Color blueColor = Color.fromRGBO(27, 118, 255, 1);

const BoxDecoration mainAppBarDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      const Color.fromRGBO(236, 169, 31, 1),
      const Color.fromRGBO(237, 120, 4, 1),
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  ),
);
const BoxDecoration nightAppBarDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      const Color.fromRGBO(255, 255, 255, 1),
      const Color.fromRGBO(19, 107, 209, 1),
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  ),
);

const BoxDecoration mainContainerDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      const Color.fromRGBO(236, 169, 31, 1),
      const Color.fromRGBO(237, 120, 4, 1),
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  ),
  image: DecorationImage(
    alignment: Alignment(4.0, -1),
    image: AssetImage(Assets.day),
  ),
);

const BoxDecoration nightContainerDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      const Color.fromRGBO(255, 255, 255, 1),
      const Color.fromRGBO(19, 107, 209, 1),
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  ),
  image: DecorationImage(
    alignment: Alignment(4.0, -1),
    image: AssetImage(Assets.night),
  ),
);
