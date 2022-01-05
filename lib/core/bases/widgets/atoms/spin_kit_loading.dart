import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum SpinKitType {
  fadingCube,
  pulse,
}

class SpinKitLoading extends StatelessWidget {
  const SpinKitLoading({
    Key? key,
    this.spinKitType,
    this.color,
  }) : super(key: key);

  final SpinKitType? spinKitType;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _mapSpinKitType(spinKitType, context),
    );
  }

  Widget _mapSpinKitType(SpinKitType? type, BuildContext context) {
    const size = 40.0;
    const duration = Duration(seconds: 1);
    final primaryColor = Theme.of(context).primaryColor;
    switch (type) {
      case SpinKitType.pulse:
        return SpinKitPulse(
          size: size,
          color: color ?? primaryColor,
        );
      case SpinKitType.fadingCube:
        return SpinKitFadingCube(
          duration: duration,
          size: size,
          color: color ?? primaryColor,
        );
      // ignore: no_default_cases
      default:
        return SpinKitFadingCube(
          duration: duration,
          size: size,
          color: color ?? primaryColor,
        );
    }
  }
}
