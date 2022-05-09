import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../screen/sizing_information.dart';
import '../../../screen/sizing_information_builder.dart';
import '../molecules/custom_scaffold.dart';
import 'base_state_normal.dart';

abstract class BaseStateful<T extends StatefulWidget> extends State<T>
    with Diagnosticable
    implements BaseStateNormal {
  late GlobalKey<RefreshIndicatorState> refreshIndicatorKey;

  @override
  void initState() {
    super.initState();
    refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    init();
  }

  ScaffoldAttribute buildAttribute();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: CustomScaffold(
        attr: buildAttribute(),
        body: SizingInformationBuilder(
          builder: (_, sizeInfo) {
            if (sizeInfo.deviceType == DeviceScreenType.mobile) {
              return buildNarrowLayout(
                context,
                sizeInfo,
              );
            }
            return buildWideLayout(
              context,
              sizeInfo,
            );
          },
        ),
        appBar: buildAppBar(context),
      ),
    );
  }
}
