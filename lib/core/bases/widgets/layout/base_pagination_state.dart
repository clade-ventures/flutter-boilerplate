import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/layout/base_state_normal.dart';
import 'package:flutter_strong_boilerplate/core/bases/widgets/molecules/custom_scaffold.dart';
import 'package:flutter_strong_boilerplate/core/environments/config.dart';
import 'package:flutter_strong_boilerplate/core/screen/sizing_information.dart';
import 'package:flutter_strong_boilerplate/core/screen/sizing_information_builder.dart';

/// An abstractions for page which has pagination.
abstract class BasePaginationState<T extends StatefulWidget> extends State<T>
    with Diagnosticable
    implements BaseStateNormal {
  late GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  late ScrollController scrollController;
  Completer<void>? completer;
  String? appName;

  @override
  void initState() {
    super.initState();
    completer = Completer<void>();
    refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
    appName = Config.appName;
    init();
  }

  void _onScroll() {
    if (_isBottom && !completer!.isCompleted && scrollCondition()) {
      onScroll();
    }
  }

  bool scrollCondition();

  void onScroll();

  bool get _isBottom {
    if (!scrollController.hasClients) {
      return false;
    }
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  ScaffoldAttribute buildAttribute();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: CustomScaffold(
        attr: buildAttribute(),
        body: SizingInformationBuilder(
          builder: (context, sizeInfo) {
            if (sizeInfo.deviceType == DeviceScreenType.mobile) {
              return buildNarrowLayout(context, sizeInfo);
            }
            return buildWideLayout(context, sizeInfo);
          },
        ),
        appBar: buildAppBar(context),
      ),
    );
  }
}
