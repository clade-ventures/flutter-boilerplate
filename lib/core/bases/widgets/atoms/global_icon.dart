import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// SVG icon format.
class GlobalIcon extends SvgPicture {
  GlobalIcon.asset(
    String assetName, {
    Key? key,
    Color? color,
    double height = 24,
    double width = 24,
  }) : super.asset(
          'assets/icons/$assetName',
          key: key,
          color: color,
          height: height,
          width: width,
        );

  GlobalIcon.svg(
    String assetName, {
    Key? key,
    Color? color,
    double height = 24,
    double width = 24,
  }) : super.asset(
          'assets/icons/$assetName.svg',
          key: key,
          color: color,
          height: height,
          width: width,
        );
}
