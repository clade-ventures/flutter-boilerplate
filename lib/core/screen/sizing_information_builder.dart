import 'package:flutter/material.dart';
import 'package:flutter_strong_boilerplate/core/screen/sizing_information.dart';

typedef SizeBuilder = Widget Function(
    BuildContext context, SizingInformation sizingInformation);

/// A sizing builder widget.
class SizingInformationBuilder extends StatelessWidget {
  /// Creates a [SizingInformationBuilder].
  const SizingInformationBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  /// Builder using [LayoutBuilder]
  final SizeBuilder builder;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      final sizingInformation = SizingInformation(
        orientation: mediaQuery.orientation,
        deviceType: getDeviceScreenType(mediaQuery),
        localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
        screenSize: mediaQuery.size,
      );
      return builder(context, sizingInformation);
    });
  }

  DeviceScreenType getDeviceScreenType(MediaQueryData mediaQuery) {
    final orientation = mediaQuery.orientation;
    var deviceWidth = 0.0;
    if (orientation == Orientation.landscape) {
      deviceWidth = mediaQuery.size.height;
    } else {
      deviceWidth = mediaQuery.size.width;
    }
    // TODO(paw): desktop version
    if (deviceWidth > 600) {
      return DeviceScreenType.tablet;
    }
    return DeviceScreenType.mobile;
  }
}
